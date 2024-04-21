USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_id_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_id_type](
	[id_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[id_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_id_type] PRIMARY KEY CLUSTERED 
(
	[id_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_id_type] ON 

INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (1, N'U.S. Passport')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (2, N'Driver''s License')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (3, N'Non-Driver Photo ID')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (4, N'U.S. Military ID')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (5, N'Tribal Card')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (6, N'Work Visa')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (7, N'Foreign Passport')
INSERT [dbo].[LU_id_type] ([id_type_id], [id_type]) VALUES (8, N'Foreign Driver''s License')
SET IDENTITY_INSERT [dbo].[LU_id_type] OFF
GO
