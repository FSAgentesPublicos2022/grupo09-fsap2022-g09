using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Responses
{
    public class ConvertirResponse
    {
        [Required(ErrorMessage = " The field SaldoCuentaDebito is required")]
        public decimal SaldoCuentaDebito { get; set; }

        [Required(ErrorMessage = " The field SaldoCuentaCredito is required")]
        public decimal SaldoCuentaCredito { get; set; }

        [Required(ErrorMessage = " The field ImporteConvertido is required")]
        public decimal ImporteConvertido { get; set; }

        [Required(ErrorMessage = " The field FechaTransacion is required")]
        public DateTime FechaTransaccion { get; set; }
    }
}