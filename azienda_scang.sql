-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2021 at 06:18 PM
-- Server version: 8.0.22
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azienda_scang`
--

-- --------------------------------------------------------

--
-- Table structure for table `altraspesa`
--

CREATE TABLE `altraspesa` (
  `Codice` int NOT NULL,
  `importo` decimal(8,2) NOT NULL,
  `Scadenza` date DEFAULT NULL,
  `Causale` varchar(100) NOT NULL,
  `DataSpesa` date DEFAULT NULL
) ;

--
-- Dumping data for table `altraspesa`
--

INSERT INTO `altraspesa` (`Codice`, `importo`, `Scadenza`, `Causale`, `DataSpesa`) VALUES
(1, '200.00', '2020-12-30', 'Bolletta', '2020-12-17'),
(2, '300.00', NULL, 'Acquisto aghi', '2020-12-14'),
(3, '50.00', NULL, 'Acquisto filo', '2020-12-12'),
(4, '1500.00', '2020-12-31', 'bolletta', '2020-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `Piva` varchar(11) NOT NULL,
  `NomeAzienda` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Web` varchar(40) DEFAULT NULL,
  `CAP` int UNSIGNED DEFAULT NULL,
  `Citta` varchar(30) DEFAULT NULL,
  `Via` varchar(20) DEFAULT NULL,
  `Numciv` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`Piva`, `NomeAzienda`, `Email`, `Web`, `CAP`, `Citta`, `Via`, `Numciv`) VALUES
('00382520427', 'Denim Politecnica', 'Denim@univpm.it', 'www.ingegneria.univpm.it', 60131, 'Ancona', 'Via Brecce Bianche', NULL),
('10203044557', 'Pantaloni Jeans', 'pantaloni@libero.it', 'www.pantjeans.com', 60100, 'Ancona', 'Via dell\'industria', 25),
('10654478557', 'Fashion Manifatture', 'Fashion@gmail.com', 'www.FaManifatture.com', 60100, 'Ancona', 'Via dell\'industria', 30),
('22369978527', 'Abbigliamento Abruzzo', 'AbbAb@yahoo.com', 'www.Abbabruzzo.com', 65121, 'Pescara', 'Via della bottega', 66),
('23568472720', 'Moda meraviglia', 'Modameraviglia@outlook.com', 'www.meraviglia.com', 64010, 'Colonnella', 'Via delle arti ', 120);

-- --------------------------------------------------------

--
-- Table structure for table `commessa`
--

