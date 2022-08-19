USE [prsistemas]
GO

/****** Object:  Table [dbo].[clienteendereco]    Script Date: 08/19/2022 02:03:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[clienteendereco](
	[idendereco] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[cep] [int] NOT NULL,
	[endereco] [varchar](max) NOT NULL,
	[nro] [int] NOT NULL,
	[bairro] [varchar](max) NOT NULL,
	[cidade] [varchar](20) NOT NULL,
	[uf] [char](2) NOT NULL,
 CONSTRAINT [PK_clienteendereco] PRIMARY KEY CLUSTERED 
(
	[idendereco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[clienteendereco]  WITH CHECK ADD  CONSTRAINT [FK_clienteendereco_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[clientes] ([id])
GO

ALTER TABLE [dbo].[clienteendereco] CHECK CONSTRAINT [FK_clienteendereco_cliente]
GO


