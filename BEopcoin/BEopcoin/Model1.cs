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

        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<CuentaUsuario> CuentaUsuario { get; set; }
        public virtual DbSet<Localidad> Localidad { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TipoDocumento> TipoDocumento { get; set; }
        public virtual DbSet<TipoMoneda> TipoMoneda { get; set; }
        public virtual DbSet<TipoTransaccion> TipoTransaccion { get; set; }
        public virtual DbSet<Transaccion> Transaccion { get; set; }
        public virtual DbSet<ViewNombreApellido> View_NombreApellido { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cliente>()
                .Property(e => e.Apellido)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .HasMany(e => e.CuentaUsuario)
                .WithRequired(e => e.Cliente)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CuentaUsuario>()
                .Property(e => e.SaldoCliente)
                .HasPrecision(19, 4);

            modelBuilder.Entity<CuentaUsuario>()
                .HasMany(e => e.Transaccion)
                .WithRequired(e => e.CuentaUsuario)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Localidad>()
                .Property(e => e.NombreLocalidad)
                .IsUnicode(false);

            modelBuilder.Entity<Localidad>()
                .HasMany(e => e.Cliente)
                .WithRequired(e => e.Localidad)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Provincia>()
                .Property(e => e.NombreProvincia)
                .IsUnicode(false);

            modelBuilder.Entity<Provincia>()
                .HasMany(e => e.Localidad)
                .WithRequired(e => e.Provincia)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TipoDocumento>()
                .Property(e => e.NombreTipoDocumento)
                .IsUnicode(false);

            modelBuilder.Entity<TipoDocumento>()
                .HasMany(e => e.Cliente)
                .WithRequired(e => e.TipoDocumento)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TipoMoneda>()
                .Property(e => e.NombreTipoMoneda)
                .IsUnicode(false);

            modelBuilder.Entity<TipoMoneda>()
                .HasMany(e => e.CuentaUsuario)
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
                .HasPrecision(19, 4);

            modelBuilder.Entity<Transaccion>()
                .Property(e => e.CotizacionMonedaTransaccion)
                .HasPrecision(19, 4);

            modelBuilder.Entity<ViewNombreApellido>()
                .Property(e => e.Nombre)
                .IsUnicode(false);

            modelBuilder.Entity<ViewNombreApellido>()
                .Property(e => e.Apellido)
                .IsUnicode(false);

            modelBuilder.Entity<ViewNombreApellido>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}
