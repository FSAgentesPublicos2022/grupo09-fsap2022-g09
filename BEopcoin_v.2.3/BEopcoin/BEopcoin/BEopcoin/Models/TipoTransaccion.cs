namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TipoTransaccion")]
    public partial class TipoTransaccion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TipoTransaccion()
        {
            Transaccion = new HashSet<Transaccion>();
        }

        [Key]
        public int ID_TipoTransaccion { get; set; }

        [Required]
        [StringLength(20)]
        public string NombreTipoTransaccion { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Transaccion> Transaccion { get; set; }
    }
}
