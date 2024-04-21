USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_acct_funding]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_funding](
	[acct_funding_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[funding_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LU_acct_funding] PRIMARY KEY CLUSTERED 
(
	[acct_funding_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_acct_funding] ON 

INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (1, N'Salary / Wages / Savings')
INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (2, N'Social Security Benefits')
INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (3, N'Sale of Property or Business')
INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (4, N'Family / Relatives / Inheritence')
INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (5, N'Investment Capital Gains')
INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (6, N'Gifts')
INSERT [dbo].[LU_acct_funding] ([acct_funding_id], [funding_type]) VALUES (7, N'Gambling / Lottery')
SET IDENTITY_INSERT [dbo].[LU_acct_funding] OFF
GO
