using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.DTOs
{
    public class ConvertirDto
    {
        [Required(ErrorMessage = " The field CuentaDebito is required")]
        public int CuentaDebito { get; set; }

        [Required(ErrorMessage = " The field CuentaCredito is required")]
        public int CuentaCredito { get; set; }

        [Required(ErrorMessage = " The field Importe is required")]
        public decimal Importe { get; set; }
    }
}