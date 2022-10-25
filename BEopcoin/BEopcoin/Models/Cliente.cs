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
            CuentaBancaria = new HashSet<CuentaBancaria>();
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
        [StringLength(321)]
        public string Email { get; set; }

        [Required]
        [StringLength(10)]
        public string CPcliente { get; set; }

        [Required]
        [StringLength(10)]
        public string NumeroDocumentoCliente { get; set; }

        [Required]
        [StringLength(200)]
        public string Telefono { get; set; }

        [Required]
        [StringLength(50)]
        public string DireccionCliente { get; set; }

        public DateTime? FechaHoraAltaCliente { get; set; }

        public DateTime? FechaHoraBajaCliente { get; set; }

        public virtual Localidad Localidad { get; set; }

        public virtual TipoDocumento TipoDocumento { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CuentaBancaria> CuentaBancaria { get; set; }
    }
}
