USE [prsistemas]
GO

/****** Object:  Table [dbo].[clientes]    Script Date: 08/19/2022 02:02:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](max) NOT NULL,
	[cpf] [varchar](20) NOT NULL,
	[rg] [varchar](20) NOT NULL,
	[nomemae] [varchar](max) NOT NULL,
	[nomepai] [varchar](max) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


