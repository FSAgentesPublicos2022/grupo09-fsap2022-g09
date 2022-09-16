namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cliente")]
    public partial class Cliente
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cliente()
        {
            CuentaUsuario = new HashSet<CuentaUsuario>();
        }

        [Key]
        public int ID_Cliente { get; set; }

        public int ID_TipoDocumento { get; set; }

        public int ID_Localidad { get; set; }

        [Required]
        [StringLength(50)]
        public string Apellido { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        [StringLength(50)]
        public string Contraseña { get; set; }

        [Required]
        [StringLength(50)]
        public string CPcliente { get; set; }

        public int? NumeroDocumentoCliente { get; set; }

        public int? Telefono { get; set; }

        [StringLength(50)]
        public string DireccionCliente { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaAltaCliente { get; set; }

        [Column(TypeName = "date")]
        public DateTime? FechaBajaCliente { get; set; }

        public bool? BloqueadoCliente { get; set; }

        public virtual Localidad Localidad { get; set; }

        public virtual TipoDocumento TipoDocumento { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CuentaUsuario> CuentaUsuario { get; set; }
    }
}
