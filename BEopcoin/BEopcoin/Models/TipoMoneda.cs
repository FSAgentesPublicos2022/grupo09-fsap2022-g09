namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TipoMoneda")]
    public partial class TipoMoneda
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TipoMoneda()
        {
            CuentaUsuario = new HashSet<CuentaUsuario>();
        }

        [Key]
        public int ID_TipoMoneda { get; set; }

        [StringLength(50)]
        public string NombreTipoMoneda { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CuentaUsuario> CuentaUsuario { get; set; }
    }
}
