using BEopcoin._Transaccion.DTOs;
using BEopcoin._Transaccion.Support;
using System;
using System.Data.Entity.Infrastructure;
using System.Linq;

namespace BEopcoin._Transaccion
{
    public class VenderCtrl
    {
        private Model1 db;

        private readonly IQueryable<TipoTransaccion> tipoTransacciones;
        private Cotizacion cotizacion;
        private decimal SaldoCuentaDebito;
        private decimal SaldoCuentaCredito;
        private decimal Importe;
        private decimal ImporteVendidoEnTipoMoneda;
        private DateTime FechaTransacion;
        private Billetera BilleteraDebito;
        private Billetera BilleteraCredito;

        public VenderCtrl(Model1 db)
        {
            this.cotizacion = new Cotizacion();
            this.SaldoCuentaDebito = 0;
            this.SaldoCuentaCredito = 0;
            this.ImporteVendidoEnTipoMoneda = 0;
            this.FechaTransacion = DateTime.Now;

            this.db = db;
            this.tipoTransacciones = db.TipoTransaccion;
        }

        public decimal GetSaldoCuentaDebito()
        {
            return this.SaldoCuentaDebito;
        }

        public decimal GetSaldoCuentaCredito()
        {
            return this.SaldoCuentaCredito;
        }

        public decimal GetImporteVendidoEnTipoMoneda()
        {
            return this.ImporteVendidoEnTipoMoneda;
        }

        public DateTime GetFechaTransacion()
        {
            return this.FechaTransacion;
        }

        public bool Process(VenderDto dto)
        {
            int CuentaDebito = dto.CuentaDebito;
            int CuentaCredito = dto.CuentaCredito;
            decimal Importe = dto.Importe;

            return RealizarVentaDeMoneda(CuentaDebito, CuentaCredito, Importe);
        }

        private bool RealizarVentaDeMoneda(int CuentaDebito, int CuentaCredito, decimal Importe)
        {
            this.Importe = Importe;

            if (!ValidarSaldoCuentaDebito(CuentaDebito, Importe))
            {
                return false;
            }

            this.SaldoCuentaCredito = ObtenerSaldo(CuentaCredito);

            decimal precioDeCompra = ObtenerPrecioDeCompra(CuentaDebito);

            this.BilleteraCredito = ObtenerBilletera(CuentaCredito);

            VenderMoneda(Importe, precioDeCompra);

            RegistrarTransaccion();

            return true;
        }

        private bool ValidarSaldoCuentaDebito(int CuentaDebito, decimal Importe)
        {
            this.SaldoCuentaDebito = ObtenerSaldo(CuentaDebito);
            return this.SaldoCuentaDebito > Importe ? true : false;
        }

        private decimal ObtenerSaldo(int Cuenta)
        {
            Billetera billetera = ObtenerBilletera(Cuenta);
            return billetera.SaldoCliente;
        }

        private decimal ObtenerPrecioDeCompra(int Cuenta)
        {
            this.BilleteraDebito = ObtenerBilletera(Cuenta);
            TipoMoneda tipoMoneda = this.BilleteraDebito.TipoMoneda;
            return this.cotizacion.ObtenerPrecioDeCompra(tipoMoneda.NombreTipoMoneda);
        }

        private Billetera ObtenerBilletera(int Cuenta)
        {
            return db.Billetera.Find(Cuenta);
        }

        private int ObtenerTipoTransaccion(string tipoTransacion)
        {
            foreach (TipoTransaccion tt in this.tipoTransacciones)
            {
                if (tt.NombreTipoTransaccion.Equals(tipoTransacion))
                {
                    return tt.ID_TipoTransaccion;
                }
            }
            return -1;
        }

        private void VenderMoneda(decimal importe, decimal precioDeCompra)
        {
            this.ImporteVendidoEnTipoMoneda = Math.Round((importe * precioDeCompra), 2, MidpointRounding.ToEven);
            this.SaldoCuentaDebito = Math.Round((this.SaldoCuentaDebito - importe), 2, MidpointRounding.ToEven);
            this.SaldoCuentaCredito = Math.Round((this.SaldoCuentaCredito + this.ImporteVendidoEnTipoMoneda), 2, MidpointRounding.ToEven);
        }

        private void RegistrarTransaccion()
        {
            ActualizarSaldos();
            CrearNuevaTransaccion();
        }

        private void ActualizarSaldos()
        {
            this.BilleteraDebito.SaldoCliente = this.SaldoCuentaDebito;
            this.BilleteraCredito.SaldoCliente = this.SaldoCuentaCredito;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                throw;
            }
        }

        private void CrearNuevaTransaccion()
        {
            int tipoTransacion = ObtenerTipoTransaccion("credito");
            Transaccion NuevaTransaccionCredito = new Transaccion
            {
                ID_Billetera = this.BilleteraCredito.ID_Billetera,
                ID_TipoTransaccion = tipoTransacion,
                FechaHoraTransaccion = this.FechaTransacion,
                MontoTransaccion = this.Importe,
                DireccionBilleteraTransaccion = "_NONE_"
            };

            tipoTransacion = ObtenerTipoTransaccion("venta");
            Transaccion NuevaTransaccionVentaMoneda = new Transaccion
            {
                ID_Billetera = this.BilleteraDebito.ID_Billetera,
                ID_TipoTransaccion = tipoTransacion,
                FechaHoraTransaccion = this.FechaTransacion,
                MontoTransaccion = this.ImporteVendidoEnTipoMoneda,
                DireccionBilleteraTransaccion = "_NONE_"
            };

            db.Transaccion.Add(NuevaTransaccionCredito);
            db.Transaccion.Add(NuevaTransaccionVentaMoneda);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                throw;
            }
        }
    }
}