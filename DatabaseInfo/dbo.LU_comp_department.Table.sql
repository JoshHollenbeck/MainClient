USE [BankDB]
GO
/****** Object:  Table [dbo].[LU_comp_department]    Script Date: 4/21/2024 5:25:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LU_comp_department](
	[department_id] [smallint] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](50) NOT NULL,
	[description] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_LU_comp_department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LU_comp_department] ON 

INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (1, N'Accounting', N'Responsible for managing the company''s financial records, transactions, and cash flow. Key activities include bookkeeping, preparing financial statements, and managing accounts payable and receivable.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (2, N'Advertising and Promotion', N'Responsible for creating and managing advertising and promotional campaigns to increase brand awareness and drive sales.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (3, N'Anti-Money Laundering', N'Responsible for implementing and enforcing anti-money laundering (AML) policies to ensure the company complies with legal requirements and minimizes risks associated with money laundering and financial crimes.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (4, N'Application Development', N'Responsible for designing, developing, testing, and maintaining software applications to meet the company''s business needs.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (5, N'Audit and Assurance', N'Responsible for conducting audits to ensure the company''s financial statements are accurate and comply with accounting standards and regulations.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (6, N'Brand Management', N'Responsible for developing and maintaining the company''s brand strategy, including positioning, identity, and guidelines.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (7, N'Business Development', N'Responsible for identifying and creating new business opportunities, building and maintaining relationships with partners and clients, and negotiating business deals.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (8, N'Business Operations', N'Responsible for managing the day-to-day operations of the company, including supply chain, logistics, and administrative functions.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (9, N'Compliance', N'Responsible for ensuring the company complies with all laws, regulations, and internal policies.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (10, N'Contracts and Agreements', N'Responsible for negotiating, drafting, and managing contracts and agreements with suppliers, customers, and other stakeholders.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (11, N'Corporate Strategy', N'Responsible for developing and implementing the company''s strategic plan, including setting goals, objectives, and initiatives.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (12, N'Credit Risk', N'Responsible for assessing and managing the company''s exposure to credit risk, including the risk of default by borrowers or counterparties.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (13, N'Customer Service', N'Responsible for managing the company''s interactions with customers, including handling inquiries, complaints, and providing support.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (14, N'Employee Relations', N'Responsible for managing the relationship between the company and its employees, including resolving conflicts, managing employee benefits, and promoting a positive work environment.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (15, N'Finance', N'Responsible for managing the company''s finances, including budgeting, forecasting, and financial reporting.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (16, N'Financial Planning and Analysis', N'Responsible for analyzing the company''s financial performance and providing insights and recommendations to support decision-making.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (17, N'Human Resources (HR)', N'Responsible for managing the company''s workforce, including recruitment, training, development, and compensation.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (18, N'Information Security', N'Responsible for protecting the company''s information and technology assets from cyber threats.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (19, N'Information Technology', N'Responsible for managing the company''s technology infrastructure, including hardware, software, and networks.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (20, N'Institutional Banking', N'Responsible for providing banking services to institutional clients, such as corporations, government entities, and financial institutions.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (21, N'Internal Audit', N'Responsible for conducting internal audits to assess the effectiveness of the company''s internal controls, risk management, and governance processes.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (22, N'IT Infrastructure', N'Responsible for managing the company''s IT infrastructure, including servers, storage, and networks.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (23, N'Know Your Customer', N'Responsible for implementing and enforcing Know Your Customer (KYC) policies to ensure the company complies with legal requirements and minimizes risks associated with money laundering and financial crimes.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (24, N'Legal Affairs', N'Responsible for managing the company''s legal affairs, including providing legal advice, managing litigation, and ensuring compliance with laws and regulations.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (25, N'Litigation', N'Responsible for managing the company''s litigation activities, including representing the company in legal proceedings and managing external legal counsel.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (26, N'Market Analysis', N'Responsible for analyzing market trends, competitor activities, and customer preferences to support the company''s strategic planning and decision-making.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (27, N'Market Research', N'Responsible for conducting research to gather insights on the market, competitors, and customer needs and preferences.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (28, N'Market Risk', N'Responsible for assessing and managing the company''s exposure to market risk, including changes in interest rates, exchange rates, and asset prices.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (29, N'Marketing', N'Responsible for developing and implementing the company''s marketing strategy, including product development, pricing, promotion, and distribution.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (30, N'Operational Risk', N'Responsible for assessing and managing the company''s exposure to operational risks, including process failures, system failures, and human errors.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (31, N'Operations', N'Responsible for managing the day-to-day operations of the company, including production, distribution, and service delivery.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (32, N'Process Improvement', N'Responsible for identifying and implementing process improvements to increase efficiency and effectiveness across the company.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (33, N'Regulatory Affairs', N'Responsible for managing the company''s interactions with regulatory agencies and ensuring compliance with regulatory requirements.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (34, N'Regulatory Compliance', N'Responsible for ensuring the company complies with all regulatory requirements, including laws, regulations, and industry standards.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (35, N'Retail Banking', N'Responsible for providing banking services to individual customers, including deposits, loans, and other financial products.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (36, N'Risk Assessment', N'Responsible for assessing the various risks the company faces, including financial, operational, and strategic risks.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (37, N'Risk Management', N'Responsible for developing and implementing strategies to manage and mitigate the various risks the company faces.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (38, N'Strategic Planning', N'Responsible for developing and implementing the company''s strategic plan, including setting goals, objectives, and initiatives.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (39, N'Talent Acquisition', N'Responsible for recruiting, selecting, and onboarding new employees to the company.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (40, N'Taxation', N'Responsible for managing the company''s tax obligations, including preparing tax returns.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (41, N'Technology and Operations', N'Responsible for managing the company''s technology infrastructure and day-to-day operations to ensure business continuity and efficiency.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (42, N'Training and Development', N'Responsible for developing and implementing training and development programs to enhance the skills and capabilities of the company''s employees.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (43, N'Treasury', N'Responsible for managing the company''s cash, investments, and debt obligations, including cash flow forecasting, investment management, and financial risk management.')
INSERT [dbo].[LU_comp_department] ([department_id], [department_name], [description]) VALUES (44, N'C-Level', N'Responsible for making decisions that affect the entire organization.')
SET IDENTITY_INSERT [dbo].[LU_comp_department] OFF
GO
