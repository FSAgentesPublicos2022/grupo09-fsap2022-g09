using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BEopcoin._Transaccion.Responses
{
    public class BilleteraResponse
    {
        [Required(ErrorMessage = " The field ID_Billetera is required")]
        public int ID_Billetera { get; set; }

        [Required(ErrorMessage = " The field ID_TipoMoneda is required")]
        public int ID_TipoMoneda { get; set; }

        [Required(ErrorMessage = " The field ID_Usuario is required")]
        public int ID_Usuario { get; set; }

        [Required(ErrorMessage = " The field SaldoCliente is required")]
        public decimal SaldoCliente { get; set; }

        [Required(ErrorMessage = " The field FechaAltaCuentaUsuario is required")]
        public DateTime? FechaAltaCuentaUsuario { get; set; }

        [Required(ErrorMessage = " The field FechaBajaCuentaUsuario is required")]
        public DateTime? FechaBajaCuentaUsuario { get; set; }
    }
}