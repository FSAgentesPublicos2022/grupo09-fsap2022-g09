namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CuentaUsuario")]
    public partial class CuentaUsuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CuentaUsuario()
        {
            Transaccion = new HashSet<Transaccion>();
        }

        [Key]
        public int ID_CuentaUsuario { get; set; }

        public int ID_TipoMoneda { get; set; }

        public int ID_Cliente { get; set; }

        [Column(TypeName = "money")]
        public decimal SaldoCliente { get; set; }

        [Column(TypeName = "date")]
        public DateTime FechaAltaCuentaUsuario { get; set; }

        [Column(TypeName = "date")]
        public DateTime? FechaBajaCuentaUsuario { get; set; }

        public virtual Cliente Cliente { get; set; }

        public virtual TipoMoneda TipoMoneda { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Transaccion> Transaccion { get; set; }
    }
}
