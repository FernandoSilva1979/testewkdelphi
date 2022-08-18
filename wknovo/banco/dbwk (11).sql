-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Ago-2022 às 20:50
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbwk`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `nome`, `cidade`, `uf`) VALUES
(1, 'ANA SILVA', 'MANAUS', 'AM'),
(2, 'JOAO', 'manaus', 'am'),
(3, 'JOSE', 'manaus', 'am'),
(4, 'ALVARO', 'manaus', 'am'),
(5, 'FRANCISCO', 'manaus', 'am'),
(6, 'FERNANDO', 'manaus', 'am'),
(7, 'JOANA', 'manaus', 'am'),
(8, 'MARIA', 'manaus', 'am'),
(9, 'JOSY', 'manaus', 'am'),
(10, 'LORENA', 'manaus', 'am'),
(11, 'PEDRO', 'manaus', 'am'),
(12, 'JONAS', 'manaus', 'am'),
(13, 'MARIO', 'manaus', 'am'),
(14, 'ISMAEL', 'manaus', 'am'),
(15, 'ISRAEL', 'manaus', 'am'),
(16, 'NUNES', 'manaus', 'am'),
(17, 'SANTOS', 'manaus', 'am'),
(18, 'JONAS', 'manaus', 'am'),
(19, 'RENATO', 'manaus', 'am'),
(20, 'JEFERSON', 'manaus', 'am');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `nro_pedido` int(11) NOT NULL,
  `data_emissao` date NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  `valor_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

CREATE TABLE `pedidos_produtos` (
  `id` int(11) NOT NULL,
  `nro_pedido` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `quantidade` double NOT NULL,
  `vlr_unitario` double NOT NULL,
  `vlr_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco_venda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `cod_produto`, `descricao`, `preco_venda`) VALUES
(2, 1, 'FEIJAO', 1),
(3, 2, 'sal', 2),
(4, 3, 'farinha', 3),
(5, 4, 'sabao', 4),
(6, 5, 'sabonete', 5),
(7, 6, 'trigo', 6),
(8, 7, 'pao', 7),
(9, 8, 'salgado', 8),
(10, 9, 'acucar', 9),
(11, 10, 'banana', 10),
(12, 11, 'chiclete', 11),
(13, 12, 'farinha dagua', 12),
(14, 13, 'sabao em po', 13),
(15, 14, 'sabonete liquido', 14),
(16, 15, 'macarrao', 15),
(17, 16, 'pao de forma', 15),
(18, 17, 'FOSFORO', 17),
(19, 18, 'arroz', 18),
(20, 19, 'banana prata', 12),
(21, 20, 'chiclete de caixa', 20);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`),
  ADD KEY `nome` (`nome`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`nro_pedido`),
  ADD KEY `data_emissao` (`data_emissao`),
  ADD KEY `cod_cliente` (`cod_cliente`);

--
-- Índices para tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nro_pedido` (`nro_pedido`),
  ADD KEY `fk_pedidosprodutoscodproduto_peodutosid` (`cod_produto`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descricao` (`descricao`),
  ADD KEY `cod_produto` (`cod_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `nro_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidoscodcliente_clienteid` FOREIGN KEY (`cod_cliente`) REFERENCES `clientes` (`cod_cliente`);

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `fk_pedidosprodutoscodproduto_peodutosid` FOREIGN KEY (`cod_produto`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
