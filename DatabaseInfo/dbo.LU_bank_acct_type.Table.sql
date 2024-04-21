USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_bank_acct_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_bank_acct_type](
	[bank_acct_type_id] [tinyint] NOT NULL,
	[bank_acct_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK__LU_bank___E83BD10F6A03605D] PRIMARY KEY CLUSTERED 
(
	[bank_acct_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LU_bank_acct_type] ([bank_acct_type_id], [bank_acct_type]) VALUES (1, N'Checking')
INSERT [dbo].[LU_bank_acct_type] ([bank_acct_type_id], [bank_acct_type]) VALUES (2, N'Savings')
GO
