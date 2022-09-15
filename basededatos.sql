USE [master]
GO
/****** Object:  Database [DBOPCOIN]    Script Date: 15/9/2022 20:31:22 ******/
CREATE DATABASE [DBOPCOIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBOPCOIN_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBOPCOIN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBOPCOIN_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBOPCOIN.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBOPCOIN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBOPCOIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBOPCOIN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBOPCOIN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBOPCOIN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBOPCOIN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBOPCOIN] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBOPCOIN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBOPCOIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBOPCOIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBOPCOIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBOPCOIN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBOPCOIN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBOPCOIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBOPCOIN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBOPCOIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBOPCOIN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBOPCOIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBOPCOIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBOPCOIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBOPCOIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBOPCOIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBOPCOIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBOPCOIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBOPCOIN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBOPCOIN] SET  MULTI_USER 
GO
ALTER DATABASE [DBOPCOIN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBOPCOIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBOPCOIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBOPCOIN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBOPCOIN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBOPCOIN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBOPCOIN] SET QUERY_STORE = OFF
GO
USE [DBOPCOIN]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoDocumento] [int] NOT NULL,
	[ID_Localidad] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[CPcliente] [nvarchar](50) NOT NULL,
	[NumeroDocumentoCliente] [int] NULL,
	[Telefono] [int] NULL,
	[DireccionCliente] [nvarchar](50) NULL,
	[FechaAltaCliente] [date] NOT NULL,
	[FechaBajaCliente] [date] NULL,
	[BloqueadoCliente] [bit] NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewNombreApellido]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewNombreApellido]
