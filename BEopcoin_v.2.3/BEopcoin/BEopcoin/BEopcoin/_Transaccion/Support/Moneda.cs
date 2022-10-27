using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Support
{
    public class Moneda
    {
        private string moneda { set; get; }
        private decimal venta { set; get; }
        private decimal compra { set; get; }

        public Moneda(string moneda, decimal venta, decimal compra)
        {
            this.moneda = moneda;
            this.venta = venta;
            this.compra = compra;
        }

        public string GetMoneda() {
            return this.moneda;
        }

        public decimal GetPrecioVenta()
        {
            return this.venta;
        }
        public decimal GetPrecioCompra()
        {
            return this.compra;
        }
    }
}