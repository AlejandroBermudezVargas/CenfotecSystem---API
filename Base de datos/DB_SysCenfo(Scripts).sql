USE [master]
GO
/****** Object:  Database [DB_SysCenfo]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[bitacoras]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[evaluacion_preguntas]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[evaluaciones]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[eventos]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[historial_contrasennas]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[kpi]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[permisos]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[plantilla]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[plantilla_preguntas]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[preguntas]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[productos]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[prospecto_interes]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[prospectos]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[reportes]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[rol_permiso]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[rols]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[seguimientos]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[sesion]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[tipo_kpi]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[tipo_producto]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[usuario_producto]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[usuario_prospectos]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[ventas]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
/****** Object:  Table [dbo].[ventas_producto]    Script Date: 24/12/2015 08:40:06 p.m. ******/
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
