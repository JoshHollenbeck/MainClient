USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_acct_activity]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_activity](
	[acct_activity_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[activity_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_acct_activity] PRIMARY KEY CLUSTERED 
(
	[acct_activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_acct_activity] ON 

INSERT [dbo].[LU_acct_activity] ([acct_activity_id], [activity_type]) VALUES (1, N'Less than Five')
INSERT [dbo].[LU_acct_activity] ([acct_activity_id], [activity_type]) VALUES (2, N'Five to Ten')
INSERT [dbo].[LU_acct_activity] ([acct_activity_id], [activity_type]) VALUES (3, N'Eleven to Twenty')
INSERT [dbo].[LU_acct_activity] ([acct_activity_id], [activity_type]) VALUES (4, N'More than Twenty')
SET IDENTITY_INSERT [dbo].[LU_acct_activity] OFF
GO
