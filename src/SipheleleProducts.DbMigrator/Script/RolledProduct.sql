USE [master]
GO
/****** Object:  Database [Rolled_ProductDb]    Script Date: 2023/04/07 16:05:02 ******/
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
/****** Object:  Table [dbo].[AbpAuditLogActions]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpAuditLogs]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpBackgroundJobs]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpClaimTypes]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpEntityChanges]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpEntityPropertyChanges]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpFeatureValues]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpLinkUsers]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpOrganizationUnitRoles]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpOrganizationUnits]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpPermissionGrants]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpRoleClaims]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpRoles]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpSecurityLogs]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpSettings]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpTenantConnectionStrings]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpTenants]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpUserClaims]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpUserLogins]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpUserOrganizationUnits]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpUserRoles]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpUsers]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[AbpUserTokens]    Script Date: 2023/04/07 16:05:03 ******/
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
/****** Object:  Table [dbo].[categories]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](250) NOT NULL,
	[description] [text] NULL,
	[picture] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](250) NOT NULL,
	[supplier_id] [smallint] NULL,
	[category_id] [smallint] NULL,
	[unit_price] [real] NULL,
	[units_in_stock] [smallint] NULL,
	[Picture] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [varchar](250) NOT NULL,
	[contact_name] [varchar](250) NULL,
	[contact_title] [varchar](250) NULL,
	[address] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[region] [varchar](100) NULL,
	[postal_code] [varchar](10) NULL,
	[country] [varchar](50) NULL,
	[phone] [varchar](10) NULL,
	[fax] [varchar](10) NULL,
	[homepage] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (4, N'My Category', N'dfgf rfr frfr frf  f fwe', N'/Images/Screenshot 2023-03-28 144206.png')
INSERT [dbo].[categories] ([category_id], [category_name], [description], [picture]) VALUES (6, N'Iphone ', N'vughchcgch', N'/Images/Screenshot 2023-03-28 144158.png')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [unit_price], [units_in_stock], [Picture]) VALUES (1, N'ASUS', 2, 2, 1, 1, NULL)
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [unit_price], [units_in_stock], [Picture]) VALUES (3, N'New Bug', 2, 3, 33, 1, N'/Images/Screenshot 2023-04-03 160535.png')
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [unit_price], [units_in_stock], [Picture]) VALUES (4, N'Siphelele', 1, 3, 1, 9, N'/Images/Screenshot 2023-04-03 160535.png')
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [unit_price], [units_in_stock], [Picture]) VALUES (5, N'Desktop', 1, 4, 1, 9, N'/Images/Screenshot 2023-03-28 144206.png')
INSERT [dbo].[products] ([product_id], [product_name], [supplier_id], [category_id], [unit_price], [units_in_stock], [Picture]) VALUES (6, N'Desktop', 1, 6, 1, 50, N'/Images/Screenshot 2023-04-03 160535.png')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (1, N'DUT App factory in Cape Town', N'Siphelele Zulu', N'Software Deloper', N'24 Winterton Walk, Berea, 4001', N'Durban', N'KwaZulu-Natal', N'4001', N'South Africa', N'0630970165', N'0630970165', N'www.dutappfactory.co.za')
INSERT [dbo].[suppliers] ([supplier_id], [company_name], [contact_name], [contact_title], [address], [city], [region], [postal_code], [country], [phone], [fax], [homepage]) VALUES (4, N'SigmaIT', N'None', N'Software Deloper', N'7 Ritson Rd, Musgrave, Berea, 4001', N'Durban', N'KwaZulu-Natal', N'4001', N'South Africa', N'0630970165', N'0630970165', N'www.SigmaItco.za')
SET IDENTITY_INSERT [dbo].[suppliers] OFF
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
/****** Object:  StoredProcedure [dbo].[AddNewCategory]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE   PROCEDURE [dbo].[AddNewCategory]  
      @CategoryName VARCHAR(100),
      @Description VARCHAR(Max),
	  @Picture VARCHAR(MAx)
  AS
      BEGIN

     INSERT INTO categories ([category_name],[description],[picture])
	               VALUES(@CategoryName,@Description,@Picture)
        END
GO
/****** Object:  StoredProcedure [dbo].[AddNewProduct]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewProduct]
@ProductName Varchar(250),
@SupplierId INT,
@CategoryId INT,
@UnitPrice real,
@UnitInStock  INT,
@ImagePath varchar(max)
  AS
    BEGIN

       INSERT INTO [dbo].[products]([product_name],[supplier_id],[category_id],[unit_price],[units_in_stock],[Picture])
	    Values(@ProductName,@SupplierId,@CategoryId,@UnitPrice,@UnitInStock,@ImagePath)
      END
      
         
GO
/****** Object:  StoredProcedure [dbo].[AddNewSupplier]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewSupplier] 
@CompanyName Varchar(50),
@ContactName Varchar(50),
@ContactTitle Varchar(50),
@Address Varchar(250),
@City Varchar(50),
@Region Varchar(50),
@Postalcode Varchar(50),
@Country Varchar(50),
@PhoneNumber Varchar(10),
@Fax Varchar(10),
@HomePage Varchar(max)

  AS
    DECLARE @ReturnResult varchar(20)
    BEGIN
      BEGIN TRY
        BEGIN TRANSACTION
        BEGIN
		     SET @ReturnResult = 'Fail'

INSERT INTO [dbo].[suppliers]([company_name],[contact_name],[contact_title],[address],[city],[region],[postal_code],[country],[phone],[fax],[homepage])
	    Values(@CompanyName,@ContactName,@ContactTitle,@Address,@City,@Region,@Postalcode,@Country,@PhoneNumber,@Fax,@HomePage)
        END
        IF @@TRANCOUNT > 0
          SET @ReturnResult = 'Success'

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
/****** Object:  StoredProcedure [dbo].[GetAllCatagories]    Script Date: 2023/04/07 16:05:03 ******/
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
      ,[picture] as ImagePath
  FROM [categories]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
  AS
     BEGIN

  Select p.product_id  as ProductId,
         p.product_name as ProductName,
		 c.category_name as CategoryName,
		 s.company_name as CompanyName,
		 p.unit_price as UnitPrice,
		 p.units_in_stock as UnitInStock,
		 p.category_id as CategoryId,
		 s.supplier_id as SupplierId,
		 p.Picture as ImagePath

  from products as p
  Inner join categories as c
  on c.category_id =p.category_id
  Inner Join suppliers as s
  on s.supplier_id = p.supplier_id
  END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSuppliers]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[GetAllSuppliers]
