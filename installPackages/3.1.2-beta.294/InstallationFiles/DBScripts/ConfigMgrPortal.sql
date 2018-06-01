USE [master]
GO

/****** Object:  Database [%CMPortalDatabaseName%]    Script Date: 6/10/2014 5:12:59 PM ******/

IF not EXISTS (SELECT name 
FROM master.dbo.sysdatabases 
WHERE (name = '%CMPortalDatabaseName%'))
Begin
	CREATE DATABASE [%CMPortalDatabaseName%] %SQLCustomCreationOptions%
End
GO
/****** Object:  Database [%CMPortalDatabaseName%]    Script Date: 6/13/2014 8:25:17 PM ******/
ALTER DATABASE [%CMPortalDatabaseName%] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

DECLARE @SQLVer nvarchar(250) = LEFT(CONVERT(nvarchar(250),(SERVERPROPERTY('ProductVersion'))),2) + '0'
SET @SQLVer = 'ALTER DATABASE %CMPortalDatabaseName% SET COMPATIBILITY_LEVEL = ' + @SQLVer
EXEC sp_executesql @SQLVer
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [%CMPortalDatabaseName%].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET ARITHABORT OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET DISABLE_BROKER 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET MULTI_USER 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET DB_CHAINING OFF 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET RECOVERY SIMPLE
GO

ALTER DATABASE [%CMPortalDatabaseName%]
	MODIFY FILE 
	( 
		NAME = N'%CMPortalDatabaseName%', 
		SIZE = 100MB,
		FILEGROWTH = 100MB 
	)
GO

ALTER DATABASE [%CMPortalDatabaseName%]
	MODIFY FILE
	(
		NAME = N'%CMPortalDatabaseName%_log', 
		SIZE = 100MB,
		FILEGROWTH = 100MB 
	)
GO

EXEC sys.sp_db_vardecimal_storage_format N'%CMPortalDatabaseName%', N'ON'
GO
USE [%CMPortalDatabaseName%]
GO


USE [master]
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET  READ_WRITE 
GO
ALTER DATABASE [%CMPortalDatabaseName%] SET  MULTI_USER
GO