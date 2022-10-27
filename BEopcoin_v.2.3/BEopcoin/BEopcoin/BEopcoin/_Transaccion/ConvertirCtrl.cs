using BEopcoin._Transaccion.DTOs;
using BEopcoin._Transaccion.Support;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion
{
    public class ConvertirCtrl
    {
        private Model1 db;

        private readonly IQueryable<TipoTransaccion> tipoTransacciones;
        private Cotizacion cotizacion;
        private decimal SaldoCuentaDebito;
        private decimal SaldoCuentaCredito;
        private decimal Importe;
        private decimal ImporteConvertido;
        private DateTime FechaTransacion;
        private Billetera BilleteraDebito;
        private Billetera BilleteraCredito;

        public ConvertirCtrl(Model1 db)
        {
            this.cotizacion = new Cotizacion();
            this.SaldoCuentaDebito = 0;
            this.SaldoCuentaCredito = 0;
            this.ImporteConvertido = 0;
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

        public decimal GetImporteConvertido()
        {
            return this.ImporteConvertido;
        }

        public DateTime GetFechaTransacion()
        {
            return this.FechaTransacion;
        }

        public bool Process(ConvertirDto dto)
        {
            int CuentaDebito = dto.CuentaDebito;
            int CuentaCredito = dto.CuentaCredito;
            decimal Importe = dto.Importe;

            return RealizarConversionDeMoneda(CuentaDebito, CuentaCredito, Importe);
        }

        private bool RealizarConversionDeMoneda(int CuentaDebito, int CuentaCredito, decimal Importe)
        {
            this.Importe = Importe;

            if (!ValidarSaldoCuentaDebito(CuentaDebito, Importe))
            {
                return false;
            }

            this.SaldoCuentaCredito = ObtenerSaldo(CuentaCredito);

            decimal precioDeCompra = ObtenerPrecioDeCompra(CuentaDebito);

            decimal precioDeVenta = ObtenerPrecioDeVenta(CuentaCredito);

            ConvertirMoneda(Importe, precioDeCompra, precioDeVenta);

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

        private Billetera ObtenerBilletera(int Cuenta)
        {
            return db.Billetera.Find(Cuenta);
        }

        private decimal ObtenerPrecioDeCompra(int Cuenta)
        {
            this.BilleteraDebito = ObtenerBilletera(Cuenta);
            TipoMoneda tipoMoneda = this.BilleteraDebito.TipoMoneda;
            return this.cotizacion.ObtenerPrecioDeCompra(tipoMoneda.NombreTipoMoneda);
        }

        private decimal ObtenerPrecioDeVenta(int Cuenta)
        {
            this.BilleteraCredito = ObtenerBilletera(Cuenta);
            TipoMoneda tipoMoneda = this.BilleteraCredito.TipoMoneda;
            return this.cotizacion.ObtenerPrecioDeVenta(tipoMoneda.NombreTipoMoneda);
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

        private void ConvertirMoneda(decimal importe, decimal precioDeCompra, decimal precioDeVenta)
        {
            decimal FactorDeConversion = precioDeCompra / precioDeVenta;
            this.ImporteConvertido = Math.Round((FactorDeConversion * importe), 2, MidpointRounding.ToEven);

            this.SaldoCuentaDebito = Math.Round((this.SaldoCuentaDebito - importe), 2, MidpointRounding.ToEven);
            this.SaldoCuentaCredito = Math.Round((this.SaldoCuentaCredito + this.ImporteConvertido), 2, MidpointRounding.ToEven);
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
            int tipoTransacion = ObtenerTipoTransacion("conversion");
            Transaccion NuevaTransaccionDebito = new Transaccion
            {
                ID_Billetera = this.BilleteraDebito.ID_Billetera,
                ID_TipoTransaccion = tipoTransacion,
                FechaHoraTransaccion = this.FechaTransacion,
                MontoTransaccion = this.Importe,
                DireccionBilleteraTransaccion = "_NONE_"
            };

            Transaccion NuevaTransaccionCredito = new Transaccion
            {
                ID_Billetera = this.BilleteraCredito.ID_Billetera,
                ID_TipoTransaccion = tipoTransacion,
                FechaHoraTransaccion = this.FechaTransacion,
                MontoTransaccion = this.ImporteConvertido,
                DireccionBilleteraTransaccion = "_NONE_"
            };

            db.Transaccion.Add(NuevaTransaccionDebito);
            db.Transaccion.Add(NuevaTransaccionCredito);

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