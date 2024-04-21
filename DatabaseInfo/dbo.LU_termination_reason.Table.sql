USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_termination_reason]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_termination_reason](
	[termination_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[termination_reason] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_LU_termination_reason] PRIMARY KEY CLUSTERED 
(
	[termination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_termination_reason] ON 

INSERT [dbo].[LU_termination_reason] ([termination_id], [termination_reason]) VALUES (1, N'Resignation')
INSERT [dbo].[LU_termination_reason] ([termination_id], [termination_reason]) VALUES (2, N'Retirement')
INSERT [dbo].[LU_termination_reason] ([termination_id], [termination_reason]) VALUES (3, N'Layoff')
INSERT [dbo].[LU_termination_reason] ([termination_id], [termination_reason]) VALUES (4, N'Termination')
SET IDENTITY_INSERT [dbo].[LU_termination_reason] OFF
GO
