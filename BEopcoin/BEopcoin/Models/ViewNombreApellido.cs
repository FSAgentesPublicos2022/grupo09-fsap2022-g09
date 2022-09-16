namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ViewNombreApellido")]
    public partial class ViewNombreApellido
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string Apellido { get; set; }

        [Key]
        [Column(Order = 2)]
        public string Email { get; set; }
    }
}
