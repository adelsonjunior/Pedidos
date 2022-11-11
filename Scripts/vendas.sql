-- phpMyAdmin SQL Dump
-- Versão do servidor: 5.7.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `cidade`, `uf`) VALUES
(1, 'REGINA CASTILLO', 'Lozova', 'PB'),
(2, 'SIMON SPENCE', 'Hall in Tirol', 'AC'),
(3, 'MURPHY KRAMER', 'Chimbote', 'AL'),
(4, 'JERMAINE FULTON', 'Anápolis', 'AP'),
(5, 'QUENTIN MCLAUGHLIN', 'Zeist', 'AM'),
(6, 'MARSHALL KIRBY', 'Oslo', 'BA'),
(7, 'CASSIDY ARNOLD', 'Muradiye', 'CE'),
(8, 'TROY FERGUSON', 'Imst', 'DF'),
(9, 'MADELINE LYNCH', 'Carletonville', 'ES'),
(10, 'CALLUM BERRY', 'Aschaffenburg', 'GO'),
(11, 'SYLVESTER DAY', 'Can Tho', 'MA'),
(12, 'JOLIE HUNT', 'Jecheon', 'MT'),
(13, 'KEVYN MALONE', 'Guangdong', 'MS'),
(14, 'JONAH GONZALEZ', 'Bad Kreuznach', 'RJ'),
(15, 'PRICE SILVA', 'Tuxtla Gutiérrez', 'RN'),
(16, 'AMELA WARD', 'Langford', 'SP'),
(17, 'PATRICIA SHAW', 'Hubei', 'SP'),
(18, 'RAHIM ARMSTRONG', 'Langford', 'SC'),
(19, 'CHRISTIAN MANN', 'Puerto Montt', 'SC'),
(20, 'JOY CHANG', 'Jiangsu', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `data_emissao` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `valor_total` float DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_cliente_idx` (`id_cliente`),
  KEY `idx_data_emissao` (`data_emissao`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Estrutura da tabela `pedidos_itens`
--

DROP TABLE IF EXISTS `pedidos_itens`;
CREATE TABLE IF NOT EXISTS `pedidos_itens` (
  `id_pedido_itens` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `qtd` float DEFAULT NULL,
  `vlr_unitario` float DEFAULT NULL,
  `vlr_total` float DEFAULT NULL,
  PRIMARY KEY (`id_pedido_itens`,`id_pedido`),
  KEY `fk_pedido_idx` (`id_pedido`),
  KEY `fk_produto_idx` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id_produto` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `preco_venda` float DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `descricao`, `preco_venda`) VALUES
(1, 'PAO', 1),
(2, 'MORTADELA BOLOGNELLA', 18.9),
(3, 'PAO DE HAMBURG PEQ', 0.9),
(4, 'QUEIJO COALHO PRE COZIDO', 24.99),
(5, 'BOLACHA SETE CAPAS KS 250G', 2.7),
(6, 'BOLACHA FOLHEADA DOCE KS 250G', 2.75),
(7, 'BOLACHA FOLEADA DOCE KS 350G', 3.35),
(8, 'GARRAFAO MINERAL INDAIA', 22),
(9, 'PRESUNTO DE PERU SADIA', 18.9),
(10, 'QUEIJO PRATO', 29),
(11, 'PIZZA', 3.5),
(12, 'PIZZA DISCO GRANDE', 2.5),
(13, 'APRESUNTADO  SADIA', 8.9),
(14, 'PAO DE CAIXA', 2.5),
(15, 'PRESUNTO LANCHE FRANGO PERD', 19),
(16, 'PRESUNTO SADIA', 17),
(17, 'MOLHO DE PIMENTA MESTRE BELO', 1.19),
(18, 'SABAO UNIDADE', 1),
(19, 'GAS', 103),
(20, 'PIZZA DISCO PEG', 1.5);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedidos_itens`
--
ALTER TABLE `pedidos_itens`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
