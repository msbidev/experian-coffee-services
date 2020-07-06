USE [ExperianCoffee]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Quality_Measures]') AND type in (N'U'))
drop table  [Quality_Measures]


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Certifier]') AND type in (N'U'))
	drop TABLE [Certifier];

CREATE TABLE [dbo].[Certifier](
	[Certifier_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ceritfied_By] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Contact_Name] [nvarchar](255) NULL,
	[Contact_Number] [nvarchar](50) NULL,
 CONSTRAINT [PK_Certifier] PRIMARY KEY CLUSTERED 
(
	[Certifier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Product]') AND type in (N'U'))
	drop TABLE [Product];

CREATE TABLE [dbo].[Product](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Location]') AND type in (N'U'))
DROP TABLE [Location];
CREATE TABLE [dbo].[Location](
	[Location_id] [int] IDENTITY(1,1) NOT NULL,
	[Country_name] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Altitude_low] [nvarchar](255) NULL,
	[Altitude_High] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Customer]') AND type in (N'U'))
	drop table [Customer];

CREATE TABLE [dbo].[Customer](
	[Customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NULL,
	[Owner] [nvarchar](255) NULL,
	[Farm_Name] [nvarchar](255) NULL,
	[Mill] [nvarchar](255) NULL,
	[Processing_method] [nvarchar](50) NULL,
	[partner] [nvarchar](255) NULL,
	[Harvest_year] [nvarchar](255) NULL,
	[No_of_Bags] [nvarchar](255) NULL,
	[Bag_weight] [nvarchar](255) NULL,
	[Variety] [nvarchar](255) NULL,
	[Lot_number] [nvarchar](255) NULL,
	[ICO_Number] [nvarchar](255) NULL,
	[Color] [nvarchar](50) NULL,
	[Categoryone_defects] [int] NULL,
	[Categorytwo_Defects] [int] NULL,
	[Moisture] [float] NULL,
	[expiration_date] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Time_dim]') AND type in (N'U'))
	DROP  TABLE Time_dim

CREATE TABLE [dbo].[Time_dim](
	[time_id] [int] IDENTITY(1,1) NOT NULL,
	[Grading_Date] [nvarchar](255) NULL,
 CONSTRAINT [PK_Time_dim] PRIMARY KEY CLUSTERED 
(
	[time_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Quality_Measures]') AND type in (N'U'))
drop table  [Quality_Measures]

CREATE TABLE [dbo].[Quality_Measures](
	[Product_id] [int] NULL,
	[Location_id] [int] NULL,
	[Customer_id] [int] NULL,
	[Certifier_id] [int] NULL,
	[Time_id] [int] NULL,
	[Aroma] [float] NULL,
	[Flavor] [float] NULL,
	[Aftertaste] [float] NULL,
	[Acidity] [float] NULL,
	[Body] [float] NULL,
	[Balance] [float] NULL,
	[Uniformity] [float] NULL,
	[CleanCup] [float] NULL,
	[Sweetness] [float] NULL,
	[CuppePoints] [float] NULL,
	[TotalCupPoints] [float] NULL
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[Quality_Measures]  WITH CHECK ADD  CONSTRAINT [fk_Quality_Measures_Certifier] FOREIGN KEY([Certifier_id])
REFERENCES [dbo].[Certifier] ([Certifier_Id])
GO

ALTER TABLE [dbo].[Quality_Measures] CHECK CONSTRAINT [fk_Quality_Measures_Certifier]
GO

ALTER TABLE [dbo].[Quality_Measures]  WITH CHECK ADD  CONSTRAINT [fk_Quality_Measures_Customer] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Customer_id])
GO

ALTER TABLE [dbo].[Quality_Measures] CHECK CONSTRAINT [fk_Quality_Measures_Customer]
GO

ALTER TABLE [dbo].[Quality_Measures]  WITH CHECK ADD  CONSTRAINT [fk_Quality_Measures_Location] FOREIGN KEY([Location_id])
REFERENCES [dbo].[Location] ([Location_id])
GO

ALTER TABLE [dbo].[Quality_Measures] CHECK CONSTRAINT [fk_Quality_Measures_Location]
GO

ALTER TABLE [dbo].[Quality_Measures]  WITH CHECK ADD  CONSTRAINT [fk_Quality_Measures_Product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Product] ([Product_id])
GO

ALTER TABLE [dbo].[Quality_Measures] CHECK CONSTRAINT [fk_Quality_Measures_Product]
GO

ALTER TABLE [dbo].[Quality_Measures]  WITH CHECK ADD  CONSTRAINT [fk_Quality_Measures_Time_dim] FOREIGN KEY([Time_id])
REFERENCES [dbo].[Time_dim] ([time_id])
GO

ALTER TABLE [dbo].[Quality_Measures] CHECK CONSTRAINT [fk_Quality_Measures_Time_dim]
GO