AS
BEGIN
SELECT [supplier_id] as SupplierId
      ,[company_name] as CompanyName
      ,[contact_name] as ContactName
      ,[contact_title] as ContactTitle
      ,[address] as [Address]
      ,[city] as City
      ,[region] as Region
      ,[postal_code] as PostalCode
      ,[country] as Country
      ,[phone]as PhoneNumber
      ,[fax] as Fax
      ,[homepage] as HomePage
  FROM [Rolled_ProductDb].[dbo].[suppliers]
  END
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryDetaislByCategoryById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategoryDetaislByCategoryById]
@CategoryId INT
AS
BEGIN
SELECT [category_id] as CategoryId
      ,[category_name] as CategoryName
      ,[description] as [Description]
      ,[picture] as ImagePath
  FROM [dbo].[categories]
  where category_id = @CategoryId
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductDetailsById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductDetailsById]
  @ProductId INT
  AS
     BEGIN

  Select p.product_id  as ProductId,
         p.product_name as ProductName,
		 c.category_name as CategoryName,
		 s.company_name as CompanyName,
		 p.unit_price as UnitPrice,
		 p.units_in_stock as UnitInStock,
		 p.category_id as CategoryId,
		 s.supplier_id as SupplierId,
		  p.Picture as ImagePath

  from products as p
  Inner join categories as c
  on c.category_id =p.category_id
  Inner Join suppliers as s
  on s.supplier_id = p.supplier_id
  where p.product_id = @ProductId
  END



 
