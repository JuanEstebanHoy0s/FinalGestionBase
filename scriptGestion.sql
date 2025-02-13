USE [SISTEMAGESTION1]
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleServicioType]    Script Date: 29/11/2024 9:45:46 p. m. ******/
CREATE TYPE [dbo].[DetalleServicioType] AS TABLE(
	[idServicio] [int] NULL,
	[idEmpleado] [int] NULL,
	[fecha] [date] NULL,
	[subtotal] [numeric](12, 2) NULL,
	[iva] [numeric](12, 2) NULL
)
GO
/****** Object:  Table [dbo].[ActividadEconomica]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadEconomica](
	[idActividadEconomica] [int] NOT NULL,
	[codigoActividad] [int] NOT NULL,
	[descripcionActividad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_idActividadEconomica] PRIMARY KEY CLUSTERED 
(
	[idActividadEconomica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[IdAuditoria] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [char](1) NULL,
	[Tabla] [varchar](50) NULL,
	[Registro] [int] NULL,
	[Campo] [varchar](50) NULL,
	[ValorDespues] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Usuario] [varchar](50) NULL,
	[ValorAntes] [varchar](50) NULL,
	[Pc] [varchar](50) NULL,
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaseRiesgo]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaseRiesgo](
	[idClaseRiesgo] [int] NOT NULL,
	[nivelClase] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[idCliente] [int] NULL,
 CONSTRAINT [PK_CLaseRiesgo] PRIMARY KEY CLUSTERED 
(
	[idClaseRiesgo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificacion]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion](
	[idClasificacion] [int] NOT NULL,
	[tipoClasificacion] [varchar](50) NOT NULL,
	[cantidadEmpleados] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[idActividadEconomica] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
 CONSTRAINT [PK_idClasificacion] PRIMARY KEY CLUSTERED 
(
	[idClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[nombreCli] [varchar](50) NOT NULL,
	[apellidoCli] [varchar](50) NULL,
	[direccionCli] [varchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[idContacto] [int] NULL,
	[correoContacto] [varchar](50) NOT NULL,
	[asunto] [varchar](30) NOT NULL,
	[descripcionAsunto] [varchar](200) NOT NULL,
	[idCliente] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleServicio]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleServicio](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[idFactura] [int] NULL,
	[idServicio] [int] NULL,
	[idEmpleado] [int] NULL,
	[fechaServicio] [date] NULL,
	[subTotalServicio] [numeric](12, 0) NOT NULL,
	[ivaServicio] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[cedula] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[telefono] [numeric](10, 0) NOT NULL,
	[cargo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_cedula] PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[nit] [numeric](10, 0) NULL,
	[nombreEmpresa] [varchar](50) NULL,
	[fechaFactura] [date] NULL,
	[total] [numeric](12, 0) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Garantia]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garantia](
	[idGarantia] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[fechaIni] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[idFactura] [int] NOT NULL,
 CONSTRAINT [PK_idGarantia] PRIMARY KEY CLUSTERED 
(
	[idGarantia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumIdentific]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumIdentific](
	[idNumIdentific] [int] NOT NULL,
	[numeroDocumento] [numeric](20, 0) NOT NULL,
	[idTipoIdenti] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
 CONSTRAINT [PK_idNumIdentific] PRIMARY KEY CLUSTERED 
(
	[idNumIdentific] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroCliente]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroCliente](
	[idLogin] [int] NOT NULL,
	[idCliente] [int] NULL,
	[email] [varchar](50) NULL,
	[confirmarCorreo] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
	[confirmarContrasena] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RegistroCliente] PRIMARY KEY CLUSTERED 
(
	[idLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroEmpleado]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroEmpleado](
	[idRegistro] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[confirmContraseña] [varchar](50) NOT NULL,
	[cedula] [int] NOT NULL,
 CONSTRAINT [PK_idRegistro] PRIMARY KEY CLUSTERED 
(
	[idRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[idServicio] [int] NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[valorHoras] [int] NOT NULL,
 CONSTRAINT [PK_idServicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[idTelefono] [int] NOT NULL,
	[idCliente] [int] NULL,
	[idtipoTelefono] [int] NULL,
	[telefono] [numeric](10, 0) NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[idTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoDocumento]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoDocumento](
	[idTipoIdenti] [int] NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [PK_idTipoIdenti] PRIMARY KEY CLUSTERED 
(
	[idTipoIdenti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTelefono]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTelefono](
	[idtipoTelefono] [int] NOT NULL,
	[descripcion] [varchar](10) NULL,
 CONSTRAINT [PK_TipoTelefono] PRIMARY KEY CLUSTERED 
(
	[idtipoTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (1, 6201, N'Desarrollo de software y consultoría tecnológica')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (2, 7010, N'Servicios de consultoría en gestión empresarial')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (3, 4711, N'Comercio al por menor en establecimientos no especializados')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (4, 5610, N'Actividades de restaurantes y de servicio móvil de comidas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (5, 4922, N'Transporte de mercancías por carretera')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (6, 4511, N'Venta de vehículos automotores nuevos y usados')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (7, 9602, N'Actividades de peluquería y otros tratamientos de belleza')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (8, 8610, N'Actividades hospitalarias')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (9, 5510, N'Servicios de alojamiento en hoteles y similares')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (10, 8559, N'Otras actividades de enseñanza no clasificadas en otra parte')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (11, 9311, N'Gestión de instalaciones deportivas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (12, 113, N'Cultivo de hortalizas, raíces y tubérculos')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (13, 6202, N'Consultoría de tecnología de la información')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (14, 8612, N'Servicios médicos especializados')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (15, 6810, N'Actividades inmobiliarias realizadas con bienes propios o arrendados')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (16, 4512, N'Mantenimiento y reparación de vehículos automotores')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (17, 8690, N'Otras actividades de atención médica')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (18, 4721, N'Comercio al por menor de productos alimenticios')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (19, 4649, N'Comercio al por mayor de otros artículos de uso doméstico')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (20, 7310, N'Publicidad y estudios de mercado')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (21, 5621, N'Provisión de comidas por encargo')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (22, 1104, N'Elaboración de bebidas no alcohólicas y aguas minerales')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (23, 112, N'Cultivo de cereales y otros cultivos no perennes')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (24, 220, N'Explotación forestal')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (25, 4321, N'Instalaciones eléctricas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (26, 3312, N'Reparación de maquinaria')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (27, 1812, N'Servicios relacionados con la impresión')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (28, 9001, N'Actividades de creación artística y literaria')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (29, 8890, N'Otras actividades de asistencia social sin alojamiento')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (30, 6209, N'Otros servicios relacionados con las tecnologías de la información')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (31, 6619, N'Otras actividades auxiliares de servicios financieros')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (32, 7210, N'Investigación y desarrollo experimental en ciencias naturales')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (33, 8299, N'Otras actividades de servicios de apoyo a las empresas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (34, 4722, N'Comercio al por menor de productos farmacéuticos y medicinales')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (35, 5629, N'Otros servicios de comidas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (36, 8010, N'Actividades de seguridad privada')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (37, 5511, N'Alojamientos turísticos no clasificados en otra parte')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (38, 9601, N'Lavandería y limpieza en seco')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (39, 8421, N'Relaciones exteriores y organismos de desarrollo')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (40, 5010, N'Transporte marítimo de pasajeros')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (41, 7911, N'Actividades de agencias de viajes')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (42, 4729, N'Comercio al por menor de otros productos no especializados')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (43, 321, N'Acuicultura marina')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (44, 322, N'Acuicultura en agua dulce')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (45, 9319, N'Otras actividades deportivas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (46, 5229, N'Otras actividades anexas al transporte')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (47, 4610, N'Intermediarios del comercio')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (48, 7729, N'Alquiler de bienes personales y domésticos no clasificados')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (49, 121, N'Cultivo de uvas')
INSERT [dbo].[ActividadEconomica] ([idActividadEconomica], [codigoActividad], [descripcionActividad]) VALUES (50, 1071, N'Fabricación de productos de panadería')
GO
SET IDENTITY_INSERT [dbo].[Auditoria] ON 

INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (1, N'I', N'dbo.DetalleServicio', 222, N'idDetalle', N'222', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (2, N'I', N'dbo.DetalleServicio', 221, N'idDetalle', N'221', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (3, N'I', N'dbo.DetalleServicio', 222, N'idFactura', N'81', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (4, N'I', N'dbo.DetalleServicio', 221, N'idFactura', N'81', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (5, N'I', N'dbo.DetalleServicio', 222, N'idServicio', N'2', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (6, N'I', N'dbo.DetalleServicio', 221, N'idServicio', N'1', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (7, N'I', N'dbo.DetalleServicio', 222, N'idEmpleado', N'102', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (8, N'I', N'dbo.DetalleServicio', 221, N'idEmpleado', N'101', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (9, N'I', N'dbo.DetalleServicio', 222, N'fechaServicio', N'2024-11-29', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (10, N'I', N'dbo.DetalleServicio', 221, N'fechaServicio', N'2024-11-29', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (11, N'I', N'dbo.DetalleServicio', 222, N'subTotalServicio', N'2000', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (12, N'I', N'dbo.DetalleServicio', 221, N'subTotalServicio', N'1000', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (13, N'I', N'dbo.DetalleServicio', 222, N'ivaServicio', N'380', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
INSERT [dbo].[Auditoria] ([IdAuditoria], [Tipo], [Tabla], [Registro], [Campo], [ValorDespues], [Fecha], [Usuario], [ValorAntes], [Pc]) VALUES (14, N'I', N'dbo.DetalleServicio', 221, N'ivaServicio', N'190', CAST(N'2024-11-29' AS Date), N'DESKTOP-VDONU91\PC', NULL, N'DESKTOP-VDONU91')
SET IDENTITY_INSERT [dbo].[Auditoria] OFF
GO
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (3, N'Bajo', N'Riesgo bajo debido a actividad empresarial estable', 3)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (4, N'Alto', N'Riesgo alto por volumen de operaciones internacionales', 4)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (5, N'Medio', N'Riesgo medio por fluctuaciones en el mercado', 5)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (6, N'Bajo', N'Riesgo bajo por negocio familiar consolidado', 6)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (7, N'Medio', N'Riesgo medio por la diversificación de actividades', 7)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (8, N'Alto', N'Riesgo alto por alta rotación de clientes', 8)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (9, N'Bajo', N'Riesgo bajo debido a la estabilidad de la industria', 9)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (10, N'Medio', N'Riesgo medio por exposición a mercados volátiles', 10)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (11, N'Bajo', N'Riesgo bajo por control efectivo de operaciones', 11)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (12, N'Medio', N'Riesgo medio por alto endeudamiento empresarial', 12)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (13, N'Alto', N'Riesgo alto debido a la alta competencia en el sector', 13)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (14, N'Bajo', N'Riesgo bajo debido a pocos cambios regulatorios', 14)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (15, N'Medio', N'Riesgo medio por constante cambio en legislación', 15)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (16, N'Alto', N'Riesgo alto debido a la alta concentración de clientes', 16)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (17, N'Bajo', N'Riesgo bajo por presencia en mercados consolidados', 17)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (18, N'Medio', N'Riesgo medio por riesgos tecnológicos moderados', 18)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (19, N'Bajo', N'Riesgo bajo debido a actividad empresarial diversificada', 19)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (20, N'Alto', N'Riesgo alto por dependencias a pocas fuentes de ingreso', 20)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (21, N'Medio', N'Riesgo medio debido a exposición en mercados internacionales', 21)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (22, N'Bajo', N'Riesgo bajo por sólida estructura organizativa', 22)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (23, N'Alto', N'Riesgo alto debido a operaciones en regiones inestables', 23)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (24, N'Medio', N'Riesgo medio debido a alto volumen de activos', 24)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (25, N'Bajo', N'Riesgo bajo por el control efectivo de los recursos', 25)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (26, N'Medio', N'Riesgo medio por la alta dependencia de clientes clave', 26)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (27, N'Alto', N'Riesgo alto debido a la exposición a fluctuaciones económicas', 27)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (28, N'Bajo', N'Riesgo bajo por la diversificación del portafolio', 28)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (29, N'Medio', N'Riesgo medio debido a la competencia en el sector local', 29)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (30, N'Bajo', N'Riesgo bajo por políticas de control interno fuertes', 30)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (31, N'Alto', N'Riesgo alto debido a la dependencia de proveedores externos', 31)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (32, N'Bajo', N'Riesgo bajo debido a la estabilidad del mercado local', 32)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (33, N'Medio', N'Riesgo medio por la exposición a crisis globales', 33)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (34, N'Alto', N'Riesgo alto debido a la falta de diversificación en el modelo de negocio', 34)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (35, N'Bajo', N'Riesgo bajo debido a una sólida reputación en el mercado', 35)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (36, N'Medio', N'Riesgo medio por alta rotación de personal', 36)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (37, N'Bajo', N'Riesgo bajo por baja exposición en mercados emergentes', 37)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (38, N'Alto', N'Riesgo alto debido a alta volatilidad en los precios de los productos', 38)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (39, N'Medio', N'Riesgo medio por riesgos asociados a la gestión de recursos humanos', 39)
INSERT [dbo].[ClaseRiesgo] ([idClaseRiesgo], [nivelClase], [descripcion], [idCliente]) VALUES (40, N'Bajo', N'Riesgo bajo debido a la estabilidad operativa y financiera', 40)
GO
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (1, N'Microempresa', 10, N'Empresa de tecnología pequeña', 1, 1)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (2, N'Mediana Empresa', 50, N'Empresa de servicios en crecimiento', 2, 2)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (3, N'Microempresa', 8, N'Tienda local de alimentos', 3, 3)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (4, N'Gran Empresa', 500, N'Corporación multinacional de manufactura', 4, 4)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (5, N'Pequeña Empresa', 20, N'Consultoría en recursos humanos', 5, 5)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (6, N'Microempresa', 5, N'Startup de diseño gráfico', 6, 6)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (7, N'Mediana Empresa', 60, N'Fabricante de muebles regional', 7, 7)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (8, N'Gran Empresa', 300, N'Cadena nacional de supermercados', 8, 8)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (9, N'Pequeña Empresa', 15, N'Agencia de marketing digital', 9, 9)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (10, N'Microempresa', 3, N'Negocio de desarrollo web freelance', 10, 10)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (11, N'Mediana Empresa', 75, N'Distribuidor de insumos agrícolas', 11, 11)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (12, N'Gran Empresa', 1000, N'Operador global de transporte y logística', 12, 12)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (13, N'Pequeña Empresa', 12, N'Empresa de reparación de electrodomésticos', 13, 13)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (14, N'Microempresa', 4, N'Cafetería local', 14, 14)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (15, N'Mediana Empresa', 90, N'Proveedor de servicios de impresión industrial', 15, 15)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (16, N'Gran Empresa', 1200, N'Compañía minera internacional', 16, 16)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (17, N'Microempresa', 2, N'Fotógrafo independiente', 17, 17)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (18, N'Pequeña Empresa', 25, N'Academia de idiomas', 18, 18)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (19, N'Mediana Empresa', 65, N'Distribuidor mayorista de alimentos', 19, 19)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (20, N'Gran Empresa', 800, N'Productor de bienes de consumo masivo', 20, 20)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (21, N'Pequeña Empresa', 18, N'Centro de bienestar y yoga', 21, 21)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (22, N'Microempresa', 7, N'Negocio de servicios de limpieza', 22, 22)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (23, N'Mediana Empresa', 55, N'Productora audiovisual', 23, 23)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (24, N'Gran Empresa', 1500, N'Fabricante de automóviles', 24, 24)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (25, N'Microempresa', 6, N'Carpintería artesanal', 25, 25)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (26, N'Pequeña Empresa', 30, N'Empresa de catering', 26, 26)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (27, N'Mediana Empresa', 80, N'Proveedor de servicios de TI', 27, 27)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (28, N'Gran Empresa', 2000, N'Conglomerado de tecnología', 28, 28)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (29, N'Pequeña Empresa', 22, N'Consultoría ambiental', 29, 29)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (30, N'Microempresa', 9, N'Tienda de artesanías locales', 30, 30)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (31, N'Mediana Empresa', 70, N'Distribuidor de equipos médicos', 31, 31)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (32, N'Gran Empresa', 3000, N'Compañía farmacéutica internacional', 32, 32)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (33, N'Pequeña Empresa', 19, N'Agencia de eventos corporativos', 33, 33)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (34, N'Microempresa', 4, N'Servicios de traducción', 34, 34)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (35, N'Mediana Empresa', 95, N'Empresa de desarrollo de software', 35, 35)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (36, N'Gran Empresa', 2500, N'Operador de telecomunicaciones', 36, 36)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (37, N'Pequeña Empresa', 14, N'Proveedor de soluciones energéticas', 37, 37)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (38, N'Microempresa', 5, N'Negocio de diseño de interiores', 38, 38)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (39, N'Mediana Empresa', 60, N'Distribuidor de materiales de construcción', 39, 39)
INSERT [dbo].[Clasificacion] ([idClasificacion], [tipoClasificacion], [cantidadEmpleados], [descripcion], [idActividadEconomica], [idCliente]) VALUES (40, N'Gran Empresa', 1800, N'Corporación de servicios financieros', 40, 40)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (1, N'Juan', N'Pérez', N'Calle Ficticia 123')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (2, N'Ana', N'Gómez', N'Avenida Real 456')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (3, N'Carlos', N'Martínez', N'Calle Luna 789')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (4, N'Pedro', N'Sánchez', N'Calle Sol 100')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (5, N'Laura', N'Torres', N'Avenida 1234')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (6, N'Marta', N'Fernández', N'Calle del Lago 321')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (7, N'Ricardo', N'Hernández', N'Calle Mayor 213')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (8, N'David', N'García', N'Calle Nueva 567')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (9, N'Elena', N'Vázquez', N'Avenida Central 987')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (10, N'José', N'Díaz', N'Calle Sierra 800')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (11, N'Sofía', N'López', N'Calle de las Flores 234')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (12, N'Raúl', N'Ramírez', N'Calle Verde 432')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (13, N'Andrea', N'Jiménez', N'Calle Bonita 666')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (14, N'Luis', N'Ruiz', N'Avenida de la Paz 777')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (15, N'Patricia', N'Serrano', N'Calle Rosario 444')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (16, N'Fernando', N'Mendoza', N'Calle Brisa 101')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (17, N'Isabel', N'Cordero', N'Calle Azul 333')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (18, N'Martín', N'Gutiérrez', N'Calle Norte 555')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (19, N'Silvia', N'Ramírez', N'Calle Primavera 222')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (20, N'Antonio', N'González', N'Avenida Libertad 888')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (21, N'Carmen', N'Vázquez', N'Calle Palma 111')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (22, N'Ricardo', N'Jiménez', N'Calle del Sol 999')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (23, N'Rosa', N'Sánchez', N'Calle del Río 654')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (24, N'Julio', N'Hernández', N'Avenida Sur 444')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (25, N'Antonio', N'López', N'Calle Carretera 888')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (26, N'Carlos', N'Mendoza', N'Avenida 2 555')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (27, N'Natalia', N'Pérez', N'Calle Magnolia 222')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (28, N'Víctor', N'Torres', N'Calle Olivos 333')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (29, N'Lucía', N'Fernández', N'Calle Aragón 444')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (30, N'Ángel', N'García', N'Avenida Nubes 555')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (31, N'Javier', N'Cano', N'Calle Mar 666')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (32, N'Adriana', N'López', N'Avenida Sol 777')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (33, N'Carlos', N'González', N'Calle Rojas 222')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (34, N'María', N'Suárez', N'Calle Independencia 333')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (35, N'Víctor', N'Díaz', N'Calle del Río 555')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (36, N'Marta', N'López', N'Calle Campo 444')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (37, N'Óscar', N'Jiménez', N'Calle Castillo 111')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (38, N'Mercedes', N'Rodríguez', N'Calle Las Palmas 555')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (39, N'José', N'Martínez', N'Avenida Pinar 999')
INSERT [dbo].[Cliente] ([idCliente], [nombreCli], [apellidoCli], [direccionCli]) VALUES (40, N'Antonio', N'Torres', N'Calle del Lago 555')
GO
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (1, N'juan.perez@example.com', N'Consulta', N'Consulta sobre servicios', 1)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (2, N'ana.gomez@example.com', N'Queja', N'Queja sobre el servicio recibido', 2)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (3, N'carlos.martinez@example.com', N'Consulta', N'Consulta sobre productos', 3)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (4, N'pedro.sanchez@example.com', N'Reclamo', N'Reclamo por factura incorrecta', 4)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (5, N'laura.torres@example.com', N'Consulta', N'Interés en nuevos servicios', 5)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (6, N'marta.fernandez@example.com', N'Reclamo', N'Reclamo por mal servicio', 6)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (7, N'ricardo.hernandez@example.com', N'Queja', N'Problemas con la entrega', 7)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (8, N'david.garcia@example.com', N'Consulta', N'Consulta sobre precios', 8)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (9, N'elena.vazquez@example.com', N'Consulta', N'Consulta sobre condiciones', 9)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (10, N'jose.diaz@example.com', N'Queja', N'Queja por producto defectuoso', 10)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (11, N'sofia.lopez@example.com', N'Consulta', N'Interés en asociación', 11)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (12, N'raul.ramirez@example.com', N'Reclamo', N'Reclamo por cargos no autorizados', 12)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (13, N'andrea.jimenez@example.com', N'Consulta', N'Consulta sobre facturación', 13)
INSERT [dbo].[Contacto] ([idContacto], [correoContacto], [asunto], [descripcionAsunto], [idCliente]) VALUES (14, N'luis.ruiz2@example.com', N'Reclamo', N'No puedo visualizar el usuario', 14)
GO
SET IDENTITY_INSERT [dbo].[DetalleServicio] ON 

INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (1, 1, 1, 101, CAST(N'2024-11-02' AS Date), CAST(200 AS Numeric(12, 0)), CAST(38 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (2, 1, 2, 101, CAST(N'2024-11-02' AS Date), CAST(300 AS Numeric(12, 0)), CAST(57 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (3, 1, 3, 101, CAST(N'2024-11-02' AS Date), CAST(339 AS Numeric(12, 0)), CAST(64 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (4, 2, 4, 102, CAST(N'2024-11-11' AS Date), CAST(300 AS Numeric(12, 0)), CAST(57 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (5, 2, 5, 102, CAST(N'2024-11-11' AS Date), CAST(450 AS Numeric(12, 0)), CAST(86 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (6, 2, 6, 102, CAST(N'2024-11-11' AS Date), CAST(494 AS Numeric(12, 0)), CAST(94 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (7, 3, 7, 103, CAST(N'2024-11-12' AS Date), CAST(400 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (8, 3, 8, 103, CAST(N'2024-11-12' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (9, 3, 9, 104, CAST(N'2024-11-12' AS Date), CAST(601 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (10, 4, 10, 110, CAST(N'2024-11-13' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (11, 4, 11, 104, CAST(N'2024-11-13' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (12, 4, 12, 104, CAST(N'2024-11-13' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (13, 5, 13, 105, CAST(N'2024-11-14' AS Date), CAST(300 AS Numeric(12, 0)), CAST(57 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (14, 5, 14, 105, CAST(N'2024-11-14' AS Date), CAST(400 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (15, 5, 15, 105, CAST(N'2024-11-14' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (16, 6, 16, 105, CAST(N'2024-11-15' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (17, 6, 17, 104, CAST(N'2024-11-15' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (18, 6, 18, 114, CAST(N'2024-11-15' AS Date), CAST(1400 AS Numeric(12, 0)), CAST(266 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (19, 7, 19, 114, CAST(N'2024-11-16' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (20, 7, 20, 120, CAST(N'2024-11-16' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (21, 7, 21, 101, CAST(N'2024-11-16' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (22, 8, 1, 101, CAST(N'2024-11-17' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (23, 8, 2, 103, CAST(N'2024-11-17' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (24, 8, 1, 103, CAST(N'2024-11-17' AS Date), CAST(351 AS Numeric(12, 0)), CAST(67 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (25, 9, 20, 105, CAST(N'2024-11-18' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (26, 9, 19, 106, CAST(N'2024-11-18' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (27, 9, 2, 107, CAST(N'2024-11-18' AS Date), CAST(601 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (28, 10, 8, 108, CAST(N'2024-11-19' AS Date), CAST(850 AS Numeric(12, 0)), CAST(162 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (29, 10, 9, 109, CAST(N'2024-11-19' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (30, 10, 3, 103, CAST(N'2024-11-19' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (31, 11, 1, 111, CAST(N'2024-11-20' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (32, 11, 3, 112, CAST(N'2024-11-20' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (33, 11, 19, 113, CAST(N'2024-11-20' AS Date), CAST(701 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (34, 12, 18, 117, CAST(N'2024-11-21' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (35, 12, 3, 117, CAST(N'2024-11-21' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (36, 12, 6, 120, CAST(N'2024-11-21' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (37, 13, 7, 103, CAST(N'2024-11-22' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (38, 13, 8, 104, CAST(N'2024-11-22' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (39, 13, 9, 105, CAST(N'2024-11-22' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (40, 14, 7, 105, CAST(N'2024-11-23' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (41, 14, 4, 105, CAST(N'2024-11-23' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (42, 14, 4, 102, CAST(N'2024-11-23' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (43, 15, 3, 103, CAST(N'2024-11-24' AS Date), CAST(850 AS Numeric(12, 0)), CAST(162 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (44, 15, 4, 104, CAST(N'2024-11-24' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (45, 15, 5, 105, CAST(N'2024-11-24' AS Date), CAST(651 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (46, 16, 6, 106, CAST(N'2024-11-25' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (47, 16, 7, 107, CAST(N'2024-11-25' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (48, 16, 4, 118, CAST(N'2024-11-25' AS Date), CAST(701 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (49, 17, 4, 119, CAST(N'2024-11-26' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (50, 17, 5, 110, CAST(N'2024-11-26' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (51, 17, 5, 111, CAST(N'2024-11-26' AS Date), CAST(651 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (52, 18, 2, 112, CAST(N'2024-11-27' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (53, 18, 5, 113, CAST(N'2024-11-27' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (54, 18, 8, 114, CAST(N'2024-11-27' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (55, 19, 11, 115, CAST(N'2024-11-28' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (56, 19, 11, 116, CAST(N'2024-11-28' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (57, 19, 11, 117, CAST(N'2024-11-28' AS Date), CAST(300 AS Numeric(12, 0)), CAST(57 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (58, 20, 18, 118, CAST(N'2024-11-29' AS Date), CAST(850 AS Numeric(12, 0)), CAST(162 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (59, 20, 19, 119, CAST(N'2024-11-29' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (60, 20, 6, 106, CAST(N'2024-11-29' AS Date), CAST(551 AS Numeric(12, 0)), CAST(105 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (61, 21, 6, 106, CAST(N'2024-11-30' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (62, 21, 2, 102, CAST(N'2024-11-30' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (63, 21, 22, 103, CAST(N'2024-11-30' AS Date), CAST(550 AS Numeric(12, 0)), CAST(105 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (64, 22, 20, 104, CAST(N'2024-12-01' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (65, 22, 5, 105, CAST(N'2024-12-01' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (66, 22, 6, 106, CAST(N'2024-12-01' AS Date), CAST(401 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (67, 23, 7, 107, CAST(N'2024-12-02' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (68, 23, 20, 108, CAST(N'2024-12-02' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (69, 23, 6, 109, CAST(N'2024-12-02' AS Date), CAST(701 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (70, 24, 2, 107, CAST(N'2024-12-03' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (71, 24, 11, 108, CAST(N'2024-12-03' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (72, 24, 12, 101, CAST(N'2024-12-03' AS Date), CAST(401 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (73, 25, 14, 103, CAST(N'2024-12-04' AS Date), CAST(850 AS Numeric(12, 0)), CAST(162 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (74, 25, 14, 104, CAST(N'2024-12-04' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (75, 25, 8, 107, CAST(N'2024-12-04' AS Date), CAST(601 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (76, 26, 6, 106, CAST(N'2024-12-05' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (77, 26, 7, 101, CAST(N'2024-12-05' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (78, 26, 8, 101, CAST(N'2024-12-05' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (79, 27, 9, 111, CAST(N'2024-12-06' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (80, 27, 8, 111, CAST(N'2024-12-06' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (81, 27, 1, 111, CAST(N'2024-12-06' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (82, 28, 2, 120, CAST(N'2024-12-07' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (83, 28, 3, 120, CAST(N'2024-12-07' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (84, 28, 4, 120, CAST(N'2024-12-07' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (85, 29, 8, 111, CAST(N'2024-12-08' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (86, 29, 6, 114, CAST(N'2024-12-08' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (87, 29, 7, 114, CAST(N'2024-12-08' AS Date), CAST(551 AS Numeric(12, 0)), CAST(105 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (88, 30, 8, 114, CAST(N'2024-12-09' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (89, 30, 9, 103, CAST(N'2024-12-09' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (90, 30, 10, 101, CAST(N'2024-12-09' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (91, 31, 11, 109, CAST(N'2024-12-10' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (92, 31, 12, 109, CAST(N'2024-12-10' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (93, 31, 13, 103, CAST(N'2024-12-10' AS Date), CAST(450 AS Numeric(12, 0)), CAST(86 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (94, 32, 14, 104, CAST(N'2024-12-11' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (95, 32, 15, 105, CAST(N'2024-12-11' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (96, 32, 16, 106, CAST(N'2024-12-11' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (97, 33, 17, 107, CAST(N'2024-12-12' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (98, 33, 18, 108, CAST(N'2024-12-12' AS Date), CAST(1100 AS Numeric(12, 0)), CAST(209 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (99, 33, 19, 109, CAST(N'2024-12-12' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
GO
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (100, 34, 10, 101, CAST(N'2024-12-13' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (101, 34, 20, 101, CAST(N'2024-12-13' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (102, 34, 10, 102, CAST(N'2024-12-13' AS Date), CAST(601 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (103, 35, 13, 103, CAST(N'2024-12-14' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (104, 35, 14, 104, CAST(N'2024-12-14' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (105, 35, 15, 105, CAST(N'2024-12-14' AS Date), CAST(350 AS Numeric(12, 0)), CAST(67 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (106, 36, 16, 106, CAST(N'2024-12-15' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (107, 36, 17, 107, CAST(N'2024-12-15' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (108, 36, 18, 108, CAST(N'2024-12-15' AS Date), CAST(400 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (109, 37, 14, 109, CAST(N'2024-12-16' AS Date), CAST(850 AS Numeric(12, 0)), CAST(162 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (110, 37, 10, 110, CAST(N'2024-12-16' AS Date), CAST(950 AS Numeric(12, 0)), CAST(181 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (111, 37, 11, 111, CAST(N'2024-12-16' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (112, 38, 12, 112, CAST(N'2024-12-17' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (113, 38, 13, 113, CAST(N'2024-12-17' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (114, 38, 14, 114, CAST(N'2024-12-17' AS Date), CAST(701 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (115, 39, 15, 115, CAST(N'2024-12-18' AS Date), CAST(850 AS Numeric(12, 0)), CAST(162 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (116, 39, 16, 116, CAST(N'2024-12-18' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (117, 39, 17, 117, CAST(N'2024-12-18' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (118, 40, 18, 118, CAST(N'2024-12-19' AS Date), CAST(950 AS Numeric(12, 0)), CAST(181 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (119, 40, 19, 119, CAST(N'2024-12-19' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (120, 40, 20, 120, CAST(N'2024-12-19' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (121, 41, 11, 101, CAST(N'2024-12-20' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (122, 41, 12, 102, CAST(N'2024-12-20' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (123, 41, 13, 103, CAST(N'2024-12-20' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (124, 42, 14, 104, CAST(N'2024-12-21' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (125, 42, 15, 105, CAST(N'2024-12-21' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (126, 42, 16, 106, CAST(N'2024-12-21' AS Date), CAST(451 AS Numeric(12, 0)), CAST(86 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (127, 43, 17, 107, CAST(N'2024-12-22' AS Date), CAST(950 AS Numeric(12, 0)), CAST(181 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (128, 43, 18, 108, CAST(N'2024-12-22' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (129, 43, 19, 109, CAST(N'2024-12-22' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (130, 44, 10, 101, CAST(N'2024-12-23' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (131, 44, 11, 101, CAST(N'2024-12-23' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (132, 44, 12, 112, CAST(N'2024-12-23' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (133, 45, 13, 113, CAST(N'2024-12-24' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (134, 45, 14, 114, CAST(N'2024-12-24' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (135, 45, 15, 115, CAST(N'2024-12-24' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (136, 46, 16, 116, CAST(N'2024-12-25' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (137, 46, 17, 117, CAST(N'2024-12-25' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (138, 46, 18, 118, CAST(N'2024-12-25' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (139, 47, 19, 119, CAST(N'2024-12-26' AS Date), CAST(1100 AS Numeric(12, 0)), CAST(209 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (140, 47, 14, 120, CAST(N'2024-12-26' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (141, 47, 1, 101, CAST(N'2024-12-26' AS Date), CAST(701 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (142, 48, 2, 102, CAST(N'2024-12-27' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (143, 48, 3, 103, CAST(N'2024-12-27' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (144, 48, 4, 114, CAST(N'2024-12-27' AS Date), CAST(350 AS Numeric(12, 0)), CAST(67 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (145, 49, 5, 115, CAST(N'2024-12-28' AS Date), CAST(950 AS Numeric(12, 0)), CAST(181 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (146, 49, 6, 116, CAST(N'2024-12-28' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (147, 49, 7, 117, CAST(N'2024-12-28' AS Date), CAST(500 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (148, 50, 8, 118, CAST(N'2024-12-29' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (149, 50, 9, 119, CAST(N'2024-12-29' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (150, 50, 15, 110, CAST(N'2024-12-29' AS Date), CAST(601 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (151, 51, 11, 111, CAST(N'2024-12-30' AS Date), CAST(1300 AS Numeric(12, 0)), CAST(247 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (152, 51, 12, 102, CAST(N'2024-12-30' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (153, 51, 13, 103, CAST(N'2024-12-30' AS Date), CAST(801 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (154, 52, 14, 104, CAST(N'2024-12-31' AS Date), CAST(1200 AS Numeric(12, 0)), CAST(228 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (155, 52, 15, 105, CAST(N'2024-12-31' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (156, 52, 16, 106, CAST(N'2024-12-31' AS Date), CAST(301 AS Numeric(12, 0)), CAST(57 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (157, 53, 17, 117, CAST(N'2025-01-01' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (158, 53, 18, 118, CAST(N'2025-01-01' AS Date), CAST(600 AS Numeric(12, 0)), CAST(114 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (159, 53, 19, 119, CAST(N'2025-01-01' AS Date), CAST(401 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (160, 54, 16, 110, CAST(N'2025-01-02' AS Date), CAST(1200 AS Numeric(12, 0)), CAST(228 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (161, 54, 11, 111, CAST(N'2025-01-02' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (162, 54, 12, 112, CAST(N'2025-01-02' AS Date), CAST(401 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (163, 55, 13, 113, CAST(N'2025-01-03' AS Date), CAST(1500 AS Numeric(12, 0)), CAST(285 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (164, 55, 14, 114, CAST(N'2025-01-03' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (165, 55, 15, 115, CAST(N'2025-01-03' AS Date), CAST(400 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (166, 56, 16, 116, CAST(N'2025-01-04' AS Date), CAST(1300 AS Numeric(12, 0)), CAST(247 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (167, 56, 17, 117, CAST(N'2025-01-04' AS Date), CAST(1200 AS Numeric(12, 0)), CAST(228 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (168, 56, 18, 118, CAST(N'2025-01-04' AS Date), CAST(606 AS Numeric(12, 0)), CAST(115 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (169, 57, 1, 111, CAST(N'2025-01-05' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (170, 57, 17, 105, CAST(N'2025-01-05' AS Date), CAST(800 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (171, 57, 17, 101, CAST(N'2025-01-05' AS Date), CAST(405 AS Numeric(12, 0)), CAST(77 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (172, 58, 1, 101, CAST(N'2025-01-06' AS Date), CAST(1200 AS Numeric(12, 0)), CAST(228 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (173, 58, 13, 103, CAST(N'2025-01-06' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (174, 58, 14, 104, CAST(N'2025-01-06' AS Date), CAST(400 AS Numeric(12, 0)), CAST(76 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (175, 59, 15, 105, CAST(N'2025-01-07' AS Date), CAST(1400 AS Numeric(12, 0)), CAST(266 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (176, 59, 16, 106, CAST(N'2025-01-07' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (177, 59, 17, 107, CAST(N'2025-01-07' AS Date), CAST(750 AS Numeric(12, 0)), CAST(143 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (178, 60, 18, 108, CAST(N'2025-01-08' AS Date), CAST(1100 AS Numeric(12, 0)), CAST(209 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (179, 60, 19, 109, CAST(N'2025-01-08' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (180, 60, 18, 110, CAST(N'2025-01-08' AS Date), CAST(306 AS Numeric(12, 0)), CAST(58 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (181, 61, 11, 111, CAST(N'2025-01-09' AS Date), CAST(1500 AS Numeric(12, 0)), CAST(285 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (182, 61, 12, 112, CAST(N'2025-01-09' AS Date), CAST(1100 AS Numeric(12, 0)), CAST(209 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (183, 61, 13, 113, CAST(N'2025-01-09' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (184, 62, 1, 114, CAST(N'2025-01-10' AS Date), CAST(1400 AS Numeric(12, 0)), CAST(266 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (185, 62, 15, 115, CAST(N'2025-01-10' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (186, 62, 16, 116, CAST(N'2025-01-10' AS Date), CAST(450 AS Numeric(12, 0)), CAST(86 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (187, 63, 18, 117, CAST(N'2025-01-11' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (188, 63, 8, 118, CAST(N'2025-01-11' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (189, 63, 19, 119, CAST(N'2025-01-11' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (190, 64, 19, 110, CAST(N'2025-01-12' AS Date), CAST(1600 AS Numeric(12, 0)), CAST(304 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (191, 64, 11, 101, CAST(N'2025-01-12' AS Date), CAST(1300 AS Numeric(12, 0)), CAST(247 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (192, 64, 12, 102, CAST(N'2025-01-12' AS Date), CAST(801 AS Numeric(12, 0)), CAST(152 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (193, 65, 13, 103, CAST(N'2025-01-13' AS Date), CAST(1400 AS Numeric(12, 0)), CAST(266 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (194, 65, 14, 104, CAST(N'2025-01-13' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (195, 65, 15, 105, CAST(N'2025-01-13' AS Date), CAST(501 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (196, 66, 19, 106, CAST(N'2025-01-14' AS Date), CAST(1500 AS Numeric(12, 0)), CAST(285 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (197, 66, 17, 107, CAST(N'2025-01-14' AS Date), CAST(1200 AS Numeric(12, 0)), CAST(228 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (198, 66, 18, 108, CAST(N'2025-01-14' AS Date), CAST(701 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (199, 67, 19, 109, CAST(N'2025-01-15' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
GO
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (200, 67, 2, 104, CAST(N'2025-01-15' AS Date), CAST(700 AS Numeric(12, 0)), CAST(133 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (201, 67, 20, 101, CAST(N'2025-01-15' AS Date), CAST(506 AS Numeric(12, 0)), CAST(95 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (202, 68, 2, 102, CAST(N'2025-01-16' AS Date), CAST(1700 AS Numeric(12, 0)), CAST(323 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (203, 68, 3, 103, CAST(N'2025-01-16' AS Date), CAST(1500 AS Numeric(12, 0)), CAST(285 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (204, 68, 4, 104, CAST(N'2025-01-16' AS Date), CAST(1001 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (205, 69, 5, 105, CAST(N'2025-01-17' AS Date), CAST(1300 AS Numeric(12, 0)), CAST(247 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (206, 69, 6, 106, CAST(N'2025-01-17' AS Date), CAST(900 AS Numeric(12, 0)), CAST(171 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (207, 69, 7, 107, CAST(N'2025-01-17' AS Date), CAST(650 AS Numeric(12, 0)), CAST(124 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (208, 70, 8, 108, CAST(N'2025-01-18' AS Date), CAST(1400 AS Numeric(12, 0)), CAST(266 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (209, 70, 9, 109, CAST(N'2025-01-18' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (210, 70, 10, 110, CAST(N'2025-01-18' AS Date), CAST(551 AS Numeric(12, 0)), CAST(105 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (211, 71, 11, 111, CAST(N'2025-01-10' AS Date), CAST(1429 AS Numeric(12, 0)), CAST(271 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (212, 72, 14, 114, CAST(N'2025-01-11' AS Date), CAST(1450 AS Numeric(12, 0)), CAST(276 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (213, 73, 17, 117, CAST(N'2025-01-12' AS Date), CAST(1600 AS Numeric(12, 0)), CAST(304 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (214, 74, 20, 120, CAST(N'2025-01-13' AS Date), CAST(1201 AS Numeric(12, 0)), CAST(228 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (215, 75, 3, 103, CAST(N'2025-01-14' AS Date), CAST(1801 AS Numeric(12, 0)), CAST(342 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (216, 76, 6, 106, CAST(N'2025-01-15' AS Date), CAST(1400 AS Numeric(12, 0)), CAST(266 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (217, 77, 9, 109, CAST(N'2025-01-16' AS Date), CAST(2201 AS Numeric(12, 0)), CAST(418 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (218, 78, 2, 102, CAST(N'2025-01-17' AS Date), CAST(1600 AS Numeric(12, 0)), CAST(304 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (219, 79, 5, 105, CAST(N'2025-01-18' AS Date), CAST(1751 AS Numeric(12, 0)), CAST(333 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (220, 80, 4, 101, CAST(N'2025-01-19' AS Date), CAST(1900 AS Numeric(12, 0)), CAST(361 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (221, 81, 1, 101, CAST(N'2024-11-29' AS Date), CAST(1000 AS Numeric(12, 0)), CAST(190 AS Numeric(12, 0)))
INSERT [dbo].[DetalleServicio] ([idDetalle], [idFactura], [idServicio], [idEmpleado], [fechaServicio], [subTotalServicio], [ivaServicio]) VALUES (222, 81, 2, 102, CAST(N'2024-11-29' AS Date), CAST(2000 AS Numeric(12, 0)), CAST(380 AS Numeric(12, 0)))
SET IDENTITY_INSERT [dbo].[DetalleServicio] OFF
GO
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (101, N'Carlos', N'Sánchez', CAST(3012345678 AS Numeric(10, 0)), N'Consultor')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (102, N'María', N'López', CAST(3023456789 AS Numeric(10, 0)), N'Soporte')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (103, N'Juan', N'Pérez', CAST(3034567890 AS Numeric(10, 0)), N'Analista')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (104, N'Ana', N'Martínez', CAST(3045678901 AS Numeric(10, 0)), N'Consultor')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (105, N'Luis', N'García', CAST(3056789012 AS Numeric(10, 0)), N'Soporte')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (106, N'Claudia', N'Hernández', CAST(3067890123 AS Numeric(10, 0)), N'Analista')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (107, N'Jorge', N'Torres', CAST(3078901234 AS Numeric(10, 0)), N'Consultor')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (108, N'Sofía', N'Vargas', CAST(3089012345 AS Numeric(10, 0)), N'Ingeniero')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (109, N'Pedro', N'Díaz', CAST(3090123456 AS Numeric(10, 0)), N'Soporte')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (110, N'Laura', N'Morales', CAST(3101234567 AS Numeric(10, 0)), N'Analista')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (111, N'Ricardo', N'Jiménez', CAST(3112345678 AS Numeric(10, 0)), N'Ingeniero')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (112, N'Adriana', N'Suárez', CAST(3123456789 AS Numeric(10, 0)), N'Consultor')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (113, N'José', N'Rodríguez', CAST(3134567890 AS Numeric(10, 0)), N'Soporte')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (114, N'Carmen', N'Ramírez', CAST(3145678901 AS Numeric(10, 0)), N'Analista')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (115, N'Martín', N'Cano', CAST(3156789012 AS Numeric(10, 0)), N'Consultor')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (116, N'Paola', N'Gómez', CAST(3167890123 AS Numeric(10, 0)), N'Soporte')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (117, N'Elena', N'Vega', CAST(3178901234 AS Numeric(10, 0)), N'Analista')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (118, N'Raúl', N'Ortiz', CAST(3189012345 AS Numeric(10, 0)), N'Ingeniero')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (119, N'Isabel', N'Castillo', CAST(3190123456 AS Numeric(10, 0)), N'Consultor')
INSERT [dbo].[Empleado] ([cedula], [nombre], [apellido], [telefono], [cargo]) VALUES (120, N'Antonio', N'Rojas', CAST(3201234567 AS Numeric(10, 0)), N'Soporte')
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (1, 1, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-01' AS Date), CAST(1000 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (2, 2, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-02' AS Date), CAST(1501 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (3, 3, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-03' AS Date), CAST(2001 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (4, 4, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-04' AS Date), CAST(2500 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (5, 5, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-05' AS Date), CAST(1201 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (6, 6, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-06' AS Date), CAST(3000 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (7, 7, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-07' AS Date), CAST(1700 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (8, 8, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-08' AS Date), CAST(1851 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (9, 9, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-09' AS Date), CAST(2101 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (10, 10, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-10' AS Date), CAST(2750 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (11, 11, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-11' AS Date), CAST(1801 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (12, 12, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-12' AS Date), CAST(1900 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (13, 13, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-13' AS Date), CAST(1750 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (14, 14, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-14' AS Date), CAST(2200 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (15, 15, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-15' AS Date), CAST(2401 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (16, 16, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-16' AS Date), CAST(2601 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (17, 17, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-17' AS Date), CAST(1951 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (18, 18, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-18' AS Date), CAST(2050 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (19, 19, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-19' AS Date), CAST(1500 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (20, 20, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-20' AS Date), CAST(2301 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (21, 1, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-21' AS Date), CAST(1850 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (22, 2, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-22' AS Date), CAST(1901 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (23, 3, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-23' AS Date), CAST(2001 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (24, 4, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-24' AS Date), CAST(1700 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (25, 5, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-25' AS Date), CAST(2151 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (26, 6, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-26' AS Date), CAST(1600 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (27, 7, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-27' AS Date), CAST(1951 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (28, 8, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-28' AS Date), CAST(1750 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (29, 9, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-29' AS Date), CAST(2051 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (30, 10, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-30' AS Date), CAST(2250 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (31, 11, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-01' AS Date), CAST(1850 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (32, 12, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-02' AS Date), CAST(1901 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (33, 13, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-03' AS Date), CAST(2401 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (34, 14, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-04' AS Date), CAST(2101 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (35, 15, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-05' AS Date), CAST(1700 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (36, 16, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-06' AS Date), CAST(1500 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (37, 17, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-07' AS Date), CAST(2301 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (38, 18, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-08' AS Date), CAST(2601 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (39, 19, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-09' AS Date), CAST(1951 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (40, 20, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-10' AS Date), CAST(2500 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (41, 21, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-11' AS Date), CAST(1600 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (42, 22, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-12' AS Date), CAST(1851 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (43, 23, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-13' AS Date), CAST(2151 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (44, 24, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-14' AS Date), CAST(1700 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (45, 25, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-15' AS Date), CAST(1901 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (46, 26, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-16' AS Date), CAST(2100 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (47, 27, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-17' AS Date), CAST(2601 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (48, 28, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-18' AS Date), CAST(1750 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (49, 29, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-19' AS Date), CAST(2050 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (50, 30, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-20' AS Date), CAST(2401 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (51, 31, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-21' AS Date), CAST(1950 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (52, 32, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-22' AS Date), CAST(2201 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (53, 33, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-23' AS Date), CAST(2501 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (54, 34, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-24' AS Date), CAST(1950 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (55, 35, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-25' AS Date), CAST(2250 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (56, 36, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-26' AS Date), CAST(1801 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (57, 37, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-27' AS Date), CAST(2001 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (58, 38, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-28' AS Date), CAST(1901 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (59, 39, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-29' AS Date), CAST(2500 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (60, 40, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-30' AS Date), CAST(2701 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (61, 1, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-12-31' AS Date), CAST(2900 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (62, 2, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-01' AS Date), CAST(1901 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (63, 3, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-02' AS Date), CAST(1800 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (64, 4, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-03' AS Date), CAST(1751 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (65, 5, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-04' AS Date), CAST(2101 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (66, 6, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-05' AS Date), CAST(2401 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (67, 7, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-06' AS Date), CAST(2600 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (68, 8, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-07' AS Date), CAST(1900 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (69, 9, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-08' AS Date), CAST(2001 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (70, 10, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-09' AS Date), CAST(2151 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (71, 11, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-10' AS Date), CAST(1700 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (72, 12, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-11' AS Date), CAST(1951 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (73, 13, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-12' AS Date), CAST(2501 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (74, 14, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-13' AS Date), CAST(1800 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (75, 15, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-14' AS Date), CAST(2200 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (76, 16, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-15' AS Date), CAST(1900 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (77, 17, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-16' AS Date), CAST(2051 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (78, 18, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-17' AS Date), CAST(2301 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (79, 19, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-18' AS Date), CAST(2451 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (80, 20, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2025-01-19' AS Date), CAST(2900 AS Numeric(12, 0)))
INSERT [dbo].[Factura] ([idFactura], [idCliente], [nit], [nombreEmpresa], [fechaFactura], [total]) VALUES (81, 1, CAST(123456789 AS Numeric(10, 0)), N'Occupational Health and Safety', CAST(N'2024-11-29' AS Date), CAST(3570 AS Numeric(12, 0)))
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Garantia] ON 

INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (1, N'Garantia contra sanciones', CAST(N'2024-11-01' AS Date), CAST(N'2025-04-29' AS Date), 1)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (2, N'Garantia contra sanciones', CAST(N'2024-11-02' AS Date), CAST(N'2025-04-30' AS Date), 2)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (3, N'Garantia contra sanciones', CAST(N'2024-11-03' AS Date), CAST(N'2025-05-01' AS Date), 3)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (4, N'Garantia contra sanciones', CAST(N'2024-11-04' AS Date), CAST(N'2025-05-02' AS Date), 4)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (5, N'Garantia contra sanciones', CAST(N'2024-11-05' AS Date), CAST(N'2025-05-03' AS Date), 5)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (6, N'Garantia contra sanciones', CAST(N'2024-11-06' AS Date), CAST(N'2025-05-04' AS Date), 6)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (7, N'Garantia contra sanciones', CAST(N'2024-11-07' AS Date), CAST(N'2025-05-05' AS Date), 7)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (8, N'Garantia contra sanciones', CAST(N'2024-11-08' AS Date), CAST(N'2025-05-06' AS Date), 8)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (9, N'Garantia contra sanciones', CAST(N'2024-11-09' AS Date), CAST(N'2025-05-07' AS Date), 9)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (10, N'Garantia contra sanciones', CAST(N'2024-11-10' AS Date), CAST(N'2025-05-08' AS Date), 10)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (11, N'Garantia contra sanciones', CAST(N'2024-11-11' AS Date), CAST(N'2025-05-09' AS Date), 11)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (12, N'Garantia contra sanciones', CAST(N'2024-11-12' AS Date), CAST(N'2025-05-10' AS Date), 12)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (13, N'Garantia contra sanciones', CAST(N'2024-11-13' AS Date), CAST(N'2025-05-11' AS Date), 13)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (14, N'Garantia contra sanciones', CAST(N'2024-11-14' AS Date), CAST(N'2025-05-12' AS Date), 14)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (15, N'Garantia contra sanciones', CAST(N'2024-11-15' AS Date), CAST(N'2025-05-13' AS Date), 15)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (16, N'Garantia contra sanciones', CAST(N'2024-11-16' AS Date), CAST(N'2025-05-14' AS Date), 16)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (17, N'Garantia contra sanciones', CAST(N'2024-11-17' AS Date), CAST(N'2025-05-15' AS Date), 17)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (18, N'Garantia contra sanciones', CAST(N'2024-11-18' AS Date), CAST(N'2025-05-16' AS Date), 18)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (19, N'Garantia contra sanciones', CAST(N'2024-11-19' AS Date), CAST(N'2025-05-17' AS Date), 19)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (20, N'Garantia contra sanciones', CAST(N'2024-11-20' AS Date), CAST(N'2025-05-18' AS Date), 20)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (21, N'Garantia contra sanciones', CAST(N'2024-11-21' AS Date), CAST(N'2025-05-19' AS Date), 21)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (22, N'Garantia contra sanciones', CAST(N'2024-11-22' AS Date), CAST(N'2025-05-20' AS Date), 22)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (23, N'Garantia contra sanciones', CAST(N'2024-11-23' AS Date), CAST(N'2025-05-21' AS Date), 23)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (24, N'Garantia contra sanciones', CAST(N'2024-11-24' AS Date), CAST(N'2025-05-22' AS Date), 24)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (25, N'Garantia contra sanciones', CAST(N'2024-11-25' AS Date), CAST(N'2025-05-23' AS Date), 25)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (26, N'Garantia contra sanciones', CAST(N'2024-11-26' AS Date), CAST(N'2025-05-24' AS Date), 26)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (27, N'Garantia contra sanciones', CAST(N'2024-11-27' AS Date), CAST(N'2025-05-25' AS Date), 27)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (28, N'Garantia contra sanciones', CAST(N'2024-11-28' AS Date), CAST(N'2025-05-26' AS Date), 28)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (29, N'Garantia contra sanciones', CAST(N'2024-11-29' AS Date), CAST(N'2025-05-27' AS Date), 29)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (30, N'Garantia contra sanciones', CAST(N'2024-11-30' AS Date), CAST(N'2025-05-28' AS Date), 30)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (31, N'Garantia contra sanciones', CAST(N'2024-12-01' AS Date), CAST(N'2025-05-29' AS Date), 31)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (32, N'Garantia contra sanciones', CAST(N'2024-12-02' AS Date), CAST(N'2025-05-30' AS Date), 32)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (33, N'Garantia contra sanciones', CAST(N'2024-12-03' AS Date), CAST(N'2025-05-31' AS Date), 33)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (34, N'Garantia contra sanciones', CAST(N'2024-12-04' AS Date), CAST(N'2025-06-01' AS Date), 34)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (35, N'Garantia contra sanciones', CAST(N'2024-12-05' AS Date), CAST(N'2025-06-02' AS Date), 35)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (36, N'Garantia contra sanciones', CAST(N'2024-12-06' AS Date), CAST(N'2025-06-03' AS Date), 36)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (37, N'Garantia contra sanciones', CAST(N'2024-12-07' AS Date), CAST(N'2025-06-04' AS Date), 37)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (38, N'Garantia contra sanciones', CAST(N'2024-12-08' AS Date), CAST(N'2025-06-05' AS Date), 38)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (39, N'Garantia contra sanciones', CAST(N'2024-12-09' AS Date), CAST(N'2025-06-06' AS Date), 39)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (40, N'Garantia contra sanciones', CAST(N'2024-12-10' AS Date), CAST(N'2025-06-07' AS Date), 40)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (41, N'Garantia contra sanciones', CAST(N'2024-12-11' AS Date), CAST(N'2025-06-08' AS Date), 41)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (42, N'Garantia contra sanciones', CAST(N'2024-12-12' AS Date), CAST(N'2025-06-09' AS Date), 42)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (43, N'Garantia contra sanciones', CAST(N'2024-12-13' AS Date), CAST(N'2025-06-10' AS Date), 43)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (44, N'Garantia contra sanciones', CAST(N'2024-12-14' AS Date), CAST(N'2025-06-11' AS Date), 44)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (45, N'Garantia contra sanciones', CAST(N'2024-12-15' AS Date), CAST(N'2025-06-12' AS Date), 45)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (46, N'Garantia contra sanciones', CAST(N'2024-12-16' AS Date), CAST(N'2025-06-13' AS Date), 46)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (47, N'Garantia contra sanciones', CAST(N'2024-12-17' AS Date), CAST(N'2025-06-14' AS Date), 47)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (48, N'Garantia contra sanciones', CAST(N'2024-12-18' AS Date), CAST(N'2025-06-15' AS Date), 48)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (49, N'Garantia contra sanciones', CAST(N'2024-12-19' AS Date), CAST(N'2025-06-16' AS Date), 49)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (50, N'Garantia contra sanciones', CAST(N'2024-12-20' AS Date), CAST(N'2025-06-17' AS Date), 50)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (51, N'Garantia contra sanciones', CAST(N'2024-12-21' AS Date), CAST(N'2025-06-18' AS Date), 51)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (52, N'Garantia contra sanciones', CAST(N'2024-12-22' AS Date), CAST(N'2025-06-19' AS Date), 52)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (53, N'Garantia contra sanciones', CAST(N'2024-12-23' AS Date), CAST(N'2025-06-20' AS Date), 53)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (54, N'Garantia contra sanciones', CAST(N'2024-12-24' AS Date), CAST(N'2025-06-21' AS Date), 54)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (55, N'Garantia contra sanciones', CAST(N'2024-12-25' AS Date), CAST(N'2025-06-22' AS Date), 55)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (56, N'Garantia contra sanciones', CAST(N'2024-12-26' AS Date), CAST(N'2025-06-23' AS Date), 56)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (57, N'Garantia contra sanciones', CAST(N'2024-12-27' AS Date), CAST(N'2025-06-24' AS Date), 57)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (58, N'Garantia contra sanciones', CAST(N'2024-12-28' AS Date), CAST(N'2025-06-25' AS Date), 58)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (59, N'Garantia contra sanciones', CAST(N'2024-12-29' AS Date), CAST(N'2025-06-26' AS Date), 59)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (60, N'Garantia contra sanciones', CAST(N'2024-12-30' AS Date), CAST(N'2025-06-27' AS Date), 60)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (61, N'Garantia contra sanciones', CAST(N'2024-12-31' AS Date), CAST(N'2025-06-28' AS Date), 61)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (62, N'Garantia contra sanciones', CAST(N'2025-01-01' AS Date), CAST(N'2025-06-29' AS Date), 62)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (63, N'Garantia contra sanciones', CAST(N'2025-01-02' AS Date), CAST(N'2025-06-30' AS Date), 63)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (64, N'Garantia contra sanciones', CAST(N'2025-01-03' AS Date), CAST(N'2025-07-01' AS Date), 64)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (65, N'Garantia contra sanciones', CAST(N'2025-01-04' AS Date), CAST(N'2025-07-02' AS Date), 65)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (66, N'Garantia contra sanciones', CAST(N'2025-01-05' AS Date), CAST(N'2025-07-03' AS Date), 66)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (67, N'Garantia contra sanciones', CAST(N'2025-01-06' AS Date), CAST(N'2025-07-04' AS Date), 67)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (68, N'Garantia contra sanciones', CAST(N'2025-01-07' AS Date), CAST(N'2025-07-05' AS Date), 68)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (69, N'Garantia contra sanciones', CAST(N'2025-01-08' AS Date), CAST(N'2025-07-06' AS Date), 69)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (70, N'Garantia contra sanciones', CAST(N'2025-01-09' AS Date), CAST(N'2025-07-07' AS Date), 70)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (71, N'Garantia contra sanciones', CAST(N'2025-01-10' AS Date), CAST(N'2025-07-08' AS Date), 71)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (72, N'Garantia contra sanciones', CAST(N'2025-01-11' AS Date), CAST(N'2025-07-09' AS Date), 72)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (73, N'Garantia contra sanciones', CAST(N'2025-01-12' AS Date), CAST(N'2025-07-10' AS Date), 73)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (74, N'Garantia contra sanciones', CAST(N'2025-01-13' AS Date), CAST(N'2025-07-11' AS Date), 74)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (75, N'Garantia contra sanciones', CAST(N'2025-01-14' AS Date), CAST(N'2025-07-12' AS Date), 75)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (76, N'Garantia contra sanciones', CAST(N'2025-01-15' AS Date), CAST(N'2025-07-13' AS Date), 76)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (77, N'Garantia contra sanciones', CAST(N'2025-01-16' AS Date), CAST(N'2025-07-14' AS Date), 77)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (78, N'Garantia contra sanciones', CAST(N'2025-01-17' AS Date), CAST(N'2025-07-15' AS Date), 78)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (79, N'Garantia contra sanciones', CAST(N'2025-01-18' AS Date), CAST(N'2025-07-16' AS Date), 79)
INSERT [dbo].[Garantia] ([idGarantia], [descripcion], [fechaIni], [fechaFin], [idFactura]) VALUES (80, N'Garantia contra sanciones', CAST(N'2025-01-19' AS Date), CAST(N'2025-07-17' AS Date), 80)
SET IDENTITY_INSERT [dbo].[Garantia] OFF
GO
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (3, CAST(2345678901 AS Numeric(20, 0)), 1, 3)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (4, CAST(3456789012 AS Numeric(20, 0)), 3, 4)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (5, CAST(4567890123 AS Numeric(20, 0)), 4, 5)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (6, CAST(5678901234 AS Numeric(20, 0)), 5, 6)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (7, CAST(6789012345 AS Numeric(20, 0)), 6, 7)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (8, CAST(7890123456 AS Numeric(20, 0)), 7, 8)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (9, CAST(8901234567 AS Numeric(20, 0)), 1, 9)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (10, CAST(9012345678 AS Numeric(20, 0)), 2, 10)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (11, CAST(1230987654 AS Numeric(20, 0)), 3, 11)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (12, CAST(2341098765 AS Numeric(20, 0)), 4, 12)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (13, CAST(3452109876 AS Numeric(20, 0)), 5, 13)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (14, CAST(4563210987 AS Numeric(20, 0)), 6, 14)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (15, CAST(5674321098 AS Numeric(20, 0)), 7, 15)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (16, CAST(6785432109 AS Numeric(20, 0)), 1, 16)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (17, CAST(7896543210 AS Numeric(20, 0)), 2, 17)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (18, CAST(8907654321 AS Numeric(20, 0)), 3, 18)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (19, CAST(9018765432 AS Numeric(20, 0)), 4, 19)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (20, CAST(1232109876 AS Numeric(20, 0)), 5, 20)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (21, CAST(2343210987 AS Numeric(20, 0)), 6, 21)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (22, CAST(3454321098 AS Numeric(20, 0)), 7, 22)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (23, CAST(4565432109 AS Numeric(20, 0)), 1, 23)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (24, CAST(5676543210 AS Numeric(20, 0)), 2, 24)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (25, CAST(6787654321 AS Numeric(20, 0)), 3, 25)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (26, CAST(7898765432 AS Numeric(20, 0)), 4, 26)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (27, CAST(8909876543 AS Numeric(20, 0)), 5, 27)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (28, CAST(9010987654 AS Numeric(20, 0)), 6, 28)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (29, CAST(1233210987 AS Numeric(20, 0)), 7, 29)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (30, CAST(2344321098 AS Numeric(20, 0)), 1, 30)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (31, CAST(3455432109 AS Numeric(20, 0)), 2, 31)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (32, CAST(4566543210 AS Numeric(20, 0)), 3, 32)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (33, CAST(5677654321 AS Numeric(20, 0)), 4, 33)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (34, CAST(6788765432 AS Numeric(20, 0)), 5, 34)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (35, CAST(7899876543 AS Numeric(20, 0)), 6, 35)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (36, CAST(8900987654 AS Numeric(20, 0)), 7, 36)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (37, CAST(9011098765 AS Numeric(20, 0)), 1, 37)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (38, CAST(1234321098 AS Numeric(20, 0)), 2, 38)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (39, CAST(2345432109 AS Numeric(20, 0)), 3, 39)
INSERT [dbo].[NumIdentific] ([idNumIdentific], [numeroDocumento], [idTipoIdenti], [idCliente]) VALUES (40, CAST(3456543210 AS Numeric(20, 0)), 4, 40)
GO
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (1, 1, N'juan.perez@example.com', N'juan.perez@example.com', N'12345', N'12345')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (2, 2, N'ana.gomez@example.com', N'ana.gomez@example.com', N'password123', N'password123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (3, 3, N'carlos.martinez@example.com', N'carlos.martinez@example.com', N'qwerty123', N'qwerty123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (4, 4, N'pedro.sanchez@example.com', N'pedro.sanchez@example.com', N'123qweasd', N'123qweasd')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (5, 5, N'laura.torres@example.com', N'laura.torres@example.com', N'secret2023', N'secret2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (6, 6, N'marta.fernandez@example.com', N'marta.fernandez@example.com', N'contrasena123', N'contrasena123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (7, 7, N'ricardo.hernandez@example.com', N'ricardo.hernandez@example.com', N'clave2023', N'clave2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (8, 8, N'david.garcia@example.com', N'david.garcia@example.com', N'password321', N'password321')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (9, 9, N'elena.vazquez@example.com', N'elena.vazquez@example.com', N'abc12345', N'abc12345')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (10, 10, N'jose.diaz@example.com', N'jose.diaz@example.com', N'123abc456', N'123abc456')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (11, 11, N'sofia.lopez@example.com', N'sofia.lopez@example.com', N'qwerty2024', N'qwerty2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (12, 12, N'raul.ramirez@example.com', N'raul.ramirez@example.com', N'ramirez123', N'ramirez123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (13, 13, N'andrea.jimenez@example.com', N'andrea.jimenez@example.com', N'12345678q', N'12345678q')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (14, 14, N'luis.ruiz@example.com', N'luis.ruiz@example.com', N'asdasd123', N'asdasd123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (15, 15, N'patricia.serrano@example.com', N'patricia.serrano@example.com', N'serrano2023', N'serrano2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (16, 16, N'fernando.mendoza@example.com', N'fernando.mendoza@example.com', N'pass1234', N'pass1234')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (17, 17, N'isabel.cordero@example.com', N'isabel.cordero@example.com', N'isabel123', N'isabel123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (18, 18, N'martin.gutierrez@example.com', N'martin.gutierrez@example.com', N'gutierrez2024', N'gutierrez2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (19, 19, N'silvia.ramirez@example.com', N'silvia.ramirez@example.com', N'silvia2024', N'silvia2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (20, 20, N'antonio.gonzalez@example.com', N'antonio.gonzalez@example.com', N'antonio2024', N'antonio2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (21, 21, N'carmen.vazquez@example.com', N'carmen.vazquez@example.com', N'carmen123', N'carmen123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (22, 22, N'ricardo.jimenez@example.com', N'ricardo.jimenez@example.com', N'ricardo2024', N'ricardo2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (23, 23, N'rosa.sanchez@example.com', N'rosa.sanchez@example.com', N'sanchez2023', N'sanchez2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (24, 24, N'julio.hernandez@example.com', N'julio.hernandez@example.com', N'julio1234', N'julio1234')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (25, 25, N'antonio.lopez@example.com', N'antonio.lopez@example.com', N'lopez2024', N'lopez2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (26, 26, N'carlos.mendoza@example.com', N'carlos.mendoza@example.com', N'mendoza123', N'mendoza123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (27, 27, N'natalia.perez@example.com', N'natalia.perez@example.com', N'perez2023', N'perez2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (28, 28, N'victor.torres@example.com', N'victor.torres@example.com', N'torres2023', N'torres2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (29, 29, N'lucia.fernandez@example.com', N'lucia.fernandez@example.com', N'lucia2024', N'lucia2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (30, 30, N'angel.garcia@example.com', N'angel.garcia@example.com', N'garcia1234', N'garcia1234')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (31, 31, N'javier.cano@example.com', N'javier.cano@example.com', N'javier2023', N'javier2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (32, 32, N'adriana.lopez@example.com', N'adriana.lopez@example.com', N'adriana2024', N'adriana2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (33, 33, N'carlos.gonzalez@example.com', N'carlos.gonzalez@example.com', N'gonzalez123', N'gonzalez123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (34, 34, N'maria.suarez@example.com', N'maria.suarez@example.com', N'suarez123', N'suarez123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (35, 35, N'victor.diaz@example.com', N'victor.diaz@example.com', N'victor2024', N'victor2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (36, 36, N'marta.lopez@example.com', N'marta.lopez@example.com', N'lopez2023', N'lopez2023')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (37, 37, N'oscar.jimenez@example.com', N'oscar.jimenez@example.com', N'oscar1234', N'oscar1234')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (38, 38, N'mercedes.rodriguez@example.com', N'mercedes.rodriguez@example.com', N'mercedes123', N'mercedes123')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (39, 39, N'jose.martinez@example.com', N'jose.martinez@example.com', N'martinez2024', N'martinez2024')
INSERT [dbo].[RegistroCliente] ([idLogin], [idCliente], [email], [confirmarCorreo], [contrasena], [confirmarContrasena]) VALUES (40, 40, N'antonio.torres@example.com', N'antonio.torres@example.com', N'torres123', N'torres123')
GO
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (1, N'carlos.sanchez@empresa.com', N'emp1234', N'emp1234', 101)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (2, N'maria.lopez@empresa.com', N'soporte123', N'soporte123', 102)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (3, N'juan.perez@empresa.com', N'analista123', N'analista123', 103)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (4, N'ana.martinez@empresa.com', N'consultor123', N'consultor123', 104)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (5, N'luis.garcia@empresa.com', N'soporte1234', N'soporte1234', 105)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (6, N'claudia.hernandez@empresa.com', N'analista456', N'analista456', 106)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (7, N'jorge.torres@empresa.com', N'consultor456', N'consultor456', 107)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (8, N'sofia.vargas@empresa.com', N'ingeniero789', N'ingeniero789', 108)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (9, N'pedro.diaz@empresa.com', N'soporte567', N'soporte567', 109)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (10, N'laura.morales@empresa.com', N'analista789', N'analista789', 110)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (11, N'ricardo.jimenez@empresa.com', N'ingeniero321', N'ingeniero321', 111)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (12, N'adriana.suarez@empresa.com', N'consultor678', N'consultor678', 112)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (13, N'jose.rodriguez@empresa.com', N'soporte890', N'soporte890', 113)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (14, N'carmen.ramirez@empresa.com', N'analista012', N'analista012', 114)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (15, N'martin.cano@empresa.com', N'consultor345', N'consultor345', 115)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (16, N'paola.gomez@empresa.com', N'soporte1235', N'soporte1235', 116)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (17, N'elena.vega@empresa.com', N'analista678', N'analista678', 117)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (18, N'raul.ortiz@empresa.com', N'ingeniero456', N'ingeniero456', 118)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (19, N'isabel.castillo@empresa.com', N'consultor987', N'consultor987', 119)
INSERT [dbo].[RegistroEmpleado] ([idRegistro], [email], [contraseña], [confirmContraseña], [cedula]) VALUES (20, N'antonio.rojas@empresa.com', N'soporte654', N'soporte654', 120)
GO
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (1, N'Evaluación de riesgos laborales', 5)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (2, N'Capacitación en seguridad laboral', 3)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (3, N'Inspección de condiciones de trabajo', 8)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (4, N'Diseño de planes de emergencia', 6)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (5, N'Implementación de protocolos de seguridad', 4)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (6, N'Auditoría de seguridad en el trabajo', 7)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (7, N'Evaluación ergonómica', 5)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (8, N'Capacitación en manejo de materiales peligrosos', 6)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (9, N'Monitoreo ambiental laboral', 7)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (10, N'Diseño de programas de salud ocupacional', 6)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (11, N'Gestión de incidentes laborales', 8)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (12, N'Implementación de equipos de protección personal', 7)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (13, N'Capacitación en primeros auxilios', 5)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (14, N'Elaboración de análisis de riesgos', 4)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (15, N'Auditoría de salud ocupacional', 8)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (16, N'Diseño de sistemas contra incendios', 7)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (17, N'Evaluación de conformidad legal en seguridad laboral', 9)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (18, N'Automatización de procesos de seguridad', 6)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (19, N'Capacitación en normatividad laboral', 7)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (20, N'Elaboración de manuales de seguridad', 5)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (21, N'Monitoreo de exposición a riesgos químicos', 6)
INSERT [dbo].[Servicio] ([idServicio], [descripcion], [valorHoras]) VALUES (22, N'Implementación de sistemas de gestión en SST', 7)
GO
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (1, 1, 1, CAST(3001234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (2, 1, 2, CAST(1234567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (3, 2, 1, CAST(3002345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (4, 2, 2, CAST(1235678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (5, 3, 1, CAST(3003456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (6, 3, 2, CAST(1236789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (7, 4, 1, CAST(3004567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (8, 4, 2, CAST(1237890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (9, 5, 1, CAST(3005678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (10, 5, 2, CAST(1238901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (11, 6, 1, CAST(3006789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (12, 6, 2, CAST(1239012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (13, 7, 1, CAST(3007890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (14, 7, 2, CAST(1230123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (15, 8, 1, CAST(3008901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (16, 8, 2, CAST(1231234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (17, 9, 1, CAST(3009012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (18, 9, 2, CAST(1232345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (19, 10, 1, CAST(3010123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (20, 10, 2, CAST(1233456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (21, 11, 1, CAST(3011234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (22, 11, 2, CAST(1234567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (23, 12, 1, CAST(3012345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (24, 12, 2, CAST(1235678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (25, 13, 1, CAST(3013456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (26, 13, 2, CAST(1236789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (27, 14, 1, CAST(3014567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (28, 14, 2, CAST(1237890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (29, 15, 1, CAST(3015678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (30, 15, 2, CAST(1238901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (31, 16, 1, CAST(3016789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (32, 16, 2, CAST(1239012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (33, 17, 1, CAST(3017890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (34, 17, 2, CAST(1230123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (35, 18, 1, CAST(3018901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (36, 18, 2, CAST(1231234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (37, 19, 1, CAST(3019012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (38, 19, 2, CAST(1232345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (39, 20, 1, CAST(3020123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (40, 20, 2, CAST(1233456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (41, 21, 1, CAST(3002345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (42, 21, 2, CAST(1234567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (43, 22, 1, CAST(3003456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (44, 22, 2, CAST(1235678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (45, 23, 1, CAST(3004567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (46, 23, 2, CAST(1236789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (47, 24, 1, CAST(3005678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (48, 24, 2, CAST(1237890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (49, 25, 1, CAST(3006789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (50, 25, 2, CAST(1239012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (51, 26, 1, CAST(3007890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (52, 26, 2, CAST(1230123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (53, 27, 1, CAST(3008901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (54, 27, 2, CAST(1231234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (55, 28, 1, CAST(3009012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (56, 28, 2, CAST(1232345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (57, 29, 1, CAST(3010123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (58, 29, 2, CAST(1233456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (59, 30, 1, CAST(3011234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (60, 30, 2, CAST(1234567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (61, 31, 1, CAST(3012345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (62, 31, 2, CAST(1235678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (63, 32, 1, CAST(3013456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (64, 32, 2, CAST(1236789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (65, 33, 1, CAST(3014567890 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (66, 33, 2, CAST(1237890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (67, 34, 1, CAST(3015678901 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (68, 34, 2, CAST(1238901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (69, 35, 1, CAST(3016789012 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (70, 35, 2, CAST(1239012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (71, 36, 1, CAST(3017890123 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (72, 36, 2, CAST(1230123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (73, 37, 1, CAST(3018901234 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (74, 37, 2, CAST(1231234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (75, 38, 1, CAST(3019012345 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (76, 38, 2, CAST(1232345678 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (77, 39, 1, CAST(3020123456 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (78, 39, 2, CAST(1233456789 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (79, 40, 1, CAST(3021234567 AS Numeric(10, 0)))
INSERT [dbo].[Telefono] ([idTelefono], [idCliente], [idtipoTelefono], [telefono]) VALUES (80, 40, 2, CAST(1234567890 AS Numeric(10, 0)))
GO
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (1, N'Cédula de Ciudadanía')
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (2, N'Registro Único Tributario')
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (3, N'Tarjeta de Identidad')
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (4, N'Licencia de Conducir')
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (5, N'Cédula de Extranjería')
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (6, N'Núm Identificación Fiscal')
INSERT [dbo].[tipoDocumento] ([idTipoIdenti], [descripcion]) VALUES (7, N'Tarjeta de Residente')
GO
INSERT [dbo].[TipoTelefono] ([idtipoTelefono], [descripcion]) VALUES (1, N'Móvil')
INSERT [dbo].[TipoTelefono] ([idtipoTelefono], [descripcion]) VALUES (2, N'Fijo')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Registro__AB6E6164E0A188C3]    Script Date: 29/11/2024 9:45:46 p. m. ******/
ALTER TABLE [dbo].[RegistroCliente] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Registro__AB6E61642924E5AC]    Script Date: 29/11/2024 9:45:46 p. m. ******/
ALTER TABLE [dbo].[RegistroEmpleado] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClaseRiesgo]  WITH CHECK ADD  CONSTRAINT [FK_ClaseRiesgoCL] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[ClaseRiesgo] CHECK CONSTRAINT [FK_ClaseRiesgoCL]
GO
ALTER TABLE [dbo].[Clasificacion]  WITH CHECK ADD  CONSTRAINT [FK_idActividadEconomica] FOREIGN KEY([idActividadEconomica])
REFERENCES [dbo].[ActividadEconomica] ([idActividadEconomica])
GO
ALTER TABLE [dbo].[Clasificacion] CHECK CONSTRAINT [FK_idActividadEconomica]
GO
ALTER TABLE [dbo].[Clasificacion]  WITH CHECK ADD  CONSTRAINT [FK_idCliente2] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Clasificacion] CHECK CONSTRAINT [FK_idCliente2]
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEmple] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([cedula])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleEmple]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFac] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleFac]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_detaller] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([idServicio])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_detaller]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_facturaCli] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_facturaCli]
GO
ALTER TABLE [dbo].[Garantia]  WITH CHECK ADD  CONSTRAINT [FK_idFactura] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO
ALTER TABLE [dbo].[Garantia] CHECK CONSTRAINT [FK_idFactura]
GO
ALTER TABLE [dbo].[NumIdentific]  WITH CHECK ADD  CONSTRAINT [FK_idCliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[NumIdentific] CHECK CONSTRAINT [FK_idCliente]
GO
ALTER TABLE [dbo].[NumIdentific]  WITH CHECK ADD  CONSTRAINT [FK_idTipoIdenti] FOREIGN KEY([idTipoIdenti])
REFERENCES [dbo].[tipoDocumento] ([idTipoIdenti])
GO
ALTER TABLE [dbo].[NumIdentific] CHECK CONSTRAINT [FK_idTipoIdenti]
GO
ALTER TABLE [dbo].[RegistroCliente]  WITH CHECK ADD  CONSTRAINT [FK_RegistroCliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[RegistroCliente] CHECK CONSTRAINT [FK_RegistroCliente]
GO
ALTER TABLE [dbo].[RegistroEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_cedula] FOREIGN KEY([cedula])
REFERENCES [dbo].[Empleado] ([cedula])
GO
ALTER TABLE [dbo].[RegistroEmpleado] CHECK CONSTRAINT [FK_cedula]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_TipoTelefono] FOREIGN KEY([idtipoTelefono])
REFERENCES [dbo].[TipoTelefono] ([idtipoTelefono])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_TipoTelefono]
GO
/****** Object:  StoredProcedure [dbo].[INSERTARFACTURACOMPLETA]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTARFACTURACOMPLETA]
    @IDCLIENTE INT,
    @NIT NUMERIC(10) = 123456789,
    @NOMBRE_EMP VARCHAR(50) = 'Occupational Health and Safety',
    @FECHA_FACT DATE,
    @DETALLE_SER DetalleServicioType READONLY ----REVISAR
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

       
        DECLARE @TOTAL NUMERIC(12, 2);

        SELECT @TOTAL = SUM(subtotal + iva)
        FROM @DETALLE_SER;

        
        INSERT INTO Factura (idCliente, nit, NombreEmpresa, FechaFactura, total)
        VALUES (@IDCLIENTE, @NIT, @NOMBRE_EMP, @FECHA_FACT, @TOTAL);

        
        DECLARE @FacturaID INT = SCOPE_IDENTITY();

       
        INSERT INTO DetalleServicio (idFactura, IdServicio, IdEmpleado, fechaServicio, subTotalServicio, ivaServicio)
        SELECT @FacturaID, idServicio, idEmpleado, fecha, subtotal, iva
        FROM @DETALLE_SER;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        PRINT 'Factura y detalles insertados correctamente.';
    END TRY
    BEGIN CATCH
        -- Revertir en caso de error
        ROLLBACK TRANSACTION;
        PRINT  'No se pudo realizar la insercion de la factura completa';
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizaciónContacto]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create   procedure [dbo].[SP_ActualizaciónContacto]
		@id int,
	  @correo varchar(50),
	  @asunto varchar(30),
	  @descripcion varchar(200)
	  AS
	  update Contacto set  correoContacto = @correo, asunto = @asunto,
	  descripcionAsunto= @descripcion 
	  where idCliente =  @id
GO
/****** Object:  StoredProcedure [dbo].[SP_ServicioEmpleado]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[SP_ServicioEmpleado]
@detalle varchar(200),
@cedu int
AS
if exists (Select s.descripcion as descripcionServicio, s.valorHoras, D.fechaServicio, D.subTotalServicio, E.cedula, E.nombre, E.apellido, E.cargo from Servicio as s
inner join DetalleServicio as D
on S.idServicio = D.idServicio inner join Empleado as E on D.idEmpleado = E.cedula
where s.descripcion like @detalle and E.cedula like @cedu)
 
(Select s.descripcion as descripcionServicio, s.valorHoras, D.fechaServicio, D.subTotalServicio, E.cedula, E.nombre, E.apellido, E.cargo from Servicio as s
inner join DetalleServicio as D
on S.idServicio = D.idServicio inner join Empleado as E on D.idEmpleado = E.cedula
where s.descripcion like @detalle and E.cedula like @cedu)
 
Else (select 'En el momento no existe un registro con esta información'
	 as ALERT)
 
GO
/****** Object:  StoredProcedure [dbo].[TOPCLIENTES]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TOPCLIENTES]
@TOP INT
as 
 BEGIN 
     
SELECT         TOP(+@TOP) dbo.Factura.idCliente, dbo.Cliente.nombreCli, dbo.Cliente.apellidoCli, SUM(dbo.Factura.total)AS 'TOTAL DE FACTURAS' 
FROM            dbo.Cliente INNER JOIN
                         dbo.Factura ON dbo.Cliente.idCliente = dbo.Factura.idCliente
						 GROUP BY dbo.Factura.idCliente,dbo.Cliente.nombreCli,dbo.Cliente.apellidoCli
 END 
GO
/****** Object:  Trigger [dbo].[trServicioInsert]    Script Date: 29/11/2024 9:45:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[trServicioInsert]
   ON  [dbo].[DetalleServicio]
   AFTER Insert 
AS 
BEGIN
 
	SET NOCOUNT ON;
 
	INSERT INTO dbo.Auditoria (Tabla, Campo, 
	ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','idDetalle',null,inserted.idDetalle,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
 
		INSERT INTO dbo.Auditoria (Tabla, Campo, 
	ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','idFactura',Null,inserted.idFactura,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
 
 
		INSERT INTO dbo.Auditoria (Tabla, Campo, 
	ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','idServicio',Null,inserted.idServicio,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
 
		INSERT INTO dbo.Auditoria (Tabla, Campo,
		ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','idEmpleado',Null,inserted.idEmpleado,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
 
	INSERT INTO dbo.Auditoria (Tabla, Campo, 
	ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','fechaServicio',Null,inserted.fechaServicio,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
 
	INSERT INTO dbo.Auditoria (Tabla, Campo, 
	ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','subTotalServicio',Null,inserted.subTotalServicio,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
 
	INSERT INTO dbo.Auditoria (Tabla, Campo, 
	ValorAntes, ValorDespues, Usuario, Pc, Fecha, Tipo, Registro)
	select 'dbo.DetalleServicio','ivaServicio',Null,inserted.ivaServicio,
	SYSTEM_USER,HOST_NAME(),GETDATE(),'I',inserted.idDetalle FROM inserted;
END

GO
ALTER TABLE [dbo].[DetalleServicio] ENABLE TRIGGER [trServicioInsert]
GO
