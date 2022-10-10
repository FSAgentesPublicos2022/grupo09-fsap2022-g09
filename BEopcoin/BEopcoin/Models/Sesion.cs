namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sesion")]
    public partial class Sesion
    {
        [Key]
        public int ID_Sesion { get; set; }

        public int ID_Usuario { get; set; }

        public DateTime FechaHoraInicio { get; set; }

        public DateTime? FechaHoraFin { get; set; }

        [Required]
        public string Token { get; set; }

        public DateTime FechaHoraUltimaActividad { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
