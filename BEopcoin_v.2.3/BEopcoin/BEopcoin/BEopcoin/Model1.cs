using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BEopcoin
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Billetera> Billetera { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TipoMoneda> TipoMoneda { get; set; }
        public virtual DbSet<TipoTransaccion> TipoTransaccion { get; set; }
        public virtual DbSet<Transaccion> Transaccion { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Billetera>()
                .Property(e => e.SaldoCliente)
                .HasPrecision(19, 2);

            modelBuilder.Entity<Billetera>()
                .HasMany(e => e.Transaccion)
                .WithRequired(e => e.Billetera)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TipoMoneda>()
                .Property(e => e.NombreTipoMoneda)
                .IsUnicode(false);

            modelBuilder.Entity<TipoMoneda>()
                .HasMany(e => e.Billetera)
                .WithRequired(e => e.TipoMoneda)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TipoTransaccion>()
                .Property(e => e.NombreTipoTransaccion)
                .IsUnicode(false);

            modelBuilder.Entity<TipoTransaccion>()
                .HasMany(e => e.Transaccion)
                .WithRequired(e => e.TipoTransaccion)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Transaccion>()
                .Property(e => e.MontoTransaccion)
                .HasPrecision(19, 2);

            modelBuilder.Entity<Transaccion>()
                .Property(e => e.DireccionBilleteraTransaccion)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Apellido)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Dni)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Billetera)
                .WithRequired(e => e.Usuario)
                .WillCascadeOnDelete(false);
        }
    }
}