CREATE TABLE `commessa` (
  `CodiceMerce` int NOT NULL,
  `ClientePiva` varchar(11) NOT NULL,
  `NumeroCommessa` varchar(15) DEFAULT NULL,
  `Tessuto` varchar(10) DEFAULT NULL,
  `Qta` decimal(5,0) NOT NULL,
  `ValoreDipendente` decimal(6,2) NOT NULL DEFAULT '0.00',
  `ValoreCliente` decimal(6,2) NOT NULL,
  `NumDDTCliente` int NOT NULL,
  `DataIngresso` date NOT NULL,
  `DDTAziendale` int DEFAULT NULL,
  `ModelloCommessa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ;

--
-- Dumping data for table `commessa`
--

INSERT INTO `commessa` (`CodiceMerce`, `ClientePiva`, `NumeroCommessa`, `Tessuto`, `Qta`, `ValoreDipendente`, `ValoreCliente`, `NumDDTCliente`, `DataIngresso`, `DDTAziendale`, `ModelloCommessa`) VALUES
(74, '10203044557', '163860', 'J358', '352', '176.00', '401.28', 55, '2020-12-08', 1, '53244'),
(75, '10203044557', '163861', 'J358', '189', '94.50', '215.46', 55, '2020-12-08', 1, '53244'),
(76, '10203044557', '163863', 'J368', '132', '66.00', '150.48', 55, '2020-12-08', 1, '53244'),
(77, '10203044557', '163864', 'J458', '145', '304.50', '609.00', 55, '2020-12-08', 1, '21757'),
(78, '10203044557', '163985', 'J358', '96', '48.00', '109.44', 59, '2020-12-10', 3, '53244'),
(79, '10203044557', '163986', 'C452', '74', '37.00', '84.36', 59, '2020-12-10', 3, '53244'),
(80, '10203044557', '164020', 'X248', '55', '27.50', '62.70', 59, '2020-12-10', 3, '53244'),
(81, '10203044557', '163029', 'Y324', '236', '495.60', '991.20', 59, '2020-12-10', 3, '21757'),
(82, '22369978527', 'DFG874', NULL, '978', '1075.80', '1956.00', 100, '2020-12-10', 4, 'Jack'),
(83, '22369978527', 'DFG875', NULL, '152', '167.20', '304.00', 100, '2020-12-10', 4, 'Jack'),
(84, '22369978527', 'DFG878', 'C-23', '685', '2192.00', '5480.00', 100, '2020-12-10', 4, 'Shirt-358'),
(85, '22369978527', 'DFG879', 'C-23', '53', '169.60', '424.00', 100, '2020-12-10', 4, 'Shirt-358'),
(86, '10654478557', '5060', 'XF569', '252', '504.00', '1360.80', 60, '2020-12-12', 5, 'FW313'),
(87, '10654478557', '5068', 'XF569', '328', '524.80', '1148.00', 60, '2020-12-12', NULL, 'UG895'),
(88, '10654478557', '5069', 'XF569', '462', '2125.20', '3788.40', 60, '2020-12-12', NULL, 'JS5632'),
(89, '10654478557', '5071', NULL, '369', '1291.50', '2287.80', 60, '2020-12-12', NULL, 'FL6530'),
(90, '10203044557', '164260', 'J527', '282', '1438.20', '5752.80', 62, '2020-12-15', NULL, '11200'),
(91, '10203044557', '164261', 'Z598', '756', '378.00', '861.84', 62, '2020-12-15', NULL, '53244'),
(92, '10203044557', '164266', 'C452', '293', '615.30', '1230.60', 62, '2020-12-15', NULL, '21757'),
(93, '10203044557', '164268', 'J587', '757', '3179.40', '6548.05', 62, '2020-12-15', NULL, '40131'),
(94, '10203044557', '164300', 'C821', '351', '737.10', '1474.20', 66, '2020-12-16', NULL, '21757'),
(95, '10203044557', '164301', 'C821', '798', '1675.80', '3351.60', 66, '2020-12-16', NULL, '21757'),
(96, '10203044557', '164302', 'C821', '1058', '2221.80', '4443.60', 66, '2020-12-16', NULL, '21757'),
(97, '10203044557', '164303', 'C821', '129', '270.90', '541.80', 66, '2020-12-16', NULL, '21757'),
(98, '23568472720', NULL, 'J358', '102', '652.80', '1285.20', 158, '2020-12-18', NULL, 'Orlando FW518'),
(99, '23568472720', NULL, 'J358', '123', '1168.50', '2238.60', 158, '2020-12-18', NULL, 'London FS109'),
(100, '23568472720', NULL, 'J358', '117', '1170.00', '2468.70', 158, '2020-12-18', NULL, 'Paris GT231'),
(101, '23568472720', NULL, 'J358', '201', '2010.00', '4241.10', 158, '2020-12-18', NULL, 'Paris GT231'),
(102, '10654478557', '5102', 'J358', '352', '1232.00', '2675.20', 70, '2020-12-17', NULL, 'PJ9872'),
(103, '10654478557', '5108', 'J358', '352', '1232.00', '2182.40', 70, '2020-12-17', NULL, 'FL6530'),
(104, '10654478557', '5109', 'J358', '352', '1232.00', '2182.40', 70, '2020-12-17', NULL, 'FL6530'),
(105, '10654478557', '5111', 'J358', '352', '901.12', '1971.20', 70, '2020-12-17', NULL, 'PJ9785'),
(106, '10654478557', '5123', 'J358', '352', '1619.20', '2886.40', 87, '2020-12-19', NULL, 'JS5632'),
(107, '10654478557', '5125', 'J358', '352', '1619.20', '2886.40', 87, '2020-12-19', NULL, 'JS5632'),
(108, '10654478557', '5127', 'J358', '352', '901.12', '1971.20', 87, '2020-12-19', NULL, 'PJ9785'),
(109, '10654478557', '5139', 'J358', '352', '1232.00', '2182.40', 87, '2020-12-19', NULL, 'FL6530');

--
-- Triggers `commessa`
--
DELIMITER $$
CREATE TRIGGER `Controllo_data_ddt_comm` AFTER UPDATE ON `commessa` FOR EACH ROW begin

if(new.DataIngresso > (select Data from Contabile where NumeroDDT = new.DDTAziendale)) then
signal sqlstate '45000' set message_text = 'Non puoi inserire questa commessa in una ddt con la data prima del arrivo della commissione' ;             
end if;

end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `checkclient` BEFORE UPDATE ON `commessa` FOR EACH ROW BEGIN
if ((new.DDTAziendale <> old.DDTAziendale OR old.DDTAziendale is NULL) AND new.DDTAziendale is not NULL) then
if( (SELECT COUNT(Cliente) FROM commessa WHERE commessa.DDTAziendale=DDTAziendale GROUP BY Cliente) >1) then
signal sqlstate '45000' set message_text ='Vietato inserire commessa da diversi clienti nello stesso DDT';
end if;
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contabile`
--

CREATE TABLE `contabile` (
  `NumeroDDT` int NOT NULL,
  `LuogoDest` varchar(10) NOT NULL,
  `DataTrasporto` date NOT NULL,
  `NumFattura` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contabile`
--

INSERT INTO `contabile` (`NumeroDDT`, `LuogoDest`, `DataTrasporto`, `NumFattura`) VALUES
(1, 'IDEM', '2020-11-14', 1),
(3, 'Lavanderia', '2020-12-17', 1),
(4, 'IDEM', '2020-12-15', 2),
(5, 'Stireria', '2020-12-09', 3);

--
-- Triggers `contabile`
--
DELIMITER $$
CREATE TRIGGER `Controllo_Cliente_DDT` AFTER UPDATE ON `contabile` FOR EACH ROW begin 
if (select count(distinct cliente) from Entrata join (contabile join commessa on contabile.NumeroDDT = commessa.DDTAziendale) on Entrata.NumeroFattura = contabile.NumFattura where Numfattura = new.NumFattura > 1) then 
signal sqlstate '45000' set message_text = 'Vietato aggiornare DDT di una stessa fattura con diversi clienti' ;                
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Controllo_data_ddt_Entrata` AFTER UPDATE ON `contabile` FOR EACH ROW begin


if(new.DataTrasporto > (SELECT Data from Entrata where numero_fattura = new.NumFattura)) then
signal sqlstate '45000' set message_text = 'Non puoi associare un DDT con una data maggiore dell'uscita associata' ;             
end if;

end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Controllo_data_ddt_aggiornamento` BEFORE UPDATE ON `contabile` FOR EACH ROW begin

if(new.DataTrasporto < (SELECT max(DataTrasporto) from Contabile where Contabile.NumeroDDT < new.NumeroDDT)) then
signal sqlstate '45000' set message_text = 'DDT precedente ha una data maggiore della data di modifica';             
end if;


end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Controllo_data_ddt_inserimento` BEFORE INSERT ON `contabile` FOR EACH ROW begin


if(new.DataTrasporto < (SELECT max(DataTrasporto) from Contabile where Contabile.NumeroDDT < new.NumeroDDT)) then
signal sqlstate '45000' set message_text = 'DDT precedente ha una data maggiore della data attuale';             
end if;

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ddt`
--

CREATE TABLE `ddt` (
  `NumeroDDT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ddt`
--

INSERT INTO `ddt` (`NumeroDDT`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);

-- --------------------------------------------------------

--
-- Table structure for table `dipendente`
--

CREATE TABLE `dipendente` (
  `CF` char(16) NOT NULL,
  `NomeCogn` char(30) NOT NULL,
  `DatNascita` date DEFAULT NULL,
  `IBAN` char(34) DEFAULT NULL,
  `TipoDip` varchar(15) NOT NULL,
  `ImpOrFeriale` decimal(7,3) DEFAULT '0.000',
  `ImpOrStraordinario` decimal(7,3) DEFAULT '0.000',
  `ImpOrRegolare` decimal(7,3) DEFAULT '0.000'
) ;

--
-- Dumping data for table `dipendente`
--

INSERT INTO `dipendente` (`CF`, `NomeCogn`, `DatNascita`, `IBAN`, `TipoDip`, `ImpOrFeriale`, `ImpOrStraordinario`, `ImpOrRegolare`) VALUES
('CRVLTT84M49H446V', 'Loretta Corvero', '1984-08-09', 'IT81L0300203280487944792229', 'pulizia', '35.000', '12.350', '9.800'),
('GNTSNG02C51I209D', 'Solange Gentilcore', '2002-03-11', 'IT45U0300203280498718444233', 'pro', '35.000', '17.350', '9.500'),
('MRTCST83L54H342P', 'Cristina Martinovich', '1983-07-14', 'IT50R0300203280743852447111', 'res', '50.000', '15.350', '10.500'),
('PCSGVS83M23M251S', 'Gervaso Pocosgnich', '1983-08-23', 'IT19S0300203280472345545625', 'pro', '45.000', '17.350', '8.500'),
('PLTVRD90B01A462X', 'Pluto Verdi', '1990-01-02', 'IT06E0300203280188542316388', 'gen', '48.000', '17.350', '12.500'),
('PPPRSS80A01L103C', 'Pippo Rossi', '1980-01-01', 'IT25C0300203280958793731861', 'gen', '40.000', '15.350', '10.500'),
('PPRRCN88C02H501O', 'Paperino Arancioni', '1988-02-03', 'IT30A0300203280554994894651', 'pro', '30.000', '10.350', '8.000'),
('TZIBRN90B03A794N', 'Tizio Bruni', '1990-02-03', 'IT09M0300203280257599387812', 'inserviente', '48.000', '12.350', '10.000');

-- --------------------------------------------------------

--
-- Table structure for table `entrata`
--

CREATE TABLE `entrata` (
  `NumeroFattura` int NOT NULL,
  `ImportoEntrata` decimal(7,2) DEFAULT NULL,
  `Dataversamento` date DEFAULT NULL,
  `Data` date NOT NULL
) ;

--
-- Dumping data for table `entrata`
--

INSERT INTO `entrata` (`NumeroFattura`, `ImportoEntrata`, `Dataversamento`, `Data`) VALUES
(1, '2623.92', NULL, '2020-12-31'),
(2, '8164.00', NULL, '2020-12-31'),
(3, '1360.80', NULL, '2020-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `listinoprezzi`
--

CREATE TABLE `listinoprezzi` (
  `Modello` varchar(20) NOT NULL,
  `ValoreCliente` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ValoreDipendente` decimal(5,2) NOT NULL DEFAULT '0.00'
) ;

--
-- Dumping data for table `listinoprezzi`
--

INSERT INTO `listinoprezzi` (`Modello`, `ValoreCliente`, `ValoreDipendente`) VALUES
('11200', '20.40', '5.10'),
('21757', '4.20', '2.10'),
('40131', '8.65', '4.20'),
('53244', '1.14', '0.50'),
('Feller', '7.00', '3.50'),
('FL6530', '6.20', '3.50'),
('FW313', '5.40', '2.00'),
('Jack', '2.00', '1.10'),
('JS5632', '8.20', '4.60'),
('London FS109', '18.20', '9.50'),
('Orlando FW518', '12.60', '6.40'),
('Paris GT231', '21.10', '10.00'),
('PJ9785', '5.60', '2.56'),
('PJ9872', '7.60', '3.50'),
('Shirt-358', '8.00', '3.20'),
('UG895', '3.50', '1.60'),
('Venice', '10.00', '5.20');

-- --------------------------------------------------------

--
-- Table structure for table `noncontabile`
--

CREATE TABLE `noncontabile` (
  `NumeroDDT` int NOT NULL,
  `LuogoDest` varchar(10) NOT NULL,
  `DataTrasporto` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `noncontabile`
--

INSERT INTO `noncontabile` (`NumeroDDT`, `LuogoDest`, `DataTrasporto`) VALUES
(2, 'lavEsterna', '2020-11-14'),
(6, 'Lavanderia', '2020-12-17');

-- --------------------------------------------------------

--
-- Table structure for table `retribuzionevariabile`
--

CREATE TABLE `retribuzionevariabile` (
  `DataRetrVar` date NOT NULL,
  `DipProf` varchar(16) NOT NULL,
  `ImportoRetribuzione` decimal(6,2) NOT NULL DEFAULT '0.00'
) ;

--
-- Dumping data for table `retribuzionevariabile`
--

INSERT INTO `retribuzionevariabile` (`DataRetrVar`, `DipProf`, `ImportoRetribuzione`) VALUES
('2020-12-01', 'PCSGVS83M23M251S', '3960.82'),
('2020-12-31', 'GNTSNG02C51I209D', '2001.76'),
('2020-12-31', 'PPRRCN88C02H501O', '1627.38');

--
-- Triggers `retribuzionevariabile`
--
DELIMITER $$
CREATE TRIGGER `check_after_ret` AFTER UPDATE ON `retribuzionevariabile` FOR EACH ROW begin  
if ((select TipoDip from Dipendente where CF = new.DipProf) <> 'pro') then 
signal sqlstate '45000' set message_text = 'dipendente deve essere professionale';
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_ins_ret` AFTER INSERT ON `retribuzionevariabile` FOR EACH ROW begin  
if ((select TipoDip from Dipendente where CF = new.DipProf) <> 'pro') then 
signal sqlstate '45000' set message_text = 'dipendente deve essere professionale';
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stipendio`
--

CREATE TABLE `stipendio` (
  `Datastip` date NOT NULL,
  `Dip` varchar(16) NOT NULL,
  `OrLavoro` decimal(5,2) NOT NULL DEFAULT '0.00',
  `OrStraordinario` decimal(5,2) NOT NULL DEFAULT '0.00',
  `GiorniFerie` decimal(4,2) NOT NULL DEFAULT '0.00',
  `ImportoStip` decimal(7,2) NOT NULL DEFAULT '0.00'
) ;

--
-- Dumping data for table `stipendio`
--

INSERT INTO `stipendio` (`Datastip`, `Dip`, `OrLavoro`, `OrStraordinario`, `GiorniFerie`, `ImportoStip`) VALUES
('2020-12-01', 'CRVLTT84M49H446V', '180.00', '4.00', '0.00', '1813.40'),
('2020-12-01', 'GNTSNG02C51I209D', '176.00', '4.00', '0.00', '1741.40'),
('2020-12-01', 'MRTCST83L54H342P', '173.00', '0.00', '3.00', '1966.50'),
('2020-12-01', 'PCSGVS83M23M251S', '172.00', '0.00', '4.00', '1642.00'),
('2020-12-01', 'PLTVRD90B01A462X', '176.00', '2.00', '0.00', '2234.70'),
('2020-12-01', 'PPPRSS80A01L103C', '175.00', '0.00', '1.00', '1877.50'),
('2020-12-01', 'PPRRCN88C02H501O', '176.00', '2.00', '0.00', '1428.70'),
('2020-12-01', 'TZIBRN90B03A794N', '175.00', '5.00', '1.00', '1859.75');

-- --------------------------------------------------------

--
-- Table structure for table `suddivisionelavoro`
--

CREATE TABLE `suddivisionelavoro` (
  `Merce` int NOT NULL,
  `Dipendente` char(16) NOT NULL,
  `QtaAssegnata` decimal(3,0) NOT NULL DEFAULT '0',
  `QtaTrasferita` decimal(3,0) DEFAULT '0',
  `ValoreTrasferito` decimal(8,4) DEFAULT '0.0000',
  `DataTrasf` date DEFAULT NULL,
  `ValoreLavoro` decimal(8,2) NOT NULL
) ;

--
-- Dumping data for table `suddivisionelavoro`
--

INSERT INTO `suddivisionelavoro` (`Merce`, `Dipendente`, `QtaAssegnata`, `QtaTrasferita`, `ValoreTrasferito`, `DataTrasf`, `ValoreLavoro`) VALUES
(74, 'GNTSNG02C51I209D', '176', NULL, NULL, NULL, '88.00'),
(74, 'PPRRCN88C02H501O', '176', NULL, NULL, NULL, '88.00'),
(75, 'PCSGVS83M23M251S', '100', NULL, NULL, NULL, '50.00'),
(75, 'PPRRCN88C02H501O', '89', NULL, NULL, NULL, '44.50'),
(76, 'GNTSNG02C51I209D', '66', NULL, NULL, NULL, '33.00'),
(76, 'PCSGVS83M23M251S', '66', NULL, NULL, NULL, '33.00'),
(77, 'GNTSNG02C51I209D', '45', NULL, NULL, NULL, '94.50'),
(77, 'PPRRCN88C02H501O', '100', NULL, NULL, NULL, '210.00'),
(78, 'PCSGVS83M23M251S', '96', NULL, NULL, NULL, '48.00'),
(79, 'PPRRCN88C02H501O', '74', NULL, NULL, NULL, '37.00'),
(80, 'GNTSNG02C51I209D', '55', NULL, NULL, NULL, '27.50'),
(81, 'PCSGVS83M23M251S', '136', NULL, NULL, NULL, '285.60'),
(81, 'PPRRCN88C02H501O', '100', NULL, NULL, NULL, '210.00'),
(82, 'GNTSNG02C51I209D', '426', '426', '-0.3400', '2020-12-10', '323.76'),
(82, 'PCSGVS83M23M251S', '126', '852', '3.0303', '2020-12-10', '2720.42'),
(82, 'PPRRCN88C02H501O', '426', '426', '-0.3200', '2020-12-10', '332.28'),
(83, 'PCSGVS83M23M251S', '152', NULL, NULL, NULL, '167.20'),
(84, 'GNTSNG02C51I209D', '400', '400', '-0.2000', '2020-12-10', '1200.00'),
(84, 'PCSGVS83M23M251S', '143', '200', '0.2000', '2020-12-10', '497.60'),
(84, 'PPRRCN88C02H501O', '142', '200', '0.2000', '2020-12-10', '494.40'),
(85, 'PPRRCN88C02H501O', '66', NULL, NULL, NULL, '211.20'),
(86, 'GNTSNG02C51I209D', '200', '150', '-1.1000', '2020-12-12', '235.00'),
(86, 'PCSGVS83M23M251S', '55', '50', '1.1000', '2020-12-12', '165.00');

--
-- Triggers `suddivisionelavoro`
--
DELIMITER $$
CREATE TRIGGER `check_after_sudd` AFTER INSERT ON `suddivisionelavoro` FOR EACH ROW begin
if ((select TipoDip from Dipendente where CF = new.Dipendente) <> 'pro') then
signal sqlstate '45000' set message_text = 'dipendente deve essere professionale';
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_after_sudd_update` AFTER UPDATE ON `suddivisionelavoro` FOR EACH ROW begin
if ((select TipoDip from Dipendente where CF = new.Dipendente) <> 'pro') then
signal sqlstate '45000' set message_text = 'dipendente deve essere professionale';
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `telefono`
--

CREATE TABLE `telefono` (
  `Numero` varchar(10) NOT NULL,
  `ClientePiva` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `telefono`
--

INSERT INTO `telefono` (`Numero`, `ClientePiva`) VALUES
('0712204708', '00382520427'),
('3332020476', '10203044557'),
('3215520986', '10654478557'),
('0875414369', '22369978527'),
('0875100125', '23568472720');

-- --------------------------------------------------------

--
-- Table structure for table `transpesa`
--

CREATE TABLE `transpesa` (
  `CodSpe` int NOT NULL,
  `IDTran` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transpesa`
--

INSERT INTO `transpesa` (`CodSpe`, `IDTran`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `transretrvar`
--

CREATE TABLE `transretrvar` (
  `IDTran` int NOT NULL,
  `DataRetr` date NOT NULL,
  `DipCF` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transretrvar`
--

INSERT INTO `transretrvar` (`IDTran`, `DataRetr`, `DipCF`) VALUES
(16, '2020-12-31', 'GNTSNG02C51I209D'),
(17, '2020-12-31', 'GNTSNG02C51I209D'),
(18, '2020-12-31', 'PCSGVS83M23M251S'),
(19, '2020-12-31', 'PCSGVS83M23M251S'),
(20, '2020-12-31', 'PCSGVS83M23M251S'),
(21, '2020-12-31', 'PPRRCN88C02H501O'),
(22, '2020-12-31', 'PPRRCN88C02H501O');

-- --------------------------------------------------------

--
-- Table structure for table `transstip`
--

CREATE TABLE `transstip` (
  `IDTran` int NOT NULL,
  `DataStip` date NOT NULL,
  `DipCF` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transstip`
--

INSERT INTO `transstip` (`IDTran`, `DataStip`, `DipCF`) VALUES
(8, '2020-12-01', 'CRVLTT84M49H446V'),
(9, '2020-12-01', 'CRVLTT84M49H446V'),
(10, '2020-12-01', 'GNTSNG02C51I209D'),
(11, '2020-12-01', 'GNTSNG02C51I209D'),
(12, '2020-12-01', 'PLTVRD90B01A462X'),
(13, '2020-12-01', 'PLTVRD90B01A462X'),
(14, '2020-12-01', 'MRTCST83L54H342P'),
(15, '2020-12-01', 'MRTCST83L54H342P');

--
-- Triggers `transstip`
--
DELIMITER $$
CREATE TRIGGER `Controllo_data_transtip` AFTER UPDATE ON `transstip` FOR EACH ROW begin
    if((select DataEsecuzione from UscitaEffettuata 
    where ID = new.IDTran) < new.DataStip) 
    then
        signal sqlstate '45000' set message_text = 'non puoi inserire una data di pagamento piu' piccola di quella dell'uscita'.';        
    end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `uscitaeffettuata`
--

CREATE TABLE `uscitaeffettuata` (
  `ID` int NOT NULL,
  `DataEsecuzione` date NOT NULL,
  `ImportoEffettuato` decimal(6,2) NOT NULL DEFAULT '0.00'
) ;

--
-- Dumping data for table `uscitaeffettuata`
--

INSERT INTO `uscitaeffettuata` (`ID`, `DataEsecuzione`, `ImportoEffettuato`) VALUES
(1, '2020-12-20', '100.00'),
(2, '2020-12-21', '100.00'),
(3, '2020-12-18', '200.00'),
(4, '2020-12-19', '100.00'),
(5, '2020-12-20', '50.00'),
(6, '2020-12-22', '750.00'),
(7, '2020-12-23', '750.00'),
(8, '2020-12-10', '1000.00'),
(9, '2020-12-21', '774.20'),
(10, '2020-12-04', '1000.00'),
(11, '2020-12-24', '741.00'),
(12, '2020-12-03', '1200.00'),
(13, '2020-12-18', '1034.70'),
(14, '2020-12-02', '1500.00'),
(15, '2020-12-22', '466.50'),
(16, '2020-12-10', '1000.00'),
(17, '2020-12-21', '1001.76'),
(18, '2020-12-04', '1500.00'),
(19, '2020-12-14', '1500.00'),
(20, '2020-12-14', '960.82'),
(21, '2020-12-03', '1000.00'),
(22, '2020-12-18', '627.38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `altraspesa`
--
ALTER TABLE `altraspesa`
  ADD PRIMARY KEY (`Codice`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Piva`);

--
-- Indexes for table `commessa`
--
ALTER TABLE `commessa`
  ADD PRIMARY KEY (`CodiceMerce`),
  ADD KEY `ClientePiva` (`ClientePiva`),
  ADD KEY `ModelloCommessa` (`ModelloCommessa`),
  ADD KEY `DDTAziendale` (`DDTAziendale`);

--
-- Indexes for table `contabile`
--
ALTER TABLE `contabile`
  ADD PRIMARY KEY (`NumeroDDT`),
  ADD KEY `NumFattura` (`NumFattura`);

--
-- Indexes for table `ddt`
--
ALTER TABLE `ddt`
  ADD PRIMARY KEY (`NumeroDDT`);

--
-- Indexes for table `dipendente`
--
ALTER TABLE `dipendente`
  ADD PRIMARY KEY (`CF`);

--
-- Indexes for table `entrata`
--
ALTER TABLE `entrata`
  ADD PRIMARY KEY (`NumeroFattura`);

--
-- Indexes for table `listinoprezzi`
--
ALTER TABLE `listinoprezzi`
  ADD PRIMARY KEY (`Modello`);

--
-- Indexes for table `noncontabile`
--
ALTER TABLE `noncontabile`
  ADD PRIMARY KEY (`NumeroDDT`);

--
-- Indexes for table `retribuzionevariabile`
--
ALTER TABLE `retribuzionevariabile`
  ADD PRIMARY KEY (`DataRetrVar`,`DipProf`);

--
-- Indexes for table `stipendio`
--
ALTER TABLE `stipendio`
  ADD PRIMARY KEY (`Datastip`,`Dip`);

--
-- Indexes for table `suddivisionelavoro`
--
ALTER TABLE `suddivisionelavoro`
  ADD PRIMARY KEY (`Merce`,`Dipendente`),
  ADD KEY `Dipendente` (`Dipendente`);

--
-- Indexes for table `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`Numero`),
  ADD KEY `ClientePiva` (`ClientePiva`);

--
-- Indexes for table `transpesa`
--
ALTER TABLE `transpesa`
  ADD PRIMARY KEY (`CodSpe`,`IDTran`);

--
-- Indexes for table `transretrvar`
--
ALTER TABLE `transretrvar`
  ADD PRIMARY KEY (`IDTran`,`DataRetr`,`DipCF`);

--
-- Indexes for table `transstip`
--
ALTER TABLE `transstip`
  ADD PRIMARY KEY (`IDTran`,`DataStip`,`DipCF`);

--
-- Indexes for table `uscitaeffettuata`
--
ALTER TABLE `uscitaeffettuata`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `altraspesa`
--
ALTER TABLE `altraspesa`
  MODIFY `Codice` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commessa`
--
ALTER TABLE `commessa`
  MODIFY `CodiceMerce` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contabile`
--
ALTER TABLE `contabile`
  MODIFY `NumeroDDT` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ddt`
--
ALTER TABLE `ddt`
  MODIFY `NumeroDDT` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `uscitaeffettuata`
--
ALTER TABLE `uscitaeffettuata`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commessa`
--
ALTER TABLE `commessa`
  ADD CONSTRAINT `commessa_ibfk_1` FOREIGN KEY (`ClientePiva`) REFERENCES `cliente` (`Piva`),
  ADD CONSTRAINT `commessa_ibfk_2` FOREIGN KEY (`ModelloCommessa`) REFERENCES `listinoprezzi` (`Modello`),
  ADD CONSTRAINT `commessa_ibfk_3` FOREIGN KEY (`DDTAziendale`) REFERENCES `ddt` (`NumeroDDT`);

--
-- Constraints for table `contabile`
--
ALTER TABLE `contabile`
  ADD CONSTRAINT `contabile_ibfk_1` FOREIGN KEY (`NumFattura`) REFERENCES `entrata` (`NumeroFattura`) ON DELETE SET NULL,
  ADD CONSTRAINT `contabile_ibfk_2` FOREIGN KEY (`NumeroDDT`) REFERENCES `ddt` (`NumeroDDT`) ON DELETE CASCADE;

--
-- Constraints for table `noncontabile`
--
ALTER TABLE `noncontabile`
  ADD CONSTRAINT `noncontabile_ibfk_1` FOREIGN KEY (`NumeroDDT`) REFERENCES `ddt` (`NumeroDDT`) ON DELETE CASCADE;

--
-- Constraints for table `suddivisionelavoro`
--
ALTER TABLE `suddivisionelavoro`
  ADD CONSTRAINT `suddivisionelavoro_ibfk_1` FOREIGN KEY (`Merce`) REFERENCES `commessa` (`CodiceMerce`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `suddivisionelavoro_ibfk_2` FOREIGN KEY (`Dipendente`) REFERENCES `dipendente` (`CF`) ON UPDATE CASCADE;

--
-- Constraints for table `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`ClientePiva`) REFERENCES `cliente` (`Piva`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
