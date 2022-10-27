using BEopcoin._Transaccion.DTOs;
using BEopcoin._Transaccion.Support;
using System;
using System.Data.Entity.Infrastructure;
using System.Linq;

namespace BEopcoin._Transaccion
{
    public class ComprarCtrl
    {
        private Model1 db;

        private readonly IQueryable<TipoTransaccion> tipoTransacciones;
        private Cotizacion cotizacion;
        private decimal SaldoCuentaDebito;
        private decimal SaldoCuentaCredito;
        private decimal Importe;
        private decimal ImporteCompradoEnTipoMoneda;
        private DateTime FechaTransacion;
        private Billetera BilleteraDebito;
        private Billetera BilleteraCredito;

        public ComprarCtrl(Model1 db)
        {
            this.cotizacion = new Cotizacion();
            this.SaldoCuentaDebito = 0;
            this.SaldoCuentaCredito = 0;
            this.ImporteCompradoEnTipoMoneda = 0;
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

        public decimal GetImporteCompradoEnTipoMoneda()
        {
            return this.ImporteCompradoEnTipoMoneda;
        }

        public DateTime GetFechaTransacion()
        {
            return this.FechaTransacion;
        }

        public bool Process(ComprarDto dto)
        {
            int CuentaDebito = dto.CuentaDebito;
            int CuentaCredito = dto.CuentaCredito;
            decimal Importe = dto.Importe;

            return RealizarCompraDeMoneda(CuentaDebito, CuentaCredito, Importe);
        }

        private bool RealizarCompraDeMoneda(int CuentaDebito, int CuentaCredito, decimal Importe)
        {
            this.Importe = Importe;

            if (!ValidarSaldoCuentaDebito(CuentaDebito, Importe))
            {
                return false;
            }

            this.SaldoCuentaCredito = ObtenerSaldo(CuentaCredito);

            decimal precioDeVenta = ObtenerPrecioDeVenta(CuentaCredito);

            this.BilleteraDebito = ObtenerBilletera(CuentaDebito);

            ComprarMoneda(Importe, precioDeVenta);

            RegistrarTransacion();

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

        private decimal ObtenerPrecioDeVenta(int Cuenta)
        {
            this.BilleteraCredito = ObtenerBilletera(Cuenta);
            TipoMoneda tipoMoneda = this.BilleteraCredito.TipoMoneda;
            return this.cotizacion.ObtenerPrecioDeVenta(tipoMoneda.NombreTipoMoneda);
        }

        private Billetera ObtenerBilletera(int Cuenta)
        {
            return db.Billetera.Find(Cuenta);
        }

        private int ObtenerTipoTransacion(string tipoTransacion)
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

        private void ComprarMoneda(decimal importe, decimal precioDeVenta)
        {
            this.ImporteCompradoEnTipoMoneda = Math.Round((importe / precioDeVenta), 2, MidpointRounding.ToEven);
            this.SaldoCuentaDebito = Math.Round((this.SaldoCuentaDebito - importe), 2, MidpointRounding.ToEven);
            this.SaldoCuentaCredito = Math.Round((this.SaldoCuentaCredito + this.ImporteCompradoEnTipoMoneda), 2, MidpointRounding.ToEven);
        }

        private void RegistrarTransacion()
        {
            ActualizarSaldos();
            CrearNuevaTransacion();
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

        private void CrearNuevaTransacion()
        {
            int tipoTransacion = ObtenerTipoTransacion("debito");
            Transaccion NuevaTransaccionDebito = new Transaccion
            {
                ID_Billetera = this.BilleteraDebito.ID_Billetera,
                ID_TipoTransaccion = tipoTransacion,
                FechaHoraTransaccion = this.FechaTransacion,
                MontoTransaccion = this.Importe,
                DireccionBilleteraTransaccion = "_NONE_"
            };

            tipoTransacion = ObtenerTipoTransacion("compra");
            Transaccion NuevaTransaccionCompraMoneda = new Transaccion
            {
                ID_Billetera = this.BilleteraCredito.ID_Billetera,
                ID_TipoTransaccion = tipoTransacion,
                FechaHoraTransaccion = this.FechaTransacion,
                MontoTransaccion = this.ImporteCompradoEnTipoMoneda,
                DireccionBilleteraTransaccion = "_NONE_"
            };

            db.Transaccion.Add(NuevaTransaccionDebito);
            db.Transaccion.Add(NuevaTransaccionCompraMoneda);

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