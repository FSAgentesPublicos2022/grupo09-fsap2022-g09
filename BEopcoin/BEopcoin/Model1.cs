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

        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<CuentaBancaria> CuentaBancaria { get; set; }
        public virtual DbSet<Localidad> Localidad { get; set; }
        public virtual DbSet<Provincia> Provincia { get; set; }
        public virtual DbSet<Rol> Rol { get; set; }
        public virtual DbSet<Sesion> Sesion { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TipoDocumento> TipoDocumento { get; set; }
        public virtual DbSet<TipoMoneda> TipoMoneda { get; set; }
        public virtual DbSet<TipoTransaccion> TipoTransaccion { get; set; }
        public virtual DbSet<Transaccion> Transaccion { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }

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
                .Property(e => e.CPcliente)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .Property(e => e.NumeroDocumentoCliente)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .Property(e => e.Telefono)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .Property(e => e.DireccionCliente)
                .IsUnicode(false);

            modelBuilder.Entity<Cliente>()
                .HasMany(e => e.CuentaBancaria)
                .WithRequired(e => e.Cliente)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CuentaBancaria>()
                .Property(e => e.SaldoCliente)
                .HasPrecision(19, 2);

            modelBuilder.Entity<CuentaBancaria>()
                .HasMany(e => e.Transaccion)
                .WithRequired(e => e.CuentaBancaria)
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

            modelBuilder.Entity<Rol>()
                .Property(e => e.NombreRol)
                .IsUnicode(false);

            modelBuilder.Entity<Rol>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<Rol>()
                .HasMany(e => e.Usuario)
                .WithRequired(e => e.Rol)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Sesion>()
                .Property(e => e.Token)
                .IsUnicode(false);

            modelBuilder.Entity<TipoDocumento>()
                .Property(e => e.NombreTipoDocumento)
                .IsUnicode(false);

            modelBuilder.Entity<TipoDocumento>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<TipoDocumento>()
                .HasMany(e => e.Cliente)
                .WithRequired(e => e.TipoDocumento)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TipoMoneda>()
                .Property(e => e.NombreTipoMoneda)
                .IsUnicode(false);

            modelBuilder.Entity<TipoMoneda>()
                .Property(e => e.Descripcion)
                .IsUnicode(false);

            modelBuilder.Entity<TipoMoneda>()
                .HasMany(e => e.CuentaBancaria)
                .WithRequired(e => e.TipoMoneda)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TipoTransaccion>()
                .Property(e => e.NombreTipoTransaccion)
                .IsUnicode(false);

            modelBuilder.Entity<TipoTransaccion>()
                .Property(e => e.Descripcion)
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

            modelBuilder.Entity<Transaccion>()
                .Property(e => e.CotizacionMonedaTransaccion)
                .HasPrecision(19, 2);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.NombreUsuario)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Sesion)
                .WithRequired(e => e.Usuario)
                .WillCascadeOnDelete(false);
        }
    }
}
