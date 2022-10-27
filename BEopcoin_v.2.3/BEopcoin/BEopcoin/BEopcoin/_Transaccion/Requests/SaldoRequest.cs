using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Requests
{
    public class SaldoRequest
    {
        [Required(ErrorMessage = " The field Cuenta is required")]
        public int Cuenta { get; set; }

    }
}