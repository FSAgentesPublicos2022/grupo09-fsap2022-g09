namespace BEopcoin
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Billetera")]
    public partial class Billetera
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Billetera()
        {
            Transaccion = new HashSet<Transaccion>();
        }

        [Key]
        public int ID_Billetera { get; set; }

        public int ID_TipoMoneda { get; set; }

        public int ID_Usuario { get; set; }

        public decimal SaldoCliente { get; set; }

        [Column(TypeName = "date")]
        public DateTime? FechaAltaCuentaUsuario { get; set; }

        [Column(TypeName = "date")]
        public DateTime? FechaBajaCuentaUsuario { get; set; }

        public virtual TipoMoneda TipoMoneda { get; set; }

        public virtual Usuario Usuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Transaccion> Transaccion { get; set; }
    }
}
