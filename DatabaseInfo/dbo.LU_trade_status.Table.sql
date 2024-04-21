USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_trade_status]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_trade_status](
	[trade_status_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](50) NOT NULL,
	[status_description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_LU_trade_status] PRIMARY KEY CLUSTERED 
(
	[trade_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_trade_status] ON 

INSERT [dbo].[LU_trade_status] ([trade_status_id], [status_name], [status_description]) VALUES (1, N'Pending', N'Trade has been initiated but not yet executed.')
INSERT [dbo].[LU_trade_status] ([trade_status_id], [status_name], [status_description]) VALUES (2, N'Executed', N'Trade has been successfully completed.')
INSERT [dbo].[LU_trade_status] ([trade_status_id], [status_name], [status_description]) VALUES (3, N'Failed', N'Trade could not be completed due to an error or rejection.')
INSERT [dbo].[LU_trade_status] ([trade_status_id], [status_name], [status_description]) VALUES (4, N'Cancelled', N'Trade was cancelled before it was executed.')
INSERT [dbo].[LU_trade_status] ([trade_status_id], [status_name], [status_description]) VALUES (5, N'Settled', N'Trade has been finalized and assets have been transferred.')
SET IDENTITY_INSERT [dbo].[LU_trade_status] OFF
GO
