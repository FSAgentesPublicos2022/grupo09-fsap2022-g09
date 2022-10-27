namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            Billetera = new HashSet<Billetera>();
        }

        [Key]
        public int ID_Usuario { get; set; }

        //[Required]
        [StringLength(50)]
        public string Apellido { get; set; }

        //[Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        [StringLength(321)]
        public string Email { get; set; }

        //[Required]
        [StringLength(10)]
        public string Dni { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Billetera> Billetera { get; set; }
    }
}
