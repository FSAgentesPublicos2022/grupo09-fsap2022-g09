USE [DB_OPCOIN]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoTransaccion]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTransaccion](
	[ID_TipoTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoTransaccion] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.TipoTransaccion] PRIMARY KEY CLUSTERED 
(
	[ID_TipoTransaccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoMoneda]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoMoneda](
	[ID_TipoMoneda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoMoneda] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.TipoMoneda] PRIMARY KEY CLUSTERED 
(
	[ID_TipoMoneda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[ID_TipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoDocumento] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[ID_TipoDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[ID_Rol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](20) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Rol] PRIMARY KEY CLUSTERED 
(
	[ID_Rol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincia](
	[ID_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Provincia] PRIMARY KEY CLUSTERED 
(
	[ID_Provincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidad](
	[ID_Localidad] [int] IDENTITY(1,1) NOT NULL,
	[NombreLocalidad] [varchar](30) NOT NULL,
	[ID_Provincia] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Localidad] PRIMARY KEY CLUSTERED 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ID_Provincia] ON [dbo].[Localidad] 
(
	[ID_Provincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[ID_Rol] [int] NOT NULL,
	[NombreUsuario] [varchar](321) NOT NULL,
	[Contrasena] [varchar](32) NOT NULL,
	[FechaHoraAlta] [datetime] NOT NULL,
	[FechaHoraBaja] [datetime] NULL,
	[ID_Cliente] [int] NULL,
	[Bloqueado] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ID_Rol] ON [dbo].[Usuario] 
(
	[ID_Rol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sesion](
	[ID_Sesion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[FechaHoraInicio] [datetime] NOT NULL,
	[FechaHoraFin] [datetime] NULL,
	[Token] [varchar](max) NOT NULL,
	[FechaHoraUltimaActividad] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Sesion] PRIMARY KEY CLUSTERED 
(
	[ID_Sesion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ID_Usuario] ON [dbo].[Sesion] 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoDocumento] [int] NOT NULL,
	[ID_Localidad] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](321) NOT NULL,
	[CPcliente] [varchar](10) NOT NULL,
	[NumeroDocumentoCliente] [varchar](10) NOT NULL,
	[Telefono] [varchar](200) NOT NULL,
	[DireccionCliente] [varchar](50) NOT NULL,
	[FechaHoraAltaCliente] [datetime] NOT NULL,
	[FechaHoraBajaCliente] [datetime] NULL,
 CONSTRAINT [PK_dbo.Cliente] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ID_Localidad] ON [dbo].[Cliente] 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_TipoDocumento] ON [dbo].[Cliente] 
(
	[ID_TipoDocumento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaBancaria]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaBancaria](
	[ID_CuentaBancaria] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoMoneda] [int] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[SaldoCliente] [decimal](19, 2) NOT NULL,
	[FechaAltaCuentaUsuario] [date] NOT NULL,
	[FechaBajaCuentaUsuario] [date] NULL,
 CONSTRAINT [PK_dbo.CuentaBancaria] PRIMARY KEY CLUSTERED 
(
	[ID_CuentaBancaria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_Cliente] ON [dbo].[CuentaBancaria] 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_TipoMoneda] ON [dbo].[CuentaBancaria] 
(
	[ID_TipoMoneda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 10/01/2022 17:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaccion](
	[ID_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[ID_CuentaBancaria] [int] NOT NULL,
	[ID_TipoTransaccion] [int] NOT NULL,
	[FechaHoraTransaccion] [datetime2](7) NOT NULL,
	[MontoTransaccion] [decimal](19, 2) NOT NULL,
	[DireccionBilleteraTransaccion] [varchar](50) NOT NULL,
	[CotizacionMonedaTransaccion] [numeric](19, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Transaccion] PRIMARY KEY CLUSTERED 
(
	[ID_Transaccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ID_CuentaBancaria] ON [dbo].[Transaccion] 
(
	[ID_CuentaBancaria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_TipoTransaccion] ON [dbo].[Transaccion] 
(
	[ID_TipoTransaccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF__Usuario__Bloquea__2B3F6F97]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Bloqueado]
GO
/****** Object:  ForeignKey [FK_dbo.Localidad_dbo.Provincia_ID_Provincia]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Localidad_dbo.Provincia_ID_Provincia] FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[Provincia] ([ID_Provincia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_dbo.Localidad_dbo.Provincia_ID_Provincia]
GO
/****** Object:  ForeignKey [FK_dbo.Usuario_dbo.Rol_ID_Rol]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Usuario_dbo.Rol_ID_Rol] FOREIGN KEY([ID_Rol])
REFERENCES [dbo].[Rol] ([ID_Rol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_dbo.Usuario_dbo.Rol_ID_Rol]
GO
/****** Object:  ForeignKey [FK_dbo.Sesion_dbo.Usuario_ID_Usuario]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Sesion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sesion_dbo.Usuario_ID_Usuario] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Sesion] CHECK CONSTRAINT [FK_dbo.Sesion_dbo.Usuario_ID_Usuario]
GO
/****** Object:  ForeignKey [FK_dbo.Cliente_dbo.Localidad_ID_Localidad]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cliente_dbo.Localidad_ID_Localidad] FOREIGN KEY([ID_Localidad])
REFERENCES [dbo].[Localidad] ([ID_Localidad])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_dbo.Cliente_dbo.Localidad_ID_Localidad]
GO
/****** Object:  ForeignKey [FK_dbo.Cliente_dbo.TipoDocumento_ID_TipoDocumento]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cliente_dbo.TipoDocumento_ID_TipoDocumento] FOREIGN KEY([ID_TipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([ID_TipoDocumento])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_dbo.Cliente_dbo.TipoDocumento_ID_TipoDocumento]
GO
/****** Object:  ForeignKey [FK_dbo.CuentaBancaria_dbo.Cliente_ID_Cliente]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[CuentaBancaria]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CuentaBancaria_dbo.Cliente_ID_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[CuentaBancaria] CHECK CONSTRAINT [FK_dbo.CuentaBancaria_dbo.Cliente_ID_Cliente]
GO
/****** Object:  ForeignKey [FK_dbo.CuentaBancaria_dbo.TipoMoneda_ID_TipoMoneda]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[CuentaBancaria]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CuentaBancaria_dbo.TipoMoneda_ID_TipoMoneda] FOREIGN KEY([ID_TipoMoneda])
REFERENCES [dbo].[TipoMoneda] ([ID_TipoMoneda])
GO
ALTER TABLE [dbo].[CuentaBancaria] CHECK CONSTRAINT [FK_dbo.CuentaBancaria_dbo.TipoMoneda_ID_TipoMoneda]
GO
/****** Object:  ForeignKey [FK_dbo.Transaccion_dbo.CuentaBancaria_ID_CuentaBancaria]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transaccion_dbo.CuentaBancaria_ID_CuentaBancaria] FOREIGN KEY([ID_CuentaBancaria])
REFERENCES [dbo].[CuentaBancaria] ([ID_CuentaBancaria])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_dbo.Transaccion_dbo.CuentaBancaria_ID_CuentaBancaria]
GO
/****** Object:  ForeignKey [FK_dbo.Transaccion_dbo.TipoTransaccion_ID_TipoTransaccion]    Script Date: 10/01/2022 17:59:22 ******/
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transaccion_dbo.TipoTransaccion_ID_TipoTransaccion] FOREIGN KEY([ID_TipoTransaccion])
REFERENCES [dbo].[TipoTransaccion] ([ID_TipoTransaccion])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_dbo.Transaccion_dbo.TipoTransaccion_ID_TipoTransaccion]
GO
