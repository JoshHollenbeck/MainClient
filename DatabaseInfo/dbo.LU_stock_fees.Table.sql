USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_stock_fees]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_stock_fees](
	[stock_fee_id] [tinyint] NOT NULL,
	[stock_type_id] [tinyint] NULL,
	[fee_amt] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_LU_stock_fees] PRIMARY KEY CLUSTERED 
(
	[stock_fee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (1, NULL, CAST(0.0000 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (2, 1, CAST(25.0000 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (3, 2, CAST(26.6500 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (4, 3, CAST(31.9500 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (5, 4, CAST(25.0000 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (6, 5, CAST(2.2500 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (7, 6, CAST(0.0000 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (8, 7, CAST(31.9500 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (9, 8, CAST(75.0000 AS Decimal(18, 4)))
INSERT [dbo].[LU_stock_fees] ([stock_fee_id], [stock_type_id], [fee_amt]) VALUES (10, 9, CAST(25.0000 AS Decimal(18, 4)))
GO
ALTER TABLE [dbo].[LU_stock_fees]  WITH CHECK ADD  CONSTRAINT [FK_LU_stock_fees_LU_stock_type] FOREIGN KEY([stock_type_id])
REFERENCES [dbo].[LU_stock_type] ([stock_type_id])
GO
ALTER TABLE [dbo].[LU_stock_fees] CHECK CONSTRAINT [FK_LU_stock_fees_LU_stock_type]
GO
