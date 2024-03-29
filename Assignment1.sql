USE [master]
GO
/****** Object:  Database [BikeSStore]    Script Date: 18-10-2019 09:19:17 ******/
CREATE DATABASE [BikeSStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeSStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BikeSStore.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BikeSStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BikeSStore_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BikeSStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeSStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeSStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeSStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeSStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeSStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeSStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeSStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeSStore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BikeSStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeSStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeSStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeSStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeSStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeSStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeSStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeSStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeSStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BikeSStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeSStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeSStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeSStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeSStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeSStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeSStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeSStore] SET RECOVERY FULL 
GO
ALTER DATABASE [BikeSStore] SET  MULTI_USER 
GO
ALTER DATABASE [BikeSStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeSStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeSStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeSStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BikeSStore]
GO
/****** Object:  Schema [Production]    Script Date: 18-10-2019 09:19:17 ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Sales]    Script Date: 18-10-2019 09:19:17 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [Production].[brands]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[brands](
	[brand_id] [int] NOT NULL,
	[brand_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Production].[categories]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[categories](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Production].[products]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](20) NULL,
	[brand_id] [int] NULL,
	[category_id] [int] NULL,
	[model_year] [date] NULL,
	[list_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Production].[stock]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[stock](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [pk_stock] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[customers]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[customers](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](20) NULL,
	[phone] [int] NULL,
	[email] [varchar](30) NULL,
	[street] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[State] [varchar](20) NULL,
	[zip_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[order_items]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[list_price] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [pk_order_item] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Sales].[orders]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[orders](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [varchar](20) NULL,
	[order_date] [date] NULL,
	[required_date] [date] NULL,
	[ship_day] [date] NULL,
	[store_id] [int] NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[staffs]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[staffs](
	[staff_id] [int] NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](20) NULL,
	[phone] [int] NULL,
	[email] [varchar](30) NULL,
	[active] [varchar](20) NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[store]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[store](
	[store_id] [int] NOT NULL,
	[store_name] [varchar](20) NULL,
	[phone] [int] NULL,
	[email] [varchar](30) NULL,
	[street] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[State_] [varchar](20) NULL,
	[zip_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Sales].[stores]    Script Date: 18-10-2019 09:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[stores](
	[store_id] [int] NOT NULL,
	[store_name] [varchar](20) NULL,
	[phone] [int] NULL,
	[email] [varchar](30) NULL,
	[street] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[State_] [varchar](20) NULL,
	[zip_code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Production].[products]  WITH CHECK ADD  CONSTRAINT [fk_brand] FOREIGN KEY([brand_id])
REFERENCES [Production].[brands] ([brand_id])
GO
ALTER TABLE [Production].[products] CHECK CONSTRAINT [fk_brand]
GO
ALTER TABLE [Production].[products]  WITH CHECK ADD  CONSTRAINT [fk_categories] FOREIGN KEY([category_id])
REFERENCES [Production].[categories] ([category_id])
GO
ALTER TABLE [Production].[products] CHECK CONSTRAINT [fk_categories]
GO
ALTER TABLE [Production].[stock]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([product_id])
REFERENCES [Production].[products] ([product_id])
GO
ALTER TABLE [Production].[stock] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [Production].[stock]  WITH CHECK ADD  CONSTRAINT [fk_store] FOREIGN KEY([store_id])
REFERENCES [Sales].[stores] ([store_id])
GO
ALTER TABLE [Production].[stock] CHECK CONSTRAINT [fk_store]
GO
ALTER TABLE [Sales].[order_items]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([order_id])
REFERENCES [Sales].[orders] ([order_id])
GO
ALTER TABLE [Sales].[order_items] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [Sales].[order_items]  WITH CHECK ADD  CONSTRAINT [fk_productions] FOREIGN KEY([product_id])
REFERENCES [Production].[products] ([product_id])
GO
ALTER TABLE [Sales].[order_items] CHECK CONSTRAINT [fk_productions]
GO
ALTER TABLE [Sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_cust] FOREIGN KEY([customer_id])
REFERENCES [Sales].[customers] ([customer_id])
GO
ALTER TABLE [Sales].[orders] CHECK CONSTRAINT [fk_cust]
GO
ALTER TABLE [Sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_staff] FOREIGN KEY([staff_id])
REFERENCES [Sales].[staffs] ([staff_id])
GO
ALTER TABLE [Sales].[orders] CHECK CONSTRAINT [fk_staff]
GO
ALTER TABLE [Sales].[orders]  WITH CHECK ADD  CONSTRAINT [fk_store] FOREIGN KEY([store_id])
REFERENCES [Sales].[stores] ([store_id])
GO
ALTER TABLE [Sales].[orders] CHECK CONSTRAINT [fk_store]
GO
ALTER TABLE [Sales].[order_items]  WITH CHECK ADD CHECK  (([list_price]>(0)))
GO
ALTER TABLE [Sales].[order_items]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
USE [master]
GO
ALTER DATABASE [BikeSStore] SET  READ_WRITE 
GO
