USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_initial_contact_method]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_initial_contact_method](
	[method_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[method_name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_initial_contact_method] PRIMARY KEY CLUSTERED 
(
	[method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_initial_contact_method] ON 

INSERT [dbo].[LU_initial_contact_method] ([method_id], [method_name]) VALUES (1, N'Online')
INSERT [dbo].[LU_initial_contact_method] ([method_id], [method_name]) VALUES (2, N'Mobile')
INSERT [dbo].[LU_initial_contact_method] ([method_id], [method_name]) VALUES (3, N'Mail')
INSERT [dbo].[LU_initial_contact_method] ([method_id], [method_name]) VALUES (4, N'Branch')
SET IDENTITY_INSERT [dbo].[LU_initial_contact_method] OFF
GO
