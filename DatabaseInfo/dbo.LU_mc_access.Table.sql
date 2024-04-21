USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_mc_access]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_mc_access](
	[mc_access_id] [smallint] IDENTITY(1,1) NOT NULL,
	[position_id] [smallint] NOT NULL,
	[trading] [bit] NOT NULL,
	[move_money] [bit] NOT NULL,
	[view_only] [bit] NOT NULL,
 CONSTRAINT [PK_LU_mc_access] PRIMARY KEY CLUSTERED 
(
	[mc_access_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_mc_access] ON 

INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (1, 38, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (2, 39, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (3, 41, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (4, 43, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (5, 44, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (6, 45, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (7, 46, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (8, 47, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (9, 48, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (10, 49, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (11, 50, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (12, 57, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (13, 58, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (14, 59, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (15, 60, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (16, 61, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (17, 62, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (18, 63, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (19, 83, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (20, 84, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (21, 85, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (22, 86, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (23, 87, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (24, 109, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (25, 110, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (26, 111, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (27, 112, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (28, 113, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (29, 114, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (30, 115, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (31, 116, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (32, 117, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (33, 118, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (34, 271, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (35, 272, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (36, 273, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (37, 274, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (38, 275, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (39, 276, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (40, 277, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (41, 278, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (42, 279, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (43, 280, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (44, 281, 1, 0, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (45, 282, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (46, 283, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (47, 284, 0, 0, 1)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (48, 285, 0, 1, 0)
INSERT [dbo].[LU_mc_access] ([mc_access_id], [position_id], [trading], [move_money], [view_only]) VALUES (49, 125, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[LU_mc_access] OFF
GO
ALTER TABLE [dbo].[LU_mc_access]  WITH CHECK ADD  CONSTRAINT [FK_emp_mc_access_LU_comp_position] FOREIGN KEY([position_id])
REFERENCES [dbo].[LU_comp_position] ([position_id])
GO
ALTER TABLE [dbo].[LU_mc_access] CHECK CONSTRAINT [FK_emp_mc_access_LU_comp_position]
GO
