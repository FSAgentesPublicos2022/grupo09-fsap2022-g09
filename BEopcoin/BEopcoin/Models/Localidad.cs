namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Localidad")]
    public partial class Localidad
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Localidad()
        {
            Cliente = new HashSet<Cliente>();
        }

        [Key]
        public int ID_Localidad { get; set; }

        [Required]
        [StringLength(30)]
        public string NombreLocalidad { get; set; }

        public int ID_Provincia { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cliente> Cliente { get; set; }

        public virtual Provincia Provincia { get; set; }
    }
}
