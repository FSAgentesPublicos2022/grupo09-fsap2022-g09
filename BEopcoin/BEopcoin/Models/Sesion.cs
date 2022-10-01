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
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID_Sesion { get; set; }

        public int ID_Usuario { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime FechaHoraInicio { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? FechaHoraFin { get; set; }

        [Required]
        public string Ttoken { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
