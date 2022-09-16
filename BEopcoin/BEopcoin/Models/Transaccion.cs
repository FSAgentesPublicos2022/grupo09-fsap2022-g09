namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Transaccion")]
    public partial class Transaccion
    {
        [Key]
        public int ID_Transaccion { get; set; }

        public int ID_CuentaUsuario { get; set; }

        public int ID_TipoTransaccion { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaTransaccion { get; set; }

        public TimeSpan HoraTransaccion { get; set; }

        [Column(TypeName = "money")]
        public decimal MontoTransaccion { get; set; }

        [Required]
        [StringLength(50)]
        public string DireccionBilleteraTransaccion { get; set; }

        [Column(TypeName = "money")]
        public decimal CotizacionMonedaTransaccion { get; set; }

        public virtual CuentaUsuario CuentaUsuario { get; set; }

        public virtual TipoTransaccion TipoTransaccion { get; set; }
    }
}
