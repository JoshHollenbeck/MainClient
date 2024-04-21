USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_transaction_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_transaction_type](
	[transaction_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[transaction_type] [varchar](25) NOT NULL,
	[transaction_abbr] [varchar](6) NOT NULL,
 CONSTRAINT [PK_LU_transaction_type] PRIMARY KEY CLUSTERED 
(
	[transaction_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_transaction_type] ON 

INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (1, N'Cash Deposit', N'CASH-D')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (2, N'Cash Withdrawal', N'CASH-W')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (3, N'Buy Security', N'BUY')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (4, N'Sell Security', N'SELL')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (5, N'Check Transaction', N'CHCK')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (6, N'Debit Card Transaction', N'DEBIT')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (7, N'Credit Card Transaction', N'CREDT')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (8, N'Journal Deposit', N'JRNL-D')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (9, N'Interest Earned', N'INTE')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (10, N'ACH Withdrawal', N'ACH-W')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (11, N'Wire Withdrawal', N'WIRE-W')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (12, N'Check Deposit', N'CHCK-D')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (13, N'ATM Withdrawal', N'ATM-W')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (14, N'Fee', N'FEE')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (15, N'Dividend', N'DIVD')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (16, N'Adjustment', N'ADJST')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (17, N'Refund', N'RFND')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (18, N'ACH Deposit', N'ACH-D')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (19, N'Wire Deposit', N'WIRE-D')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (20, N'ATM Deposit', N'ATM-D')
INSERT [dbo].[LU_transaction_type] ([transaction_type_id], [transaction_type], [transaction_abbr]) VALUES (21, N'Journal Withdrawal', N'JRNL-W')
SET IDENTITY_INSERT [dbo].[LU_transaction_type] OFF
GO