AS
SELECT        Nombre, Apellido, Email
FROM            dbo.CLIENTE
GO
/****** Object:  Table [dbo].[CuentaUsuario]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaUsuario](
	[ID_CuentaUsuario] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoMoneda] [int] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[SaldoCliente] [money] NOT NULL,
	[FechaAltaCuentaUsuario] [date] NOT NULL,
	[FechaBajaCuentaUsuario] [date] NULL,
 CONSTRAINT [PK_CUENTA_USUARIO] PRIMARY KEY CLUSTERED 
(
	[ID_CuentaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[ID_Localidad] [int] IDENTITY(1,1) NOT NULL,
	[NombreLocalidad] [varchar](50) NOT NULL,
	[ID_Provincia] [int] NOT NULL,
 CONSTRAINT [PK_LOCALIDAD] PRIMARY KEY CLUSTERED 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[ID_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [varchar](50) NULL,
 CONSTRAINT [PK_PROVINCIA] PRIMARY KEY CLUSTERED 
(
	[ID_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[ID_TipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoDocumento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TIPO_DOCUMENTO] PRIMARY KEY CLUSTERED 
(
	[ID_TipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMoneda]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMoneda](
	[ID_TipoMoneda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoMoneda] [varchar](50) NULL,
 CONSTRAINT [PK_TIPO_MONEDA] PRIMARY KEY CLUSTERED 
(
	[ID_TipoMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTransaccion]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTransaccion](
	[ID_TipoTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoTransaccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TIPO_TRANSACCION] PRIMARY KEY CLUSTERED 
(
	[ID_TipoTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 15/9/2022 20:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[ID_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[ID_CuentaUsuario] [int] NOT NULL,
	[ID_TipoTransaccion] [int] NOT NULL,
	[FechaTransaccion] [date] NOT NULL,
	[HoraTransaccion] [time](7) NOT NULL,
	[MontoTransaccion] [money] NOT NULL,
	[DireccionBilleteraTransaccion] [nvarchar](50) NOT NULL,
	[CotizacionMonedaTransaccion] [money] NOT NULL,
 CONSTRAINT [PK_TRANSACCION] PRIMARY KEY CLUSTERED 
(
	[ID_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([ID_Cliente], [ID_TipoDocumento], [ID_Localidad], [Apellido], [Nombre], [Email], [Contraseña], [CPcliente], [NumeroDocumentoCliente], [Telefono], [DireccionCliente], [FechaAltaCliente], [FechaBajaCliente], [BloqueadoCliente]) VALUES (1, 1, 1, N'juan', N'perez', N'qwert@acme.com', N'12345678', N'5000', 30300300, 351454455, N'qwerty 123', CAST(N'2020-01-02' AS Date), NULL, NULL)
INSERT [dbo].[Cliente] ([ID_Cliente], [ID_TipoDocumento], [ID_Localidad], [Apellido], [Nombre], [Email], [Contraseña], [CPcliente], [NumeroDocumentoCliente], [Telefono], [DireccionCliente], [FechaAltaCliente], [FechaBajaCliente], [BloqueadoCliente]) VALUES (2, 1, 2, N'yon', N'dou', N'asdfg@gmail.com', N'password', N'6000', 29299299, 33232545, N'qqqq 123', CAST(N'2021-04-05' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[CuentaUsuario] ON 

INSERT [dbo].[CuentaUsuario] ([ID_CuentaUsuario], [ID_TipoMoneda], [ID_Cliente], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (1, 1, 1, 5000.0000, CAST(N'2010-01-01' AS Date), NULL)
INSERT [dbo].[CuentaUsuario] ([ID_CuentaUsuario], [ID_TipoMoneda], [ID_Cliente], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (2, 2, 2, 1000.0000, CAST(N'2020-03-05' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[CuentaUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([ID_Localidad], [NombreLocalidad], [ID_Provincia]) VALUES (1, N'cordoba', 1)
INSERT [dbo].[Localidad] ([ID_Localidad], [NombreLocalidad], [ID_Provincia]) VALUES (2, N'san miguel ', 2)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([ID_Provincia], [NombreProvincia]) VALUES (1, N'cordoba')
INSERT [dbo].[Provincia] ([ID_Provincia], [NombreProvincia]) VALUES (2, N'tucuman')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumento] ON 

INSERT [dbo].[TipoDocumento] ([ID_TipoDocumento], [NombreTipoDocumento]) VALUES (1, N'dni')
INSERT [dbo].[TipoDocumento] ([ID_TipoDocumento], [NombreTipoDocumento]) VALUES (2, N'pasaporte')
SET IDENTITY_INSERT [dbo].[TipoDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMoneda] ON 

INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (1, N'bitcoin')
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (2, N'ethereum')
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (3, N'monero')
SET IDENTITY_INSERT [dbo].[TipoMoneda] OFF
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_LOCALIDAD] FOREIGN KEY([ID_Localidad])
REFERENCES [dbo].[Localidad] ([ID_Localidad])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_CLIENTE_LOCALIDAD]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_TIPO_DOCUMENTO] FOREIGN KEY([ID_TipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([ID_TipoDocumento])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_CLIENTE_TIPO_DOCUMENTO]
GO
ALTER TABLE [dbo].[CuentaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_CUENTA_USUARIO_CLIENTE1] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[CuentaUsuario] CHECK CONSTRAINT [FK_CUENTA_USUARIO_CLIENTE1]
GO
ALTER TABLE [dbo].[CuentaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_CUENTA_USUARIO_TIPO_MONEDA] FOREIGN KEY([ID_TipoMoneda])
REFERENCES [dbo].[TipoMoneda] ([ID_TipoMoneda])
GO
ALTER TABLE [dbo].[CuentaUsuario] CHECK CONSTRAINT [FK_CUENTA_USUARIO_TIPO_MONEDA]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_LOCALIDAD_PROVINCIA] FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[Provincia] ([ID_Provincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_LOCALIDAD_PROVINCIA]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_TRANSACCION_CUENTA_USUARIO] FOREIGN KEY([ID_CuentaUsuario])
REFERENCES [dbo].[CuentaUsuario] ([ID_CuentaUsuario])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_TRANSACCION_CUENTA_USUARIO]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_TRANSACCION_TIPO_TRANSACCION] FOREIGN KEY([ID_TipoTransaccion])
REFERENCES [dbo].[TipoTransaccion] ([ID_TipoTransaccion])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_TRANSACCION_TIPO_TRANSACCION]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CLIENTE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewNombreApellido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewNombreApellido'
GO
USE [master]
GO
ALTER DATABASE [DBOPCOIN] SET  READ_WRITE 
GO
