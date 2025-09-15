-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2024 at 11:31 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duolingo`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivnosti`
--

CREATE TABLE `aktivnosti` (
  `AKTIVNOST_ID` int(11) NOT NULL,
  `DOGADJAJ_ID` int(11) NOT NULL,
  `KORISNIK_ID` int(11) NOT NULL,
  `CILJ_ID` int(11) NOT NULL,
  `NAGRADA_ID` int(11) NOT NULL,
  `TEST_ID` int(11) NOT NULL,
  `STATISTIKA_ID` int(11) DEFAULT NULL,
  `DATUM_AKTIVNOSTI` date NOT NULL,
  `REZULTAT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aktivnosti`
--

INSERT INTO `aktivnosti` (`AKTIVNOST_ID`, `DOGADJAJ_ID`, `KORISNIK_ID`, `CILJ_ID`, `NAGRADA_ID`, `TEST_ID`, `STATISTIKA_ID`, `DATUM_AKTIVNOSTI`, `REZULTAT`) VALUES
(1, 101, 1, 1, 3, 1001, 2, '2024-03-12', 10),
(2, 102, 5, 1, 4, 1002, 5, '2024-03-30', 40),
(3, 104, 3, 5, 5, 1003, 2, '2024-04-03', 60),
(4, 102, 4, 1, 2, 1002, 1, '2024-04-11', 30),
(5, 101, 3, 2, 1, 1004, 1, '2024-04-15', 40);

-- --------------------------------------------------------

--
-- Table structure for table `bonusi`
--

CREATE TABLE `bonusi` (
  `BONUS_ID` int(11) NOT NULL,
  `DATUM_OSVOJENOG_BONUSA` date NOT NULL,
  `BROJ_BODOVA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bonusi`
--

INSERT INTO `bonusi` (`BONUS_ID`, `DATUM_OSVOJENOG_BONUSA`, `BROJ_BODOVA`) VALUES
(1, '2024-03-28', 10),
(2, '2024-03-27', 10),
(3, '2024-03-25', 10),
(4, '2024-03-24', 5),
(5, '2024-03-28', 5);

-- --------------------------------------------------------

--
-- Table structure for table `bonusi_aktivnosti`
--

CREATE TABLE `bonusi_aktivnosti` (
  `AKTIVNOST_ID` int(11) NOT NULL,
  `BONUS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bonusi_aktivnosti`
--

INSERT INTO `bonusi_aktivnosti` (`AKTIVNOST_ID`, `BONUS_ID`) VALUES
(1, 4),
(2, 2),
(3, 3),
(4, 5),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ciljevi`
--

CREATE TABLE `ciljevi` (
  `CILJ_ID` int(11) NOT NULL,
  `DATUM_POSTAVLJANJA_CILJA` date NOT NULL,
  `OPIS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ciljevi`
--

INSERT INTO `ciljevi` (`CILJ_ID`, `DATUM_POSTAVLJANJA_CILJA`, `OPIS`) VALUES
(1, '2024-03-31', 'preći sve lekcije'),
(2, '2024-04-04', NULL),
(3, '2024-04-18', NULL),
(4, '2024-03-30', NULL),
(5, '2024-03-28', 'imati max poena');

-- --------------------------------------------------------

--
-- Table structure for table `diskusije`
--

CREATE TABLE `diskusije` (
  `KATEGORIJA_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `TEKST` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diskusije`
--

INSERT INTO `diskusije` (`KATEGORIJA_ID`, `NAZIV`, `TEKST`) VALUES
(3, 'diskusija', 'diskusija o poslu'),
(3, 'diskusija', 'upoznavanje'),
(3, 'diskusija', 'hrana'),
(3, 'diskusija', 'putovanje'),
(3, 'diskusija', 'selo');

-- --------------------------------------------------------

--
-- Table structure for table `gramatike`
--

CREATE TABLE `gramatike` (
  `KATEGORIJA_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `TEKST` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gramatike`
--

INSERT INTO `gramatike` (`KATEGORIJA_ID`, `NAZIV`, `TEKST`) VALUES
(2, 'gramatika', 'vlastite imenice'),
(2, 'gramatika', 'glagoli'),
(2, 'gramatika', 'vremena'),
(2, 'gramatika', 'upravni govor'),
(2, 'gramatika', 'kondicionali');

-- --------------------------------------------------------

--
-- Table structure for table `jezici`
--

CREATE TABLE `jezici` (
  `JEZIK_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jezici`
--

INSERT INTO `jezici` (`JEZIK_ID`, `NAZIV`) VALUES
(1, 'engleski'),
(2, 'nemački'),
(3, 'ruski'),
(4, 'francuski'),
(5, 'italijanski');

-- --------------------------------------------------------

--
-- Table structure for table `kalendari`
--

CREATE TABLE `kalendari` (
  `DOGADJAJ_ID` int(11) NOT NULL,
  `DATUM` date NOT NULL,
  `OPIS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kalendari`
--

INSERT INTO `kalendari` (`DOGADJAJ_ID`, `DATUM`, `OPIS`) VALUES
(100, '2024-03-27', 'ispunjeje ciljeva'),
(101, '2024-03-30', 'ispunjeje ciljeva'),
(102, '2024-04-10', 'prešo sve lekcije'),
(104, '2024-04-07', 'imao max poena'),
(105, '2024-03-31', 'ispunjeje ciljeva');

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `KATEGORIJA_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`KATEGORIJA_ID`, `NAZIV`) VALUES
(1, 'vokabular'),
(2, 'gramatika'),
(3, 'diskusija');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE `korisnici` (
  `KORISNIK_ID` int(11) NOT NULL,
  `SLIKA_ID` int(11) DEFAULT NULL,
  `ONLINE_STATUS_ID` int(11) DEFAULT NULL,
  `IME` varchar(20) NOT NULL,
  `PREZIME` varchar(20) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `DATUM_REGISTRACIJE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`KORISNIK_ID`, `SLIKA_ID`, `ONLINE_STATUS_ID`, `IME`, `PREZIME`, `EMAIL`, `DATUM_REGISTRACIJE`) VALUES
(1, 1, 1, 'Marko', 'Nikolić', 'markonikolic@gmail.com', '2024-03-01'),
(2, 2, 2, 'Ana', 'Ilić', 'anailic@gmail.com', '2024-03-04'),
(3, 3, 3, 'Dušan', 'Marković', 'dmarkovic@gmail.com', '2024-02-21'),
(4, 4, 4, 'Vanja', 'Simić', 'vsimic@gmail.com', '2023-12-13'),
(5, 5, 5, 'Sara', 'Lukić', 'slukic@gmail.com', '2024-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `kursevi`
--

CREATE TABLE `kursevi` (
  `JEZIK_ID` int(11) NOT NULL,
  `KURS_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `NIVO` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kursevi`
--

INSERT INTO `kursevi` (`JEZIK_ID`, `KURS_ID`, `NAZIV`, `NIVO`) VALUES
(1, 11, 'Osnovni engleski', 'A1'),
(1, 12, 'Srednji engleski', 'B1'),
(3, 15, 'Napredni ruski', 'C2'),
(4, 13, 'Napredni francuski', 'C1'),
(5, 14, 'Osnovni italijanski', 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `lekcije`
--

CREATE TABLE `lekcije` (
  `JEZIK_ID` int(11) NOT NULL,
  `KURS_ID` int(11) NOT NULL,
  `LEKCIJA_ID` char(4) NOT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `BROJ_ZADATAKA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lekcije`
--

INSERT INTO `lekcije` (`JEZIK_ID`, `KURS_ID`, `LEKCIJA_ID`, `NAZIV`, `BROJ_ZADATAKA`) VALUES
(1, 11, 'aaaa', 'posao', 4),
(1, 11, 'bbbc', 'Zivotinje', 6),
(3, 15, 'aaac', 'Hrana i piće', 3),
(4, 13, 'bbbb', 'Sport', 5),
(5, 14, 'aaab', 'Hrana i piće', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nagrade`
--

CREATE TABLE `nagrade` (
  `NAGRADA_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `POTREBAN_BROJ_BODOVA` int(11) NOT NULL,
  `OPIS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nagrade`
--

INSERT INTO `nagrade` (`NAGRADA_ID`, `NAZIV`, `POTREBAN_BROJ_BODOVA`, `OPIS`) VALUES
(1, 'early bird', 50, NULL),
(2, 'night ow', 70, NULL),
(3, 'free', 0, 'kupuje se na dnevnom'),
(4, 'timer boost', 30, NULL),
(5, 'streak freeze', 60, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `odgovori`
--

CREATE TABLE `odgovori` (
  `ZADATAK_ID` int(11) NOT NULL,
  `ODGOVOR_ID` int(11) NOT NULL,
  `TEKST` varchar(30) NOT NULL,
  `TACNOST` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `odgovori`
--

INSERT INTO `odgovori` (`ZADATAK_ID`, `ODGOVOR_ID`, `TEKST`, `TACNOST`) VALUES
(1, 1, 'farmer', 'T'),
(1, 2, 'actor', 'N'),
(1, 5, 'lawyer', 'N'),
(2, 4, 'doctor', 'T'),
(4, 3, 'hello, i am Mark', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `online`
--

CREATE TABLE `online` (
  `ONLINE_STATUS_ID` int(11) NOT NULL,
  `KORISNIK_ID` int(11) NOT NULL,
  `STATUS` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `online`
--

INSERT INTO `online` (`ONLINE_STATUS_ID`, `KORISNIK_ID`, `STATUS`) VALUES
(1, 1, 'online'),
(2, 2, 'offline'),
(3, 3, 'online'),
(4, 4, 'online'),
(5, 5, 'online');

-- --------------------------------------------------------

--
-- Table structure for table `paketi`
--

CREATE TABLE `paketi` (
  `PAKET_ID` int(11) NOT NULL,
  `PLACANJE_ID` int(11) DEFAULT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `CENA` int(11) NOT NULL,
  `OPIS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paketi`
--

INSERT INTO `paketi` (`PAKET_ID`, `PLACANJE_ID`, `NAZIV`, `CENA`, `OPIS`) VALUES
(111, 101, 'Premium', 5000, NULL),
(112, 102, 'Super', 3000, 'plaća se na 2 meseca'),
(113, 103, 'Mega', 4000, 'plaća se na 3 meseca'),
(114, 104, 'Premium', 5000, NULL),
(115, 105, 'Mega', 4000, 'plaća se na 3 meseca');

-- --------------------------------------------------------

--
-- Table structure for table `placanja`
--

CREATE TABLE `placanja` (
  `PLACANJE_ID` int(11) NOT NULL,
  `NACIN_PLACANJA` varchar(20) NOT NULL,
  `DATUM_PLACANJA` date NOT NULL,
  `STATUS_PLACANJA` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `placanja`
--

INSERT INTO `placanja` (`PLACANJE_ID`, `NACIN_PLACANJA`, `DATUM_PLACANJA`, `STATUS_PLACANJA`) VALUES
(101, 'keš', '2024-03-03', 'uspešno'),
(102, 'kartica', '2024-02-06', 'neuspešno'),
(103, 'keš', '2024-01-02', 'uspešno'),
(104, 'kartica', '2024-03-16', 'neuspešno'),
(105, 'kartica', '2024-03-25', 'uspešno');

-- --------------------------------------------------------

--
-- Table structure for table `placanja_korisnika`
--

CREATE TABLE `placanja_korisnika` (
  `KORISNIK_ID` int(11) NOT NULL,
  `PLACANJE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `placanja_korisnika`
--

INSERT INTO `placanja_korisnika` (`KORISNIK_ID`, `PLACANJE_ID`) VALUES
(1, 101),
(1, 102),
(3, 102),
(3, 104),
(5, 105);

-- --------------------------------------------------------

--
-- Table structure for table `profilne_slike`
--

CREATE TABLE `profilne_slike` (
  `SLIKA_ID` int(11) NOT NULL,
  `KORISNIK_ID` int(11) NOT NULL,
  `URL` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profilne_slike`
--

INSERT INTO `profilne_slike` (`SLIKA_ID`, `KORISNIK_ID`, `URL`) VALUES
(1, 1, 'https://www.google.com/urlvVaw'),
(2, 2, 'https://www.google.com/urlvsds'),
(3, 3, 'https://www.google.com/urlvdsf'),
(4, 4, 'https://www.google.com/usdlvds'),
(5, 5, 'https://www.google.com/urlvbdb');

-- --------------------------------------------------------

--
-- Table structure for table `recenzije`
--

CREATE TABLE `recenzije` (
  `JEZIK_ID` int(11) NOT NULL,
  `KURS_ID` int(11) NOT NULL,
  `LEKCIJA_ID` char(4) NOT NULL,
  `RECENZIJA_ID` int(11) NOT NULL,
  `TEKST` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recenzije`
--

INSERT INTO `recenzije` (`JEZIK_ID`, `KURS_ID`, `LEKCIJA_ID`, `RECENZIJA_ID`, `TEKST`) VALUES
(1, 11, 'aaaa', 1, 'odličan'),
(1, 11, 'aaaa', 2, 'nije loše'),
(2, 12, 'aaab', 3, 'odličan'),
(3, 13, 'aaac', 5, 'odličan'),
(5, 15, 'bbbb', 4, 'ništa specijalno');

-- --------------------------------------------------------

--
-- Table structure for table `statistike`
--

CREATE TABLE `statistike` (
  `STATISTIKA_ID` int(11) NOT NULL,
  `BROJ_ZAVRSENIH_LEKCIJA` int(11) NOT NULL,
  `PROVEDENO_VREME` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statistike`
--

INSERT INTO `statistike` (`STATISTIKA_ID`, `BROJ_ZAVRSENIH_LEKCIJA`, `PROVEDENO_VREME`) VALUES
(1, 5, '02:14:06'),
(2, 2, '00:52:44'),
(3, 3, '01:15:05'),
(4, 5, '04:15:19'),
(5, 5, '07:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `testovi`
--

CREATE TABLE `testovi` (
  `TEST_ID` int(11) NOT NULL,
  `JEZIK_ID` int(11) NOT NULL,
  `KURS_ID` int(11) NOT NULL,
  `LEKCIJA_ID` char(4) NOT NULL,
  `TEKST` varchar(30) NOT NULL,
  `TEZINA_TESTA` varchar(15) NOT NULL,
  `BROJ_ZADATAKA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testovi`
--

INSERT INTO `testovi` (`TEST_ID`, `JEZIK_ID`, `KURS_ID`, `LEKCIJA_ID`, `TEKST`, `TEZINA_TESTA`, `BROJ_ZADATAKA`) VALUES
(1001, 1, 11, 'aaaa', 'Reši zadatke', 'lak', 10),
(1002, 2, 12, 'aaab', 'Reši zadatke', 'lak', 10),
(1003, 5, 15, 'bbbb', 'Reši zadatke', 'težak', 10),
(1004, 3, 15, 'aaac', 'Reši zadatke', 'težak', 10),
(1005, 3, 13, 'aaac', 'Reši zadatke', 'težak', 10);

-- --------------------------------------------------------

--
-- Table structure for table `testovi_korisnika`
--

CREATE TABLE `testovi_korisnika` (
  `KORISNIK_ID` int(11) NOT NULL,
  `TEST_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testovi_korisnika`
--

INSERT INTO `testovi_korisnika` (`KORISNIK_ID`, `TEST_ID`) VALUES
(1, 1001),
(2, 1004),
(3, 1002),
(4, 1002),
(5, 1004);

-- --------------------------------------------------------

--
-- Table structure for table `vokabulari`
--

CREATE TABLE `vokabulari` (
  `KATEGORIJA_ID` int(11) NOT NULL,
  `NAZIV` varchar(20) NOT NULL,
  `NAZIV_RECI` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vokabulari`
--

INSERT INTO `vokabulari` (`KATEGORIJA_ID`, `NAZIV`, `NAZIV_RECI`) VALUES
(1, 'vokabular', 'doctor'),
(1, 'vokabular', 'actor'),
(1, 'vokabular', 'baker'),
(1, 'vokabular', 'farmer'),
(1, 'vokabular', 'lawyer');

-- --------------------------------------------------------

--
-- Table structure for table `zadaci`
--

CREATE TABLE `zadaci` (
  `ZADATAK_ID` int(11) NOT NULL,
  `TEST_ID` int(11) NOT NULL,
  `KATEGORIJA_ID` int(11) NOT NULL,
  `TEKST` varchar(30) NOT NULL,
  `REZULTAT` int(11) NOT NULL,
  `NIVO_TEZINE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zadaci`
--

INSERT INTO `zadaci` (`ZADATAK_ID`, `TEST_ID`, `KATEGORIJA_ID`, `TEKST`, `REZULTAT`, `NIVO_TEZINE`) VALUES
(1, 1001, 1, 'zaokruži tačnu reč', 1, 'lak'),
(2, 1001, 1, 'zaokruži tačnu reč', 1, 'lak'),
(3, 1001, 2, 'napiši tačno rečenicu', 1, 'srednji'),
(4, 1001, 2, 'napiši tačno rečenicu', 1, 'težak'),
(5, 1002, 2, 'napiši tačno rečenicu', 1, 'srednji');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktivnosti`
--
ALTER TABLE `aktivnosti`
  ADD PRIMARY KEY (`AKTIVNOST_ID`),
  ADD KEY `FK_AKTIVNOS_AKTIVNOST_CILJEVI` (`CILJ_ID`),
  ADD KEY `FK_AKTIVNOS_AKTIVNOST_KORISNIC` (`KORISNIK_ID`),
  ADD KEY `FK_AKTIVNOS_AKTIVNOST_TEST` (`TEST_ID`),
  ADD KEY `FK_AKTIVNOS_KALENDAR__KALENDAR` (`DOGADJAJ_ID`),
  ADD KEY `FK_AKTIVNOS_NAGRADA_A_NAGRADE` (`NAGRADA_ID`),
  ADD KEY `FK_AKTIVNOS_STATISTIK_STATISTI` (`STATISTIKA_ID`);

--
-- Indexes for table `bonusi`
--
ALTER TABLE `bonusi`
  ADD PRIMARY KEY (`BONUS_ID`);

--
-- Indexes for table `bonusi_aktivnosti`
--
ALTER TABLE `bonusi_aktivnosti`
  ADD PRIMARY KEY (`AKTIVNOST_ID`,`BONUS_ID`),
  ADD KEY `FK_BONUSI_A_BONUS_AKT_BONUSI` (`BONUS_ID`);

--
-- Indexes for table `ciljevi`
--
ALTER TABLE `ciljevi`
  ADD PRIMARY KEY (`CILJ_ID`);

--
-- Indexes for table `diskusije`
--
ALTER TABLE `diskusije`
  ADD PRIMARY KEY (`KATEGORIJA_ID`);

--
-- Indexes for table `gramatike`
--
ALTER TABLE `gramatike`
  ADD PRIMARY KEY (`KATEGORIJA_ID`);

--
-- Indexes for table `jezici`
--
ALTER TABLE `jezici`
  ADD PRIMARY KEY (`JEZIK_ID`);

--
-- Indexes for table `kalendari`
--
ALTER TABLE `kalendari`
  ADD PRIMARY KEY (`DOGADJAJ_ID`);

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`KATEGORIJA_ID`);

--
-- Indexes for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD PRIMARY KEY (`KORISNIK_ID`),
  ADD KEY `FK_KORISNIC_SLIKA_KOR_PROFILNE` (`SLIKA_ID`),
  ADD KEY `FK_KORISNIC_STATUS_KO_ONLINE` (`ONLINE_STATUS_ID`);

--
-- Indexes for table `kursevi`
--
ALTER TABLE `kursevi`
  ADD PRIMARY KEY (`JEZIK_ID`,`KURS_ID`);

--
-- Indexes for table `lekcije`
--
ALTER TABLE `lekcije`
  ADD PRIMARY KEY (`JEZIK_ID`,`KURS_ID`,`LEKCIJA_ID`);

--
-- Indexes for table `nagrade`
--
ALTER TABLE `nagrade`
  ADD PRIMARY KEY (`NAGRADA_ID`);

--
-- Indexes for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD PRIMARY KEY (`ZADATAK_ID`,`ODGOVOR_ID`);

--
-- Indexes for table `online`
--
ALTER TABLE `online`
  ADD PRIMARY KEY (`ONLINE_STATUS_ID`),
  ADD KEY `FK_ONLINE_STATUS_KO_KORISNIC` (`KORISNIK_ID`);

--
-- Indexes for table `paketi`
--
ALTER TABLE `paketi`
  ADD PRIMARY KEY (`PAKET_ID`);

--
-- Indexes for table `placanja`
--
ALTER TABLE `placanja`
  ADD PRIMARY KEY (`PLACANJE_ID`);

--
-- Indexes for table `placanja_korisnika`
--
ALTER TABLE `placanja_korisnika`
  ADD PRIMARY KEY (`KORISNIK_ID`,`PLACANJE_ID`);

--
-- Indexes for table `profilne_slike`
--
ALTER TABLE `profilne_slike`
  ADD PRIMARY KEY (`SLIKA_ID`);

--
-- Indexes for table `recenzije`
--
ALTER TABLE `recenzije`
  ADD PRIMARY KEY (`JEZIK_ID`,`KURS_ID`,`LEKCIJA_ID`,`RECENZIJA_ID`);

--
-- Indexes for table `statistike`
--
ALTER TABLE `statistike`
  ADD PRIMARY KEY (`STATISTIKA_ID`);

--
-- Indexes for table `testovi`
--
ALTER TABLE `testovi`
  ADD PRIMARY KEY (`TEST_ID`);

--
-- Indexes for table `testovi_korisnika`
--
ALTER TABLE `testovi_korisnika`
  ADD PRIMARY KEY (`KORISNIK_ID`,`TEST_ID`);

--
-- Indexes for table `vokabulari`
--
ALTER TABLE `vokabulari`
  ADD PRIMARY KEY (`KATEGORIJA_ID`);

--
-- Indexes for table `zadaci`
--
ALTER TABLE `zadaci`
  ADD PRIMARY KEY (`ZADATAK_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktivnosti`
--
ALTER TABLE `aktivnosti`
  ADD CONSTRAINT `FK_AKTIVNOS_AKTIVNOST_CILJEVI` FOREIGN KEY (`CILJ_ID`) REFERENCES `ciljevi` (`CILJ_ID`),
  ADD CONSTRAINT `FK_AKTIVNOS_AKTIVNOST_KORISNIC` FOREIGN KEY (`KORISNIK_ID`) REFERENCES `korisnici` (`KORISNIK_ID`),
  ADD CONSTRAINT `FK_AKTIVNOS_AKTIVNOST_TEST` FOREIGN KEY (`TEST_ID`) REFERENCES `testovi` (`TEST_ID`),
  ADD CONSTRAINT `FK_AKTIVNOS_KALENDAR__KALENDAR` FOREIGN KEY (`DOGADJAJ_ID`) REFERENCES `kalendari` (`DOGADJAJ_ID`),
  ADD CONSTRAINT `FK_AKTIVNOS_NAGRADA_A_NAGRADE` FOREIGN KEY (`NAGRADA_ID`) REFERENCES `nagrade` (`NAGRADA_ID`),
  ADD CONSTRAINT `FK_AKTIVNOS_STATISTIK_STATISTI` FOREIGN KEY (`STATISTIKA_ID`) REFERENCES `statistike` (`STATISTIKA_ID`);

--
-- Constraints for table `bonusi_aktivnosti`
--
ALTER TABLE `bonusi_aktivnosti`
  ADD CONSTRAINT `FK_BONUSI_A_BONUS_AKT_AKTIVNOS` FOREIGN KEY (`AKTIVNOST_ID`) REFERENCES `aktivnosti` (`AKTIVNOST_ID`),
  ADD CONSTRAINT `FK_BONUSI_A_BONUS_AKT_BONUSI` FOREIGN KEY (`BONUS_ID`) REFERENCES `bonusi` (`BONUS_ID`);

--
-- Constraints for table `diskusije`
--
ALTER TABLE `diskusije`
  ADD CONSTRAINT `FK_DISKUSIJ_KATEGORIJ_KATEGORI` FOREIGN KEY (`KATEGORIJA_ID`) REFERENCES `kategorije` (`KATEGORIJA_ID`);

--
-- Constraints for table `gramatike`
--
ALTER TABLE `gramatike`
  ADD CONSTRAINT `FK_GRAMATIK_KATEGORIJ_KATEGORI` FOREIGN KEY (`KATEGORIJA_ID`) REFERENCES `kategorije` (`KATEGORIJA_ID`);

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `FK_KORISNIC_SLIKA_KOR_PROFILNE` FOREIGN KEY (`SLIKA_ID`) REFERENCES `profilne_slike` (`SLIKA_ID`),
  ADD CONSTRAINT `FK_KORISNIC_STATUS_KO_ONLINE` FOREIGN KEY (`ONLINE_STATUS_ID`) REFERENCES `online` (`ONLINE_STATUS_ID`);

--
-- Constraints for table `kursevi`
--
ALTER TABLE `kursevi`
  ADD CONSTRAINT `FK_KURSEVI_JEZIK_KUR_JEZICI` FOREIGN KEY (`JEZIK_ID`) REFERENCES `jezici` (`JEZIK_ID`);

--
-- Constraints for table `lekcije`
--
ALTER TABLE `lekcije`
  ADD CONSTRAINT `FK_LEKCIJE_LEKCIJA_K_KURSEVI` FOREIGN KEY (`JEZIK_ID`,`KURS_ID`) REFERENCES `kursevi` (`JEZIK_ID`, `KURS_ID`);

--
-- Constraints for table `odgovori`
--
ALTER TABLE `odgovori`
  ADD CONSTRAINT `FK_ODGOVORI_ODGOVOR_Z_ZADACI` FOREIGN KEY (`ZADATAK_ID`) REFERENCES `zadaci` (`ZADATAK_ID`);

--
-- Constraints for table `online`
--
ALTER TABLE `online`
  ADD CONSTRAINT `FK_ONLINE_STATUS_KO_KORISNIC` FOREIGN KEY (`KORISNIK_ID`) REFERENCES `korisnici` (`KORISNIK_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
