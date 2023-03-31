USE [master]
GO
/****** Object:  Database [Rolled_ProductDb]    Script Date: 2023/03/31 16:26:36 ******/
CREATE DATABASE [Rolled_ProductDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rolled_ProductDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Rolled_ProductDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rolled_ProductDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Rolled_ProductDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rolled_ProductDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rolled_ProductDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rolled_ProductDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rolled_ProductDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Rolled_ProductDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rolled_ProductDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET RECOVERY FULL 
GO
ALTER DATABASE [Rolled_ProductDb] SET  MULTI_USER 
GO
ALTER DATABASE [Rolled_ProductDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rolled_ProductDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rolled_ProductDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rolled_ProductDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rolled_ProductDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rolled_ProductDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Rolled_ProductDb', N'ON'
GO
ALTER DATABASE [Rolled_ProductDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [Rolled_ProductDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Rolled_ProductDb]
GO
/****** Object:  Table [dbo].[AbpAuditLogActions]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpAuditLogActions](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[AuditLogId] [uniqueidentifier] NOT NULL,
	[ServiceName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](128) NULL,
	[Parameters] [nvarchar](2000) NULL,
	[ExecutionTime] [datetime2](7) NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpAuditLogActions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpAuditLogs]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpAuditLogs](
	[Id] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](96) NULL,
	[UserId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NULL,
	[TenantId] [uniqueidentifier] NULL,
	[TenantName] [nvarchar](max) NULL,
	[ImpersonatorUserId] [uniqueidentifier] NULL,
	[ImpersonatorTenantId] [uniqueidentifier] NULL,
	[ExecutionTime] [datetime2](7) NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[ClientId] [nvarchar](64) NULL,
	[CorrelationId] [nvarchar](64) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[HttpMethod] [nvarchar](16) NULL,
	[Url] [nvarchar](256) NULL,
	[Exceptions] [nvarchar](max) NULL,
	[Comments] [nvarchar](256) NULL,
	[HttpStatusCode] [int] NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpBackgroundJobs]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpBackgroundJobs](
	[Id] [uniqueidentifier] NOT NULL,
	[JobName] [nvarchar](128) NOT NULL,
	[JobArgs] [nvarchar](max) NOT NULL,
	[TryCount] [smallint] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[NextTryTime] [datetime2](7) NOT NULL,
	[LastTryTime] [datetime2](7) NULL,
	[IsAbandoned] [bit] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpBackgroundJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpClaimTypes]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpClaimTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Required] [bit] NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[Regex] [nvarchar](512) NULL,
	[RegexDescription] [nvarchar](128) NULL,
	[Description] [nvarchar](256) NULL,
	[ValueType] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpClaimTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityChanges]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityChanges](
	[Id] [uniqueidentifier] NOT NULL,
	[AuditLogId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ChangeTime] [datetime2](7) NOT NULL,
	[ChangeType] [tinyint] NOT NULL,
	[EntityTenantId] [uniqueidentifier] NULL,
	[EntityId] [nvarchar](128) NOT NULL,
	[EntityTypeFullName] [nvarchar](128) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpEntityChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityPropertyChanges]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityPropertyChanges](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[EntityChangeId] [uniqueidentifier] NOT NULL,
	[NewValue] [nvarchar](512) NULL,
	[OriginalValue] [nvarchar](512) NULL,
	[PropertyName] [nvarchar](128) NOT NULL,
	[PropertyTypeFullName] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_AbpEntityPropertyChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpFeatureValues]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpFeatureValues](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](128) NOT NULL,
	[ProviderName] [nvarchar](64) NULL,
	[ProviderKey] [nvarchar](64) NULL,
 CONSTRAINT [PK_AbpFeatureValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpLinkUsers]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpLinkUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[SourceUserId] [uniqueidentifier] NOT NULL,
	[SourceTenantId] [uniqueidentifier] NULL,
	[TargetUserId] [uniqueidentifier] NOT NULL,
	[TargetTenantId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpLinkUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnitRoles]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnitRoles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[OrganizationUnitId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpOrganizationUnitRoles] PRIMARY KEY CLUSTERED 
(
	[OrganizationUnitId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnits]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnits](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Code] [nvarchar](95) NOT NULL,
	[DisplayName] [nvarchar](128) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpPermissionGrants]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpPermissionGrants](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[ProviderName] [nvarchar](64) NOT NULL,
	[ProviderKey] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_AbpPermissionGrants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpRoleClaims]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoleClaims](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ClaimType] [nvarchar](256) NOT NULL,
	[ClaimValue] [nvarchar](1024) NULL,
 CONSTRAINT [PK_AbpRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpRoles]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NormalizedName] [nvarchar](256) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpSecurityLogs]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpSecurityLogs](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ApplicationName] [nvarchar](96) NULL,
	[Identity] [nvarchar](96) NULL,
	[Action] [nvarchar](96) NULL,
	[UserId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NULL,
	[TenantName] [nvarchar](64) NULL,
	[ClientId] [nvarchar](64) NULL,
	[CorrelationId] [nvarchar](64) NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
 CONSTRAINT [PK_AbpSecurityLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpSettings]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpSettings](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](2048) NOT NULL,
	[ProviderName] [nvarchar](64) NULL,
	[ProviderKey] [nvarchar](64) NULL,
 CONSTRAINT [PK_AbpSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenantConnectionStrings]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenantConnectionStrings](
	[TenantId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Value] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_AbpTenantConnectionStrings] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenants]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenants](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpTenants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserClaims]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserClaims](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ClaimType] [nvarchar](256) NOT NULL,
	[ClaimValue] [nvarchar](1024) NULL,
 CONSTRAINT [PK_AbpUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserLogins]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserLogins](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](64) NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[ProviderKey] [nvarchar](196) NOT NULL,
	[ProviderDisplayName] [nvarchar](128) NULL,
 CONSTRAINT [PK_AbpUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserOrganizationUnits]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserOrganizationUnits](
	[UserId] [uniqueidentifier] NOT NULL,
	[OrganizationUnitId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpUserOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[OrganizationUnitId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserRoles]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_AbpUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUsers]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[NormalizedUserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](64) NULL,
	[Surname] [nvarchar](64) NULL,
	[Email] [nvarchar](256) NOT NULL,
	[NormalizedEmail] [nvarchar](256) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](256) NULL,
	[SecurityStamp] [nvarchar](256) NOT NULL,
	[IsExternal] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](16) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ExtraProperties] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](40) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorId] [uniqueidentifier] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterId] [uniqueidentifier] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserTokens]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [smallint] NOT NULL,
	[category_name] [varchar](15) NOT NULL,
	[description] [text] NULL,
	[picture] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [smallint] NOT NULL,
	[product_name] [varchar](40) NOT NULL,
	[supplier_id] [smallint] NULL,
	[category_id] [smallint] NULL,
	[quantity_per_unit] [varchar](20) NULL,
	[unit_price] [real] NULL,
	[units_in_stock] [smallint] NULL,
	[units_on_order] [smallint] NULL,
	[reorder_level] [smallint] NULL,
	[discontinued] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [smallint] NOT NULL,
	[company_name] [varchar](40) NOT NULL,
	[contact_name] [varchar](30) NULL,
	[contact_title] [varchar](30) NULL,
	[address] [varchar](60) NULL,
	[city] [varchar](15) NULL,
	[region] [varchar](15) NULL,
	[postal_code] [varchar](10) NULL,
	[country] [varchar](15) NULL,
	[phone] [varchar](24) NULL,
	[fax] [varchar](24) NULL,
	[homepage] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (4, N'Dairy Products', N'Cheeses', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (6, N'Meat/Poultry', N'Prepared meats', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (7, N'Produce', N'Dried fruit and bean curd', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (8, N'Seafood', N'Seaweed and fish', N'\x')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (50, N'Siphelele Zulu', N'We code and repeat', N'lol.png')
GO
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (1, N'Chai', 8, 1, N'10 boxes x 30 bags', 18, 39, 0, 10, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (2, N'Chang', 1, 1, N'24 - 12 oz bottles', 19, 17, 40, 25, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (3, N'Aniseed Syrup', 1, 2, N'12 - 550 ml bottles', 10, 13, 70, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, 2, N'48 - 6 oz jars', 22, 53, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, 2, N'36 boxes', 21.35, 0, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (6, N'Grandma''s Boysenberry Spread', 3, 2, N'12 - 8 oz jars', 25, 120, 0, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 3, 7, N'12 - 1 lb pkgs.', 30, 15, 0, 10, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (8, N'Northwoods Cranberry Sauce', 3, 2, N'12 - 12 oz jars', 40, 6, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (9, N'Mishi Kobe Niku', 4, 6, N'18 - 500 g pkgs.', 97, 29, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (10, N'Ikura', 4, 8, N'12 - 200 ml jars', 31, 31, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (11, N'Queso Cabrales', 5, 4, N'1 kg pkg.', 21, 22, 30, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (12, N'Queso Manchego La Pastora', 5, 4, N'10 - 500 g pkgs.', 38, 86, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (13, N'Konbu', 6, 8, N'2 kg box', 6, 24, 0, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (14, N'Tofu', 6, 7, N'40 - 100 g pkgs.', 23.25, 35, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (15, N'Genen Shouyu', 6, 2, N'24 - 250 ml bottles', 13, 39, 0, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (16, N'Pavlova', 7, 3, N'32 - 500 g boxes', 17.45, 29, 0, 10, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (17, N'Alice Mutton', 7, 6, N'20 - 1 kg tins', 39, 0, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (18, N'Carnarvon Tigers', 7, 8, N'16 kg pkg.', 62.5, 42, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (19, N'Teatime Chocolate Biscuits', 8, 3, N'10 boxes x 12 pieces', 9.2, 25, 0, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (20, N'Sir Rodney''s Marmalade', 8, 3, N'30 gift boxes', 81, 40, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (21, N'Sir Rodney''s Scones', 8, 3, N'24 pkgs. x 4 pieces', 10, 3, 40, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (22, N'Gustaf''s Knäckebröd', 9, 5, N'24 - 500 g pkgs.', 21, 104, 0, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (23, N'Tunnbröd', 9, 5, N'12 - 250 g pkgs.', 9, 61, 0, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (24, N'Guaraná Fantástica', 10, 1, N'12 - 355 ml cans', 4.5, 20, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (25, N'NuNuCa Nuß-Nougat-Creme', 11, 3, N'20 - 450 g glasses', 14, 76, 0, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (26, N'Gumbär Gummibärchen', 11, 3, N'100 - 250 g bags', 31.23, 15, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (27, N'Schoggi Schokolade', 11, 3, N'100 - 100 g pieces', 43.9, 49, 0, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (28, N'Rössle Sauerkraut', 12, 7, N'25 - 825 g cans', 45.6, 26, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (29, N'Thüringer Rostbratwurst', 12, 6, N'50 bags x 30 sausgs.', 123.79, 0, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (30, N'Nord-Ost Matjeshering', 13, 8, N'10 - 200 g glasses', 25.89, 10, 0, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (31, N'Gorgonzola Telino', 14, 4, N'12 - 100 g pkgs', 12.5, 0, 70, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (32, N'Mascarpone Fabioli', 14, 4, N'24 - 200 g pkgs.', 32, 9, 40, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (33, N'Geitost', 15, 4, N'500 g', 2.5, 112, 0, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (34, N'Sasquatch Ale', 16, 1, N'24 - 12 oz bottles', 14, 111, 0, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (35, N'Steeleye Stout', 16, 1, N'24 - 12 oz bottles', 18, 20, 0, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (36, N'Inlagd Sill', 17, 8, N'24 - 250 g  jars', 19, 112, 0, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (37, N'Gravad lax', 17, 8, N'12 - 500 g pkgs.', 26, 11, 50, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (38, N'Côte de Blaye', 18, 1, N'12 - 75 cl bottles', 263.5, 17, 0, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (39, N'Chartreuse verte', 18, 1, N'750 cc per bottle', 18, 69, 0, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (40, N'Boston Crab Meat', 19, 8, N'24 - 4 oz tins', 18.4, 123, 0, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (41, N'Jack''s New England Clam Chowder', 19, 8, N'12 - 12 oz cans', 9.65, 85, 0, 10, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (42, N'Singaporean Hokkien Fried Mee', 20, 5, N'32 - 1 kg pkgs.', 14, 26, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (43, N'Ipoh Coffee', 20, 1, N'16 - 500 g tins', 46, 17, 10, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (44, N'Gula Malacca', 20, 2, N'20 - 2 kg bags', 19.45, 27, 0, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (45, N'Rogede sild', 21, 8, N'1k pkg.', 9.5, 5, 70, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (46, N'Spegesild', 21, 8, N'4 - 450 g glasses', 12, 95, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (47, N'Zaanse koeken', 22, 3, N'10 - 4 oz boxes', 9.5, 36, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (48, N'Chocolade', 22, 3, N'10 pkgs.', 12.75, 15, 70, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (49, N'Maxilaku', 23, 3, N'24 - 50 g pkgs.', 20, 10, 60, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (50, N'Valkoinen suklaa', 23, 3, N'12 - 100 g bars', 16.25, 65, 0, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (51, N'Manjimup Dried Apples', 24, 7, N'50 - 300 g pkgs.', 53, 20, 0, 10, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (52, N'Filo Mix', 24, 5, N'16 - 2 kg boxes', 7, 38, 0, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (53, N'Perth Pasties', 24, 6, N'48 pieces', 32.8, 0, 0, 0, 1)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (54, N'Tourtière', 25, 6, N'16 pies', 7.45, 21, 0, 10, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (55, N'Pâté chinois', 25, 6, N'24 boxes x 2 pies', 24, 115, 0, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (56, N'Gnocchi di nonna Alice', 26, 5, N'24 - 250 g pkgs.', 38, 21, 10, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (57, N'Ravioli Angelo', 26, 5, N'24 - 250 g pkgs.', 19.5, 36, 0, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (58, N'Escargots de Bourgogne', 27, 8, N'24 pieces', 13.25, 62, 0, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (59, N'Raclette Courdavault', 28, 4, N'5 kg pkg.', 55, 79, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (60, N'Camembert Pierrot', 28, 4, N'15 - 300 g rounds', 34, 19, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (61, N'Sirop d''érable', 29, 2, N'24 - 500 ml bottles', 28.5, 113, 0, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (62, N'Tarte au sucre', 29, 3, N'48 pies', 49.3, 17, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (63, N'Vegie-spread', 7, 2, N'15 - 625 g jars', 43.9, 24, 0, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (64, N'Wimmers gute Semmelknödel', 12, 5, N'20 bags x 4 pieces', 33.25, 22, 80, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', 2, 2, N'32 - 8 oz bottles', 21.05, 76, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (66, N'Louisiana Hot Spiced Okra', 2, 2, N'24 - 8 oz jars', 17, 4, 100, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (67, N'Laughing Lumberjack Lager', 16, 1, N'24 - 12 oz bottles', 14, 52, 0, 10, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (68, N'Scottish Longbreads', 8, 3, N'10 boxes x 8 pieces', 12.5, 6, 10, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (69, N'Gudbrandsdalsost', 15, 4, N'10 kg pkg.', 36, 26, 0, 15, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (70, N'Outback Lager', 7, 1, N'24 - 355 ml bottles', 15, 15, 10, 30, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (71, N'Flotemysost', 15, 4, N'10 - 500 g pkgs.', 21.5, 26, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (72, N'Mozzarella di Giovanni', 14, 4, N'24 - 200 g pkgs.', 34.8, 14, 0, 0, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (73, N'Röd Kaviar', 17, 8, N'24 - 150 g jars', 15, 101, 0, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (74, N'Longlife Tofu', 4, 7, N'5 kg pkg.', 10, 4, 20, 5, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (75, N'Rhönbräu Klosterbier', 12, 1, N'24 - 0.5 l bottles', 7.75, 125, 0, 25, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (76, N'Lakkalikööri', 23, 1, N'500 ml', 18, 57, 0, 20, 0)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [quantity_per_unit], [unit_price], [units_in_stock], [units_on_order], [reorder_level], [discontinued]) VALUES (77, N'Original Frankfurter grüne Soße', 12, 2, N'12 boxes', 13, 32, 0, 15, 0)
GO
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (1, N'Exotic Liquids', N'Charlotte Cooper', N'Purchasing Manager', N'49 Gilbert St.', N'London', NULL, N'EC1 4SD', N'UK', N'(171) 555-2222', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (2, N'New Orleans Cajun Delights', N'Shelley Burke', N'Order Administrator', N'P.O. Box 78934', N'New Orleans', N'LA', N'70117', N'USA', N'(100) 555-4822', NULL, N'#CAJUN.HTM#')
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (3, N'Grandma Kelly''s Homestead', N'Regina Murphy', N'Sales Representative', N'707 Oxford Rd.', N'Ann Arbor', N'MI', N'48104', N'USA', N'(313) 555-5735', N'(313) 555-3349', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (4, N'Tokyo Traders', N'Yoshi Nagase', N'Marketing Manager', N'9-8 Sekimai Musashino-shi', N'Tokyo', NULL, N'100', N'Japan', N'(03) 3555-5011', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (5, N'Cooperativa de Quesos ''Las Cabras''', N'Antonio del Valle Saavedra', N'Export Administrator', N'Calle del Rosal 4', N'Oviedo', N'Asturias', N'33007', N'Spain', N'(98) 598 76 54', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (6, N'Mayumi''s', N'Mayumi Ohno', N'Marketing Representative', N'92 Setsuko Chuo-ku', N'Osaka', NULL, N'545', N'Japan', N'(06) 431-7877', NULL, N'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#')
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (7, N'Pavlova, Ltd.', N'Ian Devling', N'Marketing Manager', N'74 Rose St. Moonie Ponds', N'Melbourne', N'Victoria', N'3058', N'Australia', N'(03) 444-2343', N'(03) 444-6588', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (8, N'Specialty Biscuits, Ltd.', N'Peter Wilson', N'Sales Representative', N'29 King''s Way', N'Manchester', NULL, N'M14 GSD', N'UK', N'(161) 555-4448', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (9, N'PB Knäckebröd AB', N'Lars Peterson', N'Sales Agent', N'Kaloadagatan 13', N'Göteborg', NULL, N'S-345 67', N'Sweden', N'031-987 65 43', N'031-987 65 91', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (10, N'Refrescos Americanas LTDA', N'Carlos Diaz', N'Marketing Manager', N'Av. das Americanas 12.890', N'Sao Paulo', NULL, N'5442', N'Brazil', N'(11) 555 4640', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (11, N'Heli Süßwaren GmbH & Co. KG', N'Petra Winkler', N'Sales Manager', N'Tiergartenstraße 5', N'Berlin', NULL, N'10785', N'Germany', N'(010) 9984510', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (12, N'Plutzer Lebensmittelgroßmärkte AG', N'Martin Bein', N'International Marketing Mgr.', N'Bogenallee 51', N'Frankfurt', NULL, N'60439', N'Germany', N'(069) 992755', NULL, N'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#')
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (13, N'Nord-Ost-Fisch Handelsgesellschaft mbH', N'Sven Petersen', N'Coordinator Foreign Markets', N'Frahmredder 112a', N'Cuxhaven', NULL, N'27478', N'Germany', N'(04721) 8713', N'(04721) 8714', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (14, N'Formaggi Fortini s.r.l.', N'Elio Rossi', N'Sales Representative', N'Viale Dante, 75', N'Ravenna', NULL, N'48100', N'Italy', N'(0544) 60323', N'(0544) 60603', N'#FORMAGGI.HTM#')
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (15, N'Norske Meierier', N'Beate Vileid', N'Marketing Manager', N'Hatlevegen 5', N'Sandvika', NULL, N'1320', N'Norway', N'(0)2-953010', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (16, N'Bigfoot Breweries', N'Cheryl Saylor', N'Regional Account Rep.', N'3400 - 8th Avenue Suite 210', N'Bend', N'OR', N'97101', N'USA', N'(503) 555-9931', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (17, N'Svensk Sjöföda AB', N'Michael Björn', N'Sales Representative', N'Brovallavägen 231', N'Stockholm', NULL, N'S-123 45', N'Sweden', N'08-123 45 67', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (18, N'Aux joyeux ecclésiastiques', N'Guylène Nodier', N'Sales Manager', N'203, Rue des Francs-Bourgeois', N'Paris', NULL, N'75004', N'France', N'(1) 03.83.00.68', N'(1) 03.83.00.62', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (19, N'New England Seafood Cannery', N'Robb Merchant', N'Wholesale Account Agent', N'Order Processing Dept. 2100 Paul Revere Blvd.', N'Boston', N'MA', N'02134', N'USA', N'(617) 555-3267', N'(617) 555-3389', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (20, N'Leka Trading', N'Chandra Leka', N'Owner', N'471 Serangoon Loop, Suite #402', N'Singapore', NULL, N'0512', N'Singapore', N'555-8787', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (21, N'Lyngbysild', N'Niels Petersen', N'Sales Manager', N'Lyngbysild Fiskebakken 10', N'Lyngby', NULL, N'2800', N'Denmark', N'43844108', N'43844115', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (22, N'Zaanse Snoepfabriek', N'Dirk Luchte', N'Accounting Manager', N'Verkoop Rijnweg 22', N'Zaandam', NULL, N'9999 ZZ', N'Netherlands', N'(12345) 1212', N'(12345) 1210', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (23, N'Karkki Oy', N'Anne Heikkonen', N'Product Manager', N'Valtakatu 12', N'Lappeenranta', NULL, N'53120', N'Finland', N'(953) 10956', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (24, N'G''day, Mate', N'Wendy Mackenzie', N'Sales Representative', N'170 Prince Edward Parade Hunter''s Hill', N'Sydney', N'NSW', N'2042', N'Australia', N'(02) 555-5914', N'(02) 555-4873', N'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#')
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (25, N'Ma Maison', N'Jean-Guy Lauzon', N'Marketing Manager', N'2960 Rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canada', N'(514) 555-9022', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (26, N'Pasta Buttini s.r.l.', N'Giovanni Giudici', N'Order Administrator', N'Via dei Gelsomini, 153', N'Salerno', NULL, N'84100', N'Italy', N'(089) 6547665', N'(089) 6547667', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (27, N'Escargots Nouveaux', N'Marie Delamare', N'Sales Manager', N'22, rue H. Voiron', N'Montceau', NULL, N'71300', N'France', N'85.57.00.07', NULL, NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (28, N'Gai pâturage', N'Eliane Noz', N'Sales Representative', N'Bat. B 3, rue des Alpes', N'Annecy', NULL, N'74000', N'France', N'38.76.98.06', N'38.76.98.58', NULL)
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (29, N'Forêts d''érables', N'Chantal Goulet', N'Accounting Manager', N'148 rue Chasseur', N'Ste-Hyacinthe', N'Québec', N'J2S 7S8', N'Canada', N'(514) 555-2955', N'(514) 555-2921', NULL)
GO
ALTER TABLE [dbo].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([smallint],(0))) FOR [TryCount]
GO
ALTER TABLE [dbo].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAbandoned]
GO
ALTER TABLE [dbo].[AbpBackgroundJobs] ADD  DEFAULT (CONVERT([tinyint],(15))) FOR [Priority]
GO
ALTER TABLE [dbo].[AbpOrganizationUnits] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AbpTenants] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsExternal]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[AbpUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AbpAuditLogActions]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId] FOREIGN KEY([AuditLogId])
REFERENCES [dbo].[AbpAuditLogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpAuditLogActions] CHECK CONSTRAINT [FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId]
GO
ALTER TABLE [dbo].[AbpEntityChanges]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpEntityChanges_AbpAuditLogs_AuditLogId] FOREIGN KEY([AuditLogId])
REFERENCES [dbo].[AbpAuditLogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityChanges] CHECK CONSTRAINT [FK_AbpEntityChanges_AbpAuditLogs_AuditLogId]
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId] FOREIGN KEY([EntityChangeId])
REFERENCES [dbo].[AbpEntityChanges] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges] CHECK CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUnitId] FOREIGN KEY([OrganizationUnitId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles] CHECK CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUnitId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpOrganizationUnitRoles] CHECK CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
GO
ALTER TABLE [dbo].[AbpOrganizationUnits] CHECK CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId]
GO
ALTER TABLE [dbo].[AbpRoleClaims]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpRoleClaims] CHECK CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpTenantConnectionStrings]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpTenantConnectionStrings_AbpTenants_TenantId] FOREIGN KEY([TenantId])
REFERENCES [dbo].[AbpTenants] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpTenantConnectionStrings] CHECK CONSTRAINT [FK_AbpTenantConnectionStrings_AbpTenants_TenantId]
GO
ALTER TABLE [dbo].[AbpUserClaims]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserClaims] CHECK CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserLogins]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserLogins] CHECK CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUnitId] FOREIGN KEY([OrganizationUnitId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits] CHECK CONSTRAINT [FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUnitId]
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserOrganizationUnits_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserOrganizationUnits] CHECK CONSTRAINT [FK_AbpUserOrganizationUnits_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserRoles_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserRoles] CHECK CONSTRAINT [FK_AbpUserRoles_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserRoles] CHECK CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserTokens]  WITH NOCHECK ADD  CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserTokens] CHECK CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([supplier_id])
GO
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE   PROCEDURE [dbo].[AddNewCategory]  
      @CategoryName VARCHAR(100),
      @Description VARCHAR(Max),
	  @Picture VARCHAR(MAx)
  AS
    DECLARE @ReturnResult UNIQUEIDENTIFIER
    BEGIN
      BEGIN TRY
        BEGIN TRANSACTION
        BEGIN
          SET @ReturnResult = CAST(0x0 AS UNIQUEIDENTIFIER)
 

     INSERT INTO categories ([category_id],[category_name],[description],[picture])
	               VALUES(50,@CategoryName,@Description,@Picture)

        END
        IF @@TRANCOUNT > 0
          SET @ReturnResult = NEWID()

        COMMIT TRANSACTION
      END TRY

      BEGIN CATCH
        IF @@TRANCOUNT > 0
          SET @ReturnResult = CAST(0x0 AS UNIQUEIDENTIFIER)

        ROLLBACK TRANSACTION

        DECLARE @ErrMsg NVARCHAR(4000)
               ,@ErrSeverity INT

        SELECT
          @ErrMsg = ERROR_MESSAGE()
         ,@ErrSeverity = ERROR_SEVERITY()

        RAISERROR (@ErrMsg, @ErrSeverity, 1)
      END CATCH
    END
    SELECT
      @ReturnResult 
GO
/****** Object:  StoredProcedure [dbo].[GetAllCatagories]    Script Date: 2023/03/31 16:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCatagories]
AS
BEGIN
SELECT [category_id] as CategoryId
      ,[category_name] as CategoryName
      ,[description] as [Description]
      ,[picture] as Picture
  FROM [Rolled_ProductDb].[dbo].[categories]
END
GO
USE [master]
GO
ALTER DATABASE [Rolled_ProductDb] SET  READ_WRITE 
GO
