/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `mixcarmobile` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mixcarmobile`;

CREATE TABLE IF NOT EXISTS `acessorio` (
  `acessorio_id` int(11) NOT NULL AUTO_INCREMENT,
  `acessorio_nome` varchar(20) DEFAULT NULL,
  `acessorio_preco` double DEFAULT NULL,
  `id_carro` int(11) NOT NULL,
  PRIMARY KEY (`acessorio_id`),
  KEY `id_carro` (`id_carro`),
  CONSTRAINT `id_carro` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`carro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `acessorio` DISABLE KEYS */;
INSERT INTO `acessorio` (`acessorio_id`, `acessorio_nome`, `acessorio_preco`, `id_carro`) VALUES
	(1, 'Freios ABS', 500, 1),
	(2, 'Airbag duplo', 1500, 1),
	(3, 'Controle de tracao', 2500, 1),
	(4, 'Suspensao a ar', 2000, 3),
	(5, 'Freios ABS', 700, 3),
	(6, 'Airbag duplo', 1700, 3),
	(7, 'Controle de tracao', 1000, 2),
	(8, 'Suspensao a ar', 1500, 2),
	(9, 'Airbag duplo', 1100, 2),
	(10, 'Farol de milha', 1200, 4),
	(11, 'Freios ABS', 800, 4),
	(12, 'Controle de tracao', 900, 4),
	(13, 'Airbag duplo', 500, 5),
	(14, 'Suspensao a ar', 2500, 5),
	(15, 'Banco esportivo', 3500, 5),
	(16, 'Cambio automatico', 3000, 7),
	(17, 'Freios ABS', 500, 7),
	(18, 'Farol de milha', 2000, 7);
/*!40000 ALTER TABLE `acessorio` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `agendamento` (
  `agendamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `agendamento_valor` double DEFAULT NULL,
  `agendamento_data` date DEFAULT NULL,
  `agendamento_horario` time DEFAULT NULL,
  `agendamento_confirmado` tinyint(1) DEFAULT NULL,
  `id_carro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`agendamento_id`),
  KEY `FK_agendamento_carro` (`id_carro`),
  KEY `FK_agendamento_usuario` (`id_usuario`),
  CONSTRAINT `FK_agendamento_carro` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`carro_id`),
  CONSTRAINT `FK_agendamento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` (`agendamento_id`, `agendamento_valor`, `agendamento_data`, `agendamento_horario`, `agendamento_confirmado`, `id_carro`, `id_usuario`) VALUES
	(2, 170000, '2017-06-17', '09:00:00', 1, 1, 27),
	(4, 30000, '2017-06-17', '09:00:00', 1, 7, 26),
	(5, 2504000, '2017-06-17', '10:45:00', 1, 5, 26),
	(6, 172000, '2017-06-20', '10:45:00', 1, 1, 26);
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `carro` (
  `carro_id` int(11) NOT NULL AUTO_INCREMENT,
  `carro_modelo` varchar(20) NOT NULL,
  `carro_preco` double NOT NULL,
  `carro_img` varchar(200) NOT NULL,
  PRIMARY KEY (`carro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` (`carro_id`, `carro_modelo`, `carro_preco`, `carro_img`) VALUES
	(1, 'Hyundai Azera 3.0', 170000, 'img/2012-hyundai-azera-sedan-side-view.png'),
	(2, 'Jeep Renegade Trail', 140000, 'img/Jeep-Renegade-Trailhawk-2016.jpg'),
	(3, 'Impala 6.5', 210000, 'img/impala.jpg'),
	(4, 'Nissan Skyline GTR', 270000, 'img/2015-Nissan-Skyline-GTR-Nismo.jpg'),
	(5, 'Lamborghini Veneno', 2500000, 'img/lamborghini-veveno.jpg'),
	(7, 'Kombi Flu', 25000, 'img/kombi.jpg'),
	(8, 'Fusca 1500', 8000, 'img/fusca-1984.jpg');
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nome` varchar(50) DEFAULT NULL,
  `usuario_endereco` varchar(100) DEFAULT NULL,
  `usuario_telefone` varchar(15) DEFAULT NULL,
  `usuario_cpf` varchar(14) DEFAULT NULL,
  `usuario_email` varchar(100) DEFAULT NULL,
  `usuario_senha` varchar(50) DEFAULT NULL,
  `usuario_dataNascimento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_id`, `usuario_nome`, `usuario_endereco`, `usuario_telefone`, `usuario_cpf`, `usuario_email`, `usuario_senha`, `usuario_dataNascimento`) VALUES
	(25, 'Administrador', 'Rua dos Coqueiros, 159', '3698-8954', '1236498 ', 'admin@gmail.com', '654321', '1996-01-01'),
	(26, 'Adilio Martins', 'Rua olinda,157', '1234-4566', '134652 ', 'adilio@gmail.com.br', '1222', '25/01/1987'),
	(27, ' Renata Rios ', 'Rua Dias da Cruz, 74 - apt 504 ', '2133319116 ', '00000000000 ', 'rerioss@gmail.com ', '12345 ', '1989-03-13'),
	(28, ' Rute Dantas ', 'Travessa Penedo, 209 - Rio Claro, RJ ', '(21)2345-3456 ', '112.233.453-34', 'rute@gmail.com ', '1233 ', '2005-01-01'),
	(29, ' Lucas Souto ', 'Avenida Lontres, 765 ', '(21)98765-9876 ', '123.213.987-34', 'lucas@gmail.com ', '1234 ', '2008-07-05'),
	(30, 'Rafaela', 'Rua dezoito', '(21)3245-0987', '124.123.122-98', 'rafa@gmail.com', '4321', '06/01/1987'),
	(31, ' Mix ', 'RUA ', '1234-4321 ', '2332 ', 'mix@gmail.com ', '1234 ', '01/01/1981');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
