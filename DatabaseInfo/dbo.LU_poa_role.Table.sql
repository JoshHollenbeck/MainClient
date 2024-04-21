USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_poa_role]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_poa_role](
	[poa_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[poa_role] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_poa_role] PRIMARY KEY CLUSTERED 
(
	[poa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_poa_role] ON 

INSERT [dbo].[LU_poa_role] ([poa_id], [poa_role]) VALUES (1, N'Power of Attorney')
INSERT [dbo].[LU_poa_role] ([poa_id], [poa_role]) VALUES (2, N'Limited Power of Attorney')
INSERT [dbo].[LU_poa_role] ([poa_id], [poa_role]) VALUES (3, N'Durable Power of Attorney')
SET IDENTITY_INSERT [dbo].[LU_poa_role] OFF
GO
