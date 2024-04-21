USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_acct_objective]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_acct_objective](
	[acct_objective_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[objective_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_acct_objectives] PRIMARY KEY CLUSTERED 
(
	[acct_objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_acct_objective] ON 

INSERT [dbo].[LU_acct_objective] ([acct_objective_id], [objective_type]) VALUES (1, N'Capital Preservation')
INSERT [dbo].[LU_acct_objective] ([acct_objective_id], [objective_type]) VALUES (2, N'Growth')
INSERT [dbo].[LU_acct_objective] ([acct_objective_id], [objective_type]) VALUES (3, N'Income')
INSERT [dbo].[LU_acct_objective] ([acct_objective_id], [objective_type]) VALUES (4, N'Speculation')
INSERT [dbo].[LU_acct_objective] ([acct_objective_id], [objective_type]) VALUES (5, N'Decline to Answer')
SET IDENTITY_INSERT [dbo].[LU_acct_objective] OFF
GO
