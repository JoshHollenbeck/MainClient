﻿USE [BankDB]
GO
/****** Object:  UserDefinedTableType [dbo].[DepositMultipleCheckSingleAccount]    Script Date: 4/21/2024 5:21:56 PM ******/
CREATE TYPE [dbo].[DepositMultipleCheckSingleAccount] AS TABLE(
	[DepAmt] [decimal](18, 4) NULL,
	[PayerName] [varchar](200) NULL,
	[PayToOrderOf] [varchar](200) NULL,
	[CheckAcctNum] [varchar](50) NULL,
	[CheckNum] [varchar](10) NULL,
	[CheckRouting] [varchar](9) NULL,
	[CheckDate] [date] NULL,
	[Memo] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[DepositSingleCheckMultipleAccount]    Script Date: 4/21/2024 5:21:56 PM ******/
CREATE TYPE [dbo].[DepositSingleCheckMultipleAccount] AS TABLE(
	[AcctNum] [varchar](14) NULL,
	[DepAmt] [decimal](18, 4) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[InsertBeneficiariesIntoAccount]    Script Date: 4/21/2024 5:21:56 PM ******/
CREATE TYPE [dbo].[InsertBeneficiariesIntoAccount] AS TABLE(
	[BeneFirstName] [nvarchar](200) NULL,
	[BeneLastName] [nvarchar](200) NULL,
	[BeneTaxId] [varchar](25) NULL,
	[RelationshipType] [varchar](25) NULL,
	[BenePortion] [decimal](5, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[InsertPowersOfAttorneyIntoAccount]    Script Date: 4/21/2024 5:21:56 PM ******/
CREATE TYPE [dbo].[InsertPowersOfAttorneyIntoAccount] AS TABLE(
	[PoaFirstName] [nvarchar](200) NULL,
	[PoaLastName] [nvarchar](200) NULL,
	[PoaTaxId] [varchar](25) NULL,
	[PoaRole] [varchar](25) NULL
)
GO
/****** Object:  Table [dbo].[acct_access_history]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_access_history](
	[acct_history_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[emp_id] [int] NOT NULL,
	[access_date] [datetime] NOT NULL,
 CONSTRAINT [PK_acct_access_history] PRIMARY KEY CLUSTERED 
(
	[acct_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_ach]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_ach](
	[acct_ach_id] [int] IDENTITY(1,1) NOT NULL,
	[nickname] [varchar](50) NULL,
	[acct_id] [bigint] NOT NULL,
	[bank_routing_id] [int] NOT NULL,
	[bank_acct_num] [varchar](50) NOT NULL,
	[bank_acct_type] [tinyint] NOT NULL,
	[added_date] [date] NOT NULL,
	[removed] [bit] NOT NULL,
	[removed_date] [date] NULL,
	[emp_id] [int] NULL,
 CONSTRAINT [PK_acct_ach] PRIMARY KEY CLUSTERED 
(
	[acct_ach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_bal]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_bal](
	[acct_id] [bigint] NOT NULL,
	[acct_balance] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_acct_bal] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_bene]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_bene](
	[acct_bene_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[bene_cust_id] [varchar](50) NOT NULL,
	[bene_first_name] [nvarchar](200) NOT NULL,
	[bene_last_name] [nvarchar](200) NOT NULL,
	[relationship_id] [tinyint] NOT NULL,
	[bene_portion] [decimal](5, 2) NOT NULL,
	[encrypted_bene_tax_id] [varbinary](max) NOT NULL,
	[bene_tax_id_hash] [varbinary](64) NOT NULL,
 CONSTRAINT [PK_acct_bene] PRIMARY KEY CLUSTERED 
(
	[acct_bene_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_branch]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_branch](
	[acct_id] [bigint] NOT NULL,
	[acct_branch_id] [smallint] NOT NULL,
 CONSTRAINT [PK_acct_branch] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_contact]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_contact](
	[acct_id] [bigint] NOT NULL,
	[contact_name] [nvarchar](200) NOT NULL,
	[contact_address] [nvarchar](200) NOT NULL,
	[contact_address_2] [nvarchar](200) NULL,
	[contact_city_id] [int] NOT NULL,
 CONSTRAINT [PK_acct_contact] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_holders]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_holders](
	[acct_id] [bigint] NOT NULL,
	[cust_secondary_id] [varchar](50) NOT NULL,
	[joint_cust_secondary_id] [varchar](50) NULL,
 CONSTRAINT [PK_acct_holders] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_holding]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_holding](
	[acct_holding_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[stock_id] [int] NOT NULL,
	[quantity] [decimal](18, 4) NOT NULL,
	[average_cost] [decimal](18, 4) NOT NULL,
	[local_average_cost] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_acct_holding] PRIMARY KEY CLUSTERED 
(
	[acct_holding_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_info]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_info](
	[acct_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cust_id] [bigint] NOT NULL,
	[acct_num] [varchar](14) NOT NULL,
	[initial_contact_method] [tinyint] NOT NULL,
	[acct_type] [tinyint] NOT NULL,
	[registration_name] [varchar](200) NOT NULL,
	[acct_objective] [tinyint] NOT NULL,
	[acct_funding] [tinyint] NOT NULL,
	[acct_purpose] [tinyint] NOT NULL,
	[acct_activity] [tinyint] NOT NULL,
	[acct_nickname] [varchar](50) NULL,
	[opened_date] [date] NOT NULL,
	[acct_closed] [bit] NOT NULL,
	[closed_date] [date] NULL,
	[emp_id] [int] NULL,
	[currency_id] [smallint] NOT NULL,
 CONSTRAINT [PK_acct_info] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_acct_num] UNIQUE NONCLUSTERED 
(
	[acct_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_jurisdiction]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_jurisdiction](
	[acct_id] [bigint] NOT NULL,
	[jurisdiction_state] [int] NOT NULL,
 CONSTRAINT [PK_acct_jurisdiction] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_limit]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_limit](
	[acct_id] [bigint] NOT NULL,
	[atm_limit] [int] NOT NULL,
	[ach_limit] [int] NOT NULL,
	[wire_limit] [int] NOT NULL,
 CONSTRAINT [PK_acct_limit] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_mobile]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_mobile](
	[acct_id] [bigint] NOT NULL,
	[web] [bit] NOT NULL,
	[mobile] [bit] NOT NULL,
	[two_factor] [bit] NOT NULL,
	[biometrics] [bit] NOT NULL,
 CONSTRAINT [PK_acct_mobile] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_note]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_note](
	[note_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[acct_note] [nvarchar](255) NOT NULL,
	[note_date] [datetime] NOT NULL,
	[emp_id] [int] NOT NULL,
 CONSTRAINT [PK_acct_note] PRIMARY KEY CLUSTERED 
(
	[note_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_pass]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_pass](
	[acct_id] [bigint] NOT NULL,
	[encrypted_acct_pass] [varbinary](max) NULL,
 CONSTRAINT [PK_acct_pass] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_poa]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_poa](
	[acct_poa_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[poa_cust_id] [varchar](50) NOT NULL,
	[poa_first_name] [nvarchar](200) NOT NULL,
	[poa_last_name] [nvarchar](200) NOT NULL,
	[poa_role] [tinyint] NOT NULL,
	[encrypted_poa_tax_id] [varbinary](max) NOT NULL,
	[poa_tax_id_hash] [varbinary](64) NOT NULL,
 CONSTRAINT [PK_acct_poa] PRIMARY KEY CLUSTERED 
(
	[acct_poa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction](
	[acct_transaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[transaction_type] [tinyint] NOT NULL,
	[transaction_amt] [decimal](18, 4) NOT NULL,
	[transaction_date] [datetime] NOT NULL,
	[pre_bal] [decimal](18, 4) NOT NULL,
	[post_bal] [decimal](18, 4) NOT NULL,
	[emp_id] [int] NULL,
 CONSTRAINT [PK_acct_transaction] PRIMARY KEY CLUSTERED 
(
	[acct_transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction_ach]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction_ach](
	[acct_tran_ach_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_transaction_id] [bigint] NOT NULL,
	[bank_routing_id] [int] NOT NULL,
	[bank_acct_num] [varchar](50) NOT NULL,
 CONSTRAINT [PK_acct_transaction_ach_wire] PRIMARY KEY CLUSTERED 
(
	[acct_tran_ach_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction_check]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction_check](
	[acct_check_deposit_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_transaction_id] [bigint] NOT NULL,
	[payer_name] [nvarchar](200) NOT NULL,
	[pay_to_order_of] [nvarchar](200) NOT NULL,
	[check_routing_id] [int] NOT NULL,
	[check_acct_num] [nvarchar](50) NOT NULL,
	[check_num] [nchar](10) NOT NULL,
	[check_date] [date] NOT NULL,
	[memo] [nvarchar](100) NULL,
 CONSTRAINT [PK_acct_transaction_check_deposit] PRIMARY KEY CLUSTERED 
(
	[acct_check_deposit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction_journal]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction_journal](
	[acct_journal_id] [bigint] IDENTITY(1,1) NOT NULL,
	[from_acct_transaction_id] [bigint] NOT NULL,
	[from_acct_id] [bigint] NOT NULL,
	[to_acct_transaction_id] [bigint] NOT NULL,
	[to_acct_id] [bigint] NOT NULL,
 CONSTRAINT [PK_acct_transaction_journal] PRIMARY KEY CLUSTERED 
(
	[acct_journal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction_trade]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction_trade](
	[acct_trade_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_transaction_id] [bigint] NOT NULL,
	[stock_exchange] [smallint] NOT NULL,
	[stock_id] [int] NOT NULL,
	[trade_quantity] [decimal](18, 4) NOT NULL,
	[trade_price] [decimal](18, 4) NOT NULL,
	[trade_status] [tinyint] NOT NULL,
	[trade_fee] [tinyint] NOT NULL,
	[trade_currency_id] [smallint] NOT NULL,
 CONSTRAINT [PK_acct_trade] PRIMARY KEY CLUSTERED 
(
	[acct_trade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[acct_transaction_wire]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acct_transaction_wire](
	[acct_wire_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_transaction_id] [bigint] NOT NULL,
	[wire_routing_id] [int] NOT NULL,
	[wire_acct_num] [varchar](50) NOT NULL,
	[wire_amt] [decimal](18, 4) NOT NULL,
	[wire_fee] [decimal](18, 4) NOT NULL,
	[wire_currency_id] [smallint] NOT NULL,
 CONSTRAINT [PK_acct_transaction_wire] PRIMARY KEY CLUSTERED 
(
	[acct_wire_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_contact]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_contact](
	[cust_id] [bigint] NOT NULL,
	[cust_email] [nvarchar](200) NOT NULL,
	[cust_phone_home] [varchar](15) NOT NULL,
	[cust_phone_business] [varchar](15) NULL,
	[cust_address] [varchar](200) NOT NULL,
	[cust_address_2] [varchar](200) NULL,
	[cust_city_id] [int] NOT NULL,
 CONSTRAINT [PK_cust_contact] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_emp]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_emp](
	[cust_id] [bigint] NOT NULL,
	[employment_status] [bit] NOT NULL,
	[employer_name] [varchar](200) NULL,
	[occupation] [varchar](500) NULL,
 CONSTRAINT [PK_cust_emp] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_id]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_id](
	[cust_id] [bigint] NOT NULL,
	[id_type] [tinyint] NOT NULL,
	[id_state] [int] NOT NULL,
	[id_num] [varchar](25) NOT NULL,
	[id_exp] [varchar](7) NOT NULL,
	[mothers_maiden] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cust_id] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_info]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_info](
	[cust_id] [bigint] IDENTITY(1,1) NOT NULL,
	[cust_secondary_id] [varchar](50) NOT NULL,
	[first_name] [nvarchar](200) NOT NULL,
	[middle_name] [nvarchar](200) NULL,
	[last_name] [nvarchar](200) NOT NULL,
	[suffix] [varchar](5) NULL,
	[date_of_birth] [date] NOT NULL,
	[client_since] [date] NOT NULL,
	[emp_id] [int] NULL,
 CONSTRAINT [PK_cust_info] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_privacy]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_privacy](
	[cust_id] [bigint] NOT NULL,
	[voice_auth] [bit] NULL,
	[do_not_call] [bit] NULL,
	[share_affiliates] [bit] NULL,
 CONSTRAINT [PK_cust_stuff] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cust_tax]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cust_tax](
	[cust_id] [bigint] NOT NULL,
	[encrypted_cust_tax_id] [varbinary](max) NOT NULL,
	[cust_tax_id_hash] [varbinary](64) NOT NULL,
 CONSTRAINT [PK_cust_tax] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_contact]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_contact](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_email] [nvarchar](200) NOT NULL,
	[emp_phone] [varchar](15) NOT NULL,
	[emp_address] [varchar](200) NOT NULL,
	[emp_address_2] [varchar](200) NULL,
	[emp_city_id] [int] NOT NULL,
 CONSTRAINT [PK_emp_contact] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_info]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_info](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_secondary_id] [varchar](50) NOT NULL,
	[first_name] [nvarchar](200) NOT NULL,
	[middle_name] [nvarchar](200) NULL,
	[last_name] [nvarchar](200) NOT NULL,
	[suffix] [varchar](3) NULL,
	[date_of_birth] [date] NOT NULL,
	[hire_date] [date] NOT NULL,
	[termination_date] [date] NULL,
 CONSTRAINT [PK_emp_info] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_pass]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_pass](
	[emp_id] [int] NOT NULL,
	[emp_password] [varchar](50) NOT NULL,
	[emp_pass_hash] [varbinary](32) NULL,
	[emp_pass_salt] [uniqueidentifier] NULL,
 CONSTRAINT [PK_emp_pass] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_position]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_position](
	[emp_position_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NOT NULL,
	[position_location_id] [smallint] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_emp_position] PRIMARY KEY CLUSTERED 
(
	[emp_position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_rep_id]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_rep_id](
	[emp_id] [int] NOT NULL,
	[rep_id] [varchar](5) NOT NULL,
 CONSTRAINT [PK_emp_rep_id] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_rep_id] UNIQUE NONCLUSTERED 
(
	[rep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_salary]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_salary](
	[emp_salary_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NOT NULL,
	[effective_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[salary_amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_emp_salary] PRIMARY KEY CLUSTERED 
(
	[emp_salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_tax]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_tax](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[encrypted_emp_tax_id] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_emp_tax] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp_termination]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp_termination](
	[emp_termination_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NOT NULL,
	[termination_date] [date] NOT NULL,
	[reason] [tinyint] NOT NULL,
	[rehireable] [bit] NOT NULL,
 CONSTRAINT [PK_emp_termination] PRIMARY KEY CLUSTERED 
(
	[emp_termination_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[acct_access_history]  WITH CHECK ADD  CONSTRAINT [FK_acct_access_history_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_access_history] CHECK CONSTRAINT [FK_acct_access_history_acct_info]
GO
ALTER TABLE [dbo].[acct_access_history]  WITH CHECK ADD  CONSTRAINT [FK_acct_access_history_emp_rep_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_rep_id] ([emp_id])
GO
ALTER TABLE [dbo].[acct_access_history] CHECK CONSTRAINT [FK_acct_access_history_emp_rep_id]
GO
ALTER TABLE [dbo].[acct_ach]  WITH CHECK ADD  CONSTRAINT [FK_acct_ach_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_ach] CHECK CONSTRAINT [FK_acct_ach_acct_info]
GO
ALTER TABLE [dbo].[acct_ach]  WITH CHECK ADD  CONSTRAINT [FK_acct_ach_LU_bank_acct_type] FOREIGN KEY([bank_acct_type])
REFERENCES [dbo].[LU_bank_acct_type] ([bank_acct_type_id])
GO
ALTER TABLE [dbo].[acct_ach] CHECK CONSTRAINT [FK_acct_ach_LU_bank_acct_type]
GO
ALTER TABLE [dbo].[acct_ach]  WITH CHECK ADD  CONSTRAINT [FK_acct_ach_LU_bank_routing] FOREIGN KEY([bank_routing_id])
REFERENCES [dbo].[LU_bank_routing] ([bank_routing_id])
GO
ALTER TABLE [dbo].[acct_ach] CHECK CONSTRAINT [FK_acct_ach_LU_bank_routing]
GO
ALTER TABLE [dbo].[acct_bal]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_bal_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_bal] CHECK CONSTRAINT [FK_acct_bal_acct_info]
GO
ALTER TABLE [dbo].[acct_bene]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_bene_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_bene] CHECK CONSTRAINT [FK_acct_bene_acct_info]
GO
ALTER TABLE [dbo].[acct_bene]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_bene_LU_relationship_type] FOREIGN KEY([relationship_id])
REFERENCES [dbo].[LU_relationship_type] ([relationship_id])
GO
ALTER TABLE [dbo].[acct_bene] CHECK CONSTRAINT [FK_acct_bene_LU_relationship_type]
GO
ALTER TABLE [dbo].[acct_branch]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_branch_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_branch] CHECK CONSTRAINT [FK_acct_branch_acct_info]
GO
ALTER TABLE [dbo].[acct_branch]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_branch_LU_comp_location] FOREIGN KEY([acct_branch_id])
REFERENCES [dbo].[LU_comp_location] ([location_id])
GO
ALTER TABLE [dbo].[acct_branch] CHECK CONSTRAINT [FK_acct_branch_LU_comp_location]
GO
ALTER TABLE [dbo].[acct_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_contact_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_contact] CHECK CONSTRAINT [FK_acct_contact_acct_info]
GO
ALTER TABLE [dbo].[acct_contact]  WITH CHECK ADD  CONSTRAINT [FK_acct_contact_LU_city] FOREIGN KEY([contact_city_id])
REFERENCES [dbo].[LU_city] ([city_id])
GO
ALTER TABLE [dbo].[acct_contact] CHECK CONSTRAINT [FK_acct_contact_LU_city]
GO
ALTER TABLE [dbo].[acct_holders]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_holders_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_holders] CHECK CONSTRAINT [FK_acct_holders_acct_info]
GO
ALTER TABLE [dbo].[acct_holding]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_stock_holdings_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_holding] CHECK CONSTRAINT [FK_acct_stock_holdings_acct_info]
GO
ALTER TABLE [dbo].[acct_holding]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_stock_holdings_LU_stock_list] FOREIGN KEY([stock_id])
REFERENCES [dbo].[LU_stock_list] ([stock_id])
GO
ALTER TABLE [dbo].[acct_holding] CHECK CONSTRAINT [FK_acct_stock_holdings_LU_stock_list]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_cust_info]
GO
ALTER TABLE [dbo].[acct_info]  WITH CHECK ADD  CONSTRAINT [FK_acct_info_emp_rep_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_rep_id] ([emp_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_emp_rep_id]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_activity] FOREIGN KEY([acct_activity])
REFERENCES [dbo].[LU_acct_activity] ([acct_activity_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_activity]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_funding] FOREIGN KEY([acct_funding])
REFERENCES [dbo].[LU_acct_funding] ([acct_funding_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_funding]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_objectives] FOREIGN KEY([acct_objective])
REFERENCES [dbo].[LU_acct_objective] ([acct_objective_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_objectives]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_purpose] FOREIGN KEY([acct_purpose])
REFERENCES [dbo].[LU_acct_purpose] ([acct_purpose_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_purpose]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_acct_type] FOREIGN KEY([acct_type])
REFERENCES [dbo].[LU_acct_type] ([acct_type_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_acct_type]
GO
ALTER TABLE [dbo].[acct_info]  WITH CHECK ADD  CONSTRAINT [FK_acct_info_LU_currency] FOREIGN KEY([currency_id])
REFERENCES [dbo].[LU_currency] ([currency_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_currency]
GO
ALTER TABLE [dbo].[acct_info]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_info_LU_initial_contact_method] FOREIGN KEY([initial_contact_method])
REFERENCES [dbo].[LU_initial_contact_method] ([method_id])
GO
ALTER TABLE [dbo].[acct_info] CHECK CONSTRAINT [FK_acct_info_LU_initial_contact_method]
GO
ALTER TABLE [dbo].[acct_jurisdiction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_jurisdiction_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_jurisdiction] CHECK CONSTRAINT [FK_acct_jurisdiction_acct_info]
GO
ALTER TABLE [dbo].[acct_jurisdiction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_jurisdiction_LU_state] FOREIGN KEY([jurisdiction_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[acct_jurisdiction] CHECK CONSTRAINT [FK_acct_jurisdiction_LU_state]
GO
ALTER TABLE [dbo].[acct_limit]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_limit_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_limit] CHECK CONSTRAINT [FK_acct_limit_acct_info]
GO
ALTER TABLE [dbo].[acct_mobile]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_mobile_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_mobile] CHECK CONSTRAINT [FK_acct_mobile_acct_info]
GO
ALTER TABLE [dbo].[acct_note]  WITH CHECK ADD  CONSTRAINT [FK_acct_note_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_note] CHECK CONSTRAINT [FK_acct_note_acct_info]
GO
ALTER TABLE [dbo].[acct_note]  WITH CHECK ADD  CONSTRAINT [FK_acct_note_emp_rep_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_rep_id] ([emp_id])
GO
ALTER TABLE [dbo].[acct_note] CHECK CONSTRAINT [FK_acct_note_emp_rep_id]
GO
ALTER TABLE [dbo].[acct_pass]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_pass_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_pass] CHECK CONSTRAINT [FK_acct_pass_acct_info]
GO
ALTER TABLE [dbo].[acct_poa]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_poa_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_poa] CHECK CONSTRAINT [FK_acct_poa_acct_info]
GO
ALTER TABLE [dbo].[acct_poa]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_poa_LU_poa_role] FOREIGN KEY([poa_role])
REFERENCES [dbo].[LU_poa_role] ([poa_id])
GO
ALTER TABLE [dbo].[acct_poa] CHECK CONSTRAINT [FK_acct_poa_LU_poa_role]
GO
ALTER TABLE [dbo].[acct_transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_transaction_acct_info] FOREIGN KEY([acct_id])
REFERENCES [dbo].[acct_info] ([acct_id])
GO
ALTER TABLE [dbo].[acct_transaction] CHECK CONSTRAINT [FK_acct_transaction_acct_info]
GO
ALTER TABLE [dbo].[acct_transaction]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_emp_rep_id] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_rep_id] ([emp_id])
GO
ALTER TABLE [dbo].[acct_transaction] CHECK CONSTRAINT [FK_acct_transaction_emp_rep_id]
GO
ALTER TABLE [dbo].[acct_transaction]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_transaction_LU_transaction_type] FOREIGN KEY([transaction_type])
REFERENCES [dbo].[LU_transaction_type] ([transaction_type_id])
GO
ALTER TABLE [dbo].[acct_transaction] CHECK CONSTRAINT [FK_acct_transaction_LU_transaction_type]
GO
ALTER TABLE [dbo].[acct_transaction_ach]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_ach_LU_bank_routing] FOREIGN KEY([bank_routing_id])
REFERENCES [dbo].[LU_bank_routing] ([bank_routing_id])
GO
ALTER TABLE [dbo].[acct_transaction_ach] CHECK CONSTRAINT [FK_acct_transaction_ach_LU_bank_routing]
GO
ALTER TABLE [dbo].[acct_transaction_ach]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_ach_wire_acct_transaction] FOREIGN KEY([acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_transaction_ach] CHECK CONSTRAINT [FK_acct_transaction_ach_wire_acct_transaction]
GO
ALTER TABLE [dbo].[acct_transaction_check]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_check_deposit_acct_transaction] FOREIGN KEY([acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_transaction_check] CHECK CONSTRAINT [FK_acct_transaction_check_deposit_acct_transaction]
GO
ALTER TABLE [dbo].[acct_transaction_check]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_deposit_check_LU_bank_routing] FOREIGN KEY([check_routing_id])
REFERENCES [dbo].[LU_bank_routing] ([bank_routing_id])
GO
ALTER TABLE [dbo].[acct_transaction_check] CHECK CONSTRAINT [FK_acct_transaction_deposit_check_LU_bank_routing]
GO
ALTER TABLE [dbo].[acct_transaction_journal]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_journal_acct_transaction] FOREIGN KEY([from_acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_transaction_journal] CHECK CONSTRAINT [FK_acct_transaction_journal_acct_transaction]
GO
ALTER TABLE [dbo].[acct_transaction_journal]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_journal_acct_transaction1] FOREIGN KEY([to_acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_transaction_journal] CHECK CONSTRAINT [FK_acct_transaction_journal_acct_transaction1]
GO
ALTER TABLE [dbo].[acct_transaction_trade]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_trade_acct_transaction] FOREIGN KEY([acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_transaction_trade] CHECK CONSTRAINT [FK_acct_trade_acct_transaction]
GO
ALTER TABLE [dbo].[acct_transaction_trade]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_trade_LU_stock_exchange] FOREIGN KEY([stock_exchange])
REFERENCES [dbo].[LU_stock_exchange] ([stock_exchange_id])
GO
ALTER TABLE [dbo].[acct_transaction_trade] CHECK CONSTRAINT [FK_acct_trade_LU_stock_exchange]
GO
ALTER TABLE [dbo].[acct_transaction_trade]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_trade_LU_stock_list] FOREIGN KEY([stock_id])
REFERENCES [dbo].[LU_stock_list] ([stock_id])
GO
ALTER TABLE [dbo].[acct_transaction_trade] CHECK CONSTRAINT [FK_acct_trade_LU_stock_list]
GO
ALTER TABLE [dbo].[acct_transaction_trade]  WITH NOCHECK ADD  CONSTRAINT [FK_acct_trade_LU_trade_status] FOREIGN KEY([trade_status])
REFERENCES [dbo].[LU_trade_status] ([trade_status_id])
GO
ALTER TABLE [dbo].[acct_transaction_trade] CHECK CONSTRAINT [FK_acct_trade_LU_trade_status]
GO
ALTER TABLE [dbo].[acct_transaction_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_trade_LU_currency] FOREIGN KEY([trade_currency_id])
REFERENCES [dbo].[LU_currency] ([currency_id])
GO
ALTER TABLE [dbo].[acct_transaction_trade] CHECK CONSTRAINT [FK_acct_transaction_trade_LU_currency]
GO
ALTER TABLE [dbo].[acct_transaction_trade]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_trade_LU_stock_fees] FOREIGN KEY([trade_fee])
REFERENCES [dbo].[LU_stock_fees] ([stock_fee_id])
GO
ALTER TABLE [dbo].[acct_transaction_trade] CHECK CONSTRAINT [FK_acct_transaction_trade_LU_stock_fees]
GO
ALTER TABLE [dbo].[acct_transaction_wire]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_wire_acct_transaction] FOREIGN KEY([acct_transaction_id])
REFERENCES [dbo].[acct_transaction] ([acct_transaction_id])
GO
ALTER TABLE [dbo].[acct_transaction_wire] CHECK CONSTRAINT [FK_acct_transaction_wire_acct_transaction]
GO
ALTER TABLE [dbo].[acct_transaction_wire]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_wire_LU_bank_routing] FOREIGN KEY([wire_routing_id])
REFERENCES [dbo].[LU_bank_routing] ([bank_routing_id])
GO
ALTER TABLE [dbo].[acct_transaction_wire] CHECK CONSTRAINT [FK_acct_transaction_wire_LU_bank_routing]
GO
ALTER TABLE [dbo].[acct_transaction_wire]  WITH CHECK ADD  CONSTRAINT [FK_acct_transaction_wire_LU_currency] FOREIGN KEY([wire_currency_id])
REFERENCES [dbo].[LU_currency] ([currency_id])
GO
ALTER TABLE [dbo].[acct_transaction_wire] CHECK CONSTRAINT [FK_acct_transaction_wire_LU_currency]
GO
ALTER TABLE [dbo].[cust_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_contact_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_contact] CHECK CONSTRAINT [FK_cust_contact_cust_info]
GO
ALTER TABLE [dbo].[cust_contact]  WITH CHECK ADD  CONSTRAINT [FK_cust_contact_LU_city] FOREIGN KEY([cust_city_id])
REFERENCES [dbo].[LU_city] ([city_id])
GO
ALTER TABLE [dbo].[cust_contact] CHECK CONSTRAINT [FK_cust_contact_LU_city]
GO
ALTER TABLE [dbo].[cust_emp]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_emp_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_emp] CHECK CONSTRAINT [FK_cust_emp_cust_info]
GO
ALTER TABLE [dbo].[cust_id]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_id_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_id] CHECK CONSTRAINT [FK_cust_id_cust_info]
GO
ALTER TABLE [dbo].[cust_id]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_id_LU_id_type] FOREIGN KEY([id_type])
REFERENCES [dbo].[LU_id_type] ([id_type_id])
GO
ALTER TABLE [dbo].[cust_id] CHECK CONSTRAINT [FK_cust_id_LU_id_type]
GO
ALTER TABLE [dbo].[cust_id]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_id_LU_state] FOREIGN KEY([id_state])
REFERENCES [dbo].[LU_state] ([state_id])
GO
ALTER TABLE [dbo].[cust_id] CHECK CONSTRAINT [FK_cust_id_LU_state]
GO
ALTER TABLE [dbo].[cust_privacy]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_privacy_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_privacy] CHECK CONSTRAINT [FK_cust_privacy_cust_info]
GO
ALTER TABLE [dbo].[cust_tax]  WITH NOCHECK ADD  CONSTRAINT [FK_cust_tax_cust_info] FOREIGN KEY([cust_id])
REFERENCES [dbo].[cust_info] ([cust_id])
GO
ALTER TABLE [dbo].[cust_tax] CHECK CONSTRAINT [FK_cust_tax_cust_info]
GO
ALTER TABLE [dbo].[emp_contact]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_contact_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_contact] CHECK CONSTRAINT [FK_emp_contact_emp_info]
GO
ALTER TABLE [dbo].[emp_contact]  WITH CHECK ADD  CONSTRAINT [FK_emp_contact_LU_city] FOREIGN KEY([emp_city_id])
REFERENCES [dbo].[LU_city] ([city_id])
GO
ALTER TABLE [dbo].[emp_contact] CHECK CONSTRAINT [FK_emp_contact_LU_city]
GO
ALTER TABLE [dbo].[emp_pass]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_pass_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_pass] CHECK CONSTRAINT [FK_emp_pass_emp_info]
GO
ALTER TABLE [dbo].[emp_position]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_position_comp_position_location] FOREIGN KEY([position_location_id])
REFERENCES [dbo].[LU_comp_position_location] ([position_location_id])
GO
ALTER TABLE [dbo].[emp_position] CHECK CONSTRAINT [FK_emp_position_comp_position_location]
GO
ALTER TABLE [dbo].[emp_position]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_position_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_position] CHECK CONSTRAINT [FK_emp_position_emp_info]
GO
ALTER TABLE [dbo].[emp_rep_id]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_rep_id_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_rep_id] CHECK CONSTRAINT [FK_emp_rep_id_emp_info]
GO
ALTER TABLE [dbo].[emp_salary]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_salary_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_salary] CHECK CONSTRAINT [FK_emp_salary_emp_info]
GO
ALTER TABLE [dbo].[emp_tax]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_tax_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_tax] CHECK CONSTRAINT [FK_emp_tax_emp_info]
GO
ALTER TABLE [dbo].[emp_termination]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_termination_emp_info] FOREIGN KEY([emp_id])
REFERENCES [dbo].[emp_info] ([emp_id])
GO
ALTER TABLE [dbo].[emp_termination] CHECK CONSTRAINT [FK_emp_termination_emp_info]
GO
ALTER TABLE [dbo].[emp_termination]  WITH NOCHECK ADD  CONSTRAINT [FK_emp_termination_LU_termination_reason] FOREIGN KEY([reason])
REFERENCES [dbo].[LU_termination_reason] ([termination_id])
GO
ALTER TABLE [dbo].[emp_termination] CHECK CONSTRAINT [FK_emp_termination_LU_termination_reason]
GO
ALTER TABLE [dbo].[emp_termination]  WITH NOCHECK ADD  CONSTRAINT [CHK_termination_reason] CHECK  (([reason]>=(1) AND [reason]<=(4)))
GO
ALTER TABLE [dbo].[emp_termination] CHECK CONSTRAINT [CHK_termination_reason]
GO
/****** Object:  StoredProcedure [dbo].[Acct_AddAcct]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AddAcct]
	@AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@InitialContactMethod VARCHAR(25),
	@AcctType VARCHAR(75),
	@AcctObjective VARCHAR(25),
	@AcctFunding VARCHAR(50),
	@AcctPurpose VARCHAR(50),
	@AcctActivity VARCHAR(25),
	@ContactSame BIT,
	@ContactName VARCHAR(50) = NULL,
	@ContactAddress VARCHAR(50) = NULL,
	@ContactAddress2 VARCHAR(50) = NULL,
	@ContactPostalCode VARCHAR(50) = NULL,
	@NewAcctNum VARCHAR(14) OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
		SET @Error = 'Reo ID is missing.';
	ELSE IF @InitialContactMethod IS NULL
		SET @Error = 'Initial contact method is missing.';
    ELSE IF @AcctType IS NULL
		SET @Error = 'Account type is missing.';
    ELSE IF @AcctObjective IS NULL
		SET @Error = 'Account objective is missing.';
    ELSE IF @AcctFunding IS NULL
		SET @Error = 'Account funding is missing.';
    ELSE IF @AcctPurpose IS NULL
		SET @Error = 'Account purpose is missing.';
    ELSE IF @AcctActivity IS NULL
		SET @Error = 'Account activity is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @EmpId INT,
				@AcctId BIGINT,
				@CustId BIGINT,
				@ContactCityId INT,
				@AcctNickname VARCHAR(50) = NULL,
				@RegistrationName VARCHAR(200),
				@AcctClosed BIT = 0,
				@ClosedDate DATE = NULL,
				@CurrencyId VARCHAR(3),
				@BeneChecked BIT = 0,
				@BeneCustId VARCHAR(50),
				@BeneFirstName NVARCHAR(200),
				@BeneLastName NVARCHAR(200),
				@BeneTaxId VARCHAR(25),
				@BeneRelationship VARCHAR(25),
				@BenePortion DECIMAL(5,2),
				@BranchID SMALLINT,
				@CustSecondaryId VARCHAR(50),
				@JointCustSecondaryId VARCHAR(50) = NULL,
				@JurisdictionState INT,
				@AtmLimit INT = 500,
				@AchLimit INT = 1000,
				@WireLimit INT = 5000,
				@Web BIT = 0,
				@Mobile BIT = 0,
				@TwoFactor BIT = 0,
				@Biometrics BIT = 0,
				@AcctPass VARBINARY(MAX),
				@PoaChecked BIT = 0,
				@PoaCustId VARCHAR(50),
				@PoaRole VARCHAR(25),
				@PoaFirstName NVARCHAR(200),
				@PoaLastName NVARCHAR(200),
				@PoaTaxId VARCHAR(25),
				@AcctTypeId TINYINT,
				@InitialContactMethodId TINYINT,
				@AcctActivityId TINYINT,
				@AcctFundingId TINYINT,
				@AcctObjectiveId TINYINT,
				@AcctPurposeId TINYINT,
				@AcctBal DECIMAL(18,4) = 0.0000,
				@AcctAttempt INT = 1,
				@AcctMaxAttempts INT = 100,
				@AcctUniqueIDGenerated BIT = 0,
				@BeneAttempt INT = 1,
				@BeneMaxAttempts INT = 100,
				@BeneUniqueIDGenerated BIT = 0,
				@PoaAttempt INT = 1,
				@PoaMaxAttempts INT = 100,
				@PoaUniqueIDGenerated BIT = 0,
				@CityLat DECIMAL(8, 5),
				@CityLon DECIMAL(8, 5),
				@FirstName NVARCHAR(200),
				@LastName NVARCHAR(200)
		
		-- Retrieve the customer ID and currency ID based on the account number
		SELECT @AcctId = acct_id, @CustId = cust_id, @CurrencyId = currency_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Check if contact is the same as previous accounts, if not new contact info should be filled out
		IF @ContactSame = 1
		BEGIN
			SELECT @ContactName = contact_name, 
				   @ContactAddress = contact_address, 
				   @ContactAddress2 = contact_address_2, 
				   @ContactCityId =  contact_city_id 
			FROM acct_contact 
			WHERE acct_id = @AcctId;			
		END
		
		IF @ContactSame = 0 AND (@ContactName IS NULL OR @ContactAddress IS NULL OR @ContactPostalCode IS NULL )
		BEGIN
			SET @Error = 'If contact address is different, then contact name, address, and zip must be entered.';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END
		
		-- Retrieve the customer secondary ID based on customer ID
		SELECT @FirstName = first_name, @LastName = last_name, @CustSecondaryId = cust_secondary_id FROM cust_info WHERE cust_id = @CustId;

		-- Retrive contact city ID and jurisdiction ID state from LU_zip_codes
		SELECT @ContactCityId = city_id, @JurisdictionState = state_id FROM LU_city WHERE postal_code = @ContactPostalCode;

		-- Retrive jurisdiction ID state from LU_zip_codes
		SELECT @JurisdictionState = state_id FROM LU_city WHERE city_id = @ContactCityId

		-- Retrieve the initial contact method id from LU_initial_contact_method
		SELECT @InitialContactMethodId = method_id FROM LU_initial_contact_method WHERE method_name = @InitialContactMethod;
		
		-- Retrieve the initial acct type id from LU_acct_type
		SELECT @AcctTypeId = acct_type_id FROM LU_acct_type WHERE acct_type = @AcctType;
		
		-- Retrieve the objective id from LU_acct_objective
		SELECT @AcctObjectiveId = acct_objective_id FROM LU_acct_objective WHERE objective_type = @AcctObjective;
		
		-- Retrieve the funding id from LU_acct_funding
		SELECT @AcctFundingId = acct_funding_id FROM LU_acct_funding WHERE funding_type = @AcctFunding;
		
		-- Retrieve the purpose id from LU_acct_purpose 
		SELECT @AcctPurposeId = acct_purpose_id FROM LU_acct_purpose WHERE purpose_type = @AcctPurpose;
		
		-- Retrieve the activity id from LU_acct_activity 
		SELECT @AcctActivityId = acct_activity_id FROM LU_acct_activity WHERE activity_type = @AcctActivity;
		
		-- Set the registration name as 'First Name Last Name Account Type'
		SET @RegistrationName = @FirstName + ' ' + @LastName + ' ' + @AcctType;

		-- Retrieve city coordinates
		SELECT @CityLat = city_lat, @CityLon = city_lon FROM LU_city WHERE city_id = @ContactCityId;

		-- Find the closest location and set BranchID using a join to get the coordinates
		SELECT TOP 1 @BranchID = L.location_id
		FROM LU_comp_location L
		JOIN LU_city C ON L.city_id = C.city_id
		WHERE L.type_id = 2
		ORDER BY GEOGRAPHY::Point(C.city_lat, C.city_lon, 4326).STDistance(GEOGRAPHY::Point(@CityLat, @CityLon, 4326)) ASC;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Generate a unique account number
		WHILE @AcctAttempt <= @AcctMaxAttempts AND @AcctUniqueIDGenerated = 0
		BEGIN	
			-- Set account number based on account type
			IF @AcctTypeId IN (16, 17)
			BEGIN
				SET @NewAcctNum = '4000' + CAST(CAST(ROUND(RAND() * (9999999999 - 1000000000) + 1000000000, 0) AS BIGINT) AS VARCHAR(14))
			END
			ELSE IF @AcctTypeId IN (18,19)
			BEGIN
				SET @NewAcctNum = '6000' + CAST(CAST(ROUND(RAND() * (9999999999 - 1000000000) + 1000000000, 0) AS BIGINT) AS VARCHAR(14))
			END
			ELSE
			BEGIN
				SET @NewAcctNum = CAST(CAST(ROUND(RAND() * (9999999999 - 1000000000) + 1000000000, 0) AS BIGINT) AS VARCHAR(10))
			END

			-- Check if the generated account number already exists
			IF NOT EXISTS (SELECT 1 FROM acct_info WHERE acct_num = @NewAcctNum)
			BEGIN
				-- Insert data into account info
				INSERT INTO acct_info (cust_id,
									   acct_num,
 									   initial_contact_method,
   									   acct_type,
									   registration_name,
									   acct_objective,
									   acct_funding,
									   acct_purpose,
									   acct_activity,
									   acct_nickname,
									   opened_date,
									   acct_closed,
									   closed_date,
									   emp_id,
									   currency_id)
				VALUES (@CustId,
						@NewAcctNum, 
						@InitialContactMethodId, 
						@AcctTypeId, 
						@RegistrationName, 
						@AcctObjectiveId, 
						@AcctFundingId, 
						@AcctPurposeId,
						@AcctActivityId,
						@AcctNickname,
						GETDATE(),
						@AcctClosed,
						@ClosedDate,
						@EmpId,
						@CurrencyId);

				SET @AcctId = SCOPE_IDENTITY(); -- Get the ID of the inserted row

				-- Insert data into account balance
				INSERT INTO acct_bal (acct_id, acct_balance)
				VALUES (@AcctId, @AcctBal);

				-- Insert data into account branch
				INSERT INTO acct_branch (acct_id, acct_branch_id)
				VALUES (@AcctId, @BranchId);

				-- Insert data into account contact
				INSERT INTO acct_contact (acct_id, contact_name, contact_address, contact_address_2, contact_city_id)
				VALUES (@AcctId,@ContactName, @ContactAddress, @ContactAddress2, @ContactCityId);

				-- Insert data into account holders
				INSERT INTO acct_holders (acct_id, cust_secondary_id, joint_cust_secondary_id)
				VALUES (@AcctId, @CustSecondaryId, @JointCustSecondaryId)

				-- Insert data into account jurisdiction
				INSERT INTO acct_jurisdiction (acct_id, jurisdiction_state)
				VALUES (@AcctId, @JurisdictionState);
				
				-- Insert data into account withrdawal limit
				INSERT INTO acct_limit (acct_id, ach_limit, atm_limit, wire_limit)
				VALUES (@AcctId,@AchLimit, @AtmLimit, @WireLimit);

				-- Insert data into account mobile
				INSERT INTO acct_mobile (acct_id, web, mobile, two_factor, biometrics)
				VALUES (@AcctId,@Web, @Mobile, @TwoFactor, @Biometrics);

				-- Insert data into account pass
				INSERT INTO acct_pass (acct_id, encrypted_acct_pass)
				VALUES (@AcctId, NULL);

				SET @AcctUniqueIDGenerated = 1;
            END
			ELSE
			BEGIN
				SET @AcctAttempt = @AcctAttempt + 1; -- Increment attempt counter
			END
		END

		IF @AcctUniqueIDGenerated = 0
		BEGIN
			SET @Error = 'Failed to generate a unique account number after ' + CAST(@AcctMaxAttempts AS VARCHAR(10)) + ' attempts.';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END
		
		-- Commit transaction if all operations succeeded
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_AddAcctNewClient]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AddAcctNewClient]
	@CustId BIGINT,
    @RepId VARCHAR(5),
	@InitialContactMethod VARCHAR(25),
	@AcctType VARCHAR(75),
	@AcctObjective VARCHAR(25),
	@AcctFunding VARCHAR(50),
	@AcctPurpose VARCHAR(50),
	@AcctActivity VARCHAR(25),
	@ContactSame BIT,
	@ContactName VARCHAR(50) = NULL,
	@ContactAddress VARCHAR(50) = NULL,
	@ContactAddress2 VARCHAR(50) = NULL,
	@ContactPostalCode VARCHAR(50) = NULL,
	@NewAcctNum VARCHAR(14) OUTPUT 

AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

    IF @CustId IS NULL
		SET @Error = 'Customer ID is missing.';
    ELSE IF @RepId IS NULL
		SET @Error = 'Reo ID is missing.';
	ELSE IF @InitialContactMethod IS NULL
		SET @Error = 'Initial contact method is missing.';
    ELSE IF @AcctType IS NULL
		SET @Error = 'Account type is missing.';
    ELSE IF @AcctObjective IS NULL
		SET @Error = 'Account objective is missing.';
    ELSE IF @AcctFunding IS NULL
		SET @Error = 'Account funding is missing.';
    ELSE IF @AcctPurpose IS NULL
		SET @Error = 'Account purpose is missing.';
    ELSE IF @AcctActivity IS NULL
		SET @Error = 'Account activity is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @EmpId INT,
				@AcctId BIGINT,
				@ContactCityId INT,
				@AcctNickname VARCHAR(50) = NULL,
				@RegistrationName VARCHAR(200),
				@AcctClosed BIT = 0,
				@ClosedDate DATE = NULL,
				@CurrencyId VARCHAR(3),
				@BeneChecked BIT = 0,
				@BeneCustId VARCHAR(50),
				@BeneFirstName NVARCHAR(200),
				@BeneLastName NVARCHAR(200),
				@BeneTaxId VARCHAR(25),
				@BeneRelationship VARCHAR(25),
				@BenePortion DECIMAL(5,2),
				@BranchID SMALLINT,
				@CustSecondaryId VARCHAR(50),
				@JointCustSecondaryId VARCHAR(50) = NULL,
				@JurisdictionState INT,
				@AtmLimit INT = 500,
				@AchLimit INT = 1000,
				@WireLimit INT = 5000,
				@Web BIT = 0,
				@Mobile BIT = 0,
				@TwoFactor BIT = 0,
				@Biometrics BIT = 0,
				@AcctPass VARBINARY(MAX),
				@PoaChecked BIT = 0,
				@PoaCustId VARCHAR(50),
				@PoaRole VARCHAR(25),
				@PoaFirstName NVARCHAR(200),
				@PoaLastName NVARCHAR(200),
				@PoaTaxId VARCHAR(25),
				@AcctTypeId TINYINT,
				@InitialContactMethodId TINYINT,
				@AcctActivityId TINYINT,
				@AcctFundingId TINYINT,
				@AcctObjectiveId TINYINT,
				@AcctPurposeId TINYINT,
				@AcctBal DECIMAL(18,4) = 0.0000,
				@AcctAttempt INT = 1,
				@AcctMaxAttempts INT = 100,
				@AcctUniqueIDGenerated BIT = 0,
				@BeneAttempt INT = 1,
				@BeneMaxAttempts INT = 100,
				@BeneUniqueIDGenerated BIT = 0,
				@PoaAttempt INT = 1,
				@PoaMaxAttempts INT = 100,
				@PoaUniqueIDGenerated BIT = 0,
				@CityLat DECIMAL(8, 5),
				@CityLon DECIMAL(8, 5),
				@FirstName NVARCHAR(200),
				@LastName NVARCHAR(200)
		
		-- Check if contact is the same as previous accounts, if not new contact info should be filled out
		IF @ContactSame = 1
		BEGIN
			SELECT @ContactName = COALESCE(ci.first_name + ' ' + ci.last_name, ''),
				   @ContactAddress = cc.cust_address, 
				   @ContactAddress2 = cc.cust_address_2, 
				   @ContactCityId =  cc.cust_city_id 
			FROM cust_info ci
			LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
			WHERE ci.cust_id = @CustId;			
		END
		
		IF @ContactSame = 0 AND (@ContactName IS NULL OR @ContactAddress IS NULL OR @ContactPostalCode IS NULL )
		BEGIN
			SET @Error = 'If contact address is different, then contact name, address, and zip must be entered.';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END
		
		-- Retrieve the customer secondary ID based on customer ID
		SELECT @FirstName = first_name, @LastName = last_name, @CustSecondaryId = cust_secondary_id FROM cust_info WHERE cust_id = @CustId;

		-- Retrive contact city ID and jurisdiction ID state from LU_zip_codes
		SELECT @ContactCityId = city_id, @JurisdictionState = state_id FROM LU_city WHERE postal_code = @ContactPostalCode;

		-- Retrive jurisdiction ID state from LU_zip_codes
		SELECT @JurisdictionState = state_id FROM LU_city WHERE city_id = @ContactCityId

		SELECT @CurrencyId = cu.currency_id
		FROM LU_currency cu
		LEFT JOIN LU_country co ON cu.currency_id = co.currency_id
		LEFT JOIN LU_state st ON co.country_id = st.country_id
		WHERE state_id = @JurisdictionState

		-- Retrieve the initial contact method id from LU_initial_contact_method
		SELECT @InitialContactMethodId = method_id FROM LU_initial_contact_method WHERE method_name = @InitialContactMethod;
		
		-- Retrieve the initial acct type id from LU_acct_type
		SELECT @AcctTypeId = acct_type_id FROM LU_acct_type WHERE acct_type = @AcctType;
		
		-- Retrieve the objective id from LU_acct_objective
		SELECT @AcctObjectiveId = acct_objective_id FROM LU_acct_objective WHERE objective_type = @AcctObjective;
		
		-- Retrieve the funding id from LU_acct_funding
		SELECT @AcctFundingId = acct_funding_id FROM LU_acct_funding WHERE funding_type = @AcctFunding;
		
		-- Retrieve the purpose id from LU_acct_purpose 
		SELECT @AcctPurposeId = acct_purpose_id FROM LU_acct_purpose WHERE purpose_type = @AcctPurpose;
		
		-- Retrieve the activity id from LU_acct_activity 
		SELECT @AcctActivityId = acct_activity_id FROM LU_acct_activity WHERE activity_type = @AcctActivity;
		
		-- Set the registration name as 'First Name Last Name Account Type'
		SET @RegistrationName = @FirstName + ' ' + @LastName + ' ' + @AcctType;

		-- Retrieve city coordinates
		SELECT @CityLat = city_lat, @CityLon = city_lon FROM LU_city WHERE city_id = @ContactCityId;

		-- Find the closest location and set BranchID using a join to get the coordinates
		SELECT TOP 1 @BranchID = L.location_id
		FROM LU_comp_location L
		JOIN LU_city C ON L.city_id = C.city_id
		WHERE L.type_id = 2
		ORDER BY GEOGRAPHY::Point(C.city_lat, C.city_lon, 4326).STDistance(GEOGRAPHY::Point(@CityLat, @CityLon, 4326)) ASC;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Generate a unique account number
		WHILE @AcctAttempt <= @AcctMaxAttempts AND @AcctUniqueIDGenerated = 0
		BEGIN	
			-- Set account number based on account type
			IF @AcctTypeId IN (16, 17)
			BEGIN
				SET @NewAcctNum = '4000' + CAST(CAST(ROUND(RAND() * (9999999999 - 1000000000) + 1000000000, 0) AS BIGINT) AS VARCHAR(14))
			END
			ELSE IF @AcctTypeId IN (18,19)
			BEGIN
				SET @NewAcctNum = '6000' + CAST(CAST(ROUND(RAND() * (9999999999 - 1000000000) + 1000000000, 0) AS BIGINT) AS VARCHAR(14))
			END
			ELSE
			BEGIN
				SET @NewAcctNum = CAST(CAST(ROUND(RAND() * (9999999999 - 1000000000) + 1000000000, 0) AS BIGINT) AS VARCHAR(10))
			END

			-- Check if the generated account number already exists
			IF NOT EXISTS (SELECT 1 FROM acct_info WHERE acct_num = @NewAcctNum)
			BEGIN
				-- Insert data into account info
				INSERT INTO acct_info (cust_id,
									   acct_num,
 									   initial_contact_method,
   									   acct_type,
									   registration_name,
									   acct_objective,
									   acct_funding,
									   acct_purpose,
									   acct_activity,
									   acct_nickname,
									   opened_date,
									   acct_closed,
									   closed_date,
									   emp_id,
									   currency_id)
				VALUES (@CustId,
						@NewAcctNum, 
						@InitialContactMethodId, 
						@AcctTypeId, 
						@RegistrationName, 
						@AcctObjectiveId, 
						@AcctFundingId, 
						@AcctPurposeId,
						@AcctActivityId,
						@AcctNickname,
						GETDATE(),
						@AcctClosed,
						@ClosedDate,
						@EmpId,
						@CurrencyId);

				SET @AcctId = SCOPE_IDENTITY(); -- Get the ID of the inserted row

				-- Insert data into account balance
				INSERT INTO acct_bal (acct_id, acct_balance)
				VALUES (@AcctId, @AcctBal);

				-- Insert data into account branch
				INSERT INTO acct_branch (acct_id, acct_branch_id)
				VALUES (@AcctId, @BranchId);

				-- Insert data into account contact
				INSERT INTO acct_contact (acct_id, contact_name, contact_address, contact_address_2, contact_city_id)
				VALUES (@AcctId,@ContactName, @ContactAddress, @ContactAddress2, @ContactCityId);

				-- Insert data into account holders
				INSERT INTO acct_holders (acct_id, cust_secondary_id, joint_cust_secondary_id)
				VALUES (@AcctId, @CustSecondaryId, @JointCustSecondaryId)

				-- Insert data into account jurisdiction
				INSERT INTO acct_jurisdiction (acct_id, jurisdiction_state)
				VALUES (@AcctId, @JurisdictionState);
				
				-- Insert data into account withrdawal limit
				INSERT INTO acct_limit (acct_id, ach_limit, atm_limit, wire_limit)
				VALUES (@AcctId,@AchLimit, @AtmLimit, @WireLimit);

				-- Insert data into account mobile
				INSERT INTO acct_mobile (acct_id, web, mobile, two_factor, biometrics)
				VALUES (@AcctId,@Web, @Mobile, @TwoFactor, @Biometrics);

				-- Insert data into account pass
				INSERT INTO acct_pass (acct_id, encrypted_acct_pass)
				VALUES (@AcctId, NULL);

				SET @AcctUniqueIDGenerated = 1;
            END
			ELSE
			BEGIN
				SET @AcctAttempt = @AcctAttempt + 1; -- Increment attempt counter
			END
		END

		IF @AcctUniqueIDGenerated = 0
		BEGIN
			SET @Error = 'Failed to generate a unique account number after ' + CAST(@AcctMaxAttempts AS VARCHAR(10)) + ' attempts.';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END
		
		-- Commit transaction if all operations succeeded
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_AddBeneficiary]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AddBeneficiary]
	@AcctNum VARCHAR(14),
	@BeneficiaryDetails InsertBeneficiariesIntoAccount READONLY
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	-- Ensure the portion percent equals 100.00%
	DECLARE @SumOfPortion DECIMAL(5, 2);
	SELECT @SumOfPortion = SUM(ISNULL(BenePortion, 0)) FROM @BeneficiaryDetails;
	IF @SumOfPortion <> 100.00
	BEGIN
		SET @Error = 'The sum of the portions do not equal 100 percent.';
		RAISERROR(@Error, 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END

	-- Retrieve the account ID based on the account number
	DECLARE @AcctId BIGINT;
	SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

	-- Check if the account ID exists in acct_bene
	IF EXISTS (SELECT 1 FROM acct_bene WHERE acct_id = @AcctId)
	BEGIN
		SET @Error = 'We cannot add new beneficiaries. Please edit the existing ones.'
		RAISERROR(@Error, 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE beneficiaries CURSOR FOR 
            SELECT BeneFirstName, BeneLastName, BeneTaxId, RelationshipType, BenePortion 
            FROM @BeneficiaryDetails;

		DECLARE @BeneCustId VARCHAR(50),
				@BeneFirstName NVARCHAR(200),
				@BeneLastName NVARCHAR(200),
				@BeneTaxId VARCHAR(25),
				@RelationshipType VARCHAR(25),
				@BenePortion DECIMAL(5, 2),
				@Attempt INT = 1,
				@MaxAttempts INT = 100,
				@UniqueIDGenerated BIT = 0

		OPEN beneficiaries;
        FETCH NEXT FROM beneficiaries INTO @BeneFirstName, @BeneLastName, @BeneTaxId, @RelationshipType, @BenePortion;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @BeneFirstName IS NULL
				SET @Error = 'Beneficiary first name is missing.';
			ELSE IF @BeneLastName IS NULL
				SET @Error = 'Beneficiary last name is missing.';
			ELSE IF @BeneTaxId IS NULL
				SET @Error = 'Beneficiary tax ID is missing.';
			ELSE IF @RelationshipType IS NULL
				SET @Error = 'Beneficiary relationship type is missing.';
			ELSE IF @BenePortion IS NULL
				SET @Error = 'Beneficiary portion is missing.';
			
			-- If any error message has been set, raise an error and exit
			IF NOT @Error IS NULL
			BEGIN
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			DECLARE @CustID BIGINT,
					@BeneEncryptedTaxId VARBINARY(MAX),
					@FormattedTaxId VARCHAR(11),
					@TaxIdHash VARBINARY(64),
					@RelationshipTypeID tinyint

			-- Retreive the RelationshipTypeId
			SELECT @RelationshipTypeID = relationship_id FROM LU_relationship_type WHERE relationship_type = @RelationshipType;

			IF @BeneTaxId IS NOT NULL
			BEGIN
				IF CHARINDEX('-', @BeneTaxId) = 0
				BEGIN
					-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
					SET @FormattedTaxId = SUBSTRING(@BeneTaxId, 1, 3) + '-' +
											SUBSTRING(@BeneTaxId, 4, 2) + '-' +
											SUBSTRING(@BeneTaxId, 6, 4);
				END
				ELSE
				BEGIN
					SET @FormattedTaxId = @BeneTaxId;
				END

				-- Compute the hash of the formatted CustTaxId
				SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);
			END

			IF @TaxIdHash IS NULL
			BEGIN
				SET @Error = 'Tax ID hash could not be generated.';
				RAISERROR(@Error, 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END

			-- Check to see if tax id is already created
			IF EXISTS (SELECT 1 FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
			BEGIN
				-- Check if the tax ID hash exists and retrieve the associated customer or beneficiary ID.
				SELECT @CustId = COALESCE(
					(SELECT TOP 1 cust_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash),
					(SELECT TOP 1 acct_bene_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash),
					(SELECT TOP 1 acct_poa_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
				);

				-- If @CustId is found, retrieve the corresponding @BeneCustId
				IF @CustId IS NOT NULL
				BEGIN
					SELECT @BeneCustId = RIGHT('0000000000' + ISNULL(CONVERT(VARCHAR, COALESCE(
						(SELECT cust_secondary_id FROM cust_info WHERE cust_id = 
							(SELECT TOP 1 cust_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)),
						(SELECT bene_cust_id FROM acct_bene WHERE acct_bene_id = 
							(SELECT TOP 1 acct_bene_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)),
						(SELECT poa_cust_id FROM acct_poa WHERE acct_poa_id = 
							(SELECT TOP 1 acct_poa_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash))
					)), ''), 10);
					SELECT @BeneEncryptedTaxId = COALESCE(
						(SELECT TOP 1 encrypted_cust_tax_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash),
						(SELECT TOP 1 encrypted_bene_tax_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash),
						(SELECT TOP 1 encrypted_poa_tax_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
					); 
				END

				-- Insert the check deposit details into the acct_transaction_deposit_check table
				INSERT INTO acct_bene (acct_id, bene_cust_id, bene_first_name, bene_last_name, relationship_id, bene_portion, encrypted_bene_tax_id, bene_tax_id_hash)
				VALUES (@AcctId, @BeneCustId, @BeneFirstName, @BeneLastName, @RelationshipTypeID, @BenePortion, @BeneEncryptedTaxId, @TaxIdHash);

			END
			ELSE
			BEGIN
				-- Generate a unique cust_secondary_id
				WHILE @Attempt <= @MaxAttempts AND @UniqueIDGenerated = 0
				BEGIN
					SET @BeneCustId = RIGHT('0000000000' + CAST(CAST(FLOOR(RAND() * (999999999 - 10000000) + 10000000) AS BIGINT) AS VARCHAR(50)), 10);
						
					-- Check if the generated cust_secondary_id already exists
					IF NOT EXISTS (SELECT 1 FROM cust_info WHERE cust_secondary_id = @BeneCustId)
					AND NOT EXISTS (SELECT 1 FROM acct_bene WHERE bene_cust_id = @BeneCustId)
					AND NOT EXISTS (SELECT 1 FROM acct_poa WHERE poa_cust_id = @BeneCustId)
					BEGIN
						-- Retrieve the customer ID and currency ID based on the account number
						SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

						-- Open the symmetric key for encryption
						OPEN SYMMETRIC KEY TaxEncryption
						DECRYPTION BY CERTIFICATE TaxCertificate;

						-- Encrypt the formatted CustTaxId
						SET @BeneEncryptedTaxId = EncryptByKey(Key_GUID('TaxEncryption'), @FormattedTaxId);

						-- Insert the check deposit details into the acct_transaction_deposit_check table
						INSERT INTO acct_bene (acct_id, bene_cust_id, bene_first_name, bene_last_name, relationship_id, bene_portion, encrypted_bene_tax_id, bene_tax_id_hash)
						VALUES (@AcctId, @BeneCustId, @BeneFirstName, @BeneLastName, @RelationshipTypeID, @BenePortion, @BeneEncryptedTaxId, @TaxIdHash);

						-- Close the symmetric key
						CLOSE SYMMETRIC KEY TaxEncryption;

						SET @UniqueIDGenerated = 1;
					END
					ELSE
					BEGIN
						SET @Attempt = @Attempt + 1; -- Increment attempt counter
					END
				END
				
				IF @UniqueIDGenerated = 0
				BEGIN
					SET @Error = 'Failed to generate a unique cust_secondary_id after ' + CAST(@MaxAttempts AS VARCHAR(10)) + ' attempts.';
					RAISERROR(@Error, 16, 1);
					ROLLBACK TRANSACTION;
					RETURN;
				END
			END

			FETCH NEXT FROM beneficiaries INTO @BeneFirstName, @BeneLastName, @BeneTaxId, @RelationshipType, @BenePortion;
		END

        COMMIT TRANSACTION;

		CLOSE beneficiaries;
		DEALLOCATE beneficiaries;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_AddJointClient]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AddJointClient]
	@AcctNum VARCHAR(14),
	@CustTaxId VARCHAR(25),
	@FirstName NVARCHAR(200) = NULL,
    @MiddleName NVARCHAR(200) = NULL,
    @LastName NVARCHAR(200) = NULL,
    @Suffix VARCHAR(5) = NULL,
    @DateOfBirth DATE = NULL,
	@CustEmail NVARCHAR(200) = NULL,
    @CustPhoneHome VARCHAR(15) = NULL,
    @CustPhoneBusiness VARCHAR(15) = NULL,
    @CustAddress VARCHAR(200) = NULL,
    @CustAddress2 VARCHAR(200) = NULL,
    @CustPostal VARCHAR(10) = NULL,
	@EmploymentStatus VARCHAR(50) = NULL,
    @EmployerName VARCHAR(200) = NULL,
    @Occupation VARCHAR(500) = NULL,
    @IdType VARCHAR(25) = NULL,
    @IdStateName NVARCHAR(50) = NULL,
    @IdNum VARCHAR(25) = NULL,
    @IdExp VARCHAR(7) = NULL,
    @MothersMaiden NVARCHAR(200) = NULL,
	@VoiceAuth BIT = NULL,
    @DoNotCall BIT = NULL,
    @ShareAffiliates BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @CustTaxId IS NULL
		SET @Error = 'Tax ID is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @AcctId BIGINT,
				@AcctType INT,
				@CustSecondaryId VARCHAR(50),
				@Attempt INT = 1,
				@MaxAttempts INT = 1000,
				@CustCityID INT,
				@IdTypeId TINYINT,
				@FormattedTaxId VARCHAR(11),
				@TaxIdHash VARBINARY(64),
				@EncryptedTaxId VARBINARY(MAX),
				@EmploymentStatusID BIT,
				@CustIdStateId TINYINT,
				@UniqueIDGenerated BIT = 0,
				@CustId BIGINT
		
		-- Retrieve the customer ID and currency ID based on the account number
		SELECT @AcctId = acct_id, @AcctType = acct_type FROM acct_info WHERE acct_num = @AcctNum;

		IF @AcctType IN ( 8, 11, 14, 17, 19)
		BEGIN
			IF CHARINDEX('-', @CustTaxId) = 0
			BEGIN
				-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
				SET @FormattedTaxId = SUBSTRING(@CustTaxId, 1, 3) + '-' +
										SUBSTRING(@CustTaxId, 4, 2) + '-' +
										SUBSTRING(@CustTaxId, 6, 4);
			END
			ELSE
			BEGIN
				SET @FormattedTaxId = @CustTaxId;
			END

			-- Compute the hash of the formatted CustTaxId
			SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);

			-- Check to see if tax id is already created
			IF EXISTS (SELECT 1 FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
			BEGIN
				-- Selecting @CustId based on the condition
				SELECT @CustId = 
					CASE
						WHEN EXISTS (SELECT 1 FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash) THEN (SELECT cust_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)
						WHEN EXISTS (SELECT 1 FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash) THEN (SELECT acct_bene_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)
						WHEN EXISTS (SELECT 1 FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash) THEN (SELECT acct_poa_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
						ELSE NULL
					END;

				-- Selecting @BeneCustId based on the condition
				SELECT @CustSecondaryID = 
					CASE
						WHEN @CustId IS NOT NULL THEN
							(SELECT 
								CASE 
									WHEN EXISTS (SELECT 1 FROM cust_info WHERE cust_id = @CustId) THEN (SELECT cust_secondary_id FROM cust_info WHERE cust_id = @CustId)
									WHEN EXISTS (SELECT 1 FROM acct_bene WHERE acct_bene_id = @CustId) THEN (SELECT bene_cust_id FROM acct_bene WHERE acct_bene_id = @CustId)
									WHEN EXISTS (SELECT 1 FROM acct_poa WHERE acct_poa_id = @CustId) THEN (SELECT poa_cust_id FROM acct_poa WHERE acct_poa_id = @CustId)
									ELSE NULL
								END)
						ELSE NULL
					END;

				UPDATE acct_holders
				SET joint_cust_secondary_id = @CustSecondaryId
				WHERE acct_id = @AcctId;
			END
			ELSE
			BEGIN
				IF @FirstName IS NULL
					SET @Error = 'First name is missing.';
				ELSE IF @LastName IS NULL
					SET @Error = 'Last name is missing.';
				ELSE IF @DateOfBirth IS NULL
					SET @Error = 'Date of birth is missing.';
				ELSE IF @CustEmail IS NULL
					SET @Error = 'Email address is missing.';
				ELSE IF @CustPhoneHome IS NULL
					SET @Error = 'Phone number is missing.';
				ELSE IF @CustAddress IS NULL
					SET @Error = 'Address is missing.';
				ELSE IF @CustPostal IS NULL
					SET @Error = 'Postal code is missing.';
				ELSE IF @EmploymentStatus IS NULL
					SET @Error = 'Employment status is missing.';
				ELSE IF @IdType IS NULL
					SET @Error = 'ID type is missing.';
				ELSE IF @IdStateName IS NULL
					SET @Error = 'ID state is missing.';
				ELSE IF @IdNum IS NULL
					SET @Error = 'ID number is missing.';
				ELSE IF @IdExp IS NULL
					SET @Error = 'ID expiration is missing.';
				ELSE IF @MothersMaiden IS NULL
					SET @Error = 'Mother''s maiden name is missing.';

				-- If any error message has been set, raise an error and exit
				IF NOT @Error IS NULL
				BEGIN
					RAISERROR(@Error, 16, 1);
					ROLLBACK TRANSACTION;
					RETURN;
				END

				BEGIN
					-- Generate a unique cust_secondary_id
					WHILE @Attempt <= @MaxAttempts AND @UniqueIDGenerated = 0
					BEGIN
						SET @CustSecondaryId = RIGHT('0000000000' + CAST(CAST(FLOOR(RAND() * (999999999 - 10000000) + 10000000) AS BIGINT) AS VARCHAR(50)), 10);
        
						-- Check if the generated cust_secondary_id already exists
						IF NOT EXISTS (SELECT 1 FROM cust_info WHERE cust_secondary_id = @CustSecondaryId)
						AND NOT EXISTS (SELECT 1 FROM acct_bene WHERE bene_cust_id = @CustSecondaryId)
						AND NOT EXISTS (SELECT 1 FROM acct_poa WHERE poa_cust_id = @CustSecondaryId)
						BEGIN
							-- Remove leading zeroes from zip if applicable
							SET @CustPostal = STUFF(@CustPostal, 1, PATINDEX('%[^0]%', @CustPostal)-1, '')

							-- Get ZipId from LU_zip_codes
							SELECT @CustCityID = city_id FROM LU_city WHERE postal_code = @CustPostal;

							-- Get IdTypeId from LU_id_type
							SELECT @IdTypeId = id_type_id FROM LU_id_type WHERE id_type = @IdType;

							-- Get StateId from LU_state
							SELECT @CustIdStateId = state_id FROM LU_state WHERE state_name = @IdStateName;


							-- Insert data into cust_info table
							INSERT INTO cust_info (cust_secondary_id, first_name, middle_name, last_name, suffix, date_of_birth, client_since)
							VALUES (@CustSecondaryId, @FirstName, @MiddleName, @LastName, @Suffix, @DateOfBirth, GETDATE());
            
							SET @CustId = SCOPE_IDENTITY(); -- Get the ID of the inserted row
            
							-- Insert data into cust_contact table
							INSERT INTO cust_contact (cust_id, cust_email, cust_phone_home, cust_phone_business, cust_address, cust_address_2, cust_city_id)
							VALUES (@CustId, @CustEmail, @CustPhoneHome, @CustPhoneBusiness, @CustAddress, @CustAddress2, @CustCityID);
				
							-- Set EmploymentStatusId from EmploymentStatus
							IF LOWER(@EmploymentStatus) = 'employed'
							BEGIN
								SET @EmploymentStatusID = 1
							END
							ELSE IF LOWER(@EmploymentStatus) = 'unemployed'
							BEGIN
								SET @EmploymentStatusID = 0
							END


							IF @EmploymentStatusID = 0 AND (@EmployerName IS NOT NULL OR @Occupation IS NOT NULL)
							BEGIN
								SET @Error = 'Employment status is set to unemployed, so employer name and occupation should be empty.';
								RAISERROR(@Error, 16, 1);
								ROLLBACK TRANSACTION;
								RETURN;
							END

							IF @EmploymentStatusID = 1 AND (@EmployerName IS NULL OR @Occupation IS NULL)
							BEGIN
								SET @Error = 'Employment status is set to employed, so employer name and occupation should be not be missing.';
								RAISERROR(@Error, 16, 1);
								ROLLBACK TRANSACTION;
								RETURN;
							END
    
							-- Insert data into cust_emp table
							INSERT INTO cust_emp (cust_id, employment_status, employer_name, occupation)
							VALUES (@CustId, @EmploymentStatusID, @EmployerName, @Occupation);

							-- Insert data into cust_id table
							INSERT INTO cust_id (cust_id, id_type, id_state, id_num, id_exp, mothers_maiden)
							VALUES (@CustId, @IdTypeId, @CustIdStateId, @IdNum, @IdExp, @MothersMaiden);

							-- Insert data into cust_privacy table
							INSERT INTO cust_privacy (cust_id, voice_auth, do_not_call, share_affiliates)
							VALUES (@CustId, @VoiceAuth, @DoNotCall, @ShareAffiliates);

							-- Open the symmetric key for encryption
							OPEN SYMMETRIC KEY TaxEncryption
							DECRYPTION BY CERTIFICATE TaxCertificate;

							-- Encrypt the formatted CustTaxId
							SET @EncryptedTaxId = EncryptByKey(Key_GUID('TaxEncryption'), @FormattedTaxId);

							INSERT INTO cust_tax (cust_id, encrypted_cust_tax_id, cust_tax_id_hash)
							VALUES (@CustId, @EncryptedTaxId, @TaxIdHash);

							-- Close the symmetric key
							CLOSE SYMMETRIC KEY TaxEncryption;

							UPDATE acct_holders
							SET joint_cust_secondary_id = @CustSecondaryId
							WHERE acct_id = @AcctId;

							SET @UniqueIDGenerated = 1;
						END
						ELSE
						BEGIN
							SET @Attempt = @Attempt + 1; -- Increment attempt counter
						END
					END

					IF @UniqueIDGenerated = 0
					BEGIN
						SET @Error = 'Failed to generate a unique cust_secondary_id after ' + CAST(@MaxAttempts AS VARCHAR(10)) + ' attempts.';
						RAISERROR(@Error, 16, 1);
						ROLLBACK TRANSACTION; -- Rollback transaction due to failure
						RETURN;
					END
				END
			END
		END
		ELSE
		BEGIN
			SET @Error = 'You cannot add a joint holder to a non joint account';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION; -- Rollback transaction due to failure
			RETURN;
		END
		-- Commit transaction if all operations succeeded
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_AddPowerOfAttorney]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AddPowerOfAttorney]
	@AcctNum VARCHAR(14),
	@PowerOfAttorneyDetails InsertPowersOfAttorneyIntoAccount READONLY
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	-- Retrieve the account ID based on the account number
	DECLARE @AcctId BIGINT;
	SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

	-- Check if the account ID exists in acct_poa
	IF EXISTS (SELECT 1 FROM acct_poa WHERE acct_id = @AcctId)
	BEGIN
		SET @Error = 'We cannot add a new power of attorney. Please edit the existing one.'
		RAISERROR(@Error, 16, 1);
		ROLLBACK TRANSACTION;
		RETURN;
	END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE powersofattorney CURSOR FOR 
            SELECT PoaFirstName, PoaLastName, PoaTaxId, PoaRole
            FROM @PowerOfAttorneyDetails;

		DECLARE @PoaCustId VARCHAR(50),
				@PoaFirstName NVARCHAR(200),
				@PoaLastName NVARCHAR(200),
				@PoaTaxId VARCHAR(25),
				@PoaRole VARCHAR(25),
				@Attempt INT = 1,
				@MaxAttempts INT = 100,
				@UniqueIDGenerated BIT = 0

		OPEN powersofattorney;
        FETCH NEXT FROM powersofattorney INTO @PoaFirstName, @PoaLastName, @PoaTaxId, @PoaRole;

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @PoaFirstName IS NULL
				SET @Error = 'Power of attorney first name is missing.';
			ELSE IF @PoaLastName IS NULL
				SET @Error = 'Power of attorney last name is missing.';
			ELSE IF @PoaTaxId IS NULL
				SET @Error = 'Power of attorney tax ID is missing.';
			ELSE IF @PoaRole IS NULL
				SET @Error = 'Power of attorney role is missing.';
			
			-- If any error message has been set, raise an error and exit
			IF NOT @Error IS NULL
			BEGIN
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			DECLARE @CustID BIGINT,
					@PoaEncryptedTaxId VARBINARY(MAX),
					@FormattedTaxId VARCHAR(11),
					@TaxIdHash VARBINARY(64),
					@PoaRoleID tinyint

			-- Retreive the PoaRoleId
			SELECT @PoaRoleID = poa_id FROM LU_poa_role WHERE poa_role = @PoaRole;

			IF @PoaTaxId IS NOT NULL
			BEGIN
				IF CHARINDEX('-', @PoaTaxId) = 0
				BEGIN
					-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
					SET @FormattedTaxId = SUBSTRING(@PoaTaxId, 1, 3) + '-' +
											SUBSTRING(@PoaTaxId, 4, 2) + '-' +
											SUBSTRING(@PoaTaxId, 6, 4);
				END
				ELSE
				BEGIN
					SET @FormattedTaxId = @PoaTaxId;
				END

				-- Compute the hash of the formatted CustTaxId
				SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);
			END

			IF @TaxIdHash IS NULL
			BEGIN
				SET @Error = 'Tax ID hash could not be generated.';
				RAISERROR(@Error, 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END

			-- Check to see if tax id is already created
			IF EXISTS (SELECT 1 FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
			BEGIN
				-- Check if the tax ID hash exists and retrieve the associated customer or beneficiary ID.
				SELECT @CustId = COALESCE(
					(SELECT TOP 1 cust_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash),
					(SELECT TOP 1 acct_bene_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash),
					(SELECT TOP 1 acct_poa_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
				);

				-- If @CustId is found, retrieve the corresponding @PoaCustId
				IF @CustId IS NOT NULL
				BEGIN
					SELECT @PoaCustId = RIGHT('0000000000' + ISNULL(CONVERT(VARCHAR, COALESCE(
						(SELECT cust_secondary_id FROM cust_info WHERE cust_id = 
							(SELECT TOP 1 cust_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)),
						(SELECT bene_cust_id FROM acct_bene WHERE acct_bene_id = 
							(SELECT TOP 1 acct_bene_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)),
						(SELECT poa_cust_id FROM acct_poa WHERE acct_poa_id = 
							(SELECT TOP 1 acct_poa_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash))
					)), ''), 10);
					SELECT @PoaEncryptedTaxId = COALESCE(
						(SELECT TOP 1 encrypted_cust_tax_id FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash),
						(SELECT TOP 1 encrypted_bene_tax_id FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash),
						(SELECT TOP 1 encrypted_poa_tax_id FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
					); 
				END

				-- Insert the check deposit details into the acct_transaction_deposit_check table
				INSERT INTO acct_poa (acct_id, poa_cust_id, poa_first_name, poa_last_name, poa_role, encrypted_poa_tax_id, poa_tax_id_hash)
				VALUES (@AcctId, @PoaCustId, @PoaFirstName, @PoaLastName, @PoaRoleID, @PoaEncryptedTaxId, @TaxIdHash);

			END
			ELSE
			BEGIN
				-- Generate a unique cust_secondary_id
				WHILE @Attempt <= @MaxAttempts AND @UniqueIDGenerated = 0
				BEGIN
					SET @PoaCustId = RIGHT('0000000000' + CAST(CAST(FLOOR(RAND() * (999999999 - 10000000) + 10000000) AS BIGINT) AS VARCHAR(50)), 10);
						
					-- Check if the generated cust_secondary_id already exists
					IF NOT EXISTS (SELECT 1 FROM cust_info WHERE cust_secondary_id = @PoaCustId)
					AND NOT EXISTS (SELECT 1 FROM acct_bene WHERE bene_cust_id = @PoaCustId)
					AND NOT EXISTS (SELECT 1 FROM acct_poa WHERE poa_cust_id = @PoaCustId)
					BEGIN
						-- Retrieve the customer ID and currency ID based on the account number
						SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

						-- Open the symmetric key for encryption
						OPEN SYMMETRIC KEY TaxEncryption
						DECRYPTION BY CERTIFICATE TaxCertificate;

						-- Encrypt the formatted CustTaxId
						SET @PoaEncryptedTaxId = EncryptByKey(Key_GUID('TaxEncryption'), @FormattedTaxId);

						-- Insert the check deposit details into the acct_transaction_deposit_check table
						INSERT INTO acct_poa (acct_id, poa_cust_id, poa_first_name, poa_last_name, poa_role, encrypted_poa_tax_id, poa_tax_id_hash)
						VALUES (@AcctId, @PoaCustId, @PoaFirstName, @PoaLastName, @PoaRoleID, @PoaEncryptedTaxId, @TaxIdHash);

						-- Close the symmetric key
						CLOSE SYMMETRIC KEY TaxEncryption;

						SET @UniqueIDGenerated = 1;
					END
					ELSE
					BEGIN
						SET @Attempt = @Attempt + 1; -- Increment attempt counter
					END
				END
				
				IF @UniqueIDGenerated = 0
				BEGIN
					SET @Error = 'Failed to generate a unique cust_secondary_id after ' + CAST(@MaxAttempts AS VARCHAR(10)) + ' attempts.';
					RAISERROR(@Error, 16, 1);
					ROLLBACK TRANSACTION;
					RETURN;
				END
			END

			FETCH NEXT FROM powersofattorney INTO @PoaFirstName, @PoaLastName, @PoaTaxId, @PoaRole;
		END

        COMMIT TRANSACTION;

		CLOSE powersofattorney;
		DEALLOCATE powersofattorney;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_AdvancedSearch]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_AdvancedSearch]
    @LastName NVARCHAR(50) = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @MiddleInitial CHAR(1) = NULL,
    @CustSecondaryID VARCHAR(50) = NULL,
    @CustPhone NVARCHAR(20) = NULL,
    @CustZip NVARCHAR(20) = NULL,
    @CustTaxID NVARCHAR(20) = NULL,
    @AcctNum NVARCHAR(14) = NULL,
    @CustEmail NVARCHAR(100) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @FormattedTaxId VARCHAR(11),
			@TaxIdHash VARBINARY(64),
			@EncryptedTaxId VARBINARY(MAX),
			@ErrorMessage NVARCHAR(4000);

	IF CHARINDEX('-', @CustTaxId) = 0
	BEGIN
		-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
		SET @FormattedTaxId = SUBSTRING(@CustTaxId, 1, 3) + '-' +
								SUBSTRING(@CustTaxId, 4, 2) + '-' +
								SUBSTRING(@CustTaxId, 6, 4);
	END
	ELSE
	BEGIN
		SET @FormattedTaxId = @CustTaxId;
	END

	IF @CustTaxID IS NOT NULL
        SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);
	
	-- Check for errors in parameter lengths
    IF (@CustSecondaryId IS NOT NULL AND LEN(@CustSecondaryId) <> 12)
        OR (@AcctNum IS NOT NULL AND (LEN(@AcctNum) <> 10 AND LEN(@AcctNum) <> 14))
        OR (@CustTaxId IS NOT NULL AND LEN(@CustTaxId) <> 9 AND LEN(@CustTaxId) <> 11)
    BEGIN
		-- Return an error message
		SET @ErrorMessage = 'Customer ID must be 12 characters long.' + CHAR(13) + CHAR(10) +
							'Account Number must be 10 or 14 digits.' + CHAR(13) + CHAR(10) +
							'Customer Tax ID must be 9 digits.';
		RAISERROR (@ErrorMessage, 16, 1);
		RETURN;
	END

	IF (@LastName IS NOT NULL OR
		@FirstName IS NOT NULL OR
		@MiddleInitial IS NOT NULL OR
		@CustSecondaryID IS NOT NULL OR
		@CustPhone IS NOT NULL OR
		@CustZip IS NOT NULL OR
		@AcctNum IS NOT NULL OR
		@CustEmail IS NOT NULL)
	BEGIN
		SELECT ai.acct_num AS 'Acct Num',
				CONCAT(ci.first_name, ' ', ci.last_name) AS 'First & Last Name',
				ah.cust_secondary_id AS 'Cust Id',
				ah.joint_cust_secondary_id AS 'Joint Cust Id',
				CONCAT(ac.contact_address, ' ', ac.contact_address_2) AS 'Address',
				c.city_name AS 'City',
				st.state_abbr AS 'State',
				RIGHT('00000' + CAST(c.postal_code AS VARCHAR(5)), 5) AS 'Zip',
				ai.acct_type AS 'Acct Type'
		FROM cust_info ci
		LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
		LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
		LEFT JOIN acct_info ai ON ci.cust_id = ai.cust_id
		LEFT JOIN acct_contact ac on ac.acct_id = ai.acct_id
		LEFT JOIN LU_city c on c.city_id =  ac.contact_city_id
		LEFT JOIN LU_state st on st.state_id =  c.state_id
		LEFT JOIN acct_holders ah ON ai.acct_id = ah.acct_id
		WHERE (@LastName IS NULL OR ci.last_name = @LastName)
			AND (@FirstName IS NULL OR ci.first_name = @FirstName)
			AND (@MiddleInitial IS NULL OR LEFT(ci.middle_name, 1) = @MiddleInitial)
			AND (@CustSecondaryId IS NULL OR ah.cust_secondary_id = @CustSecondaryId OR ah.joint_cust_secondary_id = @CustSecondaryId)
			AND (@CustPhone IS NULL OR cc.cust_phone_home = @CustPhone OR cc.cust_phone_business = @CustPhone)
			AND (@AcctNum IS NULL OR ai.acct_num = @AcctNum)
			AND (@CustZip IS NULL OR c.postal_code = @CustZip )
			AND (@CustEmail IS NULL OR cc.cust_email = @CustEmail)
			AND ai.acct_num IS NOT NULL
		ORDER BY ci.last_name ASC;
	END
	IF (@CustTaxID IS NOT NULL)
	BEGIN
		SELECT ai.acct_num AS 'Acct Num',
		   CONCAT(ci.first_name, ' ', ci.last_name) AS 'First & Last Name',
		   ah.cust_secondary_id AS 'Cust Id',
		   ah.joint_cust_secondary_id AS 'Joint Cust Id',
		   CONCAT(ac.contact_address, ' ', ac.contact_address_2) AS 'Address',
		   c.city_name AS 'City',
		   st.state_abbr AS 'State',
		   RIGHT('00000' + CAST(c.postal_code AS VARCHAR(5)), 5) AS 'Zip',
		   ai.acct_type AS 'Acct Type'
		FROM cust_tax ct
		JOIN cust_info ci ON ct.cust_id = ci.cust_id
		JOIN acct_holders ah ON ci.cust_secondary_id = ah.cust_secondary_id OR ci.cust_secondary_id = ah.joint_cust_secondary_id
		JOIN acct_info ai ON ah.acct_id = ai.acct_id
		LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
		LEFT JOIN acct_contact ac on ac.acct_id = ai.acct_id
		LEFT JOIN LU_city c on c.city_id = ac.contact_city_id
		LEFT JOIN LU_state st on st.state_id = c.state_id
		WHERE (@CustTaxId IS NULL OR ct.cust_tax_id_hash = @TaxIdHash)
		  AND ai.acct_num IS NOT NULL
		ORDER BY ci.last_name ASC;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_EditAcctContact]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_EditAcctContact]
	@AcctNum VARCHAR(14),
    @ContactName NVARCHAR(200) = NULL,
    @ContactAddress NVARCHAR(200) = NULL,
    @ContactAddress2 NVARCHAR(200) = NULL,
    @ContactPostalCode VARCHAR(50) = NULL,
	@AllAccts BIT = 0
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@CustId BIGINT,
					@ContactCityID INT

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id, @CustId = cust_id FROM acct_info WHERE acct_num = @AcctNum;

			
			IF @AllAccts = 1
			BEGIN
					-- Remove leading zeroes from zip if applicable
					SET @ContactPostalCode = STUFF(@ContactPostalCode, 1, PATINDEX('%[^0]%', @ContactPostalCode)-1, '')

					-- Get ZipId and city coordinates from LU_zip_codes
					SELECT @ContactCityID = city_id FROM LU_city WHERE postal_code = @ContactPostalCode;

					UPDATE acct_contact
					SET
						contact_name = ISNULL(@ContactName, ac.contact_name),
						contact_address = ISNULL(@ContactAddress, ac.contact_address),
						contact_address_2 = ISNULL(@ContactAddress2, ac.contact_address_2),
						contact_city_id = ISNULL(@ContactCityId, ac.contact_city_id)
					FROM acct_info ai
					JOIN acct_contact ac ON ai.acct_id = ac.acct_id
					WHERE ai.cust_id = @CustId;
			END
			ELSE
			BEGIN
				-- Remove leading zeroes from zip if applicable
				SET @ContactPostalCode = STUFF(@ContactPostalCode, 1, PATINDEX('%[^0]%', @ContactPostalCode)-1, '')

				-- Get ZipId and city coordinates from LU_zip_codes
				SELECT @ContactCityID = city_id FROM LU_city WHERE postal_code = @ContactPostalCode;

				UPDATE acct_contact
				SET
					contact_name = ISNULL(@ContactName, contact_name),
					contact_address = ISNULL(@ContactAddress, contact_address),
					contact_address_2 = ISNULL(@ContactAddress2, contact_address_2),
					contact_city_id = ISNULL(@ContactCityId, contact_city_id)
				WHERE
					acct_id = @AcctId;
			END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_EditAcctLimit]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_EditAcctLimit]
	@AcctNum VARCHAR(14),
    @AtmLimit INT = NULL,
	@AchLimit INT = NULL,
	@WireLimit INT = NULL,
	@AllAccts BIT = 0
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@CustId BIGINT

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id, @CustId = cust_id FROM acct_info WHERE acct_num = @AcctNum;
			
			IF @AllAccts = 1
			BEGIN
				UPDATE acct_limit
				SET
					atm_limit = ISNULL(@AtmLimit, al.atm_limit),
					ach_limit = ISNULL(@AchLimit, al.ach_limit),
					wire_limit = ISNULL(@WireLimit, al.wire_limit)
				FROM acct_info ai
				JOIN acct_limit al ON ai.acct_id = al.acct_id
				WHERE
					ai.cust_id = @CustId;
			END
			ELSE
			BEGIN
				UPDATE acct_limit
				SET
					atm_limit = ISNULL(@AtmLimit, atm_limit),
					ach_limit = ISNULL(@AchLimit, ach_limit),
					wire_limit = ISNULL(@WireLimit, wire_limit)
				WHERE
					acct_id = @AcctId;
			END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_EditAcctPass]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_EditAcctPass]
	@AcctNum VARCHAR(14),
    @AcctPass VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@EncryptedAcctPass varbinary(MAX)

			OPEN SYMMETRIC KEY APEncryption
			DECRYPTION BY CERTIFICATE APCertificate;

			SET @EncryptedAcctPass = EncryptByKey(Key_GUID('APEncryption'), @AcctPass);

			CLOSE SYMMETRIC KEY APEncryption;

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

			UPDATE acct_pass
			SET
				encrypted_acct_pass = ISNULL(@EncryptedAcctPass, encrypted_acct_pass)
			WHERE
				acct_id = @AcctId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctAchLinksByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctAchLinksByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		aa.nickname AS 'Nickname',
		br.bank_name AS 'Bank Name',
		br.routing_num AS 'Routing Num',
		aa.bank_acct_num AS 'Acct Num',
		bat.bank_acct_type AS 'Acct Type',
		aa.added_date AS 'Added On',
		aa.removed_date AS 'Removed On',
		ri.rep_id AS 'Rep ID'
    FROM acct_info ai
	JOIN acct_ach aa ON ai.acct_id = aa.acct_id
	LEFT JOIN LU_bank_routing br ON aa.bank_routing_id = br.bank_routing_id
	LEFT JOIN LU_bank_acct_type bat on aa.bank_acct_type = bat.bank_acct_type_id
	LEFT JOIN emp_rep_id ri ON aa.emp_id = ri.emp_id
    WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctAchListByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctAchListByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		aa.nickname AS 'Nickname',
		br.bank_name AS 'Bank Name',
		br.routing_num AS 'Bank Routing',
		aa.bank_acct_num AS 'Bank Acct Num'
	FROM acct_ach aa
	LEFT JOIN LU_bank_routing br on aa.bank_routing_id = br.bank_routing_id
	LEFT JOIN acct_info ai on ai.acct_id = aa.acct_id
    WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctBalanceByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctBalanceByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ac.acct_balance AS 'Acct Balance'
	FROM acct_bal ac
	LEFT JOIN acct_info ai ON ac.acct_id = ai.acct_id
	WHERE ai.acct_num = @AcctNum
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctBeneByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctBeneByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	OPEN SYMMETRIC KEY TaxEncryption
        DECRYPTION BY CERTIFICATE TaxCertificate;

    SELECT 
		CONCAT(ab.bene_first_name, ' ', ab.bene_last_name) AS 'First & Last Name',
		ab.bene_cust_id AS 'Cust ID',
		CONVERT(VARCHAR(25), DecryptByKey(ab.encrypted_bene_tax_id)) AS 'Tax ID',
		rt.relationship_type AS 'Relationship',
		ab.bene_portion AS '% Portion'
    FROM acct_info ai
    JOIN acct_bene ab ON ai.acct_id = ab.acct_id
	LEFT JOIN LU_relationship_type rt ON ab.relationship_id = rt.relationship_id
    WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY TaxEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctContactByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctContactByAcctNum]
	@AcctNum VARCHAR(14)
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @AcctID BIGINT;

	SELECT ac.contact_name AS 'Contact Name',
		   ac.contact_address AS 'Contact Address 1',
		   ac.contact_address_2 AS 'Contact Address 2',
		   ci.city_name AS 'Contact City',
		   st.state_name AS 'Contact State',
		   ci.postal_code AS 'Contact Postal Code'
	FROM acct_contact ac
	LEFT JOIN acct_info ai ON ac.acct_id = ai.acct_id
	LEFT JOIN LU_city ci ON ac.contact_city_id = ci.city_id
	LEFT JOIN LU_state st ON ci.state_id = st.state_id
	WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctDetailsByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctDetailsByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	OPEN SYMMETRIC KEY APEncryption
		DECRYPTION BY CERTIFICATE APCertificate;

	OPEN SYMMETRIC KEY TaxEncryption
        DECRYPTION BY CERTIFICATE TaxCertificate;

    SELECT 
        ai.acct_num,
        icm.method_name AS 'Initial Contact Method',
        act.acct_type_abbr AS 'Acct Type',
        ai.registration_name AS 'Registration Name',
        ai.acct_objective AS 'Acct Objective',
        ai.acct_funding AS 'Acct Funding',
        ai.acct_purpose AS 'Acct Purpose',
        ai.acct_activity AS 'Acct Activity',
        emp.rep_id AS 'Rep ID',
        ai.opened_date AS 'Opened Date',
        ai.acct_closed AS 'Acct Status',
        CONVERT(VARCHAR(25), DecryptByKey(ap.encrypted_acct_pass)) AS 'Acct Pass',
        al.atm_limit AS 'ATM Limit',
        al.ach_limit AS 'ACH Limit',
        al.wire_limit AS 'Wire Limit',
        am.web AS 'Web',
        am.mobile AS 'Mobile',
        am.two_factor AS 'Two Factor',
        am.biometrics AS 'Biometrics',
        ci.cust_id AS 'Customer ID',
        ci.first_name AS 'First Name',
        ci.middle_name AS 'Middle Name',
        ci.last_name AS 'Last Name',
        ci.suffix AS 'Suffix',
        cc.cust_email AS 'Cust Email',
        CONVERT(VARCHAR(25), DecryptByKey(ct.encrypted_cust_tax_id)) AS 'Cust Tax ID',
		cc.cust_address AS 'Cust Address',
        cc.cust_address_2 AS 'Cust Address 2',
        c_cust.city_name AS 'Cust City',
        s_cust.state_abbr AS 'Cust State',
		RIGHT('00000' + CAST(c_cust.postal_code AS VARCHAR(5)), 5) AS 'Cust Zip',
		ac.contact_name AS 'Contact Name',
        ac.contact_address AS 'Contact Address',
        ac.contact_address_2 AS 'Contact Address 2',
        c_acct.city_name AS 'Contact City',
        s_acct.state_abbr AS 'Contact State',
		RIGHT('00000' + CAST(c_acct.postal_code AS VARCHAR(5)), 5) AS 'Contact Zip',
		c_branch.city_name AS 'Branch Location',
		c_juris.country_name AS 'Jurisdiction Country',
        s_juris.state_name AS 'Jurisdiction State'
    FROM acct_info ai
    JOIN acct_jurisdiction aj ON ai.acct_id = aj.acct_id
    JOIN acct_pass ap ON ai.acct_id = ap.acct_id
    JOIN acct_limit al ON ai.acct_id = al.acct_id
    JOIN acct_mobile am ON ai.acct_id = am.acct_id
    JOIN cust_info ci ON ai.cust_id = ci.cust_id
    JOIN cust_contact cc ON ai.cust_id = cc.cust_id
    JOIN cust_id cid ON ai.cust_id = cid.cust_id
    JOIN cust_tax ct ON ai.cust_id = ct.cust_id
    JOIN acct_contact ac ON ai.acct_id = ac.acct_id
	JOIN acct_branch ab ON ai.acct_id = ab.acct_id
	LEFT JOIN LU_acct_type act ON ai.acct_type = act.acct_type_id
	LEFT JOIN emp_rep_id emp ON ai.emp_id = emp.emp_id
	LEFT JOIN LU_initial_contact_method icm ON ai.initial_contact_method = icm.method_id
	LEFT JOIN LU_comp_location cl ON cl.location_id = ab.acct_branch_id
	LEFT JOIN LU_city c_acct ON ac.contact_city_id = c_acct.city_id
	LEFT JOIN LU_city c_cust ON cc.cust_city_id = c_cust.city_id
	LEFT JOIN LU_city c_branch ON cl.city_id = c_branch.city_id
	LEFT JOIN LU_state s_acct ON c_acct.state_id = s_acct.state_id
	LEFT JOIN LU_state s_cust ON c_cust.state_id = s_cust.state_id
	LEFT JOIN LU_state s_juris ON aj.jurisdiction_state = s_juris.state_id
	LEFT JOIN LU_country c_juris ON s_juris.country_id = c_juris.country_id
    WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY APEncryption;
	CLOSE SYMMETRIC KEY TaxEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctHolderByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctHolderByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	OPEN SYMMETRIC KEY TaxEncryption
        DECRYPTION BY CERTIFICATE TaxCertificate;

    SELECT 
		CONCAT(ci.first_name, ' ', ci.last_name) AS 'First & Last Name',
        ah.cust_secondary_id AS 'Cust ID',
		CONVERT(VARCHAR(25), DecryptByKey(ct.encrypted_cust_tax_id)) AS 'Tax ID',
        CONCAT(cc.cust_address, ' ', cc.cust_address_2) AS 'Address',
		c.city_name AS 'City',
        s.state_abbr AS 'State',
		RIGHT('00000' + CAST(c.postal_code AS VARCHAR(5)), 5) AS 'Zip'
    FROM acct_info ai
    JOIN acct_holders ah ON ai.acct_id = ah.acct_id
    JOIN cust_info ci ON ah.cust_secondary_id = ci.cust_secondary_id 
    LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
	LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
	LEFT JOIN LU_city c ON cc.cust_city_id = c.city_id
	LEFT JOIN LU_state s ON c.state_id = s.state_id
    WHERE ai.acct_num = @AcctNum
    UNION
    SELECT 
		CONCAT(ci.first_name, ' ', ci.last_name) AS 'First & Last Name',
        ab.joint_cust_secondary_id AS 'Customer ID',
		CONVERT(VARCHAR(25), DecryptByKey(ct.encrypted_cust_tax_id)) AS 'Tax ID',
		CONCAT(cc.cust_address, ' ', cc.cust_address_2) AS 'Address',
		c.city_name AS 'City',
        s.state_abbr AS 'State',
        RIGHT('00000' + CAST(c.postal_code AS VARCHAR(5)), 5) AS 'Zip'
    FROM acct_info ai
    JOIN acct_holders ab ON ai.acct_id = ab.acct_id
    JOIN cust_info ci ON ab.joint_cust_secondary_id = ci.cust_secondary_id
    LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
	LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
	LEFT JOIN LU_city c ON cc.cust_city_id = c.city_id
	LEFT JOIN LU_state s ON c.state_id = s.state_id
    WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY TaxEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctHoldingsByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctHoldingsByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		sl.stock_ticker AS 'Symbol',
		sl.stock_name AS 'Name',
		se.exchange_abbr AS 'Exchange',
		ah.quantity AS 'Quantity',
		ah.average_cost AS 'Dollar Cost Average',
		sl.current_price AS 'Current Stock Price',
		CAST(sl.current_price / c.exchange_rate AS DECIMAL(18,4)) AS 'USD Price',
        ROUND(ah.quantity * sl.current_price, 4) AS 'Current Value',
		c.currency_abbr AS 'Currency Abbr'
	FROM acct_holding ah
	LEFT JOIN acct_info ai ON ah.acct_id = ai.acct_id
	LEFT JOIN LU_stock_list sl ON ah.stock_id = sl.stock_id
	LEFT JOIN LU_stock_exchange_to_ticker sett ON sl.stock_id = sett.stock_id
	LEFT JOIN LU_stock_exchange se ON sett.exchange_id = se.stock_exchange_id
	LEFT JOIN LU_currency c ON se.exchange_currency = c.currency_id
	WHERE ai.acct_num = @AcctNum AND ah.quantity > 0
	ORDER BY sl.stock_name ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctLimitByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctLimitByAcctNum]
	@AcctNum VARCHAR(14)
AS
BEGIN
    SET NOCOUNT ON;
	
	DECLARE @AcctID BIGINT;

	SELECT al.ach_limit as 'ACH Limit',
		   al.atm_limit as 'ATM Limit',
		   al.wire_limit as 'Wire Limit'
	FROM acct_limit al
	LEFT JOIN acct_info ai ON al.acct_id = ai.acct_id
	WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctNotesByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctNotesByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 25
		ai.acct_num AS 'Acct Num',
		an.acct_note AS 'Note',
		an.note_date AS 'Date',
		ri.rep_id AS 'Rep ID'
	FROM acct_info ai
	JOIN acct_note an ON ai.acct_id = an.acct_id
	LEFT JOIN emp_rep_id ri ON an.emp_id = ri.emp_id
	WHERE ai.acct_num = @AcctNum
	ORDER BY an.note_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctPassByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctPassByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @AcctID BIGINT;

	OPEN SYMMETRIC KEY APEncryption
		DECRYPTION BY CERTIFICATE APCertificate;

	SELECT
		CONVERT(VARCHAR(25), DecryptByKey(ap.encrypted_acct_pass)) AS 'Acct Pass'
	FROM acct_pass ap
	LEFT JOIN acct_info ai ON ap.acct_id = ai.acct_id
	WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY APEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctPOAByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctPOAByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	OPEN SYMMETRIC KEY TaxEncryption
        DECRYPTION BY CERTIFICATE TaxCertificate;

    SELECT
        CONCAT(ap.poa_first_name, ' ', ap.poa_last_name) AS 'First & Last Name',
		ap.poa_cust_id as 'Customer ID',
		CONVERT(VARCHAR(25), DecryptByKey(ap.encrypted_poa_tax_id)) AS 'Tax ID',
		lu.poa_role AS 'Role'
    FROM acct_info ai
    JOIN acct_poa ap ON ai.acct_id = ap.acct_id
	LEFT JOIN LU_poa_role lu ON ap.poa_role = lu.poa_id
    WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY TaxEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctTransactionPrintInfoByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctTransactionPrintInfoByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ai.acct_num AS 'Acct Num',
		lua.acct_type AS 'Acct Type',
        ac.contact_name AS 'Contact Name',
		ac.contact_address AS 'Contact Address',
		ac.contact_address_2 AS 'Contact Address 2',
		luc.city_name AS 'City',
		lus.state_name AS 'State',
		luc.postal_code AS 'Postal Code'
    FROM acct_info ai
	LEFT JOIN acct_contact ac ON ai.acct_id = ac.acct_id
    LEFT JOIN LU_city luc ON ac.contact_city_id = luc.city_id
	LEFT JOIN LU_state lus ON luc.state_id = lus.state_id
	LEFT JOIN LU_acct_type lua ON ai.acct_type = lua.acct_type_id
	WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctTransactionsAchByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctTransactionsAchByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		atr.transaction_date AS 'Transaction Date',
		atr.transaction_amt AS 'Transaction Amount',
		br.bank_name AS 'Bank Name',
		br.routing_num AS 'Bank Routing',
		ata.bank_acct_num AS 'Acct Num',
		ri.rep_id AS 'Rep ID'
	FROM acct_transaction_ach ata
	LEFT JOIN acct_transaction atr ON ata.acct_transaction_id = atr.acct_transaction_id
	LEFT JOIN LU_bank_routing br ON br.bank_routing_id = ata.bank_routing_id
	LEFT JOIN acct_info ai ON atr.acct_id = ai.acct_id
	LEFT JOIN emp_rep_id ri ON atr.emp_id = ri.emp_id 
	WHERE ai.acct_num = @AcctNum
	ORDER BY atr.transaction_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctTransactionsByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctTransactionsByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
        atr.transaction_date AS 'Transaction Date',
        tt.transaction_abbr AS 'Action',
		tt.transaction_type AS 'Action Long',
        atr.transaction_amt AS 'Amount',
        sl.stock_ticker AS 'Symbol',
        att.trade_quantity AS 'Trade Quantity',
        att.trade_price AS 'Trade Price',
        ts.status_name AS 'Trade Status',
		CASE 
			WHEN tt.transaction_abbr = 'SELL' THEN 0
			ELSE COALESCE(sf.fee_amt, wire.wire_fee)
		END AS 'Trade/Wire Fees',
		COALESCE(bratw.routing_num, brata.routing_num, bratc.routing_num) AS 'ACH/Wire Routing Num',
		COALESCE(ach.bank_acct_num, wire.wire_acct_num, checks.check_acct_num) AS 'ACH/Wire Acct Num',
        atr.pre_bal AS 'Pre Balance',
        atr.post_bal AS 'Post Balance',
        ri.rep_id AS 'Rep ID'
    FROM acct_transaction atr
    LEFT JOIN acct_transaction_trade att ON atr.acct_transaction_id = att.acct_transaction_id
	LEFT JOIN acct_transaction_ach ach ON atr.acct_transaction_id = ach.acct_transaction_id
	LEFT JOIN acct_transaction_wire wire ON atr.acct_transaction_id = wire.acct_transaction_id
    LEFT JOIN acct_transaction_check checks ON atr.acct_transaction_id = checks.acct_transaction_id
	LEFT JOIN LU_transaction_type tt ON atr.transaction_type = tt.transaction_type_id
	LEFT JOIN LU_stock_fees sf ON att.trade_fee = sf.stock_fee_id
    LEFT JOIN acct_info ai ON atr.acct_id = ai.acct_id
    LEFT JOIN LU_stock_list sl ON att.stock_id = sl.stock_id
    LEFT JOIN emp_rep_id ri ON atr.emp_id = ri.emp_id
	LEFT JOIN LU_bank_routing bratw ON wire.wire_routing_id = bratw.bank_routing_id
	LEFT JOIN LU_bank_routing brata ON ach.bank_routing_id = brata.bank_routing_id
    LEFT JOIN LU_bank_routing bratc ON checks.check_routing_id = bratc.bank_routing_id
	LEFT JOIN LU_trade_status ts ON att.trade_status = ts.trade_status_id
    WHERE ai.acct_num = @AcctNum
    ORDER BY atr.transaction_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctTransactionsTradeByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctTransactionsTradeByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		atr.transaction_date AS 'Transaction Date',
        tt.transaction_abbr AS 'Action',
        atr.transaction_amt AS 'Amount',
        sl.stock_ticker AS 'Symbol',
        sl.stock_name AS 'Stock Name',
		att.trade_quantity AS 'Trade Quantity',
        att.trade_price AS 'Trade Price',
        ts.status_name AS 'Trade Status',
		CASE 
			WHEN tt.transaction_abbr = 'SELL' THEN 0
			ELSE sf.fee_amt
		END AS 'Trade Fees',
		cu.currency_abbr AS 'Trade Currency',
        ri.rep_id AS 'Rep ID'
	FROM acct_transaction atr
	RIGHT JOIN acct_transaction_trade att ON atr.acct_transaction_id = att.acct_transaction_id
    LEFT JOIN LU_transaction_type tt ON atr.transaction_type = tt.transaction_type_id
    LEFT JOIN acct_info ai ON atr.acct_id = ai.acct_id
	LEFT JOIN LU_currency cu ON att.trade_currency_id = cu.currency_id
    LEFT JOIN LU_stock_list sl ON att.stock_id = sl.stock_id
    LEFT JOIN emp_rep_id ri ON atr.emp_id = ri.emp_id
    LEFT JOIN LU_trade_status ts ON att.trade_status = ts.trade_status_id
	LEFT JOIN LU_stock_fees sf ON att.trade_fee = sf.stock_fee_id
	WHERE ai.acct_num = @AcctNum
	ORDER BY atr.transaction_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_GetAcctTransactionsWireByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_GetAcctTransactionsWireByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		atr.transaction_date AS 'Transaction Date',
		atr.transaction_amt AS 'Transaction Amount',
		br.bank_name AS 'Bank Name',
		br.routing_num AS 'Bank Routing',
		aw.wire_acct_num AS 'Acct Num',
		aw.wire_fee AS 'Wire Fees',
		cu.currency_abbr AS 'Currency',
		ri.rep_id AS 'Rep ID'
	FROM acct_transaction atr
	RIGHT JOIN acct_transaction_wire aw ON atr.acct_transaction_id = aw.acct_transaction_id
	LEFT JOIN LU_bank_routing br ON br.bank_routing_id = aw.wire_routing_id
	LEFT JOIN LU_currency cu ON aw.wire_currency_id = cu.currency_id
	LEFT JOIN acct_info ai ON atr.acct_id = ai.acct_id
	LEFT JOIN emp_rep_id ri ON atr.emp_id = ri.emp_id 
	WHERE ai.acct_num = @AcctNum
	ORDER BY atr.transaction_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctAccessHistoryByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctAccessHistoryByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	DECLARE @ErrorMessage NVARCHAR(100);

	IF @AcctNum IS NULL OR
	   @RepId IS NULL
	BEGIN
		IF @AcctNum IS NULL OR
		   @RepId IS NULL
			SET @ErrorMessage = 'Required entries are missing.';
		RAISERROR(@ErrorMessage, 16, 1);
		RETURN;
	END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @AcctId INT,
				@EmpId INT;

		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			INSERT INTO acct_access_history (acct_id, emp_id, access_date)
			VALUES (@AcctId, @EmpId, GETDATE())

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
            RAISERROR('Account number or Rep ID not found.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessages NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();
    
		RAISERROR (@ErrorMessages, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctAchSetupByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctAchSetupByAcctNum]
    @AcctNum VARCHAR(14),
    @AchRoutingNum VARCHAR(9),
	@AchAcctNum VARCHAR(50),
	@RepId VARCHAR(5),
	@AchAcctType VARCHAR(50),
	@Nickname VARCHAR(50)
	
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DECLARE @ErrorMessage NVARCHAR(100);

	IF @AcctNum IS NULL OR
	   @RepId IS NULL OR
	   @AchRoutingNum IS NULL OR
	   @AchAcctNum IS NULL OR
	   @AchAcctType IS NULL
	BEGIN
		IF @AcctNum IS NULL OR
		   @RepId IS NULL OR
		   @AchRoutingNum IS NULL OR
		   @AchAcctNum IS NULL OR
		   @AchAcctType IS NULL
			SET @ErrorMessage = 'Required entries are missing.';
		RAISERROR(@ErrorMessage, 16, 1);
		RETURN;
	END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @AcctId INT,
				@AchAcctTypeId INT,
				@EmpId INT,
				@BankRoutingId INT;

		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Retrieve the bank routing ID based on the ach routing number
		SELECT @AchAcctTypeId = bank_acct_type_id FROM LU_bank_acct_type WHERE bank_acct_type = @AchAcctType;

		-- Retrieve the bank routing ID based on the ach routing number
		SELECT @BankRoutingId = bank_routing_id FROM LU_bank_routing WHERE routing_num = @AchRoutingNum;

		-- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the note into the acct_note table
			INSERT INTO acct_ach (acct_id, nickname, bank_routing_id, bank_acct_num, bank_acct_type, added_date, removed, removed_date, emp_id)
			VALUES (@AcctId, @Nickname, @BankRoutingId, @AchAcctNum, @AchAcctTypeId, GETDATE(), 0, NULL, @EmpId);

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
            RAISERROR('Account number or Rep ID not found.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessages NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();
    
		RAISERROR (@ErrorMessages, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctNotesByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctNotesByAcctNum]
    @AcctNum VARCHAR(14),
    @Note VARCHAR(MAX),
    @RepId VARCHAR(5)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DECLARE @ErrorMessage NVARCHAR(100);

	IF @AcctNum IS NULL OR
	   @RepId IS NULL OR
	   @Note IS NULL
	BEGIN
		IF @AcctNum IS NULL OR
		   @RepId IS NULL OR
		   @Note IS NULL
			SET @ErrorMessage = 'Required entries are missing.';		
		RAISERROR(@ErrorMessage, 16, 1);
		RETURN;
	END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @AcctId INT,
				@EmpId INT;

		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the note into the acct_note table
			INSERT INTO acct_note (acct_id, acct_note, emp_id, note_date)
			VALUES (@AcctId, @Note, @EmpId, GETDATE());
			
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
            RAISERROR('Account number or Rep ID not found.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
       
	    DECLARE @ErrorMessages NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();
    
		RAISERROR (@ErrorMessages, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionAchDepositByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionAchDepositByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@BankAcctNum VARCHAR(50),
    @TransAmt DECIMAL(18,4),
    @BankRoutingNum VARCHAR(9)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
		SET @Error = 'Rep ID is missing.';
	ELSE IF @BankAcctNum IS NULL
		SET @Error = 'Bank account number is missing.';
    ELSE IF @TransAmt IS NULL
		SET @Error = 'Transaction amount is missing.';
	ELSE IF @TransAmt <= 0
		SET @Error = 'Transaction amount must be greater than zero.';
    ELSE IF @BankRoutingNum IS NULL
		SET @Error = 'Bank routing number is missing.';
    
	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctAchId INT,
                @AcctId BIGINT,
				@EmpId INT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4),
                @TransactionId BIGINT,
				@BankRoutingId INT,
				@Removed BIT;
		
		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Retrieve the employee ID based on the routing number
		SELECT @BankRoutingId = bank_routing_id from LU_bank_routing WHERE routing_num = @BankRoutingNum;

        -- Retrieve the acct_ach_id based on the bank account number and routing number
        SELECT @AcctAchId = acct_ach_id,
			   @Removed = removed 
			   FROM acct_ach 
			   WHERE acct_id = @AcctId AND 
				     bank_acct_num = @BankAcctNum AND 
					 bank_routing_id = @BankRoutingId;

		-- Ensure the ACH account exists
        IF @AcctAchId IS NULL OR 
		   @Removed = 1
			SET @Error = 'ACH account not found with provided bank account and routing numbers.';
        
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance + @TransAmt;
		

		IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
		ELSE IF @NewBalance IS NULL
			SET @Error = 'New balance not found.';
		ELSE IF @BankRoutingId IS NULL
			SET @Error = 'Bank routing ID not found.';

		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND
		   @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 18, @TransAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			SET @TransactionId = SCOPE_IDENTITY();

			-- Insert the transaction detail into the acct_transaction_ach table
			INSERT INTO acct_transaction_ach (acct_transaction_id, bank_routing_id, bank_acct_num)
			VALUES (@TransactionId, @BankRoutingId, @BankAcctNum);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
            -- If no account ID or employee ID was found, raise an error
			SET @Error = 'Account number or Rep ID not found.';
            RAISERROR(@Error, 16, 1)
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionAchWithdrawalByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionAchWithdrawalByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@BankAcctNum VARCHAR(50),
    @TransAmt DECIMAL(18,4),
    @BankRoutingNum VARCHAR(9)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Rep ID is missing.';
	ELSE IF @BankAcctNum IS NULL
        SET @Error = 'Bank account number is missing.';
    ELSE IF @TransAmt IS NULL
        SET @Error= 'Transaction amount is missing.';
	ELSE IF @TransAmt <= 0
        SET @Error= 'Transaction amount must be greater than zero.';
    ELSE IF @BankRoutingNum IS NULL
        SET @Error= 'Bank routing number is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctAchId INT,
                @AcctId BIGINT,
				@EmpId INT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4),
                @TransactionId BIGINT,
				@BankRoutingId INT,
				@Removed BIT;
		
		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Retrieve the employee ID based on the routing number
		SELECT @BankRoutingId = bank_routing_id from LU_bank_routing WHERE routing_num = @BankRoutingNum;

        -- Retrieve the acct_ach_id based on the bank account number and routing number
        SELECT @AcctAchId = acct_ach_id,
			   @Removed = removed 
			   FROM acct_ach 
			   WHERE acct_id = @AcctId AND 
					 bank_acct_num = @BankAcctNum AND 
					 bank_routing_id = @BankRoutingId;
	
		-- Ensure the ACH account exists
        IF @AcctAchId IS NULL OR 
		   @AcctId IS NULL OR 
		   @Removed = 1
        BEGIN
            SET @Error= 'ACH account not found with provided bank account and routing numbers.';
            RAISERROR(@Error, 16, 1);
            RETURN;
        END

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance - @TransAmt;
		IF @CurrentBalance IS NULL
			SET @Error= 'Current balance not found.';
		ELSE IF @NewBalance IS NULL
			SET @Error= 'New balance not found.';
		ELSE IF @BankRoutingId IS NULL
			SET @Error= 'Bank routing ID not found.';

		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 10, @TransAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			SET @TransactionId = SCOPE_IDENTITY();

			-- Insert the transaction detail into the acct_transaction_ach table
			INSERT INTO acct_transaction_ach (acct_transaction_id, bank_routing_id, bank_acct_num)
			VALUES (@TransactionId, @BankRoutingId, @BankAcctNum);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;
		
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
			RAISERROR('Account number or Rep ID not found.', 16, 1);
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionCashDepositByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionCashDepositByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
    @TransAmt DECIMAL(18,4)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Rep ID is missing.';
    ELSE IF @TransAmt IS NULL
        SET @Error = 'Transaction amount is missing.';
	ELSE IF @TransAmt <= 0
        SET @Error = 'Transaction amount must be greater than zero.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctId BIGINT,
				@EmpId INT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4);
		
		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance + @TransAmt;
		
		IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
		ELSE IF @NewBalance IS NULL
			SET @Error = 'New balance not found.';

		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 1, @TransAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
			RAISERROR('Account number or Rep ID not found.', 16, 1);
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessages NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessages, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionCashWithdrawalByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionCashWithdrawalByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
    @TransAmt DECIMAL(18,4)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Rep ID is missing.';
    ELSE IF @TransAmt IS NULL
        SET @Error = 'Transaction amount is missing.';
	ELSE IF @TransAmt <= 0
        SET @Error = 'Transaction amount must be greater than zero.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctId BIGINT,
				@EmpId INT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4);
		
		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance - @TransAmt;
		
		IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
		ELSE IF @NewBalance IS NULL
			SET @Error = 'New balance not found.';

		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 2, @TransAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
			RAISERROR('Account number or Rep ID not found.', 16, 1);
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessages NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessages, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionCheckDepositMultipleCheckByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionCheckDepositMultipleCheckByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@MultiCheckDetails DepositMultipleCheckSingleAccount READONLY
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL OR
	   @RepId IS NULL
    BEGIN
	    IF @AcctNum IS NULL
			SET @Error = 'Account number is missing.';
		ELSE IF @RepId IS NULL
			SET @Error = 'Required entries are missing.';
		
		RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE multiple_checks CURSOR FOR 
            SELECT DepAmt, PayerName, PayToOrderOf, CheckAcctNum, CheckNum, CheckRouting, CheckDate, Memo 
            FROM @MultiCheckDetails;

        DECLARE @DepAmt DECIMAL(18,4),
				@PayerName VARCHAR(200),
				@PayToOrderOf VARCHAR(200),
				@CheckAcctNum VARCHAR(50), 
                @CheckNum VARCHAR(10),
				@CheckRouting VARCHAR(9),
				@CheckDate DATE,
				@Memo VARCHAR(100),
				@AcctId BIGINT,
				@EmpId INT;

        OPEN multiple_checks;
        FETCH NEXT FROM multiple_checks INTO @DepAmt, @PayerName, @PayToOrderOf, @CheckAcctNum, @CheckNum, @CheckRouting, @CheckDate, @Memo;
		
		-- Retrieve the employee ID based on the rep_id
        SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		IF @EmpId IS NULL
			SET @Error = 'Employee ID not found.';
		
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @DepAmt IS NULL
				SET @Error = 'Deposit amount is missing.';
			ELSE IF @PayerName IS NULL
				SET @Error = 'Payer name is missing.';
			ELSE IF @PayToOrderOf IS NULL
				SET @Error = 'Pay to order of is missing.';
			ELSE IF @CheckAcctNum IS NULL
				SET @Error = 'Check account number is missing.';
			ELSE IF @CheckNum IS NULL
				SET @Error = 'Check number is missing.';
			ELSE IF @CheckRouting IS NULL
				SET @Error = 'Check routing number is missing.';
			ELSE IF @CheckDate IS NULL
				SET @Error = 'Check date is missing.';
			ELSE IF @DepAmt <= 0
				SET @Error = 'Transaction amount must be greater than zero.';
			
			-- If any error message has been set, raise an error and exit
			IF NOT @Error IS NULL
			BEGIN
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			DECLARE @CurrentBalance DECIMAL(18, 4),
					@NewBalance DECIMAL(18, 4),
					@BankRoutingId INT,
					@CustId BIGINT,
					@JointCustId varchar(50),
					@FirstName NVARCHAR(50),
					@MiddleName NVARCHAR(50),
					@LastName NVARCHAR(50),
					@ExpectedPayToOrderOf NVARCHAR(200),
					@ExpectedPayToOrderOfWithMiddleName NVARCHAR(200),
					@ExpectedPayToOrderOfWithMiddleInitial NVARCHAR(200),
					@JointFirstName NVARCHAR(50),
					@JointMiddleName NVARCHAR(50),
					@JointLastName NVARCHAR(50),
					@ExpectedJointPayToOrderOf NVARCHAR(200),
					@ExpectedJointPayToOrderOfWithMiddleName NVARCHAR(200),
					@ExpectedJointPayToOrderOfWithMiddleInitial NVARCHAR(200);

			-- Retrieve account ID based on acct_num
			SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

			-- Retrieve account and customer IDs
			SELECT @CustId = ah.cust_secondary_id, 
					@JointCustId = ah.joint_cust_secondary_id
			FROM acct_info ai
			JOIN acct_holders ah ON ai.acct_id = ah.acct_id
			WHERE ai.acct_num = @AcctNum;

			-- Retrieve the customer's full name based on the customer ID or joint customer ID
			SELECT 
				@FirstName = RTRIM(LTRIM(first_name)),
				@MiddleName = RTRIM(LTRIM(middle_name)),
				@LastName = RTRIM(LTRIM(last_name)),
				@JointFirstName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(first_name)) ELSE @JointFirstName END,
				@JointMiddleName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(middle_name)) ELSE @JointMiddleName END,
				@JointLastName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(last_name)) ELSE @JointLastName END
			FROM 
				cust_info
			WHERE 
				cust_secondary_id IN (@CustId, @JointCustId);

			IF @CustId IS NULL
				SET @Error = 'Customer ID could not be found.';
			ELSE IF @AcctId IS NULL
				SET @Error = 'Account ID could not be found.';
			ELSE IF @FirstName IS NULL
				SET @Error = 'Customer first name could not be found.';
			ELSE IF @LastName IS NULL
				SET @Error = 'Customer last name could not be found.';
			
			-- If any error message has been set, raise an error and exit
			IF NOT @Error IS NULL
			BEGIN
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			-- Prepare expected names for primary account holder
			SET @ExpectedPayToOrderOf = @FirstName + ' ' + @LastName;

			-- Check if the middle name or initial is present for primary account holder
			IF LEN(@MiddleName) > 0 
			BEGIN
				-- If middle name is present, check both full middle name and initial formats for primary account holder
				SET @ExpectedPayToOrderOfWithMiddleName = @FirstName + ' ' + @MiddleName + ' ' + @LastName;
				SET @ExpectedPayToOrderOfWithMiddleInitial = @FirstName + ' ' + LEFT(@MiddleName, 1) + ' ' + @LastName;
			END

			-- Prepare expected names for joint account holder
			SET @ExpectedJointPayToOrderOf = @JointFirstName + ' ' + @JointLastName;

			-- Check if the middle name or initial is present for joint account holder
			IF LEN(@JointMiddleName) > 0 
			BEGIN
				-- If middle name is present, check both full middle name and initial formats for joint account holder
				SET @ExpectedJointPayToOrderOfWithMiddleName = @JointFirstName + ' ' + @JointMiddleName + ' ' + @JointLastName;
				SET @ExpectedJointPayToOrderOfWithMiddleInitial = @JointFirstName + ' ' + LEFT(@JointMiddleName, 1) + ' ' + @JointLastName;
			END

			-- Compare PayToOrderOf with expected names for both primary and joint account holders
			IF NOT (
				LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOf)
				OR (LEN(@MiddleName) > 0 AND (
					LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOfWithMiddleName)
					OR LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOfWithMiddleInitial)
				))
				OR LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOf)
				OR (LEN(@JointMiddleName) > 0 AND (
					LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOfWithMiddleName)
					OR LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOfWithMiddleInitial)
				))
			)
			BEGIN
				SET @Error = 'The pay to order of value does not match the account holder''s name.';
				RAISERROR(@Error, 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END
			
			-- Retrieve current account balance
			SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;
            
			-- Retrieve the bank routing ID based on the routing number
			SELECT @BankRoutingId = bank_routing_id FROM LU_bank_routing WHERE routing_num = @CheckRouting;

			-- Calculate new balance
			SET @NewBalance = @CurrentBalance + @DepAmt;

			IF @CurrentBalance IS NULL
				SET @Error = 'Current balance not found.';
			ELSE IF @NewBalance IS NULL
				SET @Error = 'Updated balance not found.';
			ELSE IF @BankRoutingId IS NULL
				SET @Error = 'Bank routing ID not found.';
			
			-- If any error message has been set, raise an error and exit
			IF NOT @Error IS NULL
			BEGIN
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 12, @DepAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			DECLARE @TransactionId BIGINT = SCOPE_IDENTITY();
			
			IF @TransactionId IS NULL
			BEGIN
				IF @TransactionId IS NULL
					SET @Error = 'Transaction ID not found.';
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			-- Insert the check deposit details into the acct_transaction_deposit_check table
			INSERT INTO acct_transaction_check (acct_transaction_id, payer_name, pay_to_order_of, check_routing_id, check_acct_num, check_num, check_date, memo)
			VALUES (@TransactionId, @PayerName, @PayToOrderOf, @BankRoutingId, @CheckAcctNum, @CheckNum, @CheckDate, @Memo);

			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			FETCH NEXT FROM multiple_checks INTO @DepAmt, @PayerName, @PayToOrderOf, @CheckAcctNum, @CheckNum, @CheckRouting, @CheckDate, @Memo
		END

		COMMIT TRANSACTION;

		CLOSE multiple_checks;
		DEALLOCATE multiple_checks;

    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionCheckDepositSingleCheckByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionCheckDepositSingleCheckByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@DepAmt DECIMAL(18,4),
    @PayerName VARCHAR(200),
    @PayToOrderOf VARCHAR(200),
    @CheckAcctNum VARCHAR(50),
    @CheckNum VARCHAR(10),
    @CheckRouting VARCHAR(9),
    @CheckDate DATE,
    @Memo VARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
        SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Representative ID is missing.';
    ELSE IF @DepAmt IS NULL
        SET @Error = 'Deposit amount is missing.';
	ELSE IF @DepAmt <= 0
		SET @Error = 'Deposit amount must be greater than 0.';
    ELSE IF @PayerName IS NULL
        SET @Error = 'Payer name is missing.';
    ELSE IF @PayToOrderOf IS NULL
        SET @Error = 'Pay to order of is missing.';
    ELSE IF @CheckAcctNum IS NULL
        SET @Error = 'Check account number is missing.';
	ELSE IF @CheckNum IS NULL
        SET @Error = 'Check number is missing.';
	ELSE IF @CheckRouting IS NULL
        SET @Error = 'Check routing is missing.';
    ELSE IF @CheckDate IS NULL
        SET @Error = 'Check date is missing.';

    -- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctId BIGINT,
                @EmpId INT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4),
                @BankRoutingId INT,
                @CustId BIGINT,
                @JointCustId varchar(50),
                @FirstName NVARCHAR(50),
                @MiddleName NVARCHAR(50),
                @LastName NVARCHAR(50),
                @ExpectedPayToOrderOf NVARCHAR(200),
                @ExpectedPayToOrderOfWithMiddleName NVARCHAR(200),
                @ExpectedPayToOrderOfWithMiddleInitial NVARCHAR(200),
                @JointFirstName NVARCHAR(50),
                @JointMiddleName NVARCHAR(50),
                @JointLastName NVARCHAR(50),
                @ExpectedJointPayToOrderOf NVARCHAR(200),
                @ExpectedJointPayToOrderOfWithMiddleName NVARCHAR(200),
                @ExpectedJointPayToOrderOfWithMiddleInitial NVARCHAR(200);

        -- Retrieve account and customer IDs
		SELECT @AcctId = ai.acct_id, 
			   @CustId = ah.cust_secondary_id, 
			   @JointCustId = ah.joint_cust_secondary_id
		FROM acct_info ai
		JOIN acct_holders ah ON ai.acct_id = ah.acct_id
		WHERE ai.acct_num = @AcctNum;

        -- Retrieve the account ID and customer's full name based on the customer ID or joint customer ID
        SELECT 
            @FirstName = RTRIM(LTRIM(first_name)),
            @MiddleName = RTRIM(LTRIM(middle_name)),
            @LastName = RTRIM(LTRIM(last_name)),
            @JointFirstName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(first_name)) ELSE @JointFirstName END,
            @JointMiddleName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(middle_name)) ELSE @JointMiddleName END,
            @JointLastName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(last_name)) ELSE @JointLastName END
        FROM 
            cust_info
        WHERE 
            cust_secondary_id IN (@CustId, @JointCustId);

		IF @CustId IS NULL
			SET @Error = 'Customer ID not found.';
		ELSE IF @FirstName IS NULL
			SET @Error = 'Customer first name not found.';
		ELSE IF @LastName IS NULL
			SET @Error = 'Customer last name not found.';

		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END

		-- Prepare expected names for primary account holder
		SET @ExpectedPayToOrderOf = @FirstName + ' ' + @LastName;

		-- Check if the middle name or initial is present for primary account holder
		IF LEN(@MiddleName) > 0 
		BEGIN
			-- If middle name is present, check both full middle name and initial formats for primary account holder
			SET @ExpectedPayToOrderOfWithMiddleName = @FirstName + ' ' + @MiddleName + ' ' + @LastName;
			SET @ExpectedPayToOrderOfWithMiddleInitial = @FirstName + ' ' + LEFT(@MiddleName, 1) + ' ' + @LastName;
		END

		-- Prepare expected names for joint account holder
		SET @ExpectedJointPayToOrderOf = @JointFirstName + ' ' + @JointLastName;

		-- Check if the middle name or initial is present for joint account holder
		IF LEN(@JointMiddleName) > 0 
		BEGIN
			-- If middle name is present, check both full middle name and initial formats for joint account holder
			SET @ExpectedJointPayToOrderOfWithMiddleName = @JointFirstName + ' ' + @JointMiddleName + ' ' + @JointLastName;
			SET @ExpectedJointPayToOrderOfWithMiddleInitial = @JointFirstName + ' ' + LEFT(@JointMiddleName, 1) + ' ' + @JointLastName;
		END

		IF NOT (
			LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOf)
			OR (LEN(@MiddleName) > 0 AND (
				LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOfWithMiddleName)
				OR LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOfWithMiddleInitial)
			))
			OR LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOf)
			OR (LEN(@JointMiddleName) > 0 AND (
				LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOfWithMiddleName)
				OR LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOfWithMiddleInitial)
			))
		)
		BEGIN
			SET @Error = 'The pay to order of value does not match the account holder''s name.';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END

        -- Retrieve the employee ID based on the rep_id
        SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

        -- Retrieve current account balance
        SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

        -- Retrieve the bank routing ID based on the routing number
        SELECT @BankRoutingId = bank_routing_id from LU_bank_routing WHERE routing_num = @CheckRouting;

        -- Calculate new balance
        SET @NewBalance = @CurrentBalance + @DepAmt;

        IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
        ELSE IF @NewBalance IS NULL
			SET @Error = 'New balance not found.';
        ELSE IF @BankRoutingId IS NULL
			SET @Error = 'Bank routing ID not found.';
		
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
        IF @AcctId IS NOT NULL AND 
		   @EmpId IS NOT NULL
        BEGIN
            -- Insert the transaction into the acct_transaction table
            INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
            VALUES (@AcctId, 12, @DepAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

            DECLARE @TransactionId BIGINT = SCOPE_IDENTITY();

            IF @TransactionId IS NULL
            BEGIN
                SET @Error = 'Transaction ID not found.';
                RAISERROR(@Error, 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END

            -- Insert the check deposit details into the acct_transaction_deposit_check table
            INSERT INTO acct_transaction_check (acct_transaction_id, payer_name, pay_to_order_of, check_routing_id, check_acct_num, check_num, check_date, memo)
            VALUES (@TransactionId, @PayerName, @PayToOrderOf, @BankRoutingId, @CheckAcctNum, @CheckNum, @CheckDate, @Memo);

            -- Update the account balance in the acct_bal table
            UPDATE acct_bal
            SET acct_balance = @NewBalance
            WHERE acct_id = @AcctId;

            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- If no account ID or employee ID was found, raise an error
			SET @Error = 'Account number or Rep ID not found.';
            RAISERROR(@Error, 16, 1)
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of error
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionCheckDepositSingleCheckSplitByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionCheckDepositSingleCheckSplitByAcctNum]
		@TotalCheckAmt DECIMAL(18,4),
		@RepId VARCHAR(5),
		@PayerName VARCHAR(200),
		@PayToOrderOf VARCHAR(200),
		@CheckAcctNum VARCHAR(50),
		@CheckNum VARCHAR(10),
		@CheckRouting VARCHAR(9),
		@CheckDate DATE,
		@Memo VARCHAR(100) = NULL,
		@SplitCheckDetails DepositSingleCheckMultipleAccount READONLY
	AS
	BEGIN
		SET NOCOUNT ON;
		SET XACT_ABORT ON;


		DECLARE @Error NVARCHAR(4000);
		
		IF @TotalCheckAmt IS NULL
			SET @Error = 'Total check amount is missing.';
		ELSE IF @TotalCheckAmt <= 0
			SET @Error = 'Total check amount must be greater than zero.';
		ELSE IF @RepId IS NULL
			SET @Error = 'Representative ID is missing.';
		ELSE IF @PayerName IS NULL
			SET @Error = 'Payer name is missing.';
		ELSE IF @PayToOrderOf IS NULL
			SET @Error = 'Pay to order of is missing.';
		ELSE IF @CheckAcctNum IS NULL
			SET @Error = 'Check account number is missing.';
		ELSE IF @CheckNum IS NULL
			SET @Error = 'Check number is missing.';
		ELSE IF @CheckRouting IS NULL
			SET @Error = 'Check routing number is missing.';
		ELSE IF @CheckDate IS NULL
			SET @Error = 'Check data is missing.';
    
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

		BEGIN TRY
			BEGIN TRANSACTION;

			-- Loop through each deposit in the @Deposits table
			DECLARE split_checks CURSOR FOR 
				SELECT AcctNum, DepAmt
				FROM @SplitCheckDetails;
        
			DECLARE @AcctNum VARCHAR(14),
					@DepAmt DECIMAL(18,4),
					@SumofDeposits DECIMAL(18,4),
					@EmpId INT;
		
			OPEN split_checks;
			FETCH NEXT FROM split_checks INTO @AcctNum, @DepAmt;

			SELECT @SumOfDeposits = SUM(DepAmt) FROM @SplitCheckDetails;
    
			IF @SumOfDeposits <> @TotalCheckAmt
			BEGIN
				SET @Error = 'The sum of the deposits does not match the total check amount.';
				RETURN;
			END

			-- Retrieve the employee ID based on the rep_id
			SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

			IF @EmpId IS NULL
				SET @Error = 'Employee ID not found.';
		
			-- If any error message has been set, raise an error and exit
			IF NOT @Error IS NULL
			BEGIN
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF @DepAmt IS NULL
					SET @Error = 'Deposit amount is missing.';
				ELSE IF @AcctNum IS NULL
					SET @Error = 'Account number is missing.';
				ELSE IF @DepAmt <= 0
					SET @Error = 'Transaction amount must be greater than zero.';

				-- If any error message has been set, raise an error and exit
				IF NOT @Error IS NULL
				BEGIN
					RAISERROR(@Error, 16, 1);
					RETURN;
				END

				DECLARE @BankRoutingID INT,
						@AcctId BIGINT,
						@CurrentBalance DECIMAL(18, 4),
						@NewBalance DECIMAL(18, 4),
						@CustId BIGINT,
						@JointCustId varchar(50),
						@FirstName NVARCHAR(50),
						@MiddleName NVARCHAR(50),
						@LastName NVARCHAR(50),
						@ExpectedPayToOrderOf NVARCHAR(200),
						@ExpectedPayToOrderOfWithMiddleName NVARCHAR(200),
						@ExpectedPayToOrderOfWithMiddleInitial NVARCHAR(200),
						@JointFirstName NVARCHAR(50),
						@JointMiddleName NVARCHAR(50),
						@JointLastName NVARCHAR(50),
						@ExpectedJointPayToOrderOf NVARCHAR(200),
						@ExpectedJointPayToOrderOfWithMiddleName NVARCHAR(200),
						@ExpectedJointPayToOrderOfWithMiddleInitial NVARCHAR(200);
			
				-- Retrieve account ID based on acct_num
				SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

				-- Retrieve account and customer IDs
				SELECT @CustId = ah.cust_secondary_id, 
						@JointCustId = ah.joint_cust_secondary_id
				FROM acct_info ai
				JOIN acct_holders ah ON ai.acct_id = ah.acct_id
				WHERE ai.acct_num = @AcctNum;

				-- Retrieve the customer's full name based on the customer ID or joint customer ID
				SELECT 
					@FirstName = RTRIM(LTRIM(first_name)),
					@MiddleName = RTRIM(LTRIM(middle_name)),
					@LastName = RTRIM(LTRIM(last_name)),
					@JointFirstName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(first_name)) ELSE @JointFirstName END,
					@JointMiddleName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(middle_name)) ELSE @JointMiddleName END,
					@JointLastName = CASE WHEN cust_secondary_id = @JointCustId THEN RTRIM(LTRIM(last_name)) ELSE @JointLastName END
				FROM 
					cust_info
				WHERE 
					cust_secondary_id IN (@CustId, @JointCustId);

				IF @CustId IS NULL
					SET @Error = 'Customer ID could not be found.';
				ELSE IF @AcctId IS NULL
					SET @Error = 'Account ID could not be found.';
				ELSE IF @FirstName IS NULL
					SET @Error = 'Customer first name could not be found.';
				ELSE IF @LastName IS NULL
					SET @Error = 'Customer last name could not be found.';
			
				-- If any error message has been set, raise an error and exit
				IF NOT @Error IS NULL
				BEGIN
					RAISERROR(@Error, 16, 1);
					RETURN;
				END

				-- Prepare expected names for primary account holder
				SET @ExpectedPayToOrderOf = @FirstName + ' ' + @LastName;

				-- Check if the middle name or initial is present for primary account holder
				IF LEN(@MiddleName) > 0 
				BEGIN
					-- If middle name is present, check both full middle name and initial formats for primary account holder
					SET @ExpectedPayToOrderOfWithMiddleName = @FirstName + ' ' + @MiddleName + ' ' + @LastName;
					SET @ExpectedPayToOrderOfWithMiddleInitial = @FirstName + ' ' + LEFT(@MiddleName, 1) + ' ' + @LastName;
				END

				-- Prepare expected names for joint account holder
				SET @ExpectedJointPayToOrderOf = @JointFirstName + ' ' + @JointLastName;

				-- Check if the middle name or initial is present for joint account holder
				IF LEN(@JointMiddleName) > 0 
				BEGIN
					-- If middle name is present, check both full middle name and initial formats for joint account holder
					SET @ExpectedJointPayToOrderOfWithMiddleName = @JointFirstName + ' ' + @JointMiddleName + ' ' + @JointLastName;
					SET @ExpectedJointPayToOrderOfWithMiddleInitial = @JointFirstName + ' ' + LEFT(@JointMiddleName, 1) + ' ' + @JointLastName;
				END

				-- Compare PayToOrderOf with expected names for both primary and joint account holders
				IF NOT (
					LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOf)
					OR (LEN(@MiddleName) > 0 AND (
						LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOfWithMiddleName)
						OR LOWER(@PayToOrderOf) = LOWER(@ExpectedPayToOrderOfWithMiddleInitial)
					))
					OR LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOf)
					OR (LEN(@JointMiddleName) > 0 AND (
						LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOfWithMiddleName)
						OR LOWER(@PayToOrderOf) = LOWER(@ExpectedJointPayToOrderOfWithMiddleInitial)
					))
				)
				BEGIN
					SET @Error = 'The pay to order of value does not match the account holder''s name.';
					RAISERROR(@Error, 16, 1);
					ROLLBACK TRANSACTION;
					RETURN;
				END
			
				-- Retrieve current account balance
				SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;
            
				-- Retrieve the bank routing ID based on the routing number
				SELECT @BankRoutingId = bank_routing_id FROM LU_bank_routing WHERE routing_num = @CheckRouting;

				-- Calculate new balance
				SET @NewBalance = @CurrentBalance + @DepAmt;

				IF @CurrentBalance IS NULL
					SET @Error = 'Current balance not found.';
				ELSE IF @NewBalance IS NULL
					SET @Error = 'Updated balance not found.';
				ELSE IF @BankRoutingId IS NULL
					SET @Error = 'Bank routing ID not found.';
			
				-- If any error message has been set, raise an error and exit
				IF NOT @Error IS NULL
				BEGIN
					RAISERROR(@Error, 16, 1);
					RETURN;
				END

				INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
				VALUES (@AcctId, 12, @DepAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

				DECLARE @TransactionId BIGINT = SCOPE_IDENTITY();
			
				IF @TransactionId IS NULL
				BEGIN
					IF @TransactionId IS NULL
						SET @Error = 'Transaction ID not found.';
					RAISERROR(@Error, 16, 1);
					RETURN;
				END

				-- Insert the check deposit details into the acct_transaction_deposit_check table
				INSERT INTO acct_transaction_check (acct_transaction_id, payer_name, pay_to_order_of, check_routing_id, check_acct_num, check_num, check_date, memo)
				VALUES (@TransactionId, @PayerName, @PayToOrderOf, @BankRoutingId, @CheckAcctNum, @CheckNum, @CheckDate, @Memo);

				UPDATE acct_bal
				SET acct_balance = @NewBalance
				WHERE acct_id = @AcctId;

				FETCH NEXT FROM split_checks INTO @AcctNum, @DepAmt;
			END

			IF @@TRANCOUNT > 0
			BEGIN
				COMMIT TRANSACTION;
			END

			CLOSE split_checks;
			DEALLOCATE split_checks;

		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION;
			DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
			DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
			DECLARE @ErrorState INT = ERROR_STATE();

			RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		END CATCH;
	END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionCheckWithdrawalByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionCheckWithdrawalByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@WithrdawalAmt DECIMAL(18,4),
	@PayToOrderOf NVARCHAR(200),
    @CheckNum VARCHAR(10),
    @CheckDate DATE,
    @Memo VARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
        SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Representative ID is missing.';
    ELSE IF @WithrdawalAmt IS NULL
        SET @Error = 'Deposit amount is missing.';
	ELSE IF @WithrdawalAmt <= 0
		SET @Error = 'Deposit amount must be greater than 0.';
    ELSE IF @PayToOrderOf IS NULL
        SET @Error = 'Pay to order of is missing.';
	ELSE IF @CheckNum IS NULL
        SET @Error = 'Check number is missing.';
    ELSE IF @CheckDate IS NULL
        SET @Error = 'Check date is missing.';

    -- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctId BIGINT,
                @EmpId INT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4),
                @BankRoutingId INT,
				@PayerName NVARCHAR(200),
			    @CheckRouting VARCHAR(9) = '141359228';

        -- Retrieve account and customer IDs
		SELECT @AcctId = acct_id,
			   @PayerName = registration_name
		FROM acct_info
		WHERE acct_num = @AcctNum;

        -- Retrieve the employee ID based on the rep_id
        SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

        -- Retrieve current account balance
        SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

        -- Retrieve the bank routing ID based on the routing number
        SELECT @BankRoutingId = bank_routing_id from LU_bank_routing WHERE routing_num = @CheckRouting;

        -- Calculate new balance
        SET @NewBalance = @CurrentBalance - @WithrdawalAmt;

        IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
        ELSE IF @NewBalance IS NULL
			SET @Error = 'New balance not found.';
        ELSE IF @BankRoutingId IS NULL
			SET @Error = 'Bank routing ID not found.';
		
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
        IF @AcctId IS NOT NULL AND 
		   @EmpId IS NOT NULL
        BEGIN
            -- Insert the transaction into the acct_transaction table
            INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
            VALUES (@AcctId, 5, @WithrdawalAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

            DECLARE @TransactionId BIGINT = SCOPE_IDENTITY();

            IF @TransactionId IS NULL
            BEGIN
                SET @Error = 'Transaction ID not found.';
                RAISERROR(@Error, 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END

            -- Insert the check deposit details into the acct_transaction_deposit_check table
            INSERT INTO acct_transaction_check (acct_transaction_id, payer_name, pay_to_order_of, check_routing_id, check_acct_num, check_num, check_date, memo)
            VALUES (@TransactionId, @PayerName, @PayToOrderOf, @BankRoutingId, @AcctNum, @CheckNum, @CheckDate, @Memo);

            -- Update the account balance in the acct_bal table
            UPDATE acct_bal
            SET acct_balance = @NewBalance
            WHERE acct_id = @AcctId;

            COMMIT TRANSACTION;
        END
        ELSE
        BEGIN
            -- If no account ID or employee ID was found, raise an error
			SET @Error = 'Account number or Rep ID not found.';
            RAISERROR(@Error, 16, 1)
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of error
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionJournalByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionJournalByAcctNum]
    @AcctNum VARCHAR(14),
	@JournalAcctNum VARCHAR(14),
    @JournalAmt DECIMAL(18,4),
    @RepId VARCHAR(5)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);


	IF @AcctNum IS NULL
		SET @Error = 'From account number is missing.';
	ELSE IF @JournalAcctNum IS NULL
		SET @Error = 'To account number is missing.';
	ELSE IF @JournalAmt IS NULL
		SET @Error = 'Account number is missing.';
	ELSE IF @RepId IS NULL
		SET @Error = 'Rep ID is missing.';
	ELSE IF @JournalAmt <= 0
        SET @Error = 'Transaction amount must be greater than zero.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @AcctId BIGINT,
				@JournalAcctId BIGINT,
				@CustId BIGINT,
				@JournalCustId BIGINT,
				@EmpId INT,
				@CurrentBalance DECIMAL(18, 4),
				@JournalCurrentBalance DECIMAL(18, 4),
				@NewBalance DECIMAL(18, 4),
				@JournalNewBalance DECIMAL(18, 4),
				@ToTransactionId BIGINT,
				@FromTransactionId BIGINT;

		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;
		SELECT @JournalAcctId = acct_id FROM acct_info WHERE acct_num = @JournalAcctNum;

		-- Retrieve the customer ID based on the account number
		SELECT @CustId = cust_id FROM acct_info WHERE acct_id = @AcctId;
		SELECT @JournalCustId = cust_id FROM acct_info WHERE acct_id = @JournalAcctId;

		-- Ensure customer IDs don't match
		IF @CustId <> @JournalCustId
		BEGIN
		    RAISERROR('The customer IDs for the accounts do not match.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
		END

		IF @AcctId = @JournalAcctId
		BEGIN
			RAISERROR('You cannot journal between the same accounts.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
		END

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;
		SELECT @JournalCurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @JournalAcctId;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance - @JournalAmt;
		SET @JournalNewBalance = @JournalCurrentBalance + @JournalAmt;
		
		IF @CurrentBalance IS NULL
			SET @Error = 'From current balance not found.';
		ELSE IF @JournalCurrentBalance IS NULL
			SET @Error = 'To current balance not found.';
        ELSE IF @NewBalance IS NULL
			SET @Error = 'From new balance not found.';
        ELSE IF @JournalNewBalance IS NULL
			SET @Error = 'To new balance not found.';
		
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

		-- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 21, @JournalAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			SET @ToTransactionId = SCOPE_IDENTITY();

			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@JournalAcctId, 8, @JournalAmt, GETDATE(), @JournalCurrentBalance, @JournalNewBalance, @EmpId);

			SET @FromTransactionId = SCOPE_IDENTITY();

			INSERT INTO acct_transaction_journal (from_acct_transaction_id, from_acct_id, to_acct_transaction_id, to_acct_id)
			VALUES (@ToTransactionId, @AcctId, @FromTransactionId, @JournalAcctId);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			UPDATE acct_bal
			SET acct_balance = @JournalNewBalance
			WHERE acct_id = @JournalAcctId;
			
			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
            RAISERROR('Account number or Rep ID not found.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();
    
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionTradeBuyByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionTradeBuyByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@BidPrice DECIMAL(18,4),
	@TradeQuantity DECIMAL(18,4),
    @StockTicker VARCHAR(12)

AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
	ELSE IF @RepId IS NULL
		SET @Error = 'Rep ID is missing.';
	ELSE IF @BidPrice IS NULL
		SET @Error = 'Bid price is missing.';
	ELSE IF @BidPrice <= 0
        SET @Error = 'Bid price must be greater than zero.';
	ELSE IF @TradeQuantity IS NULL
		SET @Error = 'Trade quantity is missing.';
	ELSE IF @TradeQuantity <= 0
        SET @Error = 'Trade quantity must be greater than zero.';
	ELSE IF @StockTicker IS NULL
		SET @Error = 'Stock ticker is missing.';
	
	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Variables for internal use
        DECLARE @StockId INT,
                @CurrentPrice DECIMAL(18, 4),
                @StockExchangeId SMALLINT,
				@TransactionAmt DECIMAL(18,4),
                @TransactionId INT,
				@CustomerCurrencyID SMALLINT,
                @EmpId INT,
				@AcctId BIGINT,
				@CurrentBalance DECIMAL(18, 4),
				@NewBalance DECIMAL(18, 4),
				@TradeFees DECIMAL(18,4),
				@TradeFeeID INT,
				@TradeStatus TINYINT,
				@ExchangeRate DECIMAL(18,4),
				@ConvertedAmt DECIMAL(18,4),
				@UsdPrice DECIMAL(18,4),
				@NetAmt DECIMAL(18,4),
				@ExchangeCurrencyID VARCHAR(3),
				@StockType TINYINT,
				@LocalAverageCost DECIMAL(18, 4);
		
		
		-- Retrieve the account ID and customer currency based on the account number
		SELECT @AcctId = acct_id,
			   @CustomerCurrencyID = currency_id
		FROM acct_info
		WHERE acct_num = @AcctNum;

		-- Retrieve the stock's exchange currency and exchange rate.
		SELECT 
            @StockId = sl.stock_id,
			@CurrentPrice = sl.current_price,
			@StockType = sl.stock_type_id,
            @StockExchangeId = sett.exchange_id,
			@ExchangeCurrencyID = se.exchange_currency,
            @ExchangeRate = c.exchange_rate,
			@TradeFees = sf.fee_amt,
			@TradeFeeID = sf.stock_fee_id
        FROM LU_stock_list sl
        INNER JOIN LU_stock_exchange_to_ticker sett ON sl.stock_id = sett.stock_id
        INNER JOIN LU_stock_exchange se ON sett.exchange_id = se.stock_exchange_id
        INNER JOIN LU_currency c ON se.exchange_currency = c.currency_id
		INNER JOIN LU_stock_fees sf ON sl.stock_type_id = sf.stock_type_id
        WHERE sl.stock_ticker = @StockTicker;

		-- Set transaction amounts.
		SET @TransactionAmt = @BidPrice * @TradeQuantity
		SET @LocalAverageCost = @CurrentPrice

		-- Convert net amount to the stock's exchange currency if different from the customer's trade currency.
		IF @ExchangeCurrencyID <> @CustomerCurrencyID
        BEGIN
            SET @UsdPrice = @CurrentPrice / @ExchangeRate
        END
        ELSE
        BEGIN
            SET @UsdPrice = @CurrentPrice
        END
		
		-- Set net amount after fees.
        SET @NetAmt = @TransactionAmt + @TradeFees;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		IF @CurrentBalance IS NULL
		BEGIN
			RAISERROR ('Current balance not found.', 16, 1);
			RETURN;
		END

		-- Update balance and validate sufficient funds
		SET @NewBalance = @CurrentBalance - @NetAmt;
		
		IF @NewBalance < 0
		BEGIN
			RAISERROR ('Insufficient funds for this transaction.', 16, 1);
			RETURN;
		END

		-- Set trade status
		IF @BidPrice < @UsdPrice  * .99
		BEGIN
			SET @TradeStatus = 3; -- Failed
		END
		ELSE IF @BidPrice >= @UsdPrice 
		BEGIN
			SET @TradeStatus = 5; -- Settled
		END
		ELSE
		BEGIN
			SET @TradeStatus = 1; -- Pending
		END

        -- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Check if we have found an account ID and an employee ID
        IF @AcctId IS NOT NULL AND 
		   @EmpId IS NOT NULL
        BEGIN
			IF @TradeStatus = 3 OR
			   @TradeStatus = 4
			BEGIN
				-- Insert into acct_transaction table
				INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
				VALUES (@AcctId, 3, 0.0000, GETDATE(), @CurrentBalance, @CurrentBalance, @EmpId);

				SET @TransactionId = SCOPE_IDENTITY();

				IF @TransactionId IS NULL
				BEGIN
					IF @TransactionId IS NULL
						SET @Error = 'Transaction ID not found.';
					RAISERROR(@Error, 16, 1);
					RETURN;
				END
		
				-- Insert into acct_trade table
				INSERT INTO acct_transaction_trade (acct_transaction_id, stock_exchange, stock_id, trade_quantity, trade_price, trade_status, trade_fee, trade_currency_id)
				VALUES (@TransactionId, @StockExchangeId, @StockId, @TradeQuantity, @UsdPrice , @TradeStatus, @TradeFeeID, @CustomerCurrencyID);

			END
			ELSE
			BEGIN
				-- Insert into acct_transaction table
				INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
				VALUES (@AcctId, 3, @NetAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

				SET @TransactionId = SCOPE_IDENTITY();

				IF @TransactionId IS NULL
				BEGIN
					IF @TransactionId IS NULL
						SET @Error = 'Transaction ID not found.';
					RAISERROR(@Error, 16, 1);
					RETURN;
				END
		
				-- Insert into acct_trade table
				INSERT INTO acct_transaction_trade (acct_transaction_id, stock_exchange, stock_id, trade_quantity, trade_price, trade_status, trade_fee, trade_currency_id)
				VALUES (@TransactionId, @StockExchangeId, @StockId, @TradeQuantity, @UsdPrice , @TradeStatus, @TradeFeeID, @CustomerCurrencyID);

				-- Update the account balance in the acct_bal table
				UPDATE acct_bal
				SET acct_balance = @NewBalance
				WHERE acct_id = @AcctId;

				-- Check if the stock_id already exists in acct_holding for the given acct_id
				IF EXISTS (SELECT 1 FROM acct_holding WHERE stock_id = @StockId AND acct_id = @AcctId)
				BEGIN
					-- Calculate the total new quantity and new average cost
					DECLARE @OldQuantity DECIMAL(18, 4),
							@OldAverageCost DECIMAL(18, 4),
							@TotalCost DECIMAL(18, 4),
							@NewQuantity DECIMAL(18, 4),
							@NewLocalAverageCost DECIMAL(18, 4),
							@NewAverageCost DECIMAL(18, 4);

					SELECT @OldQuantity = quantity,
						   @OldAverageCost = average_cost
					FROM acct_holding
					WHERE stock_id = @StockId AND acct_id = @AcctId;

					IF @UsdPrice IS NULL OR @ExchangeRate IS NULL
					BEGIN
						SET @Error = 'Trade price or exchange rate is missing.';
						RAISERROR(@Error, 16, 1);
						RETURN;
					END

					SET @TotalCost = (@OldQuantity * @OldAverageCost) + (@TradeQuantity * @UsdPrice);
					SET @NewQuantity = @OldQuantity + @TradeQuantity;
					SET @NewAverageCost = @TotalCost / @NewQuantity;
					SET @NewLocalAverageCost = @NewAverageCost * @ExchangeRate;
				
					-- Update existing record
					UPDATE acct_holding 
					SET quantity = @NewQuantity, 
						average_cost = @NewAverageCost,
						local_average_cost = @NewLocalAverageCost
					WHERE stock_id = @StockId AND acct_id = @AcctId;
				END
				ELSE
				BEGIN
					-- Insert new holding record
					INSERT INTO acct_holding (acct_id, stock_id, quantity, average_cost, local_average_cost)
					VALUES (@AcctId, @StockId, @TradeQuantity, @TransactionAmt, @LocalAverageCost);
				END
			END
			COMMIT TRANSACTION;
		END
        ELSE
        BEGIN
            -- If no account ID or employee ID was found, raise an error
			SET @Error = 'Account number or Rep ID not found.';
            RAISERROR(@Error, 16, 1)
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionTradeSellByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionTradeSellByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@SellPrice DECIMAL(18,4),
    @TradeQuantity DECIMAL(18,4),
    @StockTicker VARCHAR(12)

AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
	ELSE IF @RepId IS NULL
		SET @Error = 'Rep ID is missing.';
	ELSE IF @SellPrice IS NULL
		SET @Error = 'Sell price is missing.';
	ELSE IF @SellPrice<= 0
        SET @Error = 'Sell price must be greater than zero.';
	ELSE IF @TradeQuantity IS NULL
		SET @Error = 'Transaction amount is missing.';
	ELSE IF @TradeQuantity <= 0
        SET @Error = 'Transaction amount must be greater than zero.';
	ELSE IF @StockTicker IS NULL
		SET @Error = 'Stock ticker is missing.';
	
	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Variables for internal use
        DECLARE @StockId INT,
                @CurrentPrice DECIMAL(18, 4),
                @StockExchangeId SMALLINT,
				@TransactionAmt DECIMAL(18,4),
                @TransactionId BIGINT,
				@CustomerCurrencyID SMALLINT,
                @EmpId INT,
				@AcctId BIGINT,
				@CurrentBalance DECIMAL(18, 4),
				@NewBalance DECIMAL(18, 4),
				@TradeStatus TINYINT,
				@TradeFeeID INT,
				@ExchangeRate DECIMAL(18,4),
				@ConvertedAmt DECIMAL(18,4),
				@UsdPrice DECIMAL(18,4),
				@NetAmt DECIMAL(18,4),
				@ExchangeCurrencyID VARCHAR(3),
				@StockType TINYINT,
				@AvailableQuantity DECIMAL(18,4),
				@LocalAverageCost DECIMAL(18, 4);

		-- Retrieve the account ID and customer currency  based on the account number
		SELECT @AcctId = acct_id,
			   @CustomerCurrencyID = currency_id
		FROM acct_info
		WHERE acct_num = @AcctNum;

		-- Retrieve the stock's exchange currency and exchange rate.
		SELECT 
            @StockId = sl.stock_id,
			@CurrentPrice = sl.current_price,
			@StockType = sl.stock_type_id,
            @StockExchangeId = sett.exchange_id,
			@ExchangeCurrencyID = se.exchange_currency,
            @ExchangeRate = lc.exchange_rate,
			@TradeFeeID = sf.stock_fee_id
        FROM LU_stock_list sl
        INNER JOIN LU_stock_exchange_to_ticker sett ON sl.stock_id = sett.stock_id
        INNER JOIN LU_stock_exchange se ON sett.exchange_id = se.stock_exchange_id
        INNER JOIN LU_currency lc ON se.exchange_currency = lc.currency_id
		INNER JOIN LU_stock_fees sf ON sl.stock_type_id = sf.stock_type_id
        WHERE sl.stock_ticker = @StockTicker;

		-- Set transaction amount.
		SET @TransactionAmt = @SellPrice * @TradeQuantity
		SET @LocalAverageCost = @CurrentPrice

		-- Convert net amount to the stock's exchange currency if different from USD.
		IF @ExchangeCurrencyID <> @CustomerCurrencyID
        BEGIN
            SET @UsdPrice = @CurrentPrice * @ExchangeRate;
        END
        ELSE
        BEGIN
            SET @UsdPrice = @CurrentPrice;
        END
		
		-- Set net amount after fees.
        SET @NetAmt = @TransactionAmt;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		IF @CurrentBalance IS NULL
		BEGIN
			RAISERROR ('Current balance not found.', 16, 1);
			RETURN;
		END

		-- Update balance and validate sufficient funds
		SET @NewBalance = @CurrentBalance + @NetAmt;

		SELECT @AvailableQuantity = quantity
		FROM acct_holding
		WHERE acct_id = @AcctId AND stock_id = @StockId;

		IF @AvailableQuantity IS NULL
		BEGIN
			SET @Error = 'There are no shares of this stock to sell.';
			RAISERROR(@Error, 16, 1);
			RETURN;
		END
		ELSE IF @AvailableQuantity < @TradeQuantity
		BEGIN
			SET @Error = 'Insufficient shares to sell.';
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

		-- Set trade status
		IF @SellPrice > @UsdPrice / .99
		BEGIN
			SET @TradeStatus = 3; -- Failed
		END
		ELSE IF @SellPrice <= @UsdPrice
		BEGIN
			SET @TradeStatus = 5; -- Settled
		END
		ELSE
		BEGIN
			SET @TradeStatus = 1; -- Pending
		END

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;;

		-- Check if we have found an account ID and an employee ID
        IF @AcctId IS NOT NULL AND 
		   @EmpId IS NOT NULL
        BEGIN
			IF @TradeStatus = 3 OR
			   @TradeStatus = 4
			BEGIN
				-- Insert into acct_transaction table
				INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
				VALUES (@AcctId, 4, 0.0000, GETDATE(), @CurrentBalance, @CurrentBalance, @EmpId);

				SET @TransactionId = SCOPE_IDENTITY();

				IF @TransactionId IS NULL
				BEGIN
					IF @TransactionId IS NULL
						SET @Error = 'Transaction ID not found.';
					RAISERROR(@Error, 16, 1);
					RETURN;
				END
		
				-- Insert into acct_trade table
				INSERT INTO acct_transaction_trade (acct_transaction_id, stock_exchange, stock_id, trade_quantity, trade_price, trade_status, trade_fee, trade_currency_id)
				VALUES (@TransactionId, @StockExchangeId, @StockId, @TradeQuantity, @UsdPrice, @TradeStatus, @TradeFeeID, @CustomerCurrencyID);

			END
			ELSE
			BEGIN
				-- Insert into acct_transaction table
				INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
				VALUES (@AcctId, 4, @NetAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

				SET @TransactionId = SCOPE_IDENTITY();

				IF @TransactionId IS NULL
				BEGIN
					IF @TransactionId IS NULL
						SET @Error = 'Transaction ID not found.';
					RAISERROR(@Error, 16, 1);
					RETURN;
				END

				-- Insert into acct_trade table
				INSERT INTO acct_transaction_trade (acct_transaction_id, stock_exchange, stock_id, trade_quantity, trade_price, trade_status, trade_fee, trade_currency_id)
				VALUES (@TransactionId, @StockExchangeId, @StockId, @TradeQuantity, @UsdPrice, @TradeStatus, @TradeFeeID, @CustomerCurrencyID);

				-- Update the account balance in the acct_bal table
				UPDATE acct_bal
				SET acct_balance = @NewBalance
				WHERE acct_id = @AcctId;

				-- Check if the stock_id already exists in acct_holdings for the given acct_id
				IF EXISTS (SELECT 1 FROM acct_holding WHERE stock_id = @StockId AND acct_id = @AcctId)
				BEGIN
					-- Calculate the total new quantity and new average cost
					DECLARE @OldQuantity DECIMAL(18, 4),
							@OldAverageCost DECIMAL(18, 4),
							@TotalCost DECIMAL(18, 4),
							@NewQuantity DECIMAL(18, 4),
							@NewLocalAverageCost DECIMAL(18, 4),
							@NewAverageCost DECIMAL(18, 4)

					SELECT @OldQuantity = quantity,
						   @OldAverageCost = average_cost
					FROM acct_holding 
					WHERE stock_id = @StockId AND acct_id = @AcctId;

					SET @TotalCost = (@OldQuantity * @OldAverageCost) - (@TradeQuantity * @UsdPrice);
					SET @NewQuantity = @OldQuantity - @TradeQuantity;
					SET @NewAverageCost = CASE 
											  WHEN @NewQuantity <> 0 THEN @TotalCost / @NewQuantity 
											  ELSE @OldAverageCost
										  END;
					SET @NewLocalAverageCost = @NewAverageCost * @ExchangeRate;

					-- Update existing record
					UPDATE acct_holding
					SET quantity = @NewQuantity, 
						average_cost = @NewAverageCost,
						local_average_cost = @NewLocalAverageCost
					WHERE stock_id = @StockId AND acct_id = @AcctId;
				END
				ELSE
				BEGIN
					SET @Error = 'Account holding doesn''t exist.';
				END
			END

			COMMIT TRANSACTION;
		END
        ELSE
        BEGIN
            -- If no account ID or employee ID was found, raise an error
			SET @Error = 'Account number or Rep ID not found.';
            RAISERROR(@Error, 16, 1)
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionWireDepositByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionWireDepositByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@WireAcctNum VARCHAR(50),
    @TransAmt DECIMAL(18,4),
    @WireRoutingNum VARCHAR(9),
	@WireCurrency VARCHAR(3)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Rep ID is missing.';
	ELSE IF @WireAcctNum IS NULL
        SET @Error = 'Wire account number is missing.';
    ELSE IF @TransAmt IS NULL
        SET @Error = 'Transaction amount is missing.';
	ELSE IF @TransAmt <= 0
        SET @Error = 'Transaction amount must be greater than zero.';
    ELSE IF @WireRoutingNum IS NULL
        SET @Error = 'Wire routing number is missing.';
	ELSE IF @WireCurrency IS NULL
        SET @Error = 'Wire routing number is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctAchId BIGINT,
                @AcctId BIGINT,
				@EmpId INT,
				@WireAmt DECIMAL(18, 4),
                @CurrentBalance DECIMAL(18, 4),
				@WireCurrencyID SMALLINT,
                @NewBalance DECIMAL(18, 4),
                @TransactionId BIGINT,
				@BankRoutingId INT,
				@WireFees DECIMAL(18,4) = 25.0000;
		
		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

        -- Retrieve the acct_ach_id based on the bank account number and routing number
		SELECT @BankRoutingId = bank_routing_id FROM LU_bank_routing WHERE routing_num = @WireRoutingNum;

		-- Ensure the ACH account exists
        IF @BankRoutingId IS NULL
            SET @Error = 'Wire routing number not found.';
        
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END
		
		-- Retrieve currency ID by currency abbreviation
		SELECT @WireCurrencyID = currency_id from LU_currency where currency_abbr = @WireCurrency;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		SET @WireAmt = @TransAmt - @WireFees;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance + @TransAmt;
		
		IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
		ELSE IF @NewBalance IS NULL
			SET @Error= 'New balance not found.';
		ELSE IF @BankRoutingId IS NULL
			SET @Error= 'Bank routing ID not found.';
		
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 19, @TransAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			SET @TransactionId = SCOPE_IDENTITY();

			-- Insert the transaction detail into the acct_transaction_ach table
			INSERT INTO acct_transaction_wire (acct_transaction_id, wire_routing_id, wire_acct_num, wire_amt, wire_fee, wire_currency_id)
			VALUES (@TransactionId, @BankRoutingId, @WireAcctNum, @WireAmt, 25.0000, @WireCurrencyID);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
			RAISERROR('Account number or Rep ID not found.', 16, 1);
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_InsertAcctTransactionWireWithdrawalByAcctNum]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_InsertAcctTransactionWireWithdrawalByAcctNum]
    @AcctNum VARCHAR(14),
    @RepId VARCHAR(5),
	@WireAcctNum VARCHAR(50),
    @TransAmt DECIMAL(18,4),
    @WireRoutingNum VARCHAR(9),
	@WireCurrency VARCHAR(3)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @Error NVARCHAR(4000);

    IF @AcctNum IS NULL
		SET @Error = 'Account number is missing.';
    ELSE IF @RepId IS NULL
        SET @Error = 'Rep ID is missing.';
	ELSE IF @WireAcctNum IS NULL
        SET @Error = 'Wire account number is missing.';
    ELSE IF @TransAmt IS NULL
        SET @Error = 'Transaction amount is missing.';
	ELSE IF @TransAmt <= 0
        SET @Error = 'Transaction amount must be greater than zero.';
    ELSE IF @WireRoutingNum IS NULL
        SET @Error = 'Wire routing number is missing.';
	ELSE IF @WireCurrency IS NULL
        SET @Error = 'Wire routing number is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AcctAchId BIGINT,
                @AcctId BIGINT,
				@EmpId INT,
				@WireAmt DECIMAL(18, 4),
				@WireCurrencyID SMALLINT,
                @CurrentBalance DECIMAL(18, 4),
                @NewBalance DECIMAL(18, 4),
                @TransactionId BIGINT,
				@BankRoutingId INT,
				@WireFees DECIMAL(18,4) = 25.0000;
		
		-- Retrieve the account ID based on the account number
		SELECT @AcctId = acct_id FROM acct_info WHERE acct_num = @AcctNum;

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

        -- Retrieve the acct_ach_id based on the bank account number and routing number
		SELECT @BankRoutingId = bank_routing_id FROM LU_bank_routing WHERE routing_num = @WireRoutingNum;

		-- Ensure the ACH account exists
        IF @BankRoutingId IS NULL
            SET @Error = 'Wire routing number not found.';
        
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END
		
		-- Retrieve currency ID by currency abbreviation
		SELECT @WireCurrencyID = currency_id from LU_currency where currency_abbr = @WireCurrency;

		-- Retrieve current account balance
		SELECT @CurrentBalance = acct_balance FROM acct_bal WHERE acct_id = @AcctId;

		SET @WireAmt = @TransAmt - @WireFees;

		-- Calculate new balance
		SET @NewBalance = @CurrentBalance - @TransAmt;
		
		IF @CurrentBalance IS NULL
			SET @Error = 'Current balance not found.';
		ELSE IF @NewBalance IS NULL
			SET @Error= 'New balance not found.';
		ELSE IF @BankRoutingId IS NULL
			SET @Error= 'Bank routing ID not found.';
		
		-- If any error message has been set, raise an error and exit
		IF NOT @Error IS NULL
		BEGIN
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

        -- Check if we have found an account ID and an employee ID
		IF @AcctId IS NOT NULL AND @EmpId IS NOT NULL
		BEGIN
			-- Insert the transaction into the acct_transaction table
			INSERT INTO acct_transaction (acct_id, transaction_type, transaction_amt, transaction_date, pre_bal, post_bal, emp_id)
			VALUES (@AcctId, 11, @TransAmt, GETDATE(), @CurrentBalance, @NewBalance, @EmpId);

			SET @TransactionId = SCOPE_IDENTITY();

			-- Insert the transaction detail into the acct_transaction_ach table
			INSERT INTO acct_transaction_wire (acct_transaction_id, wire_routing_id, wire_acct_num, wire_amt, wire_fee, wire_currency_id)
			VALUES (@TransactionId, @BankRoutingId, @WireAcctNum, @WireAmt, 25.0000, @WireCurrencyID);

			-- Update the account balance in the acct_bal table
			UPDATE acct_bal
			SET acct_balance = @NewBalance
			WHERE acct_id = @AcctId;

			COMMIT TRANSACTION;
		END
		ELSE
		BEGIN
			-- If no account ID or employee ID was found, raise an error
			RAISERROR('Account number or Rep ID not found.', 16, 1);
		END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Acct_Search]    Script Date: 4/21/2024 5:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Acct_Search]
    @CustSecondaryId VARCHAR(50) = NULL,
    @CustTaxId NVARCHAR(20) = NULL,
    @AcctNum NVARCHAR(14) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @FormattedTaxId VARCHAR(11),
			@PrimaryId VARCHAR(50),
			@JointId VARCHAR(50),
			@TaxIdHash VARBINARY(64),
			@EncryptedTaxId VARBINARY(MAX),
			@ErrorMessage NVARCHAR(4000);

	IF CHARINDEX('-', @CustTaxId) = 0
	BEGIN
		-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
		SET @FormattedTaxId = SUBSTRING(@CustTaxId, 1, 3) + '-' +
								SUBSTRING(@CustTaxId, 4, 2) + '-' +
								SUBSTRING(@CustTaxId, 6, 4);
	END
	ELSE
	BEGIN
		SET @FormattedTaxId = @CustTaxId;
	END


	-- Check for errors in parameter lengths
    IF (@CustSecondaryId IS NOT NULL AND LEN(@CustSecondaryId) <> 12)
        OR (@AcctNum IS NOT NULL AND (LEN(@AcctNum) <> 10 AND LEN(@AcctNum) <> 14))
        OR (@CustTaxId IS NOT NULL AND LEN(@CustTaxId) <> 9 AND LEN(@CustTaxId) <> 11)
    BEGIN
		-- Return an error message
		SET @ErrorMessage = 'Customer ID must be 12 characters long.' + CHAR(13) + CHAR(10) +
							'Account Number must be 10 or 14 digits.' + CHAR(13) + CHAR(10) +
							'Customer Tax ID must be 9 digits.';
		RAISERROR (@ErrorMessage, 16, 1);
		RETURN;
	END


	IF @CustTaxId IS NOT NULL
        SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);
	
	
	IF (@CustTaxId IS NOT NULL)
	BEGIN
		SELECT ai.acct_num AS 'Acct Num',
		   CONCAT(ci.first_name, ' ', ci.last_name) AS 'First & Last Name',
		   ah.cust_secondary_id AS 'Cust Id',
		   ah.joint_cust_secondary_id AS 'Joint Cust Id',
		   CONCAT(ac.contact_address, ' ', ac.contact_address_2) AS 'Address',
		   c.city_name AS 'City',
		   st.state_abbr AS 'State',
		   RIGHT('00000' + CAST(c.postal_code AS VARCHAR(5)), 5) AS 'Zip',
		   ai.acct_type AS 'Acct Type'
		FROM cust_tax ct
		JOIN cust_info ci ON ct.cust_id = ci.cust_id
		JOIN acct_holders ah ON ci.cust_secondary_id = ah.cust_secondary_id OR ci.cust_secondary_id = ah.joint_cust_secondary_id
		JOIN acct_info ai ON ah.acct_id = ai.acct_id
		LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
		LEFT JOIN acct_contact ac on ac.acct_id = ai.acct_id
		LEFT JOIN LU_city c on c.city_id = ac.contact_city_id
		LEFT JOIN LU_state st on st.state_id = c.state_id
		WHERE (@CustTaxId IS NULL OR ct.cust_tax_id_hash = @TaxIdHash)
		  AND ai.acct_num IS NOT NULL
		ORDER BY ci.last_name ASC;
	END
	ELSE
	BEGIN
		SELECT ai.acct_num AS 'Acct Num',
			   CONCAT(ci.first_name, ' ', ci.last_name) AS 'First & Last Name',
			   ah.cust_secondary_id AS 'Cust Id',
			   ah.joint_cust_secondary_id AS 'Joint Cust Id',
			   CONCAT(ac.contact_address, ' ', ac.contact_address_2) AS 'Address',
			   c.city_name AS 'City',
			   st.state_abbr AS 'State',
			   RIGHT('00000' + CAST(c.postal_code AS VARCHAR(5)), 5) AS 'Zip',
			   ai.acct_type AS 'Acct Type'
		FROM cust_info ci
		LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
		LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
		LEFT JOIN acct_info ai ON ci.cust_id = ai.cust_id
		LEFT JOIN acct_contact ac on ac.acct_id = ai.acct_id
		LEFT JOIN LU_city c on c.city_id =  ac.contact_city_id
		LEFT JOIN LU_state st on st.state_id =  c.state_id
		LEFT JOIN acct_holders ah ON ai.acct_id = ah.acct_id
		WHERE (@CustSecondaryId IS NULL OR ah.cust_secondary_id = @CustSecondaryId OR ah.joint_cust_secondary_id = @CustSecondaryId)
			AND (@AcctNum IS NULL OR ai.acct_num = @AcctNum)
			AND ai.acct_num IS NOT NULL
		ORDER BY ci.last_name ASC;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Client_AddClient]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_AddClient]
	@CustTaxId VARCHAR(25),
	@FirstName NVARCHAR(200),
    @MiddleName NVARCHAR(200) = NULL,
    @LastName NVARCHAR(200),
    @Suffix VARCHAR(5) = NULL,
    @DateOfBirth DATE,
	@CustEmail NVARCHAR(200),
    @CustPhoneHome VARCHAR(15),
    @CustPhoneBusiness VARCHAR(15) = NULL,
    @CustAddress VARCHAR(200),
    @CustAddress2 VARCHAR(200) = NULL,
    @CustPostal VARCHAR(10),
	@EmploymentStatus VARCHAR(50),
    @EmployerName VARCHAR(200) = NULL,
    @Occupation VARCHAR(500) = NULL,
    @IdType VARCHAR(25),
    @IdStateName NVARCHAR(50),
    @IdNum VARCHAR(25),
    @IdExp VARCHAR(7),
    @MothersMaiden NVARCHAR(200),
	@VoiceAuth BIT = NULL,
    @DoNotCall BIT = NULL,
    @ShareAffiliates BIT = NULL,
	@RepId VARCHAR(5),
	@CustId BIGINT OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

    IF @CustTaxId IS NULL
		SET @Error = 'Tax ID is missing.';
    ELSE IF @FirstName IS NULL
		SET @Error = 'First name is missing.';
	ELSE IF @LastName IS NULL
		SET @Error = 'Last name is missing.';
    ELSE IF @DateOfBirth IS NULL
		SET @Error = 'Date of birth is missing.';
	ELSE IF @CustEmail IS NULL
		SET @Error = 'Email address is missing.';
    ELSE IF @CustPhoneHome IS NULL
		SET @Error = 'Phone number is missing.';
    ELSE IF @CustAddress IS NULL
		SET @Error = 'Address is missing.';
    ELSE IF @CustPostal IS NULL
		SET @Error = 'Postal code is missing.';
    ELSE IF @EmploymentStatus IS NULL
		SET @Error = 'Employment status is missing.';
    ELSE IF @IdType IS NULL
		SET @Error = 'ID type is missing.';
    ELSE IF @IdStateName IS NULL
		SET @Error = 'ID state is missing.';
    ELSE IF @IdNum IS NULL
		SET @Error = 'ID number is missing.';
    ELSE IF @IdExp IS NULL
		SET @Error = 'ID expiration is missing.';
    ELSE IF @MothersMaiden IS NULL
		SET @Error = 'Mother''s maiden name is missing.';
    ELSE IF @RepId IS NULL
		SET @Error = 'Rep ID is missing.';

	-- If any error message has been set, raise an error and exit
    IF NOT @Error IS NULL
    BEGIN
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;

		DECLARE @CustSecondaryId VARCHAR(50),
				@EmpId INT,
				@Attempt INT = 1,
				@MaxAttempts INT = 100,
				@CustCityID INT,
				@IdTypeId TINYINT,
				@FormattedTaxId VARCHAR(11),
				@TaxIdHash VARBINARY(64),
				@EncryptedTaxId VARBINARY(MAX),
				@EmploymentStatusID BIT,
				@CustIdStateId TINYINT,
				@UniqueIDGenerated BIT = 0;
				
		IF CHARINDEX('-', @CustTaxId) = 0
		BEGIN
			-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
			SET @FormattedTaxId = SUBSTRING(@CustTaxId, 1, 3) + '-' +
									SUBSTRING(@CustTaxId, 4, 2) + '-' +
									SUBSTRING(@CustTaxId, 6, 4);
		END
		ELSE
		BEGIN
			SET @FormattedTaxId = @CustTaxId;
		END

		-- Compute the hash of the formatted CustTaxId
		SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);

		-- Check to see if customer tax id is already created
		IF EXISTS (SELECT 1 FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)
		OR EXISTS (SELECT 1 FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)
		OR EXISTS (SELECT 1 FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
		BEGIN
			SET @Error = 'Customer Tax ID already exists';
			ROLLBACK TRANSACTION;
			RAISERROR(@Error, 16, 1);
			RETURN;
		END

		-- Retrieve the employee ID based on the rep_id
		SELECT @EmpId = emp_id FROM emp_rep_id WHERE rep_id = @RepId;

		-- Generate a unique cust_secondary_id
		WHILE @Attempt <= @MaxAttempts AND @UniqueIDGenerated = 0
		BEGIN
			SET @CustSecondaryId = RIGHT('0000000000' + CAST(CAST(FLOOR(RAND() * (999999999 - 10000000) + 10000000) AS BIGINT) AS VARCHAR(50)), 10);
        
			-- Check if the generated cust_secondary_id already exists
			IF NOT EXISTS (SELECT 1 FROM cust_info WHERE cust_secondary_id = @CustSecondaryId)
			AND NOT EXISTS (SELECT 1 FROM acct_bene WHERE bene_cust_id = @CustSecondaryId)
			AND NOT EXISTS (SELECT 1 FROM acct_poa WHERE poa_cust_id = @CustSecondaryId)
			BEGIN
				-- Remove leading zeroes from zip if applicable
				SET @CustPostal = STUFF(@CustPostal, 1, PATINDEX('%[^0]%', @CustPostal)-1, '')

				-- Get ZipId from LU_zip_codes
				SELECT @CustCityID = city_id FROM LU_city WHERE postal_code = @CustPostal;

				-- Get IdTypeId from LU_id_type
				SELECT @IdTypeId = id_type_id FROM LU_id_type WHERE id_type = @IdType;

				-- Get StateId from LU_state
				SELECT @CustIdStateId = state_id FROM LU_state WHERE state_name = @IdStateName;


				-- Insert data into cust_info table
				INSERT INTO cust_info (cust_secondary_id, first_name, middle_name, last_name, suffix, date_of_birth, client_since, emp_id)
				VALUES (@CustSecondaryId, @FirstName, @MiddleName, @LastName, @Suffix, @DateOfBirth, GETDATE(), @EmpId);
            
				SET @CustId = SCOPE_IDENTITY(); -- Get the ID of the inserted row
            
				-- Insert data into cust_contact table
				INSERT INTO cust_contact (cust_id, cust_email, cust_phone_home, cust_phone_business, cust_address, cust_address_2, cust_city_id)
				VALUES (@CustId, @CustEmail, @CustPhoneHome, @CustPhoneBusiness, @CustAddress, @CustAddress2, @CustCityID);
				
				-- Set EmploymentStatusId from EmploymentStatus
				IF LOWER(@EmploymentStatus) = 'employed'
				BEGIN
					SET @EmploymentStatusID = 1
				END
				ELSE IF LOWER(@EmploymentStatus) = 'unemployed'
				BEGIN
					SET @EmploymentStatusID = 0
				END


				IF @EmploymentStatusID = 0 AND (@EmployerName IS NOT NULL OR @Occupation IS NOT NULL)
				BEGIN
					SET @Error = 'Employment status is set to unemployed, so employer name and occupation should be empty.';
					RAISERROR(@Error, 16, 1);
					ROLLBACK TRANSACTION;
					RETURN;
				END

				IF @EmploymentStatusID = 1 AND (@EmployerName IS NULL OR @Occupation IS NULL)
				BEGIN
					SET @Error = 'Employment status is set to employed, so employer name and occupation should be not be missing.';
					RAISERROR(@Error, 16, 1);
					ROLLBACK TRANSACTION;
					RETURN;
				END
    
				-- Insert data into cust_emp table
				INSERT INTO cust_emp (cust_id, employment_status, employer_name, occupation)
				VALUES (@CustId, @EmploymentStatusID, @EmployerName, @Occupation);

				-- Insert data into cust_id table
				INSERT INTO cust_id (cust_id, id_type, id_state, id_num, id_exp, mothers_maiden)
				VALUES (@CustId, @IdTypeId, @CustIdStateId, @IdNum, @IdExp, @MothersMaiden);

				-- Insert data into cust_privacy table
				INSERT INTO cust_privacy (cust_id, voice_auth, do_not_call, share_affiliates)
				VALUES (@CustId, @VoiceAuth, @DoNotCall, @ShareAffiliates);

				-- Open the symmetric key for encryption
				OPEN SYMMETRIC KEY TaxEncryption
				DECRYPTION BY CERTIFICATE TaxCertificate;

				-- Encrypt the formatted CustTaxId
				SET @EncryptedTaxId = EncryptByKey(Key_GUID('TaxEncryption'), @FormattedTaxId);

				INSERT INTO cust_tax (cust_id, encrypted_cust_tax_id, cust_tax_id_hash)
				VALUES (@CustId, @EncryptedTaxId, @TaxIdHash);

				-- Close the symmetric key
				CLOSE SYMMETRIC KEY TaxEncryption;

				SET @UniqueIDGenerated = 1;
            END
			ELSE
			BEGIN
				SET @Attempt = @Attempt + 1; -- Increment attempt counter
			END
		END

		IF @UniqueIDGenerated = 0
		BEGIN
			SET @Error = 'Failed to generate a unique cust_secondary_id after ' + CAST(@MaxAttempts AS VARCHAR(10)) + ' attempts.';
			RAISERROR(@Error, 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END
		
		-- Commit transaction if all operations succeeded
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_EditClientContact]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_EditClientContact]
	@AcctNum VARCHAR(14),
	@CustEmail NVARCHAR(200) = NULL,
    @CustPhoneHome VARCHAR(15) = NULL,
	@CustPhoneBusiness VARCHAR(15) = NULL,
    @CustAddress NVARCHAR(200) = NULL,
    @CustAddress2 NVARCHAR(200) = NULL,
    @CustPostalCode VARCHAR(50) = NULL,
	@AllAccts BIT = 0
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@CustCityId INT,
					@CustId BIGINT,
					@BranchID INT,
					@CityLat DECIMAL(8, 5),
					@CityLon DECIMAL(8, 5)

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id, @CustId = cust_id FROM acct_info WHERE acct_num = @AcctNum;


			IF @AllAccts = 1
			BEGIN
				-- Remove leading zeroes from zip if applicable
				SET @CustPostalCode = STUFF(@CustPostalCode, 1, PATINDEX('%[^0]%', @CustPostalCode)-1, '')

				-- Get ZipId and city coordinates from LU_zip_codes
				SELECT @CustCityID = city_id, @CityLat = city_lat, @CityLon = city_lon FROM LU_city WHERE postal_code = @CustPostalCode;

				-- Find the closest location and set BranchID using a join to get the coordinates
				SELECT TOP 1 @BranchID = L.location_id
				FROM LU_comp_location L
				JOIN LU_city C ON L.city_id = C.city_id
				WHERE L.type_id = 2
				ORDER BY GEOGRAPHY::Point(C.city_lat, C.city_lon, 4326).STDistance(GEOGRAPHY::Point(@CityLat, @CityLon, 4326)) ASC;

				UPDATE cust_contact
				SET
					cust_email = ISNULL(@CustEmail, cust_email),
					cust_phone_home = ISNULL(@CustPhoneHome, cust_phone_home),
					cust_phone_business = ISNULL(@CustPhoneBusiness, cust_phone_business),
					cust_address = ISNULL(@CustAddress, cust_address),
					cust_address_2 = ISNULL(@CustAddress2, cust_address_2),
					cust_city_id = ISNULL(@CustCityID, cust_city_id)
				WHERE
					cust_id = @CustId

				UPDATE acct_branch
				SET
					acct_branch_id = ISNULL(@BranchId, ab.acct_branch_id)
				FROM acct_info ai
				JOIN acct_branch ab ON ai.acct_id = ab.acct_id
				WHERE ai.cust_id = @CustID;

				UPDATE acct_contact
				SET
					contact_address = ISNULL(@CustAddress, ac.contact_address),
					contact_address_2 = ISNULL(@CustAddress2, ac.contact_address_2),
					contact_city_id = ISNULL(@CustCityID, ac.contact_city_id)
				FROM acct_info ai
				JOIN acct_contact ac ON ai.acct_id = ac.acct_id
				WHERE ai.cust_id = @CustId;
			END
			ELSE
			BEGIN
				-- Remove leading zeroes from zip if applicable
				SET @CustPostalCode = STUFF(@CustPostalCode, 1, PATINDEX('%[^0]%', @CustPostalCode)-1, '')

				-- Get ZipId and city coordinates from LU_zip_codes
				SELECT @CustCityID = city_id, @CityLat = city_lat, @CityLon = city_lon FROM LU_city WHERE postal_code = @CustPostalCode;

				-- Find the closest location and set BranchID using a join to get the coordinates
				SELECT TOP 1 @BranchID = L.location_id
				FROM LU_comp_location L
				JOIN LU_city C ON L.city_id = C.city_id
				WHERE L.type_id = 2
				ORDER BY GEOGRAPHY::Point(C.city_lat, C.city_lon, 4326).STDistance(GEOGRAPHY::Point(@CityLat, @CityLon, 4326)) ASC;

				UPDATE cust_contact
				SET
					cust_email = ISNULL(@CustEmail, cust_email),
					cust_phone_home = ISNULL(@CustPhoneHome, cust_phone_home),
					cust_phone_business = ISNULL(@CustPhoneBusiness, cust_phone_business),
					cust_address = ISNULL(@CustAddress, cust_address),
					cust_address_2 = ISNULL(@CustAddress2, cust_address_2),
					cust_city_id = ISNULL(@CustCityID, cust_city_id)
				WHERE
					cust_id = @CustId;

			END
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_EditClientEmployment]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_EditClientEmployment]
	@AcctNum VARCHAR(14),
	@EmploymentStatus VARCHAR(50) = NULL,
    @EmployerName VARCHAR(200) = NULL,
    @Occupation VARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@EmploymentStatusID BIT,
					@CustId BIGINT

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id, @CustId = cust_id FROM acct_info WHERE acct_num = @AcctNum;

			-- Set EmploymentStatusId from EmploymentStatus
			IF LOWER(@EmploymentStatus) = 'employed'
			BEGIN
				SET @EmploymentStatusID = 1
			END
			ELSE IF LOWER(@EmploymentStatus) = 'unemployed'
			BEGIN
				SET @EmploymentStatusID = 0
			END


			IF @EmploymentStatusID = 0 AND (@EmployerName IS NOT NULL OR @Occupation IS NOT NULL)
			BEGIN
				SET @Error = 'Employment status is set to unemployed, so employer name and occupation should be empty.';
				RAISERROR(@Error, 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END
			ELSE
			IF @EmploymentStatusID = 1 AND (@EmployerName IS NULL OR @Occupation IS NULL)
			BEGIN
				SET @Error = 'Employment status is set to employed, so employer name and occupation should be not be missing.';
				RAISERROR(@Error, 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END
			ELSE
			IF @EmploymentStatusID = 0 AND (@EmployerName IS NULL AND @Occupation IS NULL)
			BEGIN
				UPDATE cust_emp
				SET
					employment_status = 0,
					employer_name = NULL,
					occupation = NULL
				WHERE
					cust_id = @CustId;
			END
			ELSE IF @EmploymentStatusID = 1 AND (@EmployerName IS NOT NULL AND @Occupation IS NOT NULL)
			BEGIN
				UPDATE cust_emp
				SET
					employment_status = ISNULL(@EmploymentStatusID, employment_status),
					employer_name = ISNULL(@EmployerName, employer_name),
					occupation = ISNULL(@Occupation, occupation)
				WHERE
					cust_id = @CustId;
			END
			ELSE
			BEGIN
				SET @Error = 'Employment status could not be set. Employer name and occupation must be named, or empty.';
				RAISERROR(@Error, 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_EditClientInfo]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_EditClientInfo]
	@AcctNum VARCHAR(14),
	@FirstName NVARCHAR(200) = NULL,
    @MiddleName NVARCHAR(200) = NULL,
    @LastName NVARCHAR(200) = NULL,
    @Suffix VARCHAR(5) = NULL,
	@DateOfBirth DATE = NULL,
	@VoiceAuth BIT = NULL,
    @DoNotCall BIT = NULL,
    @ShareAffiliates BIT = NULL,
	@IdType VARCHAR(25) = NULL,
    @IdStateName NVARCHAR(50) = NULL,
    @IdNum VARCHAR(25) = NULL,
    @IdExp VARCHAR(7) = NULL,
	@MothersMaiden NVARCHAR(200) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL
	BEGIN
		SET @Error = 'Account number is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@CustId BIGINT,
					@IdTypeId TINYINT,
					@CustIdStateId TINYINT,
					@AcctTypeId INT,
					@AcctType VARCHAR(75)

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id, @CustId = cust_id, @AcctTypeId = acct_type FROM acct_info WHERE acct_num = @AcctNum;

			SELECT @AcctType = acct_type FROM LU_acct_type WHERE acct_type_id = @AcctTypeId

			UPDATE cust_info
			SET
				first_name = ISNULL(@FirstName, first_name),
				middle_name = ISNULL(@MiddleName, middle_name),
				last_name = ISNULL(@LastName, last_name),
				suffix = ISNULL(@Suffix, suffix),
				date_of_birth = ISNULL(@DateOfBirth, date_of_birth)
			WHERE
				cust_id = @CustId;

			UPDATE cust_privacy
			SET
				voice_auth = ISNULL(@VoiceAuth, voice_auth),
				do_not_call = ISNULL(@DoNotCall, do_not_call),
				share_affiliates = ISNULL(@ShareAffiliates, share_affiliates)
			WHERE
				cust_id = @CustId;

			-- Get IdTypeId from LU_id_type
			SELECT @IdTypeId = id_type_id FROM LU_id_type WHERE id_type = @IdType;

			-- Get StateId from LU_state
			SELECT @CustIdStateId = state_id FROM LU_state WHERE state_name = @IdStateName;

			UPDATE cust_id
			SET
				id_type = ISNULL(@IdTypeId, id_type),
				id_state = ISNULL(@CustIdStateId, id_state),
				id_num = ISNULL(@IdNum, id_num),
				id_exp = ISNULL(@IdExp, id_exp),
				mothers_maiden = ISNULL(@MothersMaiden, mothers_maiden)
			WHERE
				cust_id = @CustId;

			UPDATE acct_info
			SET
				registration_name = NULLIF(CONCAT_WS(' ', @FirstName, @LastName, @Suffix, @AcctType), '')
			WHERE cust_id = @CustId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_EditClientTax]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_EditClientTax]
	@AcctNum VARCHAR(14),
	@CustTaxId VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;
	
	DECLARE @Error NVARCHAR(4000);

	IF @AcctNum IS NULL OR
	   @CustTaxId IS NULL
	BEGIN
		SET @Error = 'Account number or customer tax ID is missing.';
        RAISERROR(@Error, 16, 1);
        RETURN;
    END

	BEGIN TRY
        BEGIN TRANSACTION;
			DECLARE @AcctId BIGINT,
					@CustId BIGINT,
					@FormattedTaxId VARCHAR(11),
					@TaxIdHash VARBINARY(64),
					@EncryptedTaxId VARBINARY(MAX)

			-- Retrieve the account ID based on the account number
			SELECT @AcctId = acct_id, @CustId = cust_id FROM acct_info WHERE acct_num = @AcctNum;

			IF CHARINDEX('-', @CustTaxId) = 0
			BEGIN
				-- Format the number to 'xxx-xx-xxxx' if it's not already formatted
				SET @FormattedTaxId = SUBSTRING(@CustTaxId, 1, 3) + '-' +
										SUBSTRING(@CustTaxId, 4, 2) + '-' +
										SUBSTRING(@CustTaxId, 6, 4);
			END
			ELSE
			BEGIN
				SET @FormattedTaxId = @CustTaxId;
			END

			-- Compute the hash of the formatted CustTaxId
			SET @TaxIdHash = HASHBYTES('SHA2_256', @FormattedTaxId);

			-- Check to see if customer tax id is already created
			IF EXISTS (SELECT 1 FROM cust_tax WHERE cust_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_bene WHERE bene_tax_id_hash = @TaxIdHash)
			OR EXISTS (SELECT 1 FROM acct_poa WHERE poa_tax_id_hash = @TaxIdHash)
			BEGIN
				SET @Error = 'Customer Tax ID already exists';
				ROLLBACK TRANSACTION;
				RAISERROR(@Error, 16, 1);
				RETURN;
			END

			-- Open the symmetric key for encryption
			OPEN SYMMETRIC KEY TaxEncryption
			DECRYPTION BY CERTIFICATE TaxCertificate;

			-- Encrypt the formatted CustTaxId
			SET @EncryptedTaxId = EncryptByKey(Key_GUID('TaxEncryption'), @FormattedTaxId);

			-- Close the symmetric key
			CLOSE SYMMETRIC KEY TaxEncryption;

			UPDATE cust_tax
			SET
				encrypted_cust_tax_id = ISNULL(@EncryptedTaxId, encrypted_cust_tax_id),
				cust_tax_id_hash = ISNULL(@TaxIdHash, cust_tax_id_hash)
			WHERE
				cust_id = @CustId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
		IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientAccessHistoryByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientAccessHistoryByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		ai.acct_num AS 'Acct Number',
		ri.rep_id AS 'Rep ID',
		ah.access_date AS 'Date'
	FROM acct_access_history as ah
	LEFT JOIN acct_info ai ON ah.acct_id = ai.acct_id
	LEFT JOIN emp_rep_id ri ON ah.emp_id = ri.emp_id
    WHERE ai.acct_num = @AcctNum
	ORDER BY ah.access_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientAcctJournalListByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientAcctJournalListByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	WITH CustomerID_CTE AS (
        SELECT ci.cust_id
        FROM acct_info ai
        JOIN cust_info ci ON ai.cust_id = ci.cust_id
        WHERE ai.acct_num = @AcctNum
    )
    SELECT 
        ai.acct_num AS 'Accts'
    FROM acct_info ai
	WHERE ai.cust_id = (SELECT cust_id FROM CustomerID_CTE) AND ai.acct_num != @AcctNum;;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientAcctListByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientAcctListByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	WITH CustomerID_CTE AS (
        SELECT ci.cust_id
        FROM acct_info ai
        JOIN cust_info ci ON ai.cust_id = ci.cust_id
        WHERE ai.acct_num = @AcctNum
    )
    SELECT 
        CONCAT(ai.acct_num, ' - ', ai.registration_name) AS 'Client Accts',
		ai.acct_type AS 'Acct Type'
    FROM acct_info ai
	WHERE ai.cust_id = (SELECT cust_id FROM CustomerID_CTE);
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientAcctsByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientAcctsByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	OPEN SYMMETRIC KEY APEncryption
        DECRYPTION BY CERTIFICATE APCertificate;

	WITH CustomerID_CTE AS (
        SELECT ci.cust_id
        FROM acct_info ai
        JOIN cust_info ci ON ai.cust_id = ci.cust_id
        WHERE ai.acct_num = @AcctNum
    )
    SELECT 
        ai.acct_num AS 'Acct Number',
		ai.acct_nickname AS 'Acct Nickname',
		ab.acct_balance AS 'Acct Balance',
		CONVERT(VARCHAR(25), DecryptByKey(ap.encrypted_acct_pass)) AS 'Acct Password',
		lu.acct_type AS 'Acct Type',
		ai.acct_closed AS 'Acct Closed'
    FROM acct_info ai
    JOIN acct_bal ab ON ai.acct_id = ab.acct_id
	JOIN acct_pass ap ON ai.acct_id = ap.acct_id
	LEFT JOIN LU_acct_type lu ON ai.acct_type = lu.acct_type_id
	WHERE ai.cust_id = (SELECT cust_id FROM CustomerID_CTE);

	CLOSE SYMMETRIC KEY APEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientContactByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientContactByAcctNum]
	@AcctNum VARCHAR(14)
AS
BEGIN
    SET NOCOUNT ON;

	SELECT 
		cc.cust_email AS 'Contact Email',
		cc.cust_phone_home AS 'Contact Phone Home',
		cc.cust_phone_business AS 'Contact Phone Business',
		cc.cust_address AS 'Contact Address 1',
		cc.cust_address_2 AS 'Contact Address 2',
		ci.city_name AS 'Contact City',
		st.state_name AS 'Contact State',
		RIGHT('00000' + CAST(ci.postal_code AS VARCHAR(5)), 5) AS 'Contact Postal Code'
	FROM cust_contact cc
	LEFT JOIN acct_info ai ON cc.cust_id = ai.cust_id
	LEFT JOIN LU_city ci ON cc.cust_city_id = ci.city_id
	LEFT JOIN LU_state st ON ci.state_id = st.state_id
	WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientDetailsByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_GetClientDetailsByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;
    
	OPEN SYMMETRIC KEY TaxEncryption
        DECRYPTION BY CERTIFICATE TaxCertificate;

	SELECT 
        ai.acct_num,
		ci.date_of_birth AS 'Date of Birth',
		ci.client_since AS 'Client Since',
		ci.first_name AS 'First Name', 
		ci.middle_name AS 'Middle Name',
		ci.last_name AS 'Last Name',
		ci.suffix AS 'Suffix',
		cc.cust_email AS 'Email',
		cc.cust_phone_home AS 'Home Phone',
		cc.cust_phone_business AS 'Business Phone',
		cc.cust_address AS 'Address 1',
		cc.cust_address_2 AS 'Address 2',
		c_cust.city_name AS 'City',
		st_cust.state_abbr AS 'State',
		RIGHT('00000' + CAST(c_cust.postal_code AS VARCHAR(5)), 5) AS 'Zip',
		ce.employment_status AS 'Employment Status',
		ce.employer_name AS 'Employer',
		ce.occupation AS 'Occupation',
		idt.id_type AS 'ID Type',
		st_id.state_name AS 'ID State',
		cid.id_num AS 'ID Number',
		cid.id_exp AS 'ID Expiration',
		cid.mothers_maiden AS 'Mothers Maiden',
		cp.voice_auth AS 'Voice Auth',
		cp.do_not_call AS 'DNC',
		cp.share_affiliates AS 'Share Affiliates',
		c_br.city_name AS 'Branch City',
		st_br.state_abbr AS 'Branch State',
		RIGHT('00000' + CAST(c_br.postal_code AS VARCHAR(5)), 5) AS 'Branch Zip',
		CONVERT(VARCHAR(25), DecryptByKey(ct.encrypted_cust_tax_id)) AS 'Tax ID'
    FROM acct_info ai
    JOIN cust_info ci ON ai.cust_id = ci.cust_id
	JOIN cust_contact cc ON ai.cust_id = cc.cust_id
	JOIN cust_emp ce ON ai.cust_id = ce.cust_id
	JOIN cust_id cid ON ai.cust_id = cid.cust_id
	JOIN cust_privacy cp ON ai.cust_id = cp.cust_id
	JOIN cust_tax ct ON ci.cust_id = ct.cust_id
	JOIN acct_branch ab ON ai.acct_id = ab.acct_id
	LEFT JOIN LU_id_type idt ON cid.id_type = idt.id_type_id
	LEFT JOIN LU_comp_location cl ON  ab.acct_branch_id = cl.location_id
	LEFT JOIN LU_city c_br ON  cl.city_id = c_br.city_id
	LEFT JOIN LU_city c_cust ON cc.cust_city_id = c_cust.city_id
	LEFT JOIN LU_state st_br ON c_br.state_id = st_br.state_id
	LEFT JOIN LU_state st_cust ON c_cust.state_id = st_cust.state_id
	LEFT JOIN LU_state st_id ON cid.id_state = st_id.state_id
    WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY TaxEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientEmploymentByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientEmploymentByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		CASE
			WHEN ce.employment_status = 1 THEN 'Employed' 
			WHEN ce.employment_status = 0 THEN 'Unemployed' 
		END AS 'Employment Status',
		ce.employer_name AS 'Employer Name',
		ce.occupation AS 'Occupation'
	FROM cust_emp ce
	LEFT JOIN acct_info ai ON ce.cust_id = ai.cust_id
	WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientIdByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientIdByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ah.cust_secondary_id AS 'Cust ID',
	       ah.joint_cust_secondary_id AS 'Joint Cust ID'
	FROM acct_holders ah
	LEFT JOIN acct_info ai ON ai.acct_id = ah.acct_id
    WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientInfoByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientInfoByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
        ai.acct_num,
		ci.first_name AS 'First Name', 
		ci.middle_name AS 'Middle Name',
		ci.last_name AS 'Last Name',
		ci.suffix AS 'Suffix',
		ci.date_of_birth AS 'Date of Birth',
		cp.voice_auth AS 'Voice Auth',
		cp.do_not_call AS 'DNC',
		cp.share_affiliates AS 'Share Affiliates',
		idt.id_type AS 'ID Type',
		st_id.state_name AS 'ID State',
		cid.id_num AS 'ID Number',
		cid.id_exp AS 'ID Expiration',
		cid.mothers_maiden AS 'Mothers Maiden',
		co.country_name AS 'Country Name'
	FROM acct_info ai
    JOIN cust_info ci ON ai.cust_id = ci.cust_id
	JOIN cust_id cid ON ai.cust_id = cid.cust_id
	JOIN cust_contact cc ON ai.cust_id = cc.cust_id 
	JOIN cust_privacy cp ON ai.cust_id = cp.cust_id
	LEFT JOIN LU_id_type idt ON cid.id_type = idt.id_type_id
	LEFT JOIN LU_state st_id ON cid.id_state = st_id.state_id
    LEFT JOIN LU_country co ON st_id.country_id = co.country_id
	WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientNameByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientNameByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CONCAT(ci.first_name, ' ', ci.last_name) AS 'Name'
    FROM acct_info ai
    JOIN cust_info ci ON ai.cust_id = ci.cust_id
    WHERE ai.acct_num = @AcctNum;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientNotesByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientNotesByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	WITH CustomerID_CTE AS (
        SELECT ci.cust_secondary_id
        FROM acct_info ai
        JOIN cust_info ci ON ai.cust_id = ci.cust_id
        WHERE ai.acct_num = @AcctNum
    )
	SELECT TOP 25
		ai.acct_num AS 'Acct Number',
		an.acct_note AS 'Note',
		an.note_date AS 'Date',
		ri.rep_id AS 'Rep ID'
	FROM acct_info ai
	JOIN acct_note an ON ai.acct_id = an.acct_id
	JOIN cust_info ci ON ai.cust_id = ci.cust_id 
	LEFT JOIN emp_rep_id ri ON an.emp_id = ri.emp_id
	WHERE ci.cust_secondary_id = (SELECT cust_secondary_id FROM CustomerID_CTE)
	ORDER BY an.note_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientTaxByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientTaxByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;
    
	OPEN SYMMETRIC KEY TaxEncryption
        DECRYPTION BY CERTIFICATE TaxCertificate;

	SELECT 
        CONVERT(VARCHAR(25), DecryptByKey(ct.encrypted_cust_tax_id)) AS 'Tax ID'
	FROM acct_info ai
    JOIN cust_info ci ON ai.cust_id = ci.cust_id
	JOIN cust_tax ct ON ai.cust_id = ct.cust_id
    WHERE ai.acct_num = @AcctNum;

	CLOSE SYMMETRIC KEY TaxEncryption;
END
GO
/****** Object:  StoredProcedure [dbo].[Client_GetClientTransactionsByAcctNum]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_GetClientTransactionsByAcctNum]
    @AcctNum VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

	WITH CustomerID_CTE AS (
        SELECT ci.cust_secondary_id
        FROM acct_info ai
        JOIN cust_info ci ON ai.cust_id = ci.cust_id
        WHERE ai.acct_num = @AcctNum
    )
	SELECT TOP 100
		ai.acct_num AS 'Acct Num',
        atr.transaction_date AS 'Transaction Date',
        tt.transaction_abbr AS 'Action',
        atr.transaction_amt AS 'Amount',
		COALESCE(sf.fee_amt, wire.wire_fee) AS 'Trade/Wire Fees',
        atr.pre_bal AS 'Pre Balance',
        atr.post_bal AS 'Post Balance',
        ri.rep_id AS 'Rep ID'
    FROM acct_transaction atr
    LEFT JOIN acct_transaction_trade att ON atr.acct_transaction_id = att.acct_transaction_id
	LEFT JOIN acct_transaction_ach ach ON atr.acct_transaction_id = ach.acct_transaction_id
	LEFT JOIN acct_transaction_wire wire ON atr.acct_transaction_id = wire.acct_transaction_id
    LEFT JOIN LU_transaction_type tt ON atr.transaction_type = tt.transaction_type_id
    LEFT JOIN acct_info ai ON atr.acct_id = ai.acct_id
	LEFT JOIN LU_stock_fees sf ON att.trade_fee = sf.stock_fee_id
    LEFT JOIN LU_stock_list sl ON att.stock_id = sl.stock_id
    LEFT JOIN emp_rep_id ri ON atr.emp_id = ri.emp_id
	LEFT JOIN LU_bank_routing bratw ON wire.wire_routing_id = bratw.bank_routing_id
	LEFT JOIN LU_bank_routing brata ON ach.bank_routing_id = brata.bank_routing_id
    LEFT JOIN LU_trade_status ts ON att.trade_status = ts.trade_status_id
	JOIN cust_info ci ON ai.cust_id = ci.cust_id 
	WHERE ci.cust_secondary_id = (SELECT cust_secondary_id FROM CustomerID_CTE)
    ORDER BY atr.transaction_date DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[Comp_GetMainClientAccessDetails]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comp_GetMainClientAccessDetails]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		cl.name AS location_name,
		cl.city,
		clt.location_type,
		cp.position_id,
		cp.position_name,
		cd.department_name,
		mc.trading,
		mc.move_money,
		mc.view_only

	FROM LU_comp_position_location cpl
	JOIN LU_comp_location cl ON cpl.location_id = cl.location_id
	JOIN LU_comp_position cp ON cpl.position_id = cp.position_id
	JOIN LU_comp_department cd ON cp.department_id = cd.department_id
	JOIN LU_comp_location_type clt ON cl.type_id = clt.location_type_id
	JOIN LU_mc_access mc ON cp.position_id = mc.position_id
	WHERE cp.position_removed = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[Comp_GetPositionHierarchy]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comp_GetPositionHierarchy]
AS
BEGIN
	SET NOCOUNT ON;

    ;WITH PositionHierarchy AS (
        SELECT 
            position_id, 
            position_name, 
            department_id, 
            salary_range_low, 
            salary_range_high, 
            parent_position_id,
            position_removed,
            CAST(position_name as VARCHAR(MAX)) as hierarchy
        FROM LU_comp_position
        WHERE parent_position_id IS NULL

        UNION ALL

        SELECT 
            cp.position_id, 
            cp.position_name, 
            cp.department_id, 
            cp.salary_range_low, 
            cp.salary_range_high, 
            cp.parent_position_id,
            cp.position_removed,
            ph.hierarchy + ' -> ' + cp.position_name
        FROM LU_comp_position cp
        JOIN PositionHierarchy ph ON cp.parent_position_id = ph.position_id
        WHERE cp.position_removed = 0
	)

    SELECT hierarchy
    FROM PositionHierarchy
    ORDER BY hierarchy;
END
GO
/****** Object:  StoredProcedure [dbo].[Comp_GetPositionLocationDetails]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Comp_GetPositionLocationDetails]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
        cl.name AS location_name,
		cl.city_id,
		c.city_name,
        clt.location_type,
		cp.position_id,
        cp.position_name,
        cd.department_name,
		position_removed
    FROM LU_comp_position_location cpl
    LEFT JOIN LU_comp_location cl ON cpl.location_id = cl.location_id
    LEFT JOIN LU_comp_position cp ON cpl.position_id = cp.position_id
    LEFT JOIN LU_comp_department cd ON cp.department_id = cd.department_id
    LEFT JOIN LU_comp_location_type clt ON cl.type_id = clt.location_type_id
	LEFT JOIN LU_city c ON cl.city_id = c.city_id
 	WHERE cp.position_removed = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[Emp_GetEmpMainClient]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Emp_GetEmpMainClient]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
        eri.emp_id,
        eri.rep_id,
        mc.trading,
        mc.move_money,
        mc.view_only,
        cl.name AS location_name,
        cp.position_name
    FROM LU_comp_position_location cpl
    JOIN LU_comp_location cl ON cpl.location_id = cl.location_id
    JOIN LU_comp_position cp ON cpl.position_id = cp.position_id
    JOIN LU_comp_department cd ON cp.department_id = cd.department_id
    JOIN LU_comp_location_type clt ON cl.type_id = clt.location_type_id
    JOIN LU_mc_access mc ON cp.position_id = mc.position_id
    JOIN emp_position ep ON cpl.position_location_id = ep.position_location_id
    JOIN emp_rep_id eri ON ep.emp_id = eri.emp_id
    WHERE cp.position_removed = 0
	ORDER BY eri.emp_id;
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_GetRandomWord]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_GetRandomWord]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 1 UPPER(LEFT(word, 1)) + LOWER(RIGHT(word, LEN(word) - 1)) AS word
    FROM LU_words
    ORDER BY NEWID();
END;
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LoginEmployee]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LoginEmployee]
	@InputRepId VARCHAR(5),
    @InputPassword VARCHAR(255),
    @LoginMessage NVARCHAR(100) OUTPUT,
	@RepId VARCHAR(5) OUTPUT,
	@Trading BIT OUTPUT,
	@MoveMoney BIT OUTPUT,
	@ViewOnly BIT OUTPUT

AS
BEGIN
    SET NOCOUNT ON;
	
	DECLARE @PositionLocationId INT;
	DECLARE @PositionId INT;
	DECLARE @EmpId INT;

    SELECT @EmpId = emp_id
    FROM [BankDB].[dbo].[emp_rep_id]
    WHERE rep_id = @InputRepId;

    IF @EmpId IS NOT NULL
    BEGIN

		DECLARE @StoredHash VARBINARY(32);
		DECLARE @StoredSalt UNIQUEIDENTIFIER;
    
	    SELECT @StoredHash = emp_pass_hash, @StoredSalt = emp_pass_salt
        FROM [BankDB].[dbo].[emp_pass]
        WHERE emp_id = @EmpId;

        IF @StoredHash IS NOT NULL AND @StoredSalt IS NOT NULL
        BEGIN
            IF HASHBYTES('SHA2_256', CONCAT(@inputPassword, CONVERT(NVARCHAR(50), @StoredSalt))) = @StoredHash
            BEGIN
				-- Retrieve the position_location_id using emp_id from emp_position
                SELECT @PositionLocationId= position_location_id
                FROM [BankDB].[dbo].[emp_position]
                WHERE emp_id = @EmpId;
                
                IF @PositionLocationId IS NOT NULL
                BEGIN
                    -- Retrieve the position_id using position_location_id from LU_comp_position_location
                    SELECT @PositionId = position_id
                    FROM [BankDB].[dbo].[LU_comp_position_location]
                    WHERE position_location_id = @PositionLocationId;

                    -- Retrieve the trading, move_money, and view_only using position_id from LU_mc_access
                    SELECT @Trading = trading, @MoveMoney = move_money, @ViewOnly = view_only
                    FROM [BankDB].[dbo].[LU_mc_access]
                    WHERE position_id = @PositionId;

					SET @RepId = @InputRepId;

					SET @LoginMessage = 'Login successful';
				END
                ELSE
                BEGIN
                    -- If position_location_id is not found, set the login message accordingly
                    SET @LoginMessage = 'Position location information not found for the employee. Please contact the National Service Desk.';
                    SET @EmpId = NULL;
                END
            END
            ELSE
            BEGIN
                SET @LoginMessage = 'Username or Password is incorrect.';
				SET @EmpId = NULL;
            END
        END
        ELSE
        BEGIN
            SET @LoginMessage = 'The information could not be found. Please contact the National Service Desk.';
			SET @EmpId = NULL;
        END
    END
    ELSE
    BEGIN
        -- If no emp_id is found for the rep_id, return 0 or another indicator of failure
        SET @LoginMessage = 'The information could not be found. Please contact the National Service Desk.';
		SET @EmpId = NULL;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpAcctActivity]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpAcctActivity]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT activity_type AS 'Activity Type'
	from LU_acct_activity
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpAcctFunding]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpAcctFunding]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT funding_type AS 'Funding Type'
	from LU_acct_funding
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpAcctObjective]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpAcctObjective]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT objective_type AS 'Objective Type'
	from LU_acct_objective
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpAcctPurpose]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpAcctPurpose]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT purpose_type AS 'Purpose Type'
	from LU_acct_purpose
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpAcctType]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpAcctType]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT acct_type AS 'Account Type'
	from LU_acct_type
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpBankAcctType]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpBankAcctType]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT bank_acct_type AS 'Bank Type'
	from LU_bank_acct_type
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpBankRouting]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpBankRouting]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT bank_name AS 'Bank Name',
		   routing_num AS 'Bank Routing Num'
		   from LU_bank_routing
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpCity]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpCity]
	@State NVARCHAR(85)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT c.city_name AS 'City Name',
		   c.postal_code AS 'City Postal Code',
		   c.city_lon AS 'City Longitude',
		   c.city_lat AS 'City Latitude'
	FROM LU_city c
	LEFT JOIN LU_state s ON c.state_id = s.state_id
	WHERE s.state_name = @State;
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpCountry]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpCountry]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT country_name AS 'Country Name',
		   can_open AS 'Can Open'
	FROM LU_country
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpCurrencyAbbr]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpCurrencyAbbr]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT currency_abbr AS 'Currency Abbr'
	from LU_currency
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpIdType]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpIdType]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT id_type AS 'ID Type'
	FROM LU_id_type
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpInitialContactMethod]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpInitialContactMethod]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT method_name AS 'Initial Contact Method'
	from LU_initial_contact_method
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpLocation]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpLocation]
	@PostalCode NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ProcessedPostalCode VARCHAR(50)

    SET @ProcessedPostalCode = CAST(CAST(@PostalCode AS INT) AS VARCHAR(50))

    SELECT c.city_name AS 'City Name',
		   c.city_lon AS 'City Longitude',
		   c.city_lat AS 'City Latitude',
		   s.state_name AS 'State Name',
		   co.country_name AS 'Country Name',
		   co.can_open AS 'Can Open'
	FROM LU_city c
	LEFT JOIN LU_state s ON c.state_id = s.state_id
	LEFT JOIN LU_country co ON s.country_id = co.country_id
	WHERE c.postal_code = @ProcessedPostalCode;
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpPoaRole]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpPoaRole]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT poa_role AS 'POA Role'
	from LU_poa_role
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpRelationshipType]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpRelationshipType]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT relationship_type AS 'Relationship Type'
	from LU_relationship_type
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpState]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpState]
	@Country NVARCHAR(60)

AS
BEGIN
	SET NOCOUNT ON;

    SELECT s.state_abbr AS 'State Abbr',
		   s.state_name AS 'State Name'
	FROM LU_state s
	LEFT JOIN LU_country c ON c.country_id = s.country_id
	WHERE country_name = @Country;
END
GO
/****** Object:  StoredProcedure [dbo].[MainClient_LookUpStockInfo]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MainClient_LookUpStockInfo]

AS
BEGIN
	SET NOCOUNT ON;

    SELECT sl.stock_name AS 'Stock Name',
		   sl.stock_ticker AS 'Stock Ticker',
		   CAST(sl.current_price / c.exchange_rate AS DECIMAL(18,4)) AS 'USD Price',
           sl.current_price AS 'Local Price',
		   sf.fee_amt AS 'Fee Amt',
		   se.exchange_name AS 'Exchange Name',
		   se.exchange_abbr AS 'Exchange Abbr',
		   c.currency_abbr AS 'Currency Abbr'
	FROM LU_stock_list sl
	LEFT JOIN LU_stock_fees sf ON sl.stock_type_id = sf.stock_type_id
	LEFT JOIN LU_stock_exchange_to_ticker sett ON sl.stock_id = sett.stock_id
	LEFT JOIN LU_stock_exchange se ON sett.exchange_id = se.stock_exchange_id
	LEFT JOIN LU_currency c ON se.exchange_currency = c.currency_id
	ORDER BY sl.stock_name ASC;

END
GO
/****** Object:  StoredProcedure [dbo].[SSMS_GetAcctInfo]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SSMS_GetAcctInfo]
    @AcctId VARCHAR(14)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT ai.acct_id,
		   ai.cust_id,
	       ai.acct_num,
		   ai.initial_contact_method,
		   ai.acct_type,
		   ai.registration_name,
		   ai.acct_objective,
		   ai.acct_funding,
		   ai.acct_purpose,
		   ai.acct_activity,
		   ai.acct_nickname,
		   ai.opened_date,
		   ai.acct_closed,
		   ai.closed_date,
		   ai.emp_id,
		   ai.currency_id,
		   ab.acct_balance,
		   bene.bene_cust_id,
		   bene.bene_first_name,
		   bene.bene_last_name,
		   bene.encrypted_bene_tax_id,
		   bene.relationship_id,
		   bene.bene_portion,
		   abr.acct_branch_id,
		   ac.contact_name,
		   ac.contact_address,
		   ac.contact_address_2,
		   ac.contact_city_id,
		   ah.cust_secondary_id,
		   ah.joint_cust_secondary_id,
		   aj.jurisdiction_state,
		   al.atm_limit,
		   al.ach_limit,
		   al.wire_limit,
		   am.web,
		   am.mobile,
		   am.two_factor,
		   am.biometrics,
		   ap.encrypted_acct_pass,
		   poa.poa_cust_id,
		   poa.poa_role,
		   poa.poa_first_name,
		   poa.poa_last_name,
		   poa.encrypted_poa_tax_id,
		   ci.cust_id,
		   ci.cust_secondary_id,
		   ci.first_name,
           ci.middle_name,
		   ci.last_name,
		   ci.suffix,
		   ci.date_of_birth,
		   ci.client_since,
		   cc.cust_email,
		   cc.cust_phone_home,
		   cc.cust_phone_business,
		   cc.cust_address,
		   cc.cust_address_2,
		   cc.cust_city_id,
		   ce.employment_status,
		   ce.employer_name,
		   ce.occupation,
		   cid.id_type,
		   cid.id_state,
		   cid.id_num,
		   cid.id_exp,
		   cid.mothers_maiden,
		   cp.voice_auth,
		   cp.do_not_call,
		   cp.share_affiliates,
		   ct.encrypted_cust_tax_id,
		   ct.cust_tax_id_hash
	FROM acct_info ai
	LEFT JOIN acct_bal ab ON ai.acct_id = ab.acct_id
	LEFT JOIN acct_bene bene ON ai.acct_id = bene.acct_id
	LEFT JOIN acct_branch abr ON ai.acct_id = abr.acct_id
	LEFT JOIN acct_contact ac ON ai.acct_id = ac.acct_id
	LEFT JOIN acct_holders ah ON ai.acct_id = ah.acct_id
	LEFT JOIN acct_jurisdiction aj ON ai.acct_id = aj.acct_id
	LEFT JOIN acct_limit al ON ai.acct_id = al.acct_id
	LEFT JOIN acct_mobile am ON ai.acct_id = am.acct_id
	LEFT JOIN acct_pass ap ON ai.acct_id = ap.acct_id
	LEFT JOIN acct_poa poa ON ai.acct_id = poa.acct_id
	LEFT JOIN cust_info ci ON ai.cust_id = ci.cust_id
	LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
	LEFT JOIN cust_emp ce ON ci.cust_id = ce.cust_id
	LEFT JOIN cust_id cid ON ci.cust_id = cid.cust_id
	LEFT JOIN cust_privacy cp ON ci.cust_id = cp.cust_id
	LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
	WHERE ai.acct_id = @AcctId;
END
GO
/****** Object:  StoredProcedure [dbo].[SSMS_GetAllAcctInfo]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SSMS_GetAllAcctInfo]
    @CustId BIGINT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT ai.acct_id,
		   ai.cust_id,
	       ai.acct_num,
		   ai.initial_contact_method,
		   ai.acct_type,
		   ai.registration_name,
		   ai.acct_objective,
		   ai.acct_funding,
		   ai.acct_purpose,
		   ai.acct_activity,
		   ai.acct_nickname,
		   ai.opened_date,
		   ai.acct_closed,
		   ai.closed_date,
		   ai.emp_id,
		   ai.currency_id,
		   ab.acct_balance,
		   bene.bene_cust_id,
		   bene.bene_first_name,
		   bene.bene_last_name,
		   bene.encrypted_bene_tax_id,
		   bene.relationship_id,
		   bene.bene_portion,
		   abr.acct_branch_id,
		   ac.contact_name,
		   ac.contact_address,
		   ac.contact_address_2,
		   ac.contact_city_id,
		   ah.cust_secondary_id,
		   ah.joint_cust_secondary_id,
		   aj.jurisdiction_state,
		   al.atm_limit,
		   al.ach_limit,
		   al.wire_limit,
		   am.web,
		   am.mobile,
		   am.two_factor,
		   am.biometrics,
		   ap.encrypted_acct_pass,
		   poa.poa_cust_id,
		   poa.poa_role,
		   poa.poa_first_name,
		   poa.poa_last_name,
		   poa.encrypted_poa_tax_id,
		   ci.cust_id,
		   ci.cust_secondary_id,
		   ci.first_name,
           ci.middle_name,
		   ci.last_name,
		   ci.suffix,
		   ci.date_of_birth,
		   ci.client_since,
		   cc.cust_email,
		   cc.cust_phone_home,
		   cc.cust_phone_business,
		   cc.cust_address,
		   cc.cust_address_2,
		   cc.cust_city_id,
		   ce.employment_status,
		   ce.employer_name,
		   ce.occupation,
		   cid.id_type,
		   cid.id_state,
		   cid.id_num,
		   cid.id_exp,
		   cid.mothers_maiden,
		   cp.voice_auth,
		   cp.do_not_call,
		   cp.share_affiliates,
		   ct.encrypted_cust_tax_id,
		   ct.cust_tax_id_hash
	FROM cust_info ci
	LEFT JOIN acct_holders ah ON ci.cust_secondary_id = ah.cust_secondary_id OR ci.cust_secondary_id = ah.joint_cust_secondary_id
	LEFT JOIN acct_info ai ON ah.acct_id = ai.acct_id
	LEFT JOIN acct_bal ab ON ai.acct_id = ab.acct_id
	LEFT JOIN acct_bene bene ON ai.acct_id = bene.acct_id
	LEFT JOIN acct_branch abr ON ai.acct_id = abr.acct_id
	LEFT JOIN acct_contact ac ON ai.acct_id = ac.acct_id
	LEFT JOIN acct_jurisdiction aj ON ai.acct_id = aj.acct_id
	LEFT JOIN acct_limit al ON ai.acct_id = al.acct_id
	LEFT JOIN acct_mobile am ON ai.acct_id = am.acct_id
	LEFT JOIN acct_pass ap ON ai.acct_id = ap.acct_id
	LEFT JOIN acct_poa poa ON ai.acct_id = poa.acct_id
	LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
	LEFT JOIN cust_emp ce ON ci.cust_id = ce.cust_id
	LEFT JOIN cust_id cid ON ci.cust_id = cid.cust_id
	LEFT JOIN cust_privacy cp ON ci.cust_id = cp.cust_id
	LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
	WHERE ci.cust_id = @CustID AND (ci.cust_secondary_id = ah.cust_secondary_id OR ci.cust_secondary_id = ah.joint_cust_secondary_id);
END
GO
/****** Object:  StoredProcedure [dbo].[SSMS_GetAllClientInfo]    Script Date: 4/21/2024 5:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SSMS_GetAllClientInfo]
    @CustId BIGINT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT ci.cust_id,
		   ci.cust_secondary_id,
		   ci.first_name,
           ci.middle_name,
		   ci.last_name,
		   ci.suffix,
		   ci.date_of_birth,
		   ci.client_since,
		   cc.cust_email,
		   cc.cust_phone_home,
		   cc.cust_phone_business,
		   cc.cust_address,
		   cc.cust_address_2,
		   cc.cust_city_id,
		   ce.employment_status,
		   ce.employer_name,
		   ce.occupation,
		   cid.id_type,
		   cid.id_state,
		   cid.id_num,
		   cid.id_exp,
		   cid.mothers_maiden,
		   cp.voice_auth,
		   cp.do_not_call,
		   cp.share_affiliates,
		   ct.encrypted_cust_tax_id,
		   ct.cust_tax_id_hash
	FROM cust_info ci
	LEFT JOIN cust_contact cc ON ci.cust_id = cc.cust_id
	LEFT JOIN cust_emp ce ON ci.cust_id = ce.cust_id
	LEFT JOIN cust_id cid ON ci.cust_id = cid.cust_id
	LEFT JOIN cust_privacy cp ON ci.cust_id = cp.cust_id
	LEFT JOIN cust_tax ct ON ci.cust_id = ct.cust_id
	WHERE ci.cust_id = @CustID;
END
GO
