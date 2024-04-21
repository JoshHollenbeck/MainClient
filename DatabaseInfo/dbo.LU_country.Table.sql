USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_country]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_country](
	[country_id] [smallint] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](60) NOT NULL,
	[can_open] [bit] NOT NULL,
	[calling_code] [varchar](25) NOT NULL,
	[iso3] [varchar](3) NOT NULL,
	[iso2] [varchar](2) NOT NULL,
	[currency_id] [smallint] NOT NULL,
 CONSTRAINT [PK_LU_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_country] ON 

INSERT [dbo].[LU_country] ([country_id], [country_name], [can_open], [calling_code], [iso3], [iso2], [currency_id]) VALUES (236, N'United States of America', 1, N'+1', N'USA', N'US', 143)
SET IDENTITY_INSERT [dbo].[LU_country] OFF
GO
ALTER TABLE [dbo].[LU_country]  WITH CHECK ADD  CONSTRAINT [FK_LU_country_LU_currency] FOREIGN KEY([currency_id])
REFERENCES [dbo].[LU_currency] ([currency_id])
GO
ALTER TABLE [dbo].[LU_country] CHECK CONSTRAINT [FK_LU_country_LU_currency]
GO
