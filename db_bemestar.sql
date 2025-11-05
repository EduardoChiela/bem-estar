-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 04/11/2025 às 19:38
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_bemestar`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `Vinculo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `emocao_hj` int DEFAULT NULL,
  `emocao_reco` int DEFAULT NULL,
  `ultima_emocao` int DEFAULT NULL,
  `causa` int DEFAULT NULL,
  `data_avaliacao` date NOT NULL,
  `id_usuario` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`Vinculo`, `emocao_hj`, `emocao_reco`, `ultima_emocao`, `causa`, `data_avaliacao`, `id_usuario`) VALUES
('Aluno', 4, 5, 2, 1, '2025-10-15', 56),
('Aluno', 4, 5, 5, 1, '2025-10-15', 57),
('Aluno', 4, 2, 5, 1, '2025-10-15', 58),
('Aluno', 5, 4, 5, 1, '2025-10-15', 59),
('Aluno', 5, 4, 4, 2, '2025-10-15', 60),
('Aluno', 1, 5, 1, 3, '2025-10-15', 61),
('Aluno', 4, 4, 5, 2, '2025-10-15', 62),
('Aluno', 2, 1, 1, 3, '2025-10-15', 63),
('Aluno', 4, 4, 2, 3, '2025-10-15', 64),
('Aluno', 4, 4, 3, 3, '2025-10-15', 65),
('Aluno', 4, 5, 3, 3, '2025-10-15', 66),
('Aluno', 3, 3, 3, 3, '2025-10-15', 67),
('Colaborador', 5, 5, 5, 4, '2025-10-15', 68),
('Aluno', 4, 3, 5, 4, '2025-10-15', 69),
('Aluno', 3, 5, 4, 3, '2025-10-15', 70),
('Aluno', 3, 4, 3, 4, '2025-10-15', 71),
('Aluno', 4, 4, 4, 2, '2025-10-15', 72),
('Aluno', 1, 4, 5, 4, '2025-10-15', 73),
('Aluno', 4, 4, 5, 4, '2025-10-15', 74),
('Aluno', 5, 5, 4, 4, '2025-10-15', 75),
('Aluno', 4, 5, 5, 2, '2025-10-15', 76),
('Aluno', 4, 4, 5, 1, '2025-10-15', 77),
('Aluno', 4, 3, 2, 3, '2025-10-15', 78),
('Aluno', 4, 4, 4, 2, '2025-10-15', 79),
('Aluno', 4, 4, 4, 4, '2025-10-15', 80),
('Aluno', 1, 4, 4, 2, '2025-10-15', 81),
('Aluno', 1, 2, 1, 2, '2025-10-15', 82),
('Aluno', 4, 3, 3, 4, '2025-10-15', 83),
('Aluno', 3, 4, 3, 4, '2025-10-15', 84),
('Aluno', 1, 1, 1, 3, '2025-10-15', 85),
('Aluno', 5, 5, 5, 1, '2025-10-15', 86),
('Aluno', 4, 3, 3, 4, '2025-10-15', 87),
('Aluno', 5, 5, 4, 1, '2025-10-15', 88),
('Aluno', 4, 4, 4, 2, '2025-10-15', 89),
('Aluno', 4, 4, 5, 2, '2025-10-15', 90),
('Aluno', 1, 1, 1, 3, '2025-10-15', 91),
('Aluno', 5, 5, 5, 3, '2025-10-15', 92),
('Aluno', 4, 4, 4, 3, '2025-10-15', 93),
('Aluno', 4, 4, 4, 3, '2025-10-15', 94),
('Aluno', 5, 5, 5, 3, '2025-10-15', 95),
('Aluno', 3, 3, 3, 3, '2025-10-15', 96),
('Aluno', 4, 4, 4, 2, '2025-10-15', 97),
('Aluno', 5, 5, 5, 2, '2025-10-15', 98),
('Aluno', 4, 4, 4, 3, '2025-10-15', 99),
('Aluno', 4, 4, 5, 2, '2025-10-15', 100),
('Aluno', 4, 4, 4, 1, '2025-10-15', 101),
('Aluno', 5, 5, 3, 4, '2025-10-15', 102),
('Aluno', 2, 3, 2, 2, '2025-10-15', 103),
('Colaborador', 3, 3, 3, 3, '2025-10-15', 104),
('Colaborador', 3, 3, 3, 3, '2025-10-15', 105),
('Aluno', 4, 4, 4, 4, '2025-10-15', 106),
('Aluno', 1, 1, 1, 2, '2025-10-15', 107),
('Aluno', 4, 5, 5, 4, '2025-10-15', 108),
('Aluno', 5, 4, 5, 1, '2025-10-15', 109),
('Aluno', 5, 5, 5, 3, '2025-10-15', 110),
('Aluno', 3, 2, 5, 3, '2025-10-15', 111),
('Aluno', 4, 2, 5, 2, '2025-10-15', 112),
('Aluno', 4, 4, 5, 4, '2025-10-15', 113),
('Aluno', 4, 4, 1, 2, '2025-10-15', 114),
('Aluno', 5, 4, 5, 3, '2025-10-15', 115),
('Aluno', 1, 2, 3, 1, '2025-10-15', 116),
('Colaborador', 3, 4, 3, 4, '2025-10-15', 117),
('Aluno', 3, 3, 3, 2, '2025-10-15', 118),
('Aluno', 4, 4, 3, 4, '2025-10-15', 119),
('Aluno', 4, 5, 3, 4, '2025-10-15', 120),
('Aluno', 4, 4, 4, 2, '2025-10-15', 121),
('Aluno', 4, 4, 4, 1, '2025-10-15', 122),
('Aluno', 4, 3, 4, 4, '2025-10-15', 123),
('Aluno', 4, 3, 4, 2, '2025-10-15', 124),
('Aluno', 4, 3, 4, 2, '2025-10-15', 125),
('Aluno', 4, 5, 3, 4, '2025-10-29', 127),
('Colaborador', 2, 2, 2, 4, '2025-10-29', 128),
('Colaborador', 1, 1, 3, 4, '2025-10-29', 129),
('Colaborador', 3, 3, 3, 4, '2025-10-29', 130),
('Colaborador', 4, 4, 2, 2, '2025-10-29', 131),
('Colaborador', 5, 4, 5, 2, '2025-10-29', 132),
('Aluno', 5, 4, 4, 1, '2025-10-29', 133),
('Aluno', 4, 5, 4, 4, '2025-10-29', 134),
('Aluno', 4, 5, 4, 3, '2025-10-29', 135),
('Aluno', 4, 5, 2, 3, '2025-10-29', 136),
('Aluno', 5, 5, 5, 1, '2025-10-29', 137),
('Aluno', 3, 3, 3, 1, '2025-10-29', 138),
('Aluno', 2, 1, 1, 2, '2025-10-29', 140),
('Aluno', 5, 3, 2, 2, '2025-10-29', 141),
('Aluno', 5, 3, 3, 3, '2025-10-29', 142),
('Aluno', 5, 5, 5, 3, '2025-10-29', 143),
('Aluno', 4, 5, 5, 3, '2025-10-29', 144),
('Aluno', 3, 4, 2, 0, '2025-10-29', 146),
('Colaborador', 1, 1, 1, 0, '2025-10-29', 147),
('Aluno', 4, 5, 5, 0, '2025-10-29', 148),
('Aluno', 5, 5, 4, 3, '2025-10-29', 149),
('Aluno', 5, 4, 5, 2, '2025-10-29', 150),
('Aluno', 4, 3, 4, 3, '2025-10-29', 151),
('Aluno', 1, 1, 1, 4, '2025-10-29', 152),
('Aluno', 4, 5, 2, 3, '2025-10-29', 153),
('Aluno', 3, 2, 3, 3, '2025-10-29', 154),
('Aluno', 4, 4, 4, 2, '2025-10-29', 155),
('Aluno', 1, 4, 2, 4, '2025-10-29', 156),
('Aluno', 3, 3, 3, 3, '2025-10-29', 157),
('Aluno', 1, 2, 2, 3, '2025-10-29', 158),
('Aluno', 2, 2, 2, 4, '2025-10-29', 159),
('Aluno', 4, 5, 2, 3, '2025-10-29', 160),
('Aluno', 4, 3, 4, 3, '2025-10-29', 161),
('Aluno', 2, 4, 5, 2, '2025-10-29', 162),
('Aluno', 4, 4, 2, 4, '2025-10-29', 163),
('Aluno', 4, 4, 5, 2, '2025-10-29', 164),
('Aluno', 2, 4, 5, 0, '2025-10-29', 165),
('Aluno', 1, 2, 2, 3, '2025-10-29', 166),
('Aluno', 1, 1, 2, 4, '2025-10-29', 167),
('Aluno', 1, 1, 1, 4, '2025-10-29', 168),
('Aluno', 4, 5, 5, 1, '2025-10-29', 169),
('Aluno', 4, 4, 4, 3, '2025-10-29', 170),
('Aluno', 3, 2, 3, 3, '2025-10-29', 171),
('Aluno', 2, 2, 3, 3, '2025-10-29', 172),
('Aluno', 1, 1, 1, 3, '2025-10-29', 173),
('Aluno', 2, 5, 1, 2, '2025-10-29', 174),
('Aluno', 1, 2, 1, 3, '2025-10-29', 175),
('Colaborador', 3, 3, 3, 4, '2025-10-29', 176),
('Aluno', 1, 1, 1, 3, '2025-10-29', 177),
('Aluno', 3, 2, 3, 3, '2025-10-29', 178),
('Aluno', 2, 4, 5, 4, '2025-10-29', 179),
('Aluno', 3, 3, 2, 4, '2025-10-29', 180),
('Aluno', 5, 4, 5, 2, '2025-10-29', 181),
('Aluno', 3, 3, 3, 3, '2025-10-29', 182),
('Aluno', 3, 3, 3, 4, '2025-10-29', 183),
('Aluno', 2, 5, 5, 0, '2025-10-29', 184),
('Aluno', 3, 2, 2, 4, '2025-10-29', 185),
('Aluno', 2, 2, 2, 3, '2025-10-29', 186),
('Aluno', 4, 4, 5, 3, '2025-10-29', 187),
('Aluno', 2, 1, 2, 3, '2025-10-29', 188),
('Aluno', 4, 5, 4, 1, '2025-10-29', 189),
('Aluno', 5, 5, 3, 3, '2025-10-29', 190),
('Aluno', 4, 2, 4, 4, '2025-10-29', 191),
('Aluno', 3, 4, 2, 3, '2025-10-29', 192),
('Aluno', 2, 2, 2, 4, '2025-10-29', 193),
('Aluno', 4, 4, 4, 0, '2025-10-29', 194),
('Aluno', 4, 3, 4, 4, '2025-10-29', 195),
('Aluno', 2, 4, 2, 3, '2025-10-29', 196),
('Aluno', 4, 4, 5, 4, '2025-10-29', 197),
('Aluno', 3, 3, 3, 3, '2025-10-29', 198),
('Aluno', 5, 2, 5, 2, '2025-10-29', 199),
('Aluno', 4, 4, 4, 2, '2025-10-29', 200),
('Colaborador', 4, 3, 1, 2, '2025-10-29', 201),
('Aluno', 4, 4, 4, 2, '2025-10-29', 202),
('Aluno', 4, 4, 2, 4, '2025-10-29', 203),
('Aluno', 4, 2, 3, 3, '2025-10-29', 204),
('Aluno', 3, 3, 3, 3, '2025-10-29', 205),
('Aluno', 4, 4, 2, 1, '2025-10-29', 206),
('Aluno', 2, 2, 5, 1, '2025-10-29', 207),
('Aluno', 4, 4, 4, 3, '2025-10-29', 208),
('Aluno', 1, 4, 3, 4, '2025-10-29', 209),
('Aluno', 2, 4, 2, 1, '2025-10-29', 210),
('Aluno', 3, 3, 5, 3, '2025-10-29', 211),
('Aluno', 3, 2, 5, 3, '2025-10-29', 212),
('Aluno', 4, 3, 4, 4, '2025-10-29', 213),
('Colaborador', 3, 4, 3, 4, '2025-10-29', 214),
('Aluno', 1, 3, 5, 4, '2025-10-29', 215),
('Aluno', 4, 5, 5, 3, '2025-10-29', 216),
('Aluno', 3, 4, 3, 2, '2025-10-29', 217),
('Aluno', 4, 4, 4, 1, '2025-10-29', 218),
('Colaborador', 5, 4, 5, 2, '2025-10-29', 219),
('Aluno', 3, 3, 4, 3, '2025-10-29', 220),
('Aluno', 3, 3, 3, 4, '2025-10-29', 221),
('Aluno', 3, 3, 3, 3, '2025-10-29', 222),
('Aluno', 4, 4, 4, 2, '2025-10-29', 223),
('Aluno', 4, 4, 4, 2, '2025-10-29', 224),
('Colaborador', 3, 3, 3, 4, '2025-10-29', 225),
('Colaborador', 4, 4, 4, 4, '2025-10-29', 226),
('Aluno', 5, 5, 5, 4, '2025-10-29', 227),
('Colaborador', 4, 4, 4, 2, '2025-10-29', 228);

-- --------------------------------------------------------

--
-- Estrutura para tabela `causa`
--

DROP TABLE IF EXISTS `causa`;
CREATE TABLE IF NOT EXISTS `causa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `causa`
--

INSERT INTO `causa` (`id`, `nome`) VALUES
(1, 'Familiar'),
(2, 'Relacionamento'),
(3, 'Faculdade'),
(4, 'Trabalho');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emocoes`
--

DROP TABLE IF EXISTS `emocoes`;
CREATE TABLE IF NOT EXISTS `emocoes` (
  `id_emocao` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_emocao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emocoes`
--

INSERT INTO `emocoes` (`id_emocao`, `nome`) VALUES
(1, 'Triste'),
(2, 'Ansioso'),
(3, 'Estressado'),
(4, 'Calmo'),
(5, 'Feliz');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
