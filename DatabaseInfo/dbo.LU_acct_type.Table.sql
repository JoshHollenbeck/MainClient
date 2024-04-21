USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_acct_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_type](
	[acct_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[acct_type] [varchar](75) NOT NULL,
	[acct_type_abbr] [varchar](10) NOT NULL,
 CONSTRAINT [PK_LU_acct_type] PRIMARY KEY CLUSTERED 
(
	[acct_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_acct_type] ON 

INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (1, N'IRA Custodial Roth', N'IRA-CH')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (2, N'Contributory IRA', N'IRA-CO')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (3, N'Education Savings', N'IRA-ED')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (4, N'Roth IRA', N'IRA-RH')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (5, N'Rollover IRA', N'IRA-RO')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (6, N'Roth Conversion IRA', N'IRA-RV')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (7, N'Simplified Employee Pension IRA', N'IRA-SEP')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (8, N'Bank One Community Property', N'B1-CP')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (9, N'Bank One Custodial', N'B1-CU')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (10, N'Bank One Individual', N'B1-IND')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (11, N'Bank One Joint Tenants with Rights of Survivorship', N'B1-JT')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (12, N'Bank One Living Trust', N'B1-LT')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (13, N'Bank One Pension Trust', N'B1-PT')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (14, N'Bank One Tenants in Common', N'B1-TC')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (15, N'Bank One Testamentary Trust', N'B1-TT')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (16, N'Bank Investor Checking', N'B2-IC')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (17, N'Bank Joint Checking', N'B2-JC')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (18, N'Bank Investor Savings', N'B2-IS')
INSERT [dbo].[LU_acct_type] ([acct_type_id], [acct_type], [acct_type_abbr]) VALUES (19, N'Bank Joint Savings', N'B2-JS')
SET IDENTITY_INSERT [dbo].[LU_acct_type] OFF
GO
