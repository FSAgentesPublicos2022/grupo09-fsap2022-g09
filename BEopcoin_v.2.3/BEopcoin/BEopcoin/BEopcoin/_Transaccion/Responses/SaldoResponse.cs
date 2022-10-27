using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Responses
{
    public class SaldoResponse
    {
        [Required(ErrorMessage = " The field Saldo is required")]
        public decimal Saldo { get; set; }
    }
}