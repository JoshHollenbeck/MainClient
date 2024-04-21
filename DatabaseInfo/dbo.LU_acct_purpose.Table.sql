USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_acct_purpose]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_purpose](
	[acct_purpose_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[purpose_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LU_acct_purpose] PRIMARY KEY CLUSTERED 
(
	[acct_purpose_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_acct_purpose] ON 

INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (1, N'General Investing')
INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (2, N'Investing for Estate Planning')
INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (3, N'Investing for College')
INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (4, N'Investment of Pooled Assets')
INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (5, N'Investment for Tax Planning')
INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (6, N'Investment for Retirement')
INSERT [dbo].[LU_acct_purpose] ([acct_purpose_id], [purpose_type]) VALUES (7, N'Other')
SET IDENTITY_INSERT [dbo].[LU_acct_purpose] OFF
GO
