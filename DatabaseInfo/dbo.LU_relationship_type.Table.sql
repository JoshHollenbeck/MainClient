USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_relationship_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_relationship_type](
	[relationship_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[relationship_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_relationship_type] PRIMARY KEY CLUSTERED 
(
	[relationship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_relationship_type] ON 

INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (1, N'Child')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (2, N'Spouse')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (3, N'Parent')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (4, N'Sibling')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (5, N'Grandchild')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (6, N'Niece/Nephew')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (7, N'Aunt/Uncle')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (8, N'Cousin')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (9, N'Domestic Partner')
INSERT [dbo].[LU_relationship_type] ([relationship_id], [relationship_type]) VALUES (10, N'Non-relative')
SET IDENTITY_INSERT [dbo].[LU_relationship_type] OFF
GO
