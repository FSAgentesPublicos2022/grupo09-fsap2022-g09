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
            Sesion = new HashSet<Sesion>();
        }

        [Key]
        public int ID_Usuario { get; set; }

        public int ID_Rol { get; set; }

        [Required]
        [StringLength(321)]
        public string NombreUsuario { get; set; }

        [Required]
        [StringLength(32)]
        public string Password { get; set; }

        public DateTime? FechaHoraAlta { get; set; } //

        public DateTime? FechaHoraBaja { get; set; }

        public int? ID_Cliente { get; set; }

        public bool Bloqueado { get; set; }

        public virtual Rol Rol { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sesion> Sesion { get; set; }
    }
}
