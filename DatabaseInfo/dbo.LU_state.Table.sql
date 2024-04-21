USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_state]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](85) NOT NULL,
	[state_abbr] [varchar](5) NOT NULL,
	[country_id] [smallint] NOT NULL,
 CONSTRAINT [PK_LU_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_state] ON 

INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (1, N'Alabama', N'AL', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (2, N'Alaska', N'AK', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (3, N'Arizona', N'AZ', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4, N'Arkansas', N'AR', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (5, N'California', N'CA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (6, N'Colorado', N'CO', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (7, N'Connecticut', N'CT', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (8, N'District of Columbia', N'DC', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (9, N'Delaware', N'DE', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (10, N'Florida', N'FL', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (11, N'Georgia', N'GA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (12, N'Hawaii', N'HI', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (13, N'Idaho', N'ID', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (14, N'Illinois', N'IL', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (15, N'Indiana', N'IN', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (16, N'Iowa', N'IA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (17, N'Kansas', N'KS', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (18, N'Kentucky', N'KY', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (19, N'Louisiana', N'LA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (20, N'Maine', N'ME', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (21, N'Maryland', N'MD', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (22, N'Massachusetts', N'MA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (23, N'Michigan', N'MI', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (24, N'Minnesota', N'MN', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (25, N'Mississippi', N'MS', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (26, N'Missouri', N'MO', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (27, N'Montana', N'MT', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (28, N'Nebraska', N'NE', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (29, N'Nevada', N'NV', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (30, N'New Hampshire', N'NH', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (31, N'New Jersey', N'NJ', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (32, N'New Mexico', N'NM', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (33, N'New York', N'NY', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (34, N'North Carolina', N'NC', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (35, N'North Dakota', N'ND', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (36, N'Ohio', N'OH', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (37, N'Oklahoma', N'OK', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (38, N'Oregon', N'OR', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (39, N'Pennsylvania', N'PA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (40, N'Rhode Island', N'RI', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (41, N'South Carolina', N'SC', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (42, N'South Dakota', N'SD', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (43, N'Tennessee', N'TN', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (44, N'Texas', N'TX', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (45, N'Utah', N'UT', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (46, N'Vermont', N'VT', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (47, N'Virginia', N'VA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (48, N'Washington', N'WA', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (49, N'West Virginia', N'WV', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (50, N'Wisconsin', N'WI', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (51, N'Wyoming', N'WY', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (52, N'Puerto Rico', N'PR', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (53, N'Guam', N'GU', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (54, N'Palau', N'PW', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (55, N'Micronesia', N'FM', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (56, N'Northern Mariana Islands', N'MP', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (57, N'Marshall Islands', N'MH', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (58, N'American Samoa', N'AS', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (59, N'Virgin Islands', N'VI', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4907, N'Baker Island', N'UM-81', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4908, N'Howland Island', N'UM-84', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4909, N'Jarvis Island', N'UM-86', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4910, N'Johnston Atoll', N'UM-67', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4911, N'Kingman Reef', N'UM-89', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4912, N'Midway Atoll', N'UM-71', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4913, N'Navassa Island', N'UM-76', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4914, N'Palmyra Atoll', N'UM-95', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4915, N'United States Minor Outlying Islands', N'UM', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4916, N'United States Virgin Islands', N'VI', 236)
INSERT [dbo].[LU_state] ([state_id], [state_name], [state_abbr], [country_id]) VALUES (4917, N'Wake Island', N'UM-79', 236)
SET IDENTITY_INSERT [dbo].[LU_state] OFF
GO
ALTER TABLE [dbo].[LU_state]  WITH CHECK ADD  CONSTRAINT [FK_LU_state_LU_country] FOREIGN KEY([country_id])
REFERENCES [dbo].[LU_country] ([country_id])
GO
ALTER TABLE [dbo].[LU_state] CHECK CONSTRAINT [FK_LU_state_LU_country]
GO
