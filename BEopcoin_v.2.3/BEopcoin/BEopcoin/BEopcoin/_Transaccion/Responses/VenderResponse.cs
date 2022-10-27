using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Responses
{
    public class VenderResponse
    {
        [Required(ErrorMessage = " The field SaldoCuentaDebito is required")]
        public decimal SaldoCuentaDebito { get; set; }

        [Required(ErrorMessage = " The field SaldoCuentaCredito is required")]
        public decimal SaldoCuentaCredito { get; set; }

        [Required(ErrorMessage = " The field ImporteVendidoEnTipoMoneda  is required")]
        public decimal ImporteVendidoEnTipoMoneda { get; set; }

        [Required(ErrorMessage = " The field FechaTransacion is required")]
        public DateTime FechaTransaccion { get; set; }
    }
}