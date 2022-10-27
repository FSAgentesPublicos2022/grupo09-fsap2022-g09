USE [DBOPCOIN]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/26/2022 18:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](321) NOT NULL,
	[Dni] [varchar](10) NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Cliente] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([ID_Usuario], [Apellido], [Nombre], [Email], [Dni], [Password]) VALUES (1, N'juan', N'perez', N'jperez@acme.com', N'30123123', N'12345678')
INSERT [dbo].[Usuario] ([ID_Usuario], [Apellido], [Nombre], [Email], [Dni], [Password]) VALUES (2, N'martinez', N'martin', N'mmartinez@acme.com', N'20123123', N'88888888')
INSERT [dbo].[Usuario] ([ID_Usuario], [Apellido], [Nombre], [Email], [Dni], [Password]) VALUES (7, N'dou', N'yon', N'ydou@acme.com', N'30123123', N'88888888')
INSERT [dbo].[Usuario] ([ID_Usuario], [Apellido], [Nombre], [Email], [Dni], [Password]) VALUES (9, N'diaz', N'pedro', N'pdiaz@acme.com', N'34.34', N'12345678')
INSERT [dbo].[Usuario] ([ID_Usuario], [Apellido], [Nombre], [Email], [Dni], [Password]) VALUES (10, N'Grillo', N'Pepe', N'pgrillo@opcoin2.com', N'22.333.444', N'p3p3gr1ll0')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Table [dbo].[TipoTransaccion]    Script Date: 10/26/2022 18:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoTransaccion](
	[ID_TipoTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoTransaccion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.TipoTransaccion] PRIMARY KEY CLUSTERED 
(
	[ID_TipoTransaccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TipoTransaccion] ON
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (1, N'compra')
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (2, N'conversion')
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (3, N'enviar')
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (4, N'recibir')
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (5, N'debito')
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (6, N'credito')
INSERT [dbo].[TipoTransaccion] ([ID_TipoTransaccion], [NombreTipoTransaccion]) VALUES (7, N'venta')
SET IDENTITY_INSERT [dbo].[TipoTransaccion] OFF
/****** Object:  Table [dbo].[TipoMoneda]    Script Date: 10/26/2022 18:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoMoneda](
	[ID_TipoMoneda] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoMoneda] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.TipoMoneda] PRIMARY KEY CLUSTERED 
(
	[ID_TipoMoneda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMoneda] ON
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (1, N'bitcoin')
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (2, N'ethereum')
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (3, N'monero')
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (4, N'cardano')
INSERT [dbo].[TipoMoneda] ([ID_TipoMoneda], [NombreTipoMoneda]) VALUES (5, N'peso')
SET IDENTITY_INSERT [dbo].[TipoMoneda] OFF
/****** Object:  Table [dbo].[Billetera]    Script Date: 10/26/2022 18:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billetera](
	[ID_Billetera] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoMoneda] [int] NOT NULL,
	[ID_Usuario] [int] NOT NULL,
	[SaldoCliente] [decimal](19, 10) NOT NULL,
	[FechaAltaCuentaUsuario] [date] NULL,
	[FechaBajaCuentaUsuario] [date] NULL,
 CONSTRAINT [PK_dbo.CuentaBancaria] PRIMARY KEY CLUSTERED 
(
	[ID_Billetera] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_Cliente] ON [dbo].[Billetera] 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_TipoMoneda] ON [dbo].[Billetera] 
(
	[ID_TipoMoneda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Billetera] ON
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (4, 1, 1, CAST(0.0000031000 AS Decimal(19, 10)), NULL, NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (5, 2, 1, CAST(0.0000720000 AS Decimal(19, 10)), NULL, NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (6, 3, 1, CAST(0.0005500000 AS Decimal(19, 10)), NULL, NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (7, 4, 1, CAST(0.0024700000 AS Decimal(19, 10)), NULL, NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (8, 1, 2, CAST(0.0000990000 AS Decimal(19, 10)), NULL, NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (9, 5, 10, CAST(94826000.0000000000 AS Decimal(19, 10)), CAST(0x7A440B00 AS Date), NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (10, 1, 10, CAST(90.0000000000 AS Decimal(19, 10)), CAST(0x7A440B00 AS Date), NULL)
INSERT [dbo].[Billetera] ([ID_Billetera], [ID_TipoMoneda], [ID_Usuario], [SaldoCliente], [FechaAltaCuentaUsuario], [FechaBajaCuentaUsuario]) VALUES (11, 2, 10, CAST(3547.2500000000 AS Decimal(19, 10)), CAST(0x7A440B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Billetera] OFF
/****** Object:  Table [dbo].[Transaccion]    Script Date: 10/26/2022 18:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaccion](
	[ID_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Billetera] [int] NOT NULL,
	[ID_TipoTransaccion] [int] NOT NULL,
	[FechaHoraTransaccion] [datetime2](7) NULL,
	[MontoTransaccion] [decimal](19, 10) NOT NULL,
	[DireccionBilleteraTransaccion] [varchar](50) NOT NULL,
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
	[ID_Billetera] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID_TipoTransaccion] ON [dbo].[Transaccion] 
(
	[ID_TipoTransaccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Transaccion] ON
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (2, 4, 1, NULL, CAST(0.0000011000 AS Decimal(19, 10)), N'3EEEjkUF6uxgjSukkjVtfKNnrdfrebRGR7')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (3, 9, 5, CAST(0x072B943FA1C794440B AS DateTime2), CAST(100000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (4, 10, 1, CAST(0x071CBB3FA1C794440B AS DateTime2), CAST(33.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (5, 9, 5, CAST(0x07574DCEB1B994440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (6, 11, 1, CAST(0x07574DCEB1B994440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (7, 9, 5, CAST(0x07B3233F8E1595440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (8, 11, 1, CAST(0x07B3233F8E1595440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (9, 10, 2, CAST(0x07041290B31695440B AS DateTime2), CAST(5.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (10, 11, 2, CAST(0x07041290B31695440B AS DateTime2), CAST(9.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (11, 9, 6, CAST(0x07606CFB841795440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (12, 11, 7, CAST(0x07606CFB841795440B AS DateTime2), CAST(0.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (13, 9, 6, CAST(0x07EC08544D1895440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (14, 11, 7, CAST(0x07EC08544D1895440B AS DateTime2), CAST(0.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (15, 9, 6, CAST(0x07BD47BAEC1895440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (16, 11, 7, CAST(0x07BD47BAEC1895440B AS DateTime2), CAST(0.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (17, 9, 5, CAST(0x07602F1B011995440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (18, 11, 1, CAST(0x07602F1B011995440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (19, 9, 6, CAST(0x07D9B6C42E1A95440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (20, 11, 7, CAST(0x07D9B6C42E1A95440B AS DateTime2), CAST(0.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (21, 9, 6, CAST(0x07A06B3B641A95440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (22, 11, 7, CAST(0x07A06B3B641A95440B AS DateTime2), CAST(0.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (23, 9, 6, CAST(0x079DF0C1C01B95440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (24, 11, 7, CAST(0x079DF0C1C01B95440B AS DateTime2), CAST(13000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (25, 9, 5, CAST(0x07069EABD81B95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (26, 11, 1, CAST(0x07069EABD81B95440B AS DateTime2), CAST(300000000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (27, 9, 5, CAST(0x07D0BA50D21C95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (28, 11, 1, CAST(0x07D0BA50D21C95440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (29, 9, 5, CAST(0x0704F3ED402095440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (30, 11, 1, CAST(0x0704F3ED402095440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (31, 9, 5, CAST(0x076905EE022195440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (32, 11, 1, CAST(0x076905EE022195440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (33, 9, 6, CAST(0x07CC5097142195440B AS DateTime2), CAST(10.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (34, 11, 7, CAST(0x07CC5097142195440B AS DateTime2), CAST(13000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (35, 10, 2, CAST(0x07437AEC2C2195440B AS DateTime2), CAST(5.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (36, 11, 2, CAST(0x07437AEC2C2195440B AS DateTime2), CAST(9.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (37, 9, 5, CAST(0x0723EEBAD96395440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (38, 11, 1, CAST(0x0723EEBAD96395440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (39, 9, 5, CAST(0x07E8795CE47095440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (40, 11, 1, CAST(0x07E8795CE47095440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (41, 9, 5, CAST(0x07AF2478037195440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (42, 11, 1, CAST(0x07AF2478037195440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (43, 9, 5, CAST(0x07290B2F867195440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (44, 11, 1, CAST(0x07290B2F867195440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (45, 9, 5, CAST(0x076E5A869A7195440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (46, 11, 1, CAST(0x076E5A869A7195440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (47, 9, 5, CAST(0x078C84E2C27195440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (48, 11, 1, CAST(0x078C84E2C27195440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (49, 9, 5, CAST(0x075667D1397295440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (50, 11, 1, CAST(0x075667D1397295440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (51, 9, 5, CAST(0x073BD946C07295440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (52, 11, 1, CAST(0x073BD946C07295440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (53, 9, 5, CAST(0x07BFD83FB97495440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (54, 11, 1, CAST(0x07BFD83FB97495440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (55, 9, 5, CAST(0x07AE93DCA67D95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (56, 11, 1, CAST(0x07AE93DCA67D95440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (57, 9, 5, CAST(0x07474676CF7D95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (58, 11, 1, CAST(0x07474676CF7D95440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (59, 9, 5, CAST(0x073FD9901E8295440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (60, 11, 1, CAST(0x073FD9901E8295440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (61, 9, 5, CAST(0x078798A16A8495440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (62, 11, 1, CAST(0x078798A16A8495440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (63, 9, 5, CAST(0x073015AAC88495440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (64, 11, 1, CAST(0x073015AAC88495440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (65, 9, 5, CAST(0x0701C206E48B95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (66, 11, 1, CAST(0x0701C206E48B95440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (67, 9, 5, CAST(0x07B7F2793B8C95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (68, 11, 1, CAST(0x07B7F2793B8C95440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (69, 9, 5, CAST(0x07E0398F1F8E95440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (70, 11, 1, CAST(0x07E0398F1F8E95440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (71, 9, 5, CAST(0x0749E724329595440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (72, 11, 1, CAST(0x0749E724329595440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (73, 9, 5, CAST(0x07F0930C579795440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (74, 11, 1, CAST(0x07F0930C579795440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (75, 9, 5, CAST(0x079BE158D09795440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (76, 11, 1, CAST(0x079BE158D09795440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (77, 9, 5, CAST(0x0710A45FDC9795440B AS DateTime2), CAST(200000.0000000000 AS Decimal(19, 10)), N'_NONE_')
INSERT [dbo].[Transaccion] ([ID_Transaccion], [ID_Billetera], [ID_TipoTransaccion], [FechaHoraTransaccion], [MontoTransaccion], [DireccionBilleteraTransaccion]) VALUES (78, 11, 1, CAST(0x0710A45FDC9795440B AS DateTime2), CAST(133.3300000000 AS Decimal(19, 10)), N'_NONE_')
SET IDENTITY_INSERT [dbo].[Transaccion] OFF
/****** Object:  ForeignKey [FK_Billetera_TipoMoneda1]    Script Date: 10/26/2022 18:10:30 ******/
ALTER TABLE [dbo].[Billetera]  WITH CHECK ADD  CONSTRAINT [FK_Billetera_TipoMoneda1] FOREIGN KEY([ID_TipoMoneda])
REFERENCES [dbo].[TipoMoneda] ([ID_TipoMoneda])
GO
ALTER TABLE [dbo].[Billetera] CHECK CONSTRAINT [FK_Billetera_TipoMoneda1]
GO
/****** Object:  ForeignKey [FK_Billetera_Usuario]    Script Date: 10/26/2022 18:10:30 ******/
ALTER TABLE [dbo].[Billetera]  WITH CHECK ADD  CONSTRAINT [FK_Billetera_Usuario] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Billetera] CHECK CONSTRAINT [FK_Billetera_Usuario]
GO
/****** Object:  ForeignKey [FK_Transaccion_Billetera]    Script Date: 10/26/2022 18:10:30 ******/
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_Billetera] FOREIGN KEY([ID_Billetera])
REFERENCES [dbo].[Billetera] ([ID_Billetera])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_Billetera]
GO
/****** Object:  ForeignKey [FK_Transaccion_TipoTransaccion]    Script Date: 10/26/2022 18:10:30 ******/
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_TipoTransaccion] FOREIGN KEY([ID_TipoTransaccion])
REFERENCES [dbo].[TipoTransaccion] ([ID_TipoTransaccion])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_TipoTransaccion]
GO
