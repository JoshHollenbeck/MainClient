USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_stock_exchange]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_stock_exchange](
	[stock_exchange_id] [smallint] IDENTITY(1,1) NOT NULL,
	[exchange_name] [varchar](50) NOT NULL,
	[exchange_abbr] [varchar](50) NOT NULL,
	[exchange_currency] [smallint] NOT NULL,
 CONSTRAINT [PK_LU_stock_exchange] PRIMARY KEY CLUSTERED 
(
	[stock_exchange_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_stock_exchange] ON 

INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (1, N'Nasdaq', N'NASDAQ', 143)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (2, N'New York Stock Exchange', N'NYSE', 143)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (3, N'NYSE American', N'NYSE American', 143)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (5, N'Toronto Stock Exchange', N'TSX', 27)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (6, N'London Stock Exchange', N'LON', 47)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (7, N'Australian Securities Exchange', N'ASX', 9)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (8, N'European New Exchange Technology', N'Euronext', 44)
INSERT [dbo].[LU_stock_exchange] ([stock_exchange_id], [exchange_name], [exchange_abbr], [exchange_currency]) VALUES (9, N'Hong Kong Stock Exchange', N'HK', 55)
SET IDENTITY_INSERT [dbo].[LU_stock_exchange] OFF
GO