GO
/****** Object:  StoredProcedure [dbo].[GetSupplierDetailsById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[GetSupplierDetailsById]
   @SupplierId INT
AS
BEGIN
SELECT [supplier_id] as SupplierId
      ,[company_name] as CompanyName
      ,[contact_name] as ContactName
      ,[contact_title] as ContactTitle
      ,[address] as [Address]
      ,[city] as City
      ,[region] as Region
      ,[postal_code] as PostalCode
      ,[country] as Country
      ,[phone]as PhoneNumber
      ,[fax] as Fax
      ,[homepage] as HomePage
  FROM [dbo].[suppliers]
  WHERE supplier_id =  @SupplierId
  END
GO
/****** Object:  StoredProcedure [dbo].[RemoveCategoryById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveCategoryById]
@CategoryId INT
 

  AS
    DECLARE @ReturnResult varchar(20)
    BEGIN
      BEGIN TRY
        BEGIN TRANSACTION
        BEGIN
		     SET @ReturnResult = 'Fail'


	  Delete [dbo].[categories]
	  WHERE [category_id] = @CategoryId
    
        END
        IF @@TRANCOUNT > 0
          SET @ReturnResult = 'Success'

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
/****** Object:  StoredProcedure [dbo].[RemoveProductById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveProductById]
@ProductId INT
 

  AS
    DECLARE @ReturnResult varchar(20)
    BEGIN
      BEGIN TRY
        BEGIN TRANSACTION
        BEGIN
		     SET @ReturnResult = 'Fail'


	  Delete [dbo].[products]
	  WHERE [product_id] = @ProductId
    
        END
        IF @@TRANCOUNT > 0
          SET @ReturnResult = 'Success'

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
/****** Object:  StoredProcedure [dbo].[RemoveSupplierById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveSupplierById]
@SupplierId INT

  AS
    DECLARE @ReturnResult varchar(20)
    BEGIN
      BEGIN TRY
        BEGIN TRANSACTION
        BEGIN
		     SET @ReturnResult = 'Fail'

Delete [dbo].[suppliers]
	  Where [supplier_id]  = @SupplierId
        END
        IF @@TRANCOUNT > 0
          SET @ReturnResult = 'Success'

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
/****** Object:  StoredProcedure [dbo].[UpdateCategoryById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE   PROCEDURE [dbo].[UpdateCategoryById]  
      @CategoryId INT,
	  @CategoryName VARCHAR(100),
      @Description VARCHAR(Max),
	  @Picture VARCHAR(MAx)

  AS
      BEGIN
     Update categories 
	       SET [category_name] =@CategoryName,
	           [description] =@Description,
			   [picture] = @Picture
			   Where [category_id] = @CategoryId
        END
 
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductById]
@ProductId INT,
@ProductName Varchar(250),
@SupplierId INT,
@CategoryId INT,
@UnitPrice real,
@UnitInStock INT,
@ImagePath varchar(max)
  AS
    BEGIN
	 Update [dbo].[products]
	   SET [product_name] =@ProductName
      ,[supplier_id] = @SupplierId
      ,[category_id] =@CategoryId
      ,[unit_price] =@UnitPrice
      ,[units_in_stock] =@UnitInStock
	  ,[Picture] =@ImagePath
	  WHERE [product_id] = @ProductId
    END
     
GO
/****** Object:  StoredProcedure [dbo].[UpdateSupplierById]    Script Date: 2023/04/07 16:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSupplierById]
@SupplyerId INT,
@CompanyName Varchar(250),
@ContactName Varchar(250),
@ContactTitle Varchar(250),
@Address Varchar(250),
@City Varchar(250),
@Region Varchar(250),
@Postalcode Varchar(250),
@Country Varchar(250),
@PhoneNumber Varchar(10),
@Fax Varchar(10),
@HomePage Varchar(max)
  AS
 
        BEGIN
	 

Update [dbo].[suppliers]
      Set 
      [company_name] =@CompanyName
      ,[contact_name] = @ContactName
      ,[contact_title] =@ContactTitle
      ,[address] =@Address
      ,[city] =@City
      ,[region] =@Region
      ,[postal_code] = @Postalcode
      ,[country] =@Country
      ,[phone]=@PhoneNumber
      ,[fax] = @Fax
      ,[homepage] =@HomePage
	  Where [supplier_id]  = @SupplyerId
   END
       
GO
USE [master]
GO
ALTER DATABASE [Rolled_ProductDb] SET  READ_WRITE 
GO
