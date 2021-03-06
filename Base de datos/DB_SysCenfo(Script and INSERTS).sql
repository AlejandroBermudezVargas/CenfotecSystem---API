USE [master]
GO
/****** Object:  Database [DB_SysCenfo]    Script Date: 24/12/2015 08:39:39 p.m. ******/
CREATE DATABASE [DB_SysCenfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyectoV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\proyectoV2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'proyectoV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\proyectoV2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_SysCenfo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_SysCenfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_SysCenfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_SysCenfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_SysCenfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_SysCenfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_SysCenfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_SysCenfo] SET  MULTI_USER 
GO
ALTER DATABASE [DB_SysCenfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_SysCenfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_SysCenfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_SysCenfo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_SysCenfo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_SysCenfo]
GO
/****** Object:  Table [dbo].[bitacoras]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacoras](
	[id_bitacora] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[accion] [text] NOT NULL,
	[id_usuario] [int] NULL,
	[id_prosprecto] [int] NULL,
	[id_reporte] [int] NULL,
	[id_evento] [int] NULL,
	[id_permiso] [int] NULL,
	[id_producto] [int] NULL,
	[id_rol] [int] NULL,
	[id_seguimiento] [int] NULL,
	[id_sesion] [int] NULL,
	[id_tipo_producto] [int] NULL,
	[id_venta] [int] NULL,
	[id_usuario_afectado] [int] NULL,
 CONSTRAINT [PK_bitacoras] PRIMARY KEY CLUSTERED 
(
	[id_bitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evaluacion_preguntas]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluacion_preguntas](
	[id_evaluacion] [int] NOT NULL,
	[id_pregunta] [int] NOT NULL,
	[respuesta] [int] NOT NULL,
 CONSTRAINT [PK_evaluacion_preguntas] PRIMARY KEY CLUSTERED 
(
	[id_evaluacion] ASC,
	[id_pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evaluaciones]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluaciones](
	[id_evaluacion] [int] IDENTITY(1,1) NOT NULL,
	[usuario_evaluado] [int] NOT NULL,
	[id_evaluador] [int] NOT NULL,
	[porcentaje_desactivacion] [int] NOT NULL,
	[curso_evaluado] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[fecha_creacion] [smalldatetime] NOT NULL,
	[fecha_actualizacion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_evaluaciones] PRIMARY KEY CLUSTERED 
(
	[id_evaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[eventos]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[eventos](
	[id_evento] [int] IDENTITY(1,1) NOT NULL,
	[lugar] [varchar](100) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
 CONSTRAINT [PK_eventos] PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[historial_contrasennas]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[historial_contrasennas](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_historial_contrasennas_2] PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kpi]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kpi](
	[id_kpi] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo] [int] NOT NULL,
	[descripcion_indicador] [varchar](100) NOT NULL,
	[indicador] [varchar](50) NOT NULL,
	[fecha_inicio] [date] NULL,
	[fecha_final] [date] NULL,
 CONSTRAINT [PK_kpi] PRIMARY KEY CLUSTERED 
(
	[id_kpi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permisos]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[permisos](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_permisos] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[plantilla]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[plantilla](
	[id_plantilla] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_plantilla] PRIMARY KEY CLUSTERED 
(
	[id_plantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[plantilla_preguntas]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantilla_preguntas](
	[id_plantilla] [int] NOT NULL,
	[id_pregunta] [int] NOT NULL,
 CONSTRAINT [PK_plantilla_preguntas] PRIMARY KEY CLUSTERED 
(
	[id_plantilla] ASC,
	[id_pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[preguntas]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[preguntas](
	[id_pregunta] [int] IDENTITY(1,1) NOT NULL,
	[pregunta] [varchar](100) NOT NULL,
	[peso] [int] NOT NULL,
 CONSTRAINT [PK_preguntas] PRIMARY KEY CLUSTERED 
(
	[id_pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productos]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[codigo_producto] [varchar](20) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[costo] [money] NOT NULL,
	[horario] [varchar](254) NOT NULL,
	[id_tipo_product] [int] NOT NULL,
	[fecha_creacion] [smalldatetime] NOT NULL,
	[fecha_actualizacion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prospecto_interes]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prospecto_interes](
	[id_prospecto] [int] NOT NULL,
	[id_tipo_producto] [int] NOT NULL,
 CONSTRAINT [PK_prospecto_interes] PRIMARY KEY CLUSTERED 
(
	[id_prospecto] ASC,
	[id_tipo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[prospectos]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prospectos](
	[id_prospecto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[procedencia] [text] NOT NULL,
	[estado] [bit] NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[direccion] [text] NULL,
	[interesado] [bit] NOT NULL,
	[cliente] [bit] NOT NULL,
	[id_evento] [int] NULL,
	[fecha_creacion] [smalldatetime] NOT NULL,
	[fecha_actualizacion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_prospectos] PRIMARY KEY CLUSTERED 
(
	[id_prospecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reportes]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reportes](
	[id_reporte] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_reportes] PRIMARY KEY CLUSTERED 
(
	[id_reporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol_permiso]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_permiso](
	[id_permiso] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
 CONSTRAINT [PK_rol_permiso] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC,
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rols]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rols](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_rols] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seguimientos]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seguimientos](
	[id_seguimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_prospecto] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[comentario] [text] NULL,
	[fecha_creacion] [smalldatetime] NOT NULL,
	[fecha_actualizacion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_seguimientos] PRIMARY KEY CLUSTERED 
(
	[id_seguimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sesion]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sesion](
	[id_sesion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_sesion] PRIMARY KEY CLUSTERED 
(
	[id_sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_kpi]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_kpi](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_kpi] PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_producto]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_producto](
	[id_tipo_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
 CONSTRAINT [PK_tipo_producto] PRIMARY KEY CLUSTERED 
(
	[id_tipo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_producto]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_producto](
	[id_usuario] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_usuario_producto] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_prospectos]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_prospectos](
	[id_usuario] [int] NOT NULL,
	[id_prospecto] [int] NOT NULL,
 CONSTRAINT [PK_usuario_prospectos] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_prospecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
	[id_rol] [int] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ventas](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
	[tipo] [varchar](100) NULL,
	[fecha_creacion] [smalldatetime] NOT NULL,
	[fecha_actualizacion] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas_producto]    Script Date: 24/12/2015 08:39:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas_producto](
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
 CONSTRAINT [PK_ventas_producto] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC,
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[bitacoras] ON 

INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (129, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (130, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (131, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (132, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (133, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (134, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (135, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (136, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (137, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (138, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (139, CAST(N'2015-12-14' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (140, CAST(N'2015-12-19' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (141, CAST(N'2015-12-19' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (142, CAST(N'2015-12-19' AS Date), N'Cerro sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (143, CAST(N'2015-12-19' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (144, CAST(N'2015-12-19' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (145, CAST(N'2015-12-19' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (146, CAST(N'2015-12-19' AS Date), N'Cerro sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (147, CAST(N'2015-12-19' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (148, CAST(N'2015-12-24' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (149, CAST(N'2015-12-24' AS Date), N'Cerro sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[bitacoras] ([id_bitacora], [fecha], [accion], [id_usuario], [id_prosprecto], [id_reporte], [id_evento], [id_permiso], [id_producto], [id_rol], [id_seguimiento], [id_sesion], [id_tipo_producto], [id_venta], [id_usuario_afectado]) VALUES (150, CAST(N'2015-12-24' AS Date), N'Inicio sesión', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[bitacoras] OFF
SET IDENTITY_INSERT [dbo].[eventos] ON 

INSERT [dbo].[eventos] ([id_evento], [lugar], [fecha_inicio], [fecha_fin]) VALUES (27, N'La casa del cuño', CAST(N'2015-12-14' AS Date), CAST(N'2015-12-14' AS Date))
INSERT [dbo].[eventos] ([id_evento], [lugar], [fecha_inicio], [fecha_fin]) VALUES (28, N'Evento ULATINA', CAST(N'2015-06-23' AS Date), CAST(N'2015-02-26' AS Date))
INSERT [dbo].[eventos] ([id_evento], [lugar], [fecha_inicio], [fecha_fin]) VALUES (29, N'Universidad Cenfotec Cyber Monday', CAST(N'2015-12-22' AS Date), CAST(N'2015-12-24' AS Date))
SET IDENTITY_INSERT [dbo].[eventos] OFF
SET IDENTITY_INSERT [dbo].[historial_contrasennas] ON 

INSERT [dbo].[historial_contrasennas] ([id_historial], [contraseña], [id_usuario]) VALUES (22, N'GzUQvWJyMkvJV9ckdDyhxA==', 4)
INSERT [dbo].[historial_contrasennas] ([id_historial], [contraseña], [id_usuario]) VALUES (23, N'gyr4EHG2Od09hFhR7IXjsQ==', 5)
INSERT [dbo].[historial_contrasennas] ([id_historial], [contraseña], [id_usuario]) VALUES (24, N'gyr4EHG2Od09hFhR7IXjsQ==', 6)
INSERT [dbo].[historial_contrasennas] ([id_historial], [contraseña], [id_usuario]) VALUES (25, N'gyr4EHG2Od09hFhR7IXjsQ==', 7)
INSERT [dbo].[historial_contrasennas] ([id_historial], [contraseña], [id_usuario]) VALUES (26, N'gyr4EHG2Od09hFhR7IXjsQ==', 8)
INSERT [dbo].[historial_contrasennas] ([id_historial], [contraseña], [id_usuario]) VALUES (27, N'gyr4EHG2Od09hFhR7IXjsQ==', 9)
SET IDENTITY_INSERT [dbo].[historial_contrasennas] OFF
SET IDENTITY_INSERT [dbo].[kpi] ON 

INSERT [dbo].[kpi] ([id_kpi], [id_tipo], [descripcion_indicador], [indicador], [fecha_inicio], [fecha_final]) VALUES (2, 1, N'Ventas', N'175000', NULL, NULL)
INSERT [dbo].[kpi] ([id_kpi], [id_tipo], [descripcion_indicador], [indicador], [fecha_inicio], [fecha_final]) VALUES (3, 1, N'Total del ventas de CENFOTEC', N'2000000', NULL, NULL)
SET IDENTITY_INSERT [dbo].[kpi] OFF
SET IDENTITY_INSERT [dbo].[permisos] ON 

INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (1, N'actis', N'El usuario tiene acceso a la seccion de productos')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (2, N'carreras', N'El usuario tiene acceso a la seccion de carreras')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (3, N'ventas', N'El usuario tiene acceso a la seccion de los ventas')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (4, N'prospectos', N'El usuario tiene acceso a la seccion de prospectos')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (5, N'eventos', N'El usuario tiene acceso a la seccion de los eventos')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (6, N'kpis', N'El usuario tiene acceso a la seccion de los kpis')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (7, N'usuarios', N'El usuario tiene acceso a la seccion de los usuarios')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (8, N'reportes', N'El usuario tiene acceso a la seccion de reportes')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (9, N'configuracion', N'El usuario tiene acceso a la seccion de configuracion')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (10, N'evaluaciones', N'El usuario tiene acceso a la seccion de configuracion')
INSERT [dbo].[permisos] ([id_permiso], [nombre], [descripcion]) VALUES (11, N'preguntas', N'El usuario tiene acceso a la seccion de configuracion')
SET IDENTITY_INSERT [dbo].[permisos] OFF
SET IDENTITY_INSERT [dbo].[plantilla] ON 

INSERT [dbo].[plantilla] ([id_plantilla], [nombre], [descripcion]) VALUES (1, N'Trabajo en equipo ', N'Descripcio')
INSERT [dbo].[plantilla] ([id_plantilla], [nombre], [descripcion]) VALUES (2, N'Alvaro Cordero', N'Descripción')
INSERT [dbo].[plantilla] ([id_plantilla], [nombre], [descripcion]) VALUES (3, N'Eficiencia ', N'Mide la eficiencia ')
INSERT [dbo].[plantilla] ([id_plantilla], [nombre], [descripcion]) VALUES (4, N'Evaluación fundamentos de programación grupo 3', N'Fundamentos de programación')
INSERT [dbo].[plantilla] ([id_plantilla], [nombre], [descripcion]) VALUES (5, N'Evaluación programación 2', N'Evaluación programación 2')
SET IDENTITY_INSERT [dbo].[plantilla] OFF
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (1, 3)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (2, 1)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (2, 2)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (2, 6)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (3, 2)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (4, 1)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (4, 5)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (4, 6)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (5, 1)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (5, 3)
INSERT [dbo].[plantilla_preguntas] ([id_plantilla], [id_pregunta]) VALUES (5, 5)
SET IDENTITY_INSERT [dbo].[preguntas] ON 

INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (1, N'¿El profesor es puntual?', 2)
INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (2, N'¿Que le parece la explicación del profesor?', 2)
INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (3, N'El profesor es respetuoso con los alumnos', 3)
INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (4, N'El profesor dedica horas extras a resolver dudas', 3)
INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (5, N'¿Da a conocer el programa del curso?', 4)
INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (6, N'¿El relaciona la experiencia profesional con sus clases?', 2)
INSERT [dbo].[preguntas] ([id_pregunta], [pregunta], [peso]) VALUES (7, N'¿El profesor cumple el programa del curso?', 3)
SET IDENTITY_INSERT [dbo].[preguntas] OFF
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (4, N'INT-001', N'Android 1', 200000.0000, N'LMJ', 1, CAST(N'2015-12-11 23:54:00' AS SmallDateTime), CAST(N'2015-12-11 23:54:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (5, N'BISOFT', N'Datos 1', 200000.0000, N'LMJ', 2, CAST(N'2015-12-11 23:54:00' AS SmallDateTime), CAST(N'2015-12-11 23:54:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (6, N'BISOFT', N'Datos 1', 200000.0000, N'LMJ', 2, CAST(N'2015-12-11 23:54:00' AS SmallDateTime), CAST(N'2015-12-11 23:54:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (7, N'INT-001', N'Android 1', 200000.0000, N'LMJ', 1, CAST(N'2015-12-11 23:54:00' AS SmallDateTime), CAST(N'2015-12-11 23:54:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (8, N'BISOFT', N'Ingenieria del Software', 20000000.0000, N'-', 2, CAST(N'2015-12-14 04:01:00' AS SmallDateTime), CAST(N'2015-12-14 04:01:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (9, N'CAR1', N'Carrera Académica 1', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:09:00' AS SmallDateTime), CAST(N'2015-12-14 04:09:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (10, N'CAR2', N'Carrera Académica 2', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:09:00' AS SmallDateTime), CAST(N'2015-12-14 04:09:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (11, N'CAR3', N'Carrera Académica 3', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:09:00' AS SmallDateTime), CAST(N'2015-12-14 04:09:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (12, N'CAR4', N'Carrera Académica 4', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:09:00' AS SmallDateTime), CAST(N'2015-12-14 04:09:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (13, N'CAR5', N'Carrera Académica 5', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:09:00' AS SmallDateTime), CAST(N'2015-12-14 04:09:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (14, N'CAR1', N'Carrera Académica 1', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (15, N'CAR2', N'Carrera Académica 2', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (16, N'CAR3', N'Carrera Académica 3', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (17, N'CAR4', N'Carrera Académica 4', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (18, N'CAR5', N'Carrera Académica 5', 7000000.0000, N'No Provisto', 2, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (19, N'ACT1', N'Acti 1', 500000.0000, N'Lunes de 10:30 a 11:45', 1, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (20, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (21, N'ACT3', N'Acti 3', 500000.0000, N'Lunes de 10:30 a 11:45', 1, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (22, N'ACT4', N'Acti 4', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (23, N'ACT5', N'Acti 5', 500000.0000, N'Lunes de 10:30 a 11:45', 1, CAST(N'2015-12-14 04:26:00' AS SmallDateTime), CAST(N'2015-12-14 04:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (24, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (25, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (26, N'ACT4', N'Acti 4', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (27, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (28, N'ACT4', N'Acti 4', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (29, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (30, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (31, N'ACT4', N'Acti 4', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (32, N'ACT2', N'Acti 2', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (33, N'ACT4', N'Acti 4', 500000.0000, N'Martes de 14:30 a 15:30', 1, CAST(N'2015-12-14 10:26:00' AS SmallDateTime), CAST(N'2015-12-14 10:26:00' AS SmallDateTime))
INSERT [dbo].[productos] ([id_producto], [codigo_producto], [nombre], [costo], [horario], [id_tipo_product], [fecha_creacion], [fecha_actualizacion]) VALUES (34, N'BTEL', N'Bachillerato en Telemática', 6000000.0000, N'-', 2, CAST(N'2015-12-15 00:55:00' AS SmallDateTime), CAST(N'2015-12-15 00:55:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[productos] OFF
INSERT [dbo].[prospecto_interes] ([id_prospecto], [id_tipo_producto]) VALUES (61, 1)
SET IDENTITY_INSERT [dbo].[prospectos] ON 

INSERT [dbo].[prospectos] ([id_prospecto], [nombre], [apellidos], [fecha_nacimiento], [procedencia], [estado], [telefono], [email], [direccion], [interesado], [cliente], [id_evento], [fecha_creacion], [fecha_actualizacion]) VALUES (61, N'Fabio', N'Bermudez', CAST(N'2015-03-06' AS Date), N'Evento', 1, N'83158818', N'fflores@ucenfotec.ac.cr', N'San antionui', 1, 1, 27, CAST(N'2015-12-14 18:07:00' AS SmallDateTime), CAST(N'2015-12-14 18:07:00' AS SmallDateTime))
INSERT [dbo].[prospectos] ([id_prospecto], [nombre], [apellidos], [fecha_nacimiento], [procedencia], [estado], [telefono], [email], [direccion], [interesado], [cliente], [id_evento], [fecha_creacion], [fecha_actualizacion]) VALUES (62, N'Anthony ', N'Ramirez', CAST(N'1990-11-01' AS Date), N'Evento', 1, N'83158818', N'aramirezm@ucenfotec.ac.cr', N'San Pedro', 0, 0, 29, CAST(N'2015-12-14 19:03:00' AS SmallDateTime), CAST(N'2015-12-14 19:03:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[prospectos] OFF
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (1, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (1, 2)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (1, 3)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (2, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (2, 2)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (2, 3)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (3, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (3, 2)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (3, 3)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (4, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (5, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (6, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (7, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (8, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (9, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (9, 2)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (9, 3)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (9, 6)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (10, 1)
INSERT [dbo].[rol_permiso] ([id_permiso], [id_rol]) VALUES (11, 1)
SET IDENTITY_INSERT [dbo].[rols] ON 

INSERT [dbo].[rols] ([id_rol], [nombre], [activo]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[rols] ([id_rol], [nombre], [activo]) VALUES (2, N'Ventas', 1)
INSERT [dbo].[rols] ([id_rol], [nombre], [activo]) VALUES (3, N'Telemercadeo', 1)
INSERT [dbo].[rols] ([id_rol], [nombre], [activo]) VALUES (4, N'Estudiante', 1)
INSERT [dbo].[rols] ([id_rol], [nombre], [activo]) VALUES (5, N'Profesor', 1)
INSERT [dbo].[rols] ([id_rol], [nombre], [activo]) VALUES (6, N'Asistente', 1)
SET IDENTITY_INSERT [dbo].[rols] OFF
SET IDENTITY_INSERT [dbo].[seguimientos] ON 

INSERT [dbo].[seguimientos] ([id_seguimiento], [id_prospecto], [fecha], [comentario], [fecha_creacion], [fecha_actualizacion]) VALUES (2, 21, CAST(N'2015-11-01' AS Date), N'Me dijo que no lo llamara mas', CAST(N'2015-12-13 22:50:00' AS SmallDateTime), CAST(N'2015-12-13 22:50:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[seguimientos] OFF
SET IDENTITY_INSERT [dbo].[sesion] ON 

INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (78, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (79, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (80, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (81, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (82, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (83, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (84, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (85, 2, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (86, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (87, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (88, 1, CAST(N'2015-12-14' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (89, 1, CAST(N'2015-12-19' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (90, 1, CAST(N'2015-12-19' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (91, 1, CAST(N'2015-12-19' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (92, 1, CAST(N'2015-12-19' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (93, 1, CAST(N'2015-12-19' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (94, 1, CAST(N'2015-12-19' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (95, 1, CAST(N'2015-12-24' AS Date))
INSERT [dbo].[sesion] ([id_sesion], [id_usuario], [fecha]) VALUES (96, 1, CAST(N'2015-12-24' AS Date))
SET IDENTITY_INSERT [dbo].[sesion] OFF
SET IDENTITY_INSERT [dbo].[tipo_kpi] ON 

INSERT [dbo].[tipo_kpi] ([id_tipo], [nombre]) VALUES (1, N'Ventas')
INSERT [dbo].[tipo_kpi] ([id_tipo], [nombre]) VALUES (2, N'Prospectos')
INSERT [dbo].[tipo_kpi] ([id_tipo], [nombre]) VALUES (3, N'Vendedores')
SET IDENTITY_INSERT [dbo].[tipo_kpi] OFF
SET IDENTITY_INSERT [dbo].[tipo_producto] ON 

INSERT [dbo].[tipo_producto] ([id_tipo_producto], [nombre], [descripcion]) VALUES (1, N'Actis', N'Cursos de actualización')
INSERT [dbo].[tipo_producto] ([id_tipo_producto], [nombre], [descripcion]) VALUES (2, N'Carrera', N'Cursos de carrera')
INSERT [dbo].[tipo_producto] ([id_tipo_producto], [nombre], [descripcion]) VALUES (3, N'Actis', N'Cursos de actualización')
INSERT [dbo].[tipo_producto] ([id_tipo_producto], [nombre], [descripcion]) VALUES (4, N'Carrera', N'Cursos de carrera')
SET IDENTITY_INSERT [dbo].[tipo_producto] OFF
INSERT [dbo].[usuario_prospectos] ([id_usuario], [id_prospecto]) VALUES (2, 61)
INSERT [dbo].[usuario_prospectos] ([id_usuario], [id_prospecto]) VALUES (2, 62)
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (1, N'207730389', N'Alejandro', N'Bermudez', N'admin@ucenfotec.ac.cr', CAST(N'2015-12-19' AS Date), N'83158818', N'HUEZR7OOIi2UQ9iLliWkyg==', 1, 1)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (2, N'2145791', N'ventas', N'', N'ventas@ucenfotec.ac.cr', CAST(N'2015-12-14' AS Date), N'', N'W5UKhV2ezFI9C4f/+1b9FA==', 1, 2)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (3, N'5548545', N'Telemercadeo', N'', N'telemercadeo@ucenfotec.ac.cr', CAST(N'2015-12-14' AS Date), N'', N'CdfSNDh3QKjoaVIGhUYspw==', 0, 3)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (4, N'104820176', N'Ignacio', N'Trejos Zelaya', N'itrejos@ucenfotec.ac.cr', CAST(N'1984-12-29' AS Date), N'22222222', N'GzUQvWJyMkvJV9ckdDyhxA==', 1, 1)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (5, N'123456789', N'Diego', N'Mora', N'diego@mora.com', CAST(N'1984-10-25' AS Date), N'87780699', N'gyr4EHG2Od09hFhR7IXjsQ==', 1, 5)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (6, N'321654999', N'Juan', N'Gomez', N'juan@gmail.com', CAST(N'1984-10-26' AS Date), N'87780698', N'gyr4EHG2Od09hFhR7IXjsQ==', 1, 5)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (7, N'456789146', N'Lucia', N'Gonzalez', N'lucia@gmail.com', CAST(N'1984-10-27' AS Date), N'87780697', N'gyr4EHG2Od09hFhR7IXjsQ==', 1, 5)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (8, N'321456999', N'Pablo', N'Murillo', N'pablo@yahoo.es', CAST(N'1984-10-28' AS Date), N'87780698', N'gyr4EHG2Od09hFhR7IXjsQ==', 1, 5)
INSERT [dbo].[usuarios] ([id_usuario], [cedula], [nombre], [apellido], [correo], [fecha_nacimiento], [telefono], [password], [activo], [id_rol]) VALUES (9, N'789321458', N'Enrique', N'Lopez', N'enriquito@yahoo.com', CAST(N'1984-10-29' AS Date), N'87780698', N'gyr4EHG2Od09hFhR7IXjsQ==', 1, 5)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
SET IDENTITY_INSERT [dbo].[ventas] ON 

INSERT [dbo].[ventas] ([id_venta], [id_usuario], [monto], [fecha], [tipo], [fecha_creacion], [fecha_actualizacion]) VALUES (4, 1, 6075000.0000, CAST(N'2015-12-14' AS Date), N'Carrera', CAST(N'2015-12-15 01:04:00' AS SmallDateTime), CAST(N'2015-12-15 01:04:00' AS SmallDateTime))
INSERT [dbo].[ventas] ([id_venta], [id_usuario], [monto], [fecha], [tipo], [fecha_creacion], [fecha_actualizacion]) VALUES (5, 2, 210000.0000, CAST(N'2015-12-14' AS Date), N'Actis', CAST(N'2015-12-15 01:06:00' AS SmallDateTime), CAST(N'2015-12-15 01:06:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ventas] OFF
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_eventos] FOREIGN KEY([id_evento])
REFERENCES [dbo].[eventos] ([id_evento])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_eventos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_permisos] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permisos] ([id_permiso])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_permisos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_productos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_prospectos] FOREIGN KEY([id_prosprecto])
REFERENCES [dbo].[prospectos] ([id_prospecto])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_prospectos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_reportes] FOREIGN KEY([id_reporte])
REFERENCES [dbo].[reportes] ([id_reporte])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_reportes]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_seguimientos] FOREIGN KEY([id_seguimiento])
REFERENCES [dbo].[seguimientos] ([id_seguimiento])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_seguimientos]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_sesion] FOREIGN KEY([id_sesion])
REFERENCES [dbo].[sesion] ([id_sesion])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_sesion]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_tipo_producto] FOREIGN KEY([id_tipo_producto])
REFERENCES [dbo].[tipo_producto] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_tipo_producto]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_usuarios]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_usuarios2] FOREIGN KEY([id_usuario_afectado])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_usuarios2]
GO
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_ventas] FOREIGN KEY([id_venta])
REFERENCES [dbo].[ventas] ([id_venta])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_ventas]
GO
ALTER TABLE [dbo].[evaluacion_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_evaluacion_preguntas_evaluaciones] FOREIGN KEY([id_evaluacion])
REFERENCES [dbo].[evaluaciones] ([id_evaluacion])
GO
ALTER TABLE [dbo].[evaluacion_preguntas] CHECK CONSTRAINT [FK_evaluacion_preguntas_evaluaciones]
GO
ALTER TABLE [dbo].[evaluacion_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_evaluacion_preguntas_preguntas] FOREIGN KEY([id_pregunta])
REFERENCES [dbo].[preguntas] ([id_pregunta])
GO
ALTER TABLE [dbo].[evaluacion_preguntas] CHECK CONSTRAINT [FK_evaluacion_preguntas_preguntas]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_evaluaciones_productos] FOREIGN KEY([curso_evaluado])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [FK_evaluaciones_productos]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_evaluaciones_usuarios] FOREIGN KEY([usuario_evaluado])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [FK_evaluaciones_usuarios]
GO
ALTER TABLE [dbo].[evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_evaluaciones_usuarios1] FOREIGN KEY([usuario_evaluado])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[evaluaciones] CHECK CONSTRAINT [FK_evaluaciones_usuarios1]
GO
ALTER TABLE [dbo].[historial_contrasennas]  WITH CHECK ADD  CONSTRAINT [FK_historial_contrasennas_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[historial_contrasennas] CHECK CONSTRAINT [FK_historial_contrasennas_usuarios]
GO
ALTER TABLE [dbo].[kpi]  WITH CHECK ADD  CONSTRAINT [FK_kpi_tipo_kpi] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[tipo_kpi] ([id_tipo])
GO
ALTER TABLE [dbo].[kpi] CHECK CONSTRAINT [FK_kpi_tipo_kpi]
GO
ALTER TABLE [dbo].[plantilla_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_plantilla_preguntas_plantilla] FOREIGN KEY([id_plantilla])
REFERENCES [dbo].[plantilla] ([id_plantilla])
GO
ALTER TABLE [dbo].[plantilla_preguntas] CHECK CONSTRAINT [FK_plantilla_preguntas_plantilla]
GO
ALTER TABLE [dbo].[plantilla_preguntas]  WITH CHECK ADD  CONSTRAINT [FK_plantilla_preguntas_preguntas] FOREIGN KEY([id_pregunta])
REFERENCES [dbo].[preguntas] ([id_pregunta])
GO
ALTER TABLE [dbo].[plantilla_preguntas] CHECK CONSTRAINT [FK_plantilla_preguntas_preguntas]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_tipo_producto] FOREIGN KEY([id_tipo_product])
REFERENCES [dbo].[tipo_producto] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_tipo_producto]
GO
ALTER TABLE [dbo].[prospecto_interes]  WITH CHECK ADD  CONSTRAINT [FK_prospecto_interes_prospectos] FOREIGN KEY([id_prospecto])
REFERENCES [dbo].[prospectos] ([id_prospecto])
GO
ALTER TABLE [dbo].[prospecto_interes] CHECK CONSTRAINT [FK_prospecto_interes_prospectos]
GO
ALTER TABLE [dbo].[prospecto_interes]  WITH CHECK ADD  CONSTRAINT [FK_prospecto_interes_tipo_producto] FOREIGN KEY([id_tipo_producto])
REFERENCES [dbo].[tipo_producto] ([id_tipo_producto])
GO
ALTER TABLE [dbo].[prospecto_interes] CHECK CONSTRAINT [FK_prospecto_interes_tipo_producto]
GO
ALTER TABLE [dbo].[prospectos]  WITH CHECK ADD  CONSTRAINT [FK_prospectos_eventos] FOREIGN KEY([id_evento])
REFERENCES [dbo].[eventos] ([id_evento])
GO
ALTER TABLE [dbo].[prospectos] CHECK CONSTRAINT [FK_prospectos_eventos]
GO
ALTER TABLE [dbo].[rol_permiso]  WITH CHECK ADD  CONSTRAINT [FK_rol_permiso_permisos] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permisos] ([id_permiso])
GO
ALTER TABLE [dbo].[rol_permiso] CHECK CONSTRAINT [FK_rol_permiso_permisos]
GO
ALTER TABLE [dbo].[rol_permiso]  WITH CHECK ADD  CONSTRAINT [FK_rol_permiso_rol_permiso] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rols] ([id_rol])
GO
ALTER TABLE [dbo].[rol_permiso] CHECK CONSTRAINT [FK_rol_permiso_rol_permiso]
GO
ALTER TABLE [dbo].[sesion]  WITH CHECK ADD  CONSTRAINT [FK_sesion_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[sesion] CHECK CONSTRAINT [FK_sesion_usuarios]
GO
ALTER TABLE [dbo].[usuario_producto]  WITH CHECK ADD  CONSTRAINT [FK_usuario_producto_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[usuario_producto] CHECK CONSTRAINT [FK_usuario_producto_productos]
GO
ALTER TABLE [dbo].[usuario_producto]  WITH CHECK ADD  CONSTRAINT [FK_usuario_producto_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_producto] CHECK CONSTRAINT [FK_usuario_producto_usuarios]
GO
ALTER TABLE [dbo].[usuario_prospectos]  WITH CHECK ADD  CONSTRAINT [FK_usuario_prospectos_prospectos] FOREIGN KEY([id_prospecto])
REFERENCES [dbo].[prospectos] ([id_prospecto])
GO
ALTER TABLE [dbo].[usuario_prospectos] CHECK CONSTRAINT [FK_usuario_prospectos_prospectos]
GO
ALTER TABLE [dbo].[usuario_prospectos]  WITH CHECK ADD  CONSTRAINT [FK_usuario_prospectos_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_prospectos] CHECK CONSTRAINT [FK_usuario_prospectos_usuarios]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_rols] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rols] ([id_rol])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_rols]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_usuarios]
GO
ALTER TABLE [dbo].[ventas_producto]  WITH CHECK ADD  CONSTRAINT [FK_ventas_producto_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[ventas_producto] CHECK CONSTRAINT [FK_ventas_producto_productos]
GO
ALTER TABLE [dbo].[ventas_producto]  WITH CHECK ADD  CONSTRAINT [FK_ventas_producto_ventas] FOREIGN KEY([id_venta])
REFERENCES [dbo].[ventas] ([id_venta])
GO
ALTER TABLE [dbo].[ventas_producto] CHECK CONSTRAINT [FK_ventas_producto_ventas]
GO
USE [master]
GO
ALTER DATABASE [DB_SysCenfo] SET  READ_WRITE 
GO
