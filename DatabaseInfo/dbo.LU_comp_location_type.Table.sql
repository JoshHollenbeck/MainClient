USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_comp_location_type]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_location_type](
	[location_type_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[location_type] [varchar](25) NOT NULL,
 CONSTRAINT [PK_LU_comp_location_type] PRIMARY KEY CLUSTERED 
(
	[location_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_comp_location_type] ON 

INSERT [dbo].[LU_comp_location_type] ([location_type_id], [location_type]) VALUES (1, N'Corporate')
INSERT [dbo].[LU_comp_location_type] ([location_type_id], [location_type]) VALUES (2, N'Branch')
SET IDENTITY_INSERT [dbo].[LU_comp_location_type] OFF
GO
