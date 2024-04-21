USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_stock_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_stock_type](
	[stock_type_id] [tinyint] NOT NULL,
	[stock_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LU_stock_type] PRIMARY KEY CLUSTERED 
(
	[stock_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (7, N'Canadian')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (6, N'CD')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (8, N'Foreign')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (5, N'Future')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (4, N'Mutual Fund')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (2, N'Options')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (3, N'OTC')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (1, N'Stock/ETF')
INSERT [dbo].[LU_stock_type] ([stock_type_id], [stock_type]) VALUES (9, N'Treasury')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_LU_stock_type]    Script Date: 4/21/2024 5:25:43 PM ******/
ALTER TABLE [dbo].[LU_stock_type] ADD  CONSTRAINT [UK_LU_stock_type] UNIQUE NONCLUSTERED 
(
	[stock_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
