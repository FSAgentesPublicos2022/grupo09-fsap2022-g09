using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Support
{
    public class Cotizacion
    {
        private List<Moneda> lstCotizacion;

        public Cotizacion()
        {
            this.lstCotizacion = new List<Moneda>();

            this.lstCotizacion.Add(new Moneda("bitcoin", 3000, 2800));
            this.lstCotizacion.Add(new Moneda("ethereum", 1500, 1300));
            this.lstCotizacion.Add(new Moneda("monero", 400, 300));
            this.lstCotizacion.Add(new Moneda("carcano", 200, 150));
        }

        public decimal ObtenerPrecioDeVenta(string moneda) {
            foreach (Moneda m in this.lstCotizacion) {
                if (moneda.Equals(m.GetMoneda())) { 
                    return m.GetPrecioVenta();
                }
            }
            return 0;
        }

        public decimal ObtenerPrecioDeCompra(string moneda) {
            foreach (Moneda m in this.lstCotizacion)
            {
                if (moneda.Equals(m.GetMoneda()))
                {
                    return m.GetPrecioCompra();
                }
            }
            return 0;
        }
    }
}