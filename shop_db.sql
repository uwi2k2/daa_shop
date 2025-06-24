-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 24. Jun 2025 um 08:56
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `buecherei`
--
CREATE DATABASE IF NOT EXISTS `buecherei` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `buecherei`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ausleihe`
--

CREATE TABLE `ausleihe` (
  `id` int(11) NOT NULL,
  `kunde_id` int(11) DEFAULT NULL,
  `buch_id` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ausleihe`
--

INSERT INTO `ausleihe` (`id`, `kunde_id`, `buch_id`, `datum`) VALUES
(1, 1, 4, '2025-05-14'),
(2, 2, 3, '2025-05-20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `vorname` varchar(100) DEFAULT NULL,
  `nachname` varchar(100) DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
  `land` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `autor`
--

INSERT INTO `autor` (`id`, `vorname`, `nachname`, `jahr`, `land`) VALUES
(1, 'Peter', 'Lustig', 1960, 'DE'),
(2, 'Gabi', 'Klein', 1990, 'AT'),
(3, 'Peter', 'Pan', 2000, 'US'),
(4, 'Wille', 'Woll', 2005, 'UN');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buch`
--

CREATE TABLE `buch` (
  `id` int(11) NOT NULL,
  `titel` varchar(100) NOT NULL,
  `jahr` int(11) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `buch`
--

INSERT INTO `buch` (`id`, `titel`, `jahr`, `isbn`, `genre`, `autor_id`) VALUES
(1, 'Löwenzahn Immergrün', 2000, 'x546846168465', 'Kinderbuch', 1),
(2, 'Herr der ringe', 1960, '68751687684', 'Klassiker', 4),
(3, 'Tief im Wald', 2002, '554435535534', 'Krimi', 2),
(4, 'Gestern war heute noch morgen', 1998, '6548234654622544', 'Klassiker', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `id` int(11) NOT NULL,
  `vorname` varchar(100) DEFAULT NULL,
  `nachname` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `strasse` varchar(100) DEFAULT NULL,
  `plz` varchar(7) DEFAULT NULL,
  `ort` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`id`, `vorname`, `nachname`, `email`, `tel`, `strasse`, `plz`, `ort`) VALUES
(1, 'Klaus', 'Meier', 'k.meier@web.de', '5487455645278', 'Testrstr. 55', '00000', 'Testhausen'),
(2, 'Hans', 'Hausen', 'hans@freemail.de', '9875632415', 'Weststr. 56', '98654', 'Westhausen'),
(3, 'Jürgen', 'Schmoll', 'j.schmoll@gmx.de', '22222222', 'Lange Strasse. 756', '21214', 'Überbach'),
(4, 'Zeus', 'Gott', 'zeus@gott.de', '5623215478', 'Olympstr. 1', '11111', 'Athen'),
(5, 'Tolle', 'Wurst', '', '757857578', NULL, '88888', NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ausleihe`
--
ALTER TABLE `ausleihe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kunde_id` (`kunde_id`),
  ADD KEY `buch_id` (`buch_id`);

--
-- Indizes für die Tabelle `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `buch`
--
ALTER TABLE `buch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ausleihe`
--
ALTER TABLE `ausleihe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `buch`
--
ALTER TABLE `buch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `ausleihe`
--
ALTER TABLE `ausleihe`
  ADD CONSTRAINT `ausleihe_ibfk_1` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`id`),
  ADD CONSTRAINT `ausleihe_ibfk_2` FOREIGN KEY (`buch_id`) REFERENCES `buch` (`id`);

--
-- Constraints der Tabelle `buch`
--
ALTER TABLE `buch`
  ADD CONSTRAINT `buch_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);
--
-- Datenbank: `cc_data`
--
CREATE DATABASE IF NOT EXISTS `cc_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cc_data`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `preis` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `name`, `preis`) VALUES
(1, 'test', 3.00),
(2, 'test neu ', 75.44),
(3, 'test', 45.25);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'test@web.de', '123456546'),
(2, 'peter@lustig.de', '777777'),
(3, 'gabi55@lustig.de', 'passwort123456'),
(4, 'kai@apoon.de', '8888888'),
(7, 'gabi22@test.de', '788787899'),
(10, 'zzz@www.de', '987654'),
(11, 'ppppppp', 'wwwwww'),
(12, 'neu@user.de', 'ichBinNeu77'),
(21, '', ''),
(22, '', ''),
(23, '', ''),
(24, 'aus@python.de', 'pythonPassowerd');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Datenbank: `daa_shop`
--
CREATE DATABASE IF NOT EXISTS `daa_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `daa_shop`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'peter@pan.de', '6l54kh6b245k6bd2k45h6bv43k56hb2pk546hb');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Datenbank: `gfn`
--
CREATE DATABASE IF NOT EXISTS `gfn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gfn`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `vorname` varchar(100) NOT NULL,
  `nachname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `vorname`, `nachname`, `email`, `password`) VALUES
(2, 'Peter 3', 'Pan 3', 'peter@pan.de 3', '334455 3'),
(3, 'Klausdfadsf', 'Lustigadsfadsf', 'klaus@lustig.deadsfads', '123456adfasf'),
(16, 'Klausi', 'Lustig', 'klaus@lustig.de', '123456'),
(18, 'Klausi', 'Lustig', 'klaus@lustig.de', '123456'),
(19, 'Klausi', 'Lustig', 'klaus@lustig.de', '123456'),
(20, 'Klausi', 'Lustig', 'klaus@lustig.de', '123456');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Datenbank: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gaeste`
--

CREATE TABLE `gaeste` (
  `id` int(11) NOT NULL,
  `vorname` varchar(150) NOT NULL,
  `nachname` varchar(150) NOT NULL,
  `telnr` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `gaeste`
--

INSERT INTO `gaeste` (`id`, `vorname`, `nachname`, `telnr`, `email`) VALUES
(1, 'John', 'Doe', '0123456789', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '0987654321', 'jane.smith@example.com'),
(3, 'Paul', 'Miller', '0234567890', 'paul.miller@example.com'),
(4, 'Emma', 'Johnson', '0345678901', 'emma.johnson@example.com'),
(5, 'Mike', 'Brown', '0456789012', 'mike.brown@example.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `leistung`
--

CREATE TABLE `leistung` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `preis` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `leistung`
--

INSERT INTO `leistung` (`id`, `name`, `preis`) VALUES
(1, 'Frühstück', 10.00),
(2, 'Abendessen', 20.00),
(3, 'Spa', 50.00),
(4, 'Fitnessraum', 15.00),
(5, 'WLAN', 5.00);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE `mitarbeiter` (
  `id` int(11) NOT NULL,
  `vorname` varchar(150) NOT NULL,
  `nachname` varchar(150) NOT NULL,
  `position` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`id`, `vorname`, `nachname`, `position`, `email`) VALUES
(1, 'Alice', 'Johnson', 'Rezeptionist', 'alice.johnson@example.com'),
(2, 'Bob', 'Brown', 'Manager', 'bob.brown@example.com'),
(3, 'Charlie', 'Davis', 'Hausmeister', 'charlie.davis@example.com'),
(4, 'Diana', 'Evans', 'Buchhalter', 'diana.evans@example.com'),
(5, 'Evan', 'Foster', 'Rezeptionist', 'evan.foster@example.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnung`
--

CREATE TABLE `rechnung` (
  `id` int(11) NOT NULL,
  `reservierung_id` int(11) DEFAULT NULL,
  `zahlungsart_id` int(11) DEFAULT NULL,
  `mitarbeiter_id` int(11) DEFAULT NULL,
  `gesamtbetrag` decimal(10,2) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `rechnung`
--

INSERT INTO `rechnung` (`id`, `reservierung_id`, `zahlungsart_id`, `mitarbeiter_id`, `gesamtbetrag`, `datum`) VALUES
(1, 1, 1, 1, 250.00, '2024-06-17 11:39:31'),
(2, 2, 2, 2, 375.00, '2024-06-17 11:39:31'),
(3, 3, 3, 3, 1500.00, '2024-06-17 11:39:31'),
(4, 4, 1, 4, 660.00, '2024-06-17 11:39:31'),
(5, 5, 2, 5, 1600.00, '2024-06-17 11:39:31');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnung2leistung`
--

CREATE TABLE `rechnung2leistung` (
  `rechnung_id` int(11) NOT NULL,
  `leistung_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `rechnung2leistung`
--

INSERT INTO `rechnung2leistung` (`rechnung_id`, `leistung_id`, `menge`, `datum`) VALUES
(1, 1, 2, '2024-06-17 11:39:31'),
(1, 3, 1, '2024-06-17 11:39:31'),
(2, 2, 1, '2024-06-17 11:39:31'),
(2, 4, 1, '2024-06-17 11:39:31'),
(3, 5, 5, '2024-06-17 11:39:31'),
(4, 1, 1, '2024-06-17 11:39:31'),
(4, 2, 2, '2024-06-17 11:39:31'),
(5, 3, 3, '2024-06-17 11:39:31'),
(5, 4, 1, '2024-06-17 11:39:31');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservierung`
--

CREATE TABLE `reservierung` (
  `id` int(11) NOT NULL,
  `check_in_datum` date NOT NULL,
  `check_out_datum` date NOT NULL,
  `gast_id` int(11) DEFAULT NULL,
  `zimmer_id` int(11) DEFAULT NULL,
  `mitarbeiter_id` int(11) DEFAULT NULL,
  `anreise_datum` date NOT NULL,
  `abreise_datum` date NOT NULL,
  `buchungsdatum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `reservierung`
--

INSERT INTO `reservierung` (`id`, `check_in_datum`, `check_out_datum`, `gast_id`, `zimmer_id`, `mitarbeiter_id`, `anreise_datum`, `abreise_datum`, `buchungsdatum`) VALUES
(1, '2024-07-01', '2024-07-05', 1, 101, 1, '2024-07-01', '2024-07-05', '2024-06-17 11:39:31'),
(2, '2024-07-10', '2024-07-15', 2, 102, 2, '2024-07-10', '2024-07-15', '2024-06-17 11:39:31'),
(3, '2024-08-01', '2024-08-10', 3, 103, 3, '2024-08-01', '2024-08-10', '2024-06-17 11:39:31'),
(4, '2024-09-05', '2024-09-12', 4, 104, 4, '2024-09-05', '2024-09-12', '2024-06-17 11:39:31'),
(5, '2024-10-10', '2024-10-20', 5, 105, 5, '2024-10-10', '2024-10-20', '2024-06-17 11:39:31');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zahlungsart`
--

CREATE TABLE `zahlungsart` (
  `id` int(11) NOT NULL,
  `art` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zahlungsart`
--

INSERT INTO `zahlungsart` (`id`, `art`) VALUES
(1, 'Kreditkarte'),
(2, 'Bar'),
(3, 'Debitkarte');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmer`
--

CREATE TABLE `zimmer` (
  `id` int(11) NOT NULL,
  `kat_id` int(11) DEFAULT NULL,
  `preis` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zimmer`
--

INSERT INTO `zimmer` (`id`, `kat_id`, `preis`) VALUES
(101, 1, 50.00),
(102, 2, 75.00),
(103, 3, 150.00),
(104, 1, 55.00),
(105, 2, 80.00);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmerkategorien`
--

CREATE TABLE `zimmerkategorien` (
  `id` int(11) NOT NULL,
  `kat_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zimmerkategorien`
--

INSERT INTO `zimmerkategorien` (`id`, `kat_name`) VALUES
(1, 'Einzelzimmer'),
(2, 'Doppelzimmer'),
(3, 'Suite');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `gaeste`
--
ALTER TABLE `gaeste`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `leistung`
--
ALTER TABLE `leistung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservierung_id` (`reservierung_id`),
  ADD KEY `zahlungsart_id` (`zahlungsart_id`),
  ADD KEY `mitarbeiter_id` (`mitarbeiter_id`);

--
-- Indizes für die Tabelle `rechnung2leistung`
--
ALTER TABLE `rechnung2leistung`
  ADD PRIMARY KEY (`rechnung_id`,`leistung_id`),
  ADD KEY `leistung_id` (`leistung_id`);

--
-- Indizes für die Tabelle `reservierung`
--
ALTER TABLE `reservierung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gast_id` (`gast_id`),
  ADD KEY `zimmer_id` (`zimmer_id`),
  ADD KEY `mitarbeiter_id` (`mitarbeiter_id`);

--
-- Indizes für die Tabelle `zahlungsart`
--
ALTER TABLE `zahlungsart`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `zimmer`
--
ALTER TABLE `zimmer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kat_id` (`kat_id`);

--
-- Indizes für die Tabelle `zimmerkategorien`
--
ALTER TABLE `zimmerkategorien`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `gaeste`
--
ALTER TABLE `gaeste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `leistung`
--
ALTER TABLE `leistung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `reservierung`
--
ALTER TABLE `reservierung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `zahlungsart`
--
ALTER TABLE `zahlungsart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `zimmerkategorien`
--
ALTER TABLE `zimmerkategorien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  ADD CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`reservierung_id`) REFERENCES `reservierung` (`id`),
  ADD CONSTRAINT `rechnung_ibfk_2` FOREIGN KEY (`zahlungsart_id`) REFERENCES `zahlungsart` (`id`),
  ADD CONSTRAINT `rechnung_ibfk_3` FOREIGN KEY (`mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`);

--
-- Constraints der Tabelle `rechnung2leistung`
--
ALTER TABLE `rechnung2leistung`
  ADD CONSTRAINT `rechnung2leistung_ibfk_1` FOREIGN KEY (`rechnung_id`) REFERENCES `rechnung` (`id`),
  ADD CONSTRAINT `rechnung2leistung_ibfk_2` FOREIGN KEY (`leistung_id`) REFERENCES `leistung` (`id`);

--
-- Constraints der Tabelle `reservierung`
--
ALTER TABLE `reservierung`
  ADD CONSTRAINT `reservierung_ibfk_1` FOREIGN KEY (`gast_id`) REFERENCES `gaeste` (`id`),
  ADD CONSTRAINT `reservierung_ibfk_2` FOREIGN KEY (`zimmer_id`) REFERENCES `zimmer` (`id`),
  ADD CONSTRAINT `reservierung_ibfk_3` FOREIGN KEY (`mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`);

--
-- Constraints der Tabelle `zimmer`
--
ALTER TABLE `zimmer`
  ADD CONSTRAINT `zimmer_ibfk_1` FOREIGN KEY (`kat_id`) REFERENCES `zimmerkategorien` (`id`);
--
-- Datenbank: `krankenhaus`
--
CREATE DATABASE IF NOT EXISTS `krankenhaus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `krankenhaus`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `arzt`
--

CREATE TABLE `arzt` (
  `ArztNr` int(10) NOT NULL,
  `ArztName` varchar(80) NOT NULL,
  `ArztFaktor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `arzt`
--

INSERT INTO `arzt` (`ArztNr`, `ArztName`, `ArztFaktor`) VALUES
(3, 'Dr. Meier', 1.5),
(4, 'Dr. Hansen', 1.7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `medleistung`
--

CREATE TABLE `medleistung` (
  `MLeistungNr` int(11) NOT NULL,
  `Bezeichnung` varchar(150) NOT NULL,
  `Preis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `medleistung`
--

INSERT INTO `medleistung` (`MLeistungNr`, `Bezeichnung`, `Preis`) VALUES
(1, 'Gr. Blutbild', 78.99),
(2, 'Kl. Blutbild', 44.78);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `PatientNr` int(11) NOT NULL,
  `PatientName` varchar(100) NOT NULL,
  `PatientVorname` varchar(100) NOT NULL,
  `PatientStrNr` varchar(150) NOT NULL,
  `PatientPLZ` varchar(8) NOT NULL,
  `PatientOrt` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `patient`
--

INSERT INTO `patient` (`PatientNr`, `PatientName`, `PatientVorname`, `PatientStrNr`, `PatientPLZ`, `PatientOrt`) VALUES
(1, 'Lustig', 'Gabi', 'Teststr. 123', '12345', 'Testhausen'),
(2, 'Kleber', 'Klaus', 'Hauptstr. 88', '87654', 'Lummerland'),
(5, 'Niklas', 'Kai', 'Dummyroad. 88', '44556', 'Dummyhausen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pat_medleistung`
--

CREATE TABLE `pat_medleistung` (
  `PatientNr` int(11) NOT NULL,
  `LeistungDat` date NOT NULL,
  `MLeistungNr` int(11) NOT NULL,
  `ArztNr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pat_zusatzleistung`
--

CREATE TABLE `pat_zusatzleistung` (
  `PatientNr` int(11) NOT NULL,
  `VonDatum` date NOT NULL,
  `BisDatum` date NOT NULL,
  `ZLeistungNr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `pat_zusatzleistung`
--

INSERT INTO `pat_zusatzleistung` (`PatientNr`, `VonDatum`, `BisDatum`, `ZLeistungNr`) VALUES
(1, '2024-10-01', '2024-10-16', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zusatzleistung`
--

CREATE TABLE `zusatzleistung` (
  `ZLeistungNr` int(11) NOT NULL,
  `Bezeichnung` varchar(100) NOT NULL,
  `TagesPreis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zusatzleistung`
--

INSERT INTO `zusatzleistung` (`ZLeistungNr`, `Bezeichnung`, `TagesPreis`) VALUES
(1, 'EKG', 120),
(2, 'MRT', 1245),
(3, 'Abendessen', 17.55),
(4, 'Telefon', 5.77);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `arzt`
--
ALTER TABLE `arzt`
  ADD PRIMARY KEY (`ArztNr`);

--
-- Indizes für die Tabelle `medleistung`
--
ALTER TABLE `medleistung`
  ADD PRIMARY KEY (`MLeistungNr`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientNr`);

--
-- Indizes für die Tabelle `pat_medleistung`
--
ALTER TABLE `pat_medleistung`
  ADD KEY `pat_nr_FK` (`PatientNr`),
  ADD KEY `arzt_nr_FK` (`ArztNr`),
  ADD KEY `leist_nr_FK` (`MLeistungNr`);

--
-- Indizes für die Tabelle `pat_zusatzleistung`
--
ALTER TABLE `pat_zusatzleistung`
  ADD KEY `PatientNr` (`PatientNr`),
  ADD KEY `ZLeistungNr` (`ZLeistungNr`);

--
-- Indizes für die Tabelle `zusatzleistung`
--
ALTER TABLE `zusatzleistung`
  ADD PRIMARY KEY (`ZLeistungNr`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `arzt`
--
ALTER TABLE `arzt`
  MODIFY `ArztNr` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `medleistung`
--
ALTER TABLE `medleistung`
  MODIFY `MLeistungNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `zusatzleistung`
--
ALTER TABLE `zusatzleistung`
  MODIFY `ZLeistungNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `pat_medleistung`
--
ALTER TABLE `pat_medleistung`
  ADD CONSTRAINT `arzt_nr_FK` FOREIGN KEY (`ArztNr`) REFERENCES `arzt` (`ArztNr`),
  ADD CONSTRAINT `leist_nr_FK` FOREIGN KEY (`MLeistungNr`) REFERENCES `medleistung` (`MLeistungNr`),
  ADD CONSTRAINT `pat_nr_FK` FOREIGN KEY (`PatientNr`) REFERENCES `patient` (`PatientNr`);

--
-- Constraints der Tabelle `pat_zusatzleistung`
--
ALTER TABLE `pat_zusatzleistung`
  ADD CONSTRAINT `pat_zusatzleistung_ibfk_1` FOREIGN KEY (`PatientNr`) REFERENCES `patient` (`PatientNr`),
  ADD CONSTRAINT `pat_zusatzleistung_ibfk_2` FOREIGN KEY (`ZLeistungNr`) REFERENCES `zusatzleistung` (`ZLeistungNr`);
--
-- Datenbank: `motel`
--
CREATE DATABASE IF NOT EXISTS `motel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `motel`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buchung`
--

CREATE TABLE `buchung` (
  `id` int(11) DEFAULT NULL,
  `gast_id` int(11) DEFAULT NULL,
  `zimmer_id` int(11) DEFAULT NULL,
  `start_datum` date DEFAULT NULL,
  `end_datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `buchung`
--

INSERT INTO `buchung` (`id`, `gast_id`, `zimmer_id`, `start_datum`, `end_datum`) VALUES
(1, 5, 6, '2025-05-12', '2025-05-18'),
(2, 10, 3, '2025-04-10', '2025-04-12'),
(3, 18, 8, '2025-06-22', '2025-06-28'),
(4, 99, 3, '2025-04-13', '2025-04-21'),
(5, 15, 9, '2025-02-18', '2025-02-28'),
(6, 10, 10, '2025-04-11', '2025-04-11');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gast`
--

CREATE TABLE `gast` (
  `gast_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `telefonnummer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `gast`
--

INSERT INTO `gast` (`gast_id`, `name`, `telefonnummer`) VALUES
(5, 'lena', '492385610'),
(6, 'tim', '839201734'),
(7, 'sandra', '753829104'),
(8, 'mario', '618273945'),
(9, 'julia', '983471265'),
(10, 'tom', '456823917'),
(11, 'sophie', '238947162'),
(12, 'jan', '786423190'),
(13, 'lara', '910273645'),
(14, 'ben', '847162309'),
(15, 'nina', '374829105'),
(16, 'felix', '284719305'),
(17, 'anna', '692847130'),
(18, 'leo', '109283746'),
(19, 'paula', '238947183'),
(20, 'lukas', '849302718');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechnung`
--

CREATE TABLE `rechnung` (
  `id` int(11) NOT NULL,
  `buchung_id` int(11) DEFAULT NULL,
  `rech_plz` varchar(8) DEFAULT NULL,
  `rech_ort` varchar(100) DEFAULT NULL,
  `rech_str` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `rechnung`
--

INSERT INTO `rechnung` (`id`, `buchung_id`, `rech_plz`, `rech_ort`, `rech_str`) VALUES
(1, 1, '12345', 'Bonn', 'teststr. 22'),
(3, 3, '73458', 'West', 'Lummerlandstr 777'),
(4, 2, '99999', 'WWWW', 'Strasse 123');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmer`
--

CREATE TABLE `zimmer` (
  `id` int(11) DEFAULT NULL,
  `zimmer_nr` int(11) DEFAULT NULL,
  `zimmertyp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zimmer`
--

INSERT INTO `zimmer` (`id`, `zimmer_nr`, `zimmertyp_id`) VALUES
(1, 101, 1),
(2, 102, 1),
(3, 103, 2),
(4, 104, 2),
(5, 201, 3),
(6, 202, 4),
(7, 301, 5),
(8, 302, 5),
(9, 401, 6),
(10, 999, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zimmertyp`
--

CREATE TABLE `zimmertyp` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `preis` float DEFAULT NULL,
  `anzahl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zimmertyp`
--

INSERT INTO `zimmertyp` (`id`, `name`, `preis`, `anzahl`) VALUES
(1, 'SingleRoom', 79.9, 12),
(2, 'DoubleRoom', 119.9, 25),
(3, 'JuniorSuite', 179.5, 14),
(4, 'SeniorSuite', 232.3, 10),
(5, 'DeLuxSuite', 365, 4),
(6, 'Familienzimmer', 166, 4),
(7, 'Konferenzraum', 650, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `gast`
--
ALTER TABLE `gast`
  ADD PRIMARY KEY (`gast_id`);

--
-- Indizes für die Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `gast`
--
ALTER TABLE `gast`
  MODIFY `gast_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `rechnung`
--
ALTER TABLE `rechnung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Datenbank: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Daten für Tabelle `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Daten für Tabelle `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"daa_shop\",\"table\":\"user\"},{\"db\":\"buecherei\",\"table\":\"autor\"},{\"db\":\"buecherei\",\"table\":\"kunde\"},{\"db\":\"buecherei\",\"table\":\"buch\"},{\"db\":\"buecherei\",\"table\":\"ausleihe\"},{\"db\":\"cc_data\",\"table\":\"user\"},{\"db\":\"cc_data\",\"table\":\"artikel\"},{\"db\":\"python\",\"table\":\"user\"},{\"db\":\"krankenhaus\",\"table\":\"pat_zusatzleistung\"},{\"db\":\"krankenhaus\",\"table\":\"pat_medleistung\"}]');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Daten für Tabelle `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'shop', 'kategorie', '{\"sorted_col\":\"`kategorie`.`eltern_kat` ASC\"}', '2024-08-22 07:25:15'),
('root', 'train_db', 'files', '{\"sorted_col\":\"`files`.`file_name` DESC\"}', '2024-04-14 16:11:10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Daten für Tabelle `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-24 06:56:03', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"de\"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indizes für die Tabelle `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indizes für die Tabelle `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indizes für die Tabelle `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indizes für die Tabelle `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indizes für die Tabelle `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indizes für die Tabelle `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indizes für die Tabelle `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indizes für die Tabelle `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indizes für die Tabelle `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indizes für die Tabelle `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indizes für die Tabelle `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indizes für die Tabelle `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indizes für die Tabelle `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Datenbank: `php_shop`
--
CREATE DATABASE IF NOT EXISTS `php_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `php_shop`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`) VALUES
(1, 'hans2', '123456', 9),
(14, 'gabi', '123456', 5);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name_uni` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Datenbank: `python`
--
CREATE DATABASE IF NOT EXISTS `python` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `python`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `vorname` varchar(100) NOT NULL,
  `nachname` varchar(100) NOT NULL,
  `plz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `vorname`, `nachname`, `plz`) VALUES
(1, 'peter', 'pan', 12345),
(3, 'gabi', 'lustig', 12345),
(4, 'gabi', 'lustig', 12345),
(5, 'gabi', 'lustig', 12345),
(6, 'gabi', 'lustig', 12345),
(7, 'gabi', 'lustig', 12345),
(8, 'gabi', 'lustig', 12345);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Datenbank: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kategorie` int(11) NOT NULL,
  `preis` float NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `name`, `kategorie`, `preis`, `image`) VALUES
(1, 'Samsung Oled TV 55 22', 2, 49922, ''),
(2, 'Schraubendreher', 2, 5, ''),
(3, 'Samsung Oled TV 60\"', 1, 599, ''),
(4, 'Milch', 3, 1.29, ''),
(5, 'dfgsgff', 2, 234, ''),
(6, 'dfdsaf', 2, 3, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `eltern_kat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id`, `name`, `eltern_kat`) VALUES
(1, 'Elektronik 2 ', 2),
(2, 'Metalware', 0),
(3, 'Lebensmittel', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `nachname` varchar(255) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `passwort` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `street` varchar(200) NOT NULL,
  `zip` varchar(7) NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `deleted`, `nachname`, `vorname`, `passwort`, `email`, `image`, `street`, `zip`, `city`) VALUES
(5, 0, 'Peter', 'Pan', '202cb962ac59075b964b07152d234b70', 'test@test.de', '', '', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL,
  `kunden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategorie` (`kategorie`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_nr` (`art_id`,`kunden_id`),
  ADD KEY `kunden_nr` (`kunden_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `artikel_ibfk_1` FOREIGN KEY (`kategorie`) REFERENCES `kategorie` (`id`);

--
-- Constraints der Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD CONSTRAINT `warenkorb_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `warenkorb_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`);
--
-- Datenbank: `shop2`
--
CREATE DATABASE IF NOT EXISTS `shop2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop2`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `last_edit` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` mediumtext NOT NULL,
  `bild` varchar(255) NOT NULL,
  `lagerbestand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `deleted`, `user_id`, `last_edit`, `name`, `beschreibung`, `bild`, `lagerbestand`) VALUES
(1, 0, 0, NULL, 'Test 1', 'test test test test test test test test test test test test test test test test test test test test test test test test ', 'test.jpg', 222),
(77, 1, 22, '2024-03-21 12:23:27', 'Keyboard 200', 'das Mega Ding', 'key100.jpg', 55),
(81, 0, 0, NULL, 'Mega 500', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(82, 1, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(83, 0, 0, NULL, 'Mega 500', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(84, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(85, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(86, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(87, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(88, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(89, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(90, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(91, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(92, 0, 0, NULL, 'BeatBox 1000 gsfgsgf', 'test 55 test 5gsdgfsdgf', 'testsdgsdgf_55.jpg', 888),
(93, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(94, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(95, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(96, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(97, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(98, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(99, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(100, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(101, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `art_2_kat`
--

CREATE TABLE `art_2_kat` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `art_id` int(11) UNSIGNED NOT NULL,
  `kat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `art_2_kat`
--

INSERT INTO `art_2_kat` (`id`, `deleted`, `art_id`, `kat_id`) VALUES
(1, 1, 81, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `art_2_war`
--

CREATE TABLE `art_2_war` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `art_id` int(10) UNSIGNED NOT NULL,
  `war_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `art_2_war`
--

INSERT INTO `art_2_war` (`id`, `deleted`, `art_id`, `war_id`, `menge`) VALUES
(1, 1, 81, 2, 77),
(7, 0, 1, 5, 5),
(8, 0, 1, 5, 5),
(9, 0, 1, 5, 5),
(10, 0, 1, 5, 5),
(11, 0, 1, 5, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `bild` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`id`, `deleted`, `name`, `parent_id`, `bild`) VALUES
(1, 0, 'Bekleidung', 0, 'uploads/kat_1'),
(2, 1, 'T-Shirts ', 1, ''),
(3, 0, 'Hosen', 1, 'uploads/kat_3'),
(4, 0, 'Möbel', 0, ''),
(5, 0, 'Tische', 4, ''),
(6, 0, 'Shorts', 3, 'uploads/kat_6');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staffelpreise`
--

CREATE TABLE `staffelpreise` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `art_id` int(11) UNSIGNED NOT NULL,
  `ab_menge` int(11) NOT NULL,
  `preis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `staffelpreise`
--

INSERT INTO `staffelpreise` (`id`, `deleted`, `art_id`, `ab_menge`, `preis`) VALUES
(1, 0, 77, 1, 5.99),
(2, 1, 81, 5, 5.49);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `typ` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `deleted`, `username`, `password`, `typ`) VALUES
(5, 0, 'sub_admin', 'e10adc3949ba59abbe56e057f20f883e', 5),
(6, 1, 'user', 'e10adc3949ba59abbe56e057f20f883e', 1),
(7, 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL,
  `summe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `warenkorb`
--

INSERT INTO `warenkorb` (`id`, `deleted`, `user_id`, `datum`, `summe`) VALUES
(1, 1, 6, '2024-03-10 12:12:12', 99.34),
(2, 0, 6, '2024-03-22 09:31:08', 88),
(5, 0, 7, '2024-03-28 13:58:54', 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_id_FK` (`art_id`),
  ADD KEY `kat_id_FK` (`kat_id`);

--
-- Indizes für die Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a2w_art_id_FK` (`art_id`),
  ADD KEY `a2w_war_id_FK` (`war_id`);

--
-- Indizes für die Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preise_art_id_FK` (`art_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wk_user_id_FK` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT für Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  ADD CONSTRAINT `art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `kat_id_FK` FOREIGN KEY (`kat_id`) REFERENCES `kategorien` (`id`);

--
-- Constraints der Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  ADD CONSTRAINT `a2w_art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `a2w_war_id_FK` FOREIGN KEY (`war_id`) REFERENCES `warenkorb` (`id`);

--
-- Constraints der Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  ADD CONSTRAINT `preise_art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`);

--
-- Constraints der Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD CONSTRAINT `wk_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Datenbank: `shop3`
--
CREATE DATABASE IF NOT EXISTS `shop3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop3`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `last_edit` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` mediumtext NOT NULL,
  `bild` varchar(255) NOT NULL,
  `lagerbestand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `deleted`, `user_id`, `last_edit`, `name`, `beschreibung`, `bild`, `lagerbestand`) VALUES
(1, 0, 0, NULL, 'Test 1', 'test test test test test test test test test test test test test test test test test test test test test test test test ', 'test.jpg', 222),
(77, 1, 22, '2024-03-21 12:23:27', 'Keyboard 200', 'das Mega Ding', 'key100.jpg', 55),
(81, 0, 0, NULL, 'Mega 500', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(82, 1, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(83, 0, 0, NULL, 'Mega 500', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(84, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(85, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(86, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(87, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(88, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(89, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(90, 0, 0, NULL, 'test 55', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(91, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(92, 0, 0, NULL, 'BeatBox 1000 gsfgsgf', 'test 55 test 5gsdgfsdgf', 'testsdgsdgf_55.jpg', 888),
(93, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(94, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(95, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(96, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(97, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(98, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(99, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(100, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77),
(101, 0, 0, NULL, 'BeatBox 1000 ', 'test 55 test 55test 55test 55test 55', 'test_55.jpg', 77);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `art_2_kat`
--

CREATE TABLE `art_2_kat` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `art_id` int(11) UNSIGNED NOT NULL,
  `kat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `art_2_kat`
--

INSERT INTO `art_2_kat` (`id`, `deleted`, `art_id`, `kat_id`) VALUES
(1, 1, 81, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `art_2_war`
--

CREATE TABLE `art_2_war` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `art_id` int(10) UNSIGNED NOT NULL,
  `war_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `art_2_war`
--

INSERT INTO `art_2_war` (`id`, `deleted`, `art_id`, `war_id`, `menge`) VALUES
(1, 1, 81, 2, 77);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kategorien`
--

INSERT INTO `kategorien` (`id`, `deleted`, `name`, `parent_id`) VALUES
(1, 0, 'Home', 0),
(2, 1, 'T-Shirts 1000', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staffelpreise`
--

CREATE TABLE `staffelpreise` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `art_id` int(11) UNSIGNED NOT NULL,
  `ab_menge` int(11) NOT NULL,
  `preis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `staffelpreise`
--

INSERT INTO `staffelpreise` (`id`, `deleted`, `art_id`, `ab_menge`, `preis`) VALUES
(1, 0, 77, 1, 5.99),
(2, 1, 81, 5, 5.49);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `deleted`, `username`, `password`) VALUES
(5, 0, 'peterpan', 'test123'),
(6, 1, 'gabi', '123456');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL,
  `summe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `warenkorb`
--

INSERT INTO `warenkorb` (`id`, `deleted`, `user_id`, `datum`, `summe`) VALUES
(1, 1, 6, '2024-03-10 12:12:12', 99.34),
(2, 0, 6, '2024-03-22 09:31:08', 88);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_id_FK` (`art_id`),
  ADD KEY `kat_id_FK` (`kat_id`);

--
-- Indizes für die Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a2w_art_id_FK` (`art_id`),
  ADD KEY `a2w_war_id_FK` (`war_id`);

--
-- Indizes für die Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preise_art_id_FK` (`art_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wk_user_id_FK` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT für Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  ADD CONSTRAINT `art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `kat_id_FK` FOREIGN KEY (`kat_id`) REFERENCES `kategorien` (`id`);

--
-- Constraints der Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  ADD CONSTRAINT `a2w_art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `a2w_war_id_FK` FOREIGN KEY (`war_id`) REFERENCES `warenkorb` (`id`);

--
-- Constraints der Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  ADD CONSTRAINT `preise_art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`);

--
-- Constraints der Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD CONSTRAINT `wk_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Datenbank: `shop_alt`
--
CREATE DATABASE IF NOT EXISTS `shop_alt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_alt`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` mediumtext NOT NULL,
  `bild` varchar(255) NOT NULL,
  `lagerbestand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `art_2_kat`
--

CREATE TABLE `art_2_kat` (
  `id` int(11) NOT NULL,
  `art_id` int(11) UNSIGNED NOT NULL,
  `kat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `art_2_war`
--

CREATE TABLE `art_2_war` (
  `id` int(11) NOT NULL,
  `art_id` int(10) UNSIGNED NOT NULL,
  `war_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorien`
--

CREATE TABLE `kategorien` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staffelpreise`
--

CREATE TABLE `staffelpreise` (
  `id` int(11) NOT NULL,
  `art_id` int(11) UNSIGNED NOT NULL,
  `ab_menge` int(11) NOT NULL,
  `preis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(5, 'peter', 'pan');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `datum` datetime NOT NULL,
  `summe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_id_FK` (`art_id`),
  ADD KEY `kat_id_FK` (`kat_id`);

--
-- Indizes für die Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a2w_art_id_FK` (`art_id`),
  ADD KEY `a2w_war_id_FK` (`war_id`);

--
-- Indizes für die Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preise_art_id_FK` (`art_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wk_user_id_FK` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kategorien`
--
ALTER TABLE `kategorien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `art_2_kat`
--
ALTER TABLE `art_2_kat`
  ADD CONSTRAINT `art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `kat_id_FK` FOREIGN KEY (`kat_id`) REFERENCES `kategorien` (`id`);

--
-- Constraints der Tabelle `art_2_war`
--
ALTER TABLE `art_2_war`
  ADD CONSTRAINT `a2w_art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `a2w_war_id_FK` FOREIGN KEY (`war_id`) REFERENCES `warenkorb` (`id`);

--
-- Constraints der Tabelle `staffelpreise`
--
ALTER TABLE `staffelpreise`
  ADD CONSTRAINT `preise_art_id_FK` FOREIGN KEY (`art_id`) REFERENCES `artikel` (`id`);

--
-- Constraints der Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD CONSTRAINT `wk_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
--
-- Datenbank: `shop_import`
--
CREATE DATABASE IF NOT EXISTS `shop_import` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_import`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `kategorie` int(11) NOT NULL,
  `preis` float NOT NULL,
  `bild` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `eltern_kat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nachname` varchar(100) NOT NULL,
  `vorname` varchar(100) NOT NULL,
  `passwort` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL,
  `kunden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Datenbank: `shop_org`
--
CREATE DATABASE IF NOT EXISTS `shop_org` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_org`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `kategorie` int(11) NOT NULL,
  `preis` float NOT NULL,
  `bild` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `name`, `kategorie`, `preis`, `bild`) VALUES
(2, 'test art 1', 1, 4.99, 'test.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `eltern_kat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id`, `name`, `eltern_kat`) VALUES
(1, 'Hosen', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nachname` varchar(100) NOT NULL,
  `vorname` varchar(100) NOT NULL,
  `passwort` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `nachname`, `vorname`, `passwort`, `email`) VALUES
(1, 'Lustig', 'Peter', '123456', 'p.lustig@web.de'),
(2, 'Pan', 'Peter', '987654321', 'p.pan@nimmerland.com'),
(3, 'Lustig', 'Gabi', '563464565', 'g.lustig@freemail.de');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `menge` int(11) NOT NULL,
  `kunden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `warenkorb`
--

INSERT INTO `warenkorb` (`id`, `art_id`, `menge`, `kunden_id`) VALUES
(1, 1, 5, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Datenbank: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Datenbank: `train_db`
--
CREATE DATABASE IF NOT EXISTS `train_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `train_db`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `short_desc` mediumtext DEFAULT NULL,
  `long_text` text DEFAULT NULL,
  `authors` tinytext DEFAULT NULL,
  `course_category_id` int(11) DEFAULT NULL,
  `cert_points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `courses`
--

INSERT INTO `courses` (`id`, `crdate`, `tstamp`, `deleted`, `name`, `short_desc`, `long_text`, `authors`, `course_category_id`, `cert_points`) VALUES
(1, 1711462221, 1713110703, 0, 'Adjunct therapies', 'This course introduces you to the current unmet need in type 1 diabetes and explores trial data in the use of adjunct therapies including pramlintide, metformin, liraglutide and SGLT-2 inhibitors.&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <br>', 'LONG_____ This course introduces you to the current unmet need in type 1 diabetes and explores trial data in the use of adjunct therapies including pramlintide, metformin, liraglutide and SGLT-2 inhibitors.&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <br>', 'Professor Thomas Danne ', 2, 50),
(4, 0, 0, 1, 'a', 'jk', 'jk', 'j', 2, 89),
(5, 0, 0, 1, 'dsfmk', 'jkl', 'jkl', 'kjl', 2, 2222),
(6, 0, 0, 1, 'dsfmk', 'jkl', 'jkl', 'kjl', 2, 22222),
(7, 0, 0, 1, 'dsfmk', 'jkl', 'jkl', 'kjl', 2, 22222),
(8, 0, 1713110762, 0, 'Cardiovascular health and diabetes', 'This course focuses on cardiovascular health – one of the most \r\nsignificant and challenging aspects of care for type 1 and type 2 \r\ndiabetes.', 'LONG___ This course focuses on cardiovascular health – one of the most \r\nsignificant and challenging aspects of care for type 1 and type 2 \r\ndiabetes.', 'Professor Miles Fisher ', 2, 42),
(9, 1711635859, 0, 1, '', '', '', '', 2, 5),
(10, 1711636470, 0, 1, 'a', 'a', 'a', 'a', 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_2_user`
--

CREATE TABLE `course_2_user` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `cours_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_finished` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_categorys`
--

CREATE TABLE `course_categorys` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `desc` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `course_categorys`
--

INSERT INTO `course_categorys` (`id`, `crdate`, `tstamp`, `deleted`, `name`, `desc`) VALUES
(2, 1711438285, 1713165153, 0, 'Video Courses', 'Video Courses');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `diary_dates`
--

CREATE TABLE `diary_dates` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `pub_date` datetime DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `short_desc` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `diary_dates`
--

INSERT INTO `diary_dates` (`id`, `crdate`, `tstamp`, `deleted`, `pub_date`, `event_date`, `name`, `location`, `link`, `short_desc`) VALUES
(1, 0, 1713185284, 0, '2024-03-27 21:04:00', '2024-03-30', 'Evenname - Test', 'Düsseldorf', 'https://wow.com', 'jkl'),
(2, 0, 1711544794, 1, '0000-00-00 00:00:00', '0000-00-00', 'sdf', 'sdf', 'ds', 'sdf');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `org_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `rel_table` varchar(150) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `caption` tinytext DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `files`
--

INSERT INTO `files` (`id`, `crdate`, `tstamp`, `deleted`, `org_name`, `file_name`, `file_type`, `rel_table`, `rel_id`, `alt_text`, `caption`, `order_num`) VALUES
(74, 1713106247, 0, 0, 'Horizons_Feb01_Cover_16x9.jpg', 'news_1_thumb.jpg', 'image/jpeg', 'news', 1, 'thumb', '', 0),
(75, 1713106247, 0, 0, 'Horizons_Feb01_Cover.jpg', 'news_1_head.jpg', 'image/jpeg', 'news', 1, 'head', '', 0),
(76, 1713106277, 0, 0, 'AdobeStock_271092418_optimised-768x432.jpg', 'news_4_thumb.jpg', 'image/jpeg', 'news', 4, 'thumb', '', 0),
(77, 1713106277, 0, 0, 'AdobeStock_271092418_optimised.jpg', 'news_4_head.jpg', 'image/jpeg', 'news', 4, 'head', '', 0),
(78, 1713109360, 0, 0, 'AdobeStock_560308430_optimised-768x432.jpg', 'news_5_thumb.jpg', 'image/jpeg', 'news', 5, 'thumb', '', 0),
(79, 1713109360, 0, 0, 'AdobeStock_560308430_optimised.jpg', 'news_5_head.jpg', 'image/jpeg', 'news', 5, 'head', '', 0),
(80, 1713110703, 0, 0, 'EASD_Adjunct-Therapies-mobile.png', 'courses_1.png', 'image/png', 'courses', 1, '', '', 0),
(81, 1713110762, 0, 0, 'EASD-Cardiovascular-Card.png', 'courses_8.png', 'image/png', 'courses', 8, '', '', 0),
(82, 1713164717, 0, 1, 'dna-7090994_1920.jpg', 'course_categorys_2.jpg', 'image/jpeg', 'course_categorys', 2, '', '', 0),
(83, 1713165153, 0, 0, 'dna-7090994_1920.jpg', 'course_categorys_2.jpg', 'image/jpeg', 'course_categorys', 2, '', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_series`
--

CREATE TABLE `film_series` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `pub_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_desc` tinytext DEFAULT NULL,
  `long_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `film_series`
--

INSERT INTO `film_series` (`id`, `crdate`, `tstamp`, `deleted`, `pub_date`, `name`, `short_desc`, `long_desc`) VALUES
(1, 1711437600, 1713169981, 0, '2024-04-17 12:00:00', 'ATTD Expert Insights', '<p>We asked 10 world-leading experts to share their insights in the \r\nlatest research presented at the ATTD 2024 –– the 17th Conference on \r\nAdvanced Treatments and Technologies For Diabetes. Released every \r\nTuesday and Thursday until April 18.</p>', '<p>We asked 10 world-leading experts to share their insights in the \r\nlatest research presented at the ATTD 2024 –– the 17th Conference on \r\nAdvanced Treatments and Technologies For Diabetes. Released every \r\nTuesday and Thursday until April 18.</p>'),
(2, 1711540239, 0, 1, '0000-00-00 00:00:00', '', '', ''),
(3, 0, 1713170002, 0, '2024-03-27 19:57:00', '11 February is International Day of Women and Girls in Science', '					<span class=\"item\">11 February is International Day of Women and Girls in Science</span>', '					<span class=\"item\">11 February is International Day of Women and Girls in Science</span>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fs_film`
--

CREATE TABLE `fs_film` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `pub_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_desc` tinytext DEFAULT NULL,
  `long_desc` text DEFAULT NULL,
  `film_series_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `fs_film`
--

INSERT INTO `fs_film` (`id`, `crdate`, `tstamp`, `deleted`, `pub_date`, `name`, `short_desc`, `long_desc`, `film_series_id`) VALUES
(1, 0, 1713195125, 0, '2024-03-27 20:41:00', 'Dr Julia Mader', '<h5>A huge shoutout to all women in research.</h5>', 'And now, the grand finale of our video series... A huge shout out to all\r\n the remarkable yet often unseen women contributing to diabetes research\r\n by Dr. Julia Mader (MedUni Graz). \r\n							But that’s not all. As a board member of EASD, she shares how she\r\n supports women and girls in the wards, halls and labs of diabetes and \r\nendocrinology.\r\n&nbsp;							<br><br>\r\n							Furthermore, here at EASD, we view February 11th as a reminder \r\nthat lifting up women and girls in science is an ongoing priority. How \r\ncan you contribute to this and elevate your own career in the field?', 3),
(2, 0, 1713195163, 0, '2024-03-28 20:41:00', 'Prof Lia Bally', '<h5>Tips for career development and wellbeing in diabetes research.</h5>', 'Ever thought of saying \'no\'? It’s one of the tips given by Prof Lia \r\nBally (Universitätsspital Bern). Watch the video for this and other \r\ninvaluable insights into research career development and well-being from\r\n the endocrinologist who attained professorship at age 32. This is the \r\n6th video of our series celebrating International Day of Women and Girls\r\n in Science.\r\n						', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `desc` tinytext DEFAULT NULL,
  `cert_points` int(11) DEFAULT NULL,
  `parent_module_id` int(11) DEFAULT NULL,
  `order_nr` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `modules`
--

INSERT INTO `modules` (`id`, `crdate`, `tstamp`, `deleted`, `name`, `course_id`, `desc`, `cert_points`, `parent_module_id`, `order_nr`, `type`) VALUES
(1, 1711466798, 1713169895, 0, 'Unmet needs in type 1 diabetes', 1, '<h3 class=\"course-subtitle\">Unmet needs in type 1 diabetes</h3>', 43643, 6, 2, 0),
(2, 1711467081, 1713169873, 0, 'Comparison of total mortality in type 1 and type 2 diabetes', 1, 'a', 4, 6, 1, 8),
(3, 1711467522, 0, 1, '', 1, '', 43643, 0, 1, 0),
(4, 1711467727, 0, 1, '', 1, '', 9, 0, 90, 9),
(5, 0, 1713169846, 0, 'Module 2: Different adjunct therapies', 1, '<a class=\"no-border-bottom\" href=\"https://easd-elearning.eu/lessons/module-2-different-adjunct-therapies/\"><span style=\"font-size: 16px;\">Module 2: Different adjunct therapies</span></a>', 5, 0, 2, 6),
(6, 0, 1713169827, 0, 'Module 1: Rationale for adjunct therapies', 1, '<a class=\"no-border-bottom\" href=\"https://easd-elearning.eu/lessons/module-1-rationale-for-adjunct-therapies/\"><span style=\"font-size: 16px;\">Module 1: Rationale for adjunct therapies</span></a>', 9, 0, 1, 7),
(9, 0, 0, 1, 'sd', 1, 'f', 2, 0, 3, 3),
(10, 0, 1713169918, 0, 'Inadequate glycaemic control increases mortality', 1, '<h3 class=\"course-subtitle\">Inadequate glycaemic control increases mortality</h3>', 3, 6, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `modul_2_user`
--

CREATE TABLE `modul_2_user` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `modul_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_finished` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `pub_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_desc` tinytext DEFAULT NULL,
  `long_desc` text DEFAULT NULL,
  `news_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `news`
--

INSERT INTO `news` (`id`, `crdate`, `tstamp`, `deleted`, `pub_date`, `name`, `short_desc`, `long_desc`, `news_category_id`) VALUES
(1, 0, 1713106247, 0, '2024-03-27 21:33:00', 'A diabetologists’ guide to subgroup meta-analyses', 'Determining which treatment is suited best for specific patient \r\ngroups can be a complex challenge. A recent study proposes a simple \r\nroadmap to guide clinicians through the interpretation of subgroup \r\nmeta-analyses. Using data from recent cardiovascul', '<p>As the number of diabetes medications continues to grow, clinicians \r\nare encouraged to consider individual factors when making treatment \r\ndecisions. However, recommendations for specific patient groups rely on \r\nthe use of meta-level subgroup analyses – and these are often limited by\r\n clinical heterogeneity across individual trials and the credibility of \r\npooling data.\r\n<br><br>\r\nIn a study published in Diabetes Care, Thomas Karagiannis and colleagues\r\n now offer a step-by-step approach to performing and interpreting \r\nsubgroup meta-analyses. By focusing on the prevention of major \r\ncardiovascular events (MACE) in CVOTs with GLP-1 receptor agonists or \r\nSGLT2 inhibitors, the authors highlight the clinical importance of \r\nconsidering absolute (in addition to relative) treatment effects and of \r\nadditional credibility assessments.\r\n<br>  </p>\r\n\r\n\r\n\r\n<p>\r\n<b>Balancing perspectives</b><br><br>\r\nGLP-1 receptor agonists and SGLT2 inhibitors have broadened the scope of\r\n diabetes management beyond glycaemic control. Among other benefits, \r\nboth classes of drugs are known to improve the cardiovascular health of \r\npatients with type 2 diabetes. Karagiannis et al. pooled results from \r\nplacebo-controlled cardiovascular outcome trials and specifically \r\ncompared two subgroups: patients with established cardiovascular disease\r\n vs patients at high cardiovascular risk but without manifest disease. </p>\r\n\r\n<p>By applying a comprehensive methodological framework, the study \r\nshowed that by focusing solely on relative treatment effects, you may \r\nneglect clinically relevant absolute effects. This was illustrated by \r\nthe finding that the absolute reduction in MACE was approximately two \r\ntimes greater with both drug classes in patients with established \r\ncardiovascular disease as compared with patients at high cardiovascular \r\nrisk but without manifest disease while the relative risk reduction did \r\nnot differ between subgroups. \r\n<br><br></p>\r\n\r\n\r\n\r\n\r\n\r\n<p>\r\n<b>Clinical implications</b><br><br>\r\n“The clinical interpretation of our findings is that it is reasonable to\r\n support a strong recommendation for using these medications to reduce \r\nMACE in people with type 2 diabetes and established cardiovascular \r\ndisease, while they may be considered for patients at high \r\ncardiovascular risk but without manifest cardiovascular disease, given \r\nthe lower absolute benefits in the latter subpopulation,” the authors \r\nargue in line with the 2022 EASD/ADA consensus statement on the \r\nmanagement of hyperglycaemia in type 2 diabetes.\r\n<br><br>\r\nIn addition, their findings highlight the importance of tailoring \r\ntherapies to individual factors, such as a patient’s baseline \r\ncardiovascular risk, and therefore underscore the need for robust \r\nsubgroup meta-analyses. The authors present a stepwise approach that can\r\n generally help clinicians address treatment differences between \r\nsubgroups, regardless of the variable of interest.\r\n<br>\r\n </p>\r\n\r\n\r\n\r\n\r\n<p>\r\n<b>Methodological precision: a step-by-step approach</b><br><br>\r\nSubgroup meta-analyses can provide valuable information but are also \r\nknown to have limitations. “They should be approached and implemented \r\nwith caution to prevent potential misinterpretation or unwarranted \r\ngeneralizations,” the authors write.\r\n<br><br>\r\nBased on these considerations, the study introduces a methodological \r\nframework that can be applied to any subgroup meta-analysis (see Figure \r\n1). Essentially, each of the four steps is designed to systematically \r\nanswer one important question about the comparability of the studies \r\nconsidered: \r\n\r\n </p>\r\n\r\n<ol><li>How do the definitions of the subpopulation vary between individual studies?</li><li>Is the baseline risk for each of these subpopulations sufficiently \r\nconsistent across different studies to justify pooling the data in a \r\nmeta-analysis?</li><li>Does the relative treatment effect differ between the subpopulations?</li><li>What are the absolute treatment effects for each subpopulation?</li></ol>', 2),
(3, 1713084383, 0, 1, '2024-04-26 12:30:00', 'Test 123 ', '<p>dgsdg<br></p>', '<p>dfagdafg<br></p>', 0),
(4, 1713084398, 1713106277, 0, '2024-04-25 12:45:00', 'Unique layers of stress in LGBTQ+ populations', '<p>‘Epidemiologic trends and disparities in diabetes risk factors \r\namong LGBTQ+ populations’ was the title of a presentation at the 59th \r\nAnnual Meeting of the EASD and it highlighted the need for more detailed\r\n research into the mechanisms behind', '<p>Carl G Streed Jr, Assistant Professor of Medicine at Boston \r\nUniversity Chobanian and Avedisian School of Medicine and Research Lead \r\nat the GenderCare Center at Boston Medical Center began with the context\r\n of the increase in prevalence of diabetes across the US, as is being \r\nseen across the globe. In terms of how this relates to LGBTQ [lesbian, \r\ngay, bisexual, transgender and queer or questioning]+ populations, we \r\nare limited by the data available, he said, as not every surveillance \r\nsystem is asking questions about sexual orientation or gender identity. </p>\r\n\r\n\r\n\r\n<p>The data he presented was from Gallup 2023 – it showed that there are\r\n about 20 million LGBTQ people in the US. For Europe, Germany has the \r\nhighest percentage of people identifying at LGBT at 7.4% in 2016 and \r\nHungary the lowest at 1.5%. He also showed more recent data from market \r\nresearch firm, Ipsos, which shows that this is a large and growing \r\npopulation as younger generations become more comfortable with coming \r\nout and finding more support and acceptance from their families and \r\ncommunities. </p>\r\n\r\n\r\n\r\n<p>So how does this relate to diabetes, he asked. There are a number of \r\nfactors that are modifiable that have differences across different \r\npopulations, particularly those that are marginalised by society. The \r\nfactor that Professor Streed focused on was stress – there is a growing \r\nbody of research, he said, to show that this is leading a significant \r\namount of the disparities that we see in marginalised populations. </p>\r\n\r\n\r\n\r\n<p>A lot of the early research on how this plays out has been done on \r\nracial and ethnic marginalised populations and so they’ve drawn on \r\nsimilar theories on minority stress. He displayed a graphic from the \r\nAmerican Heart Association’s (AHA) statement on LGBTQ cardiovascular \r\nhealth on minority stress theory and its link to cardiometabolic \r\noutcomes from Caceres et al (2020). It demonstrates that people from \r\nmarginalised groups have unique layers of stress that can play out from \r\ndiscrimination, such as being targeted by family, institutions and also \r\nby governments (for example, being denied access to certain services), \r\nhypervigilance (fear of discrimination) and self-stigma and concealment.\r\n Research has shown that these stressors are related to disparities in \r\noutcomes arising from factors such as depression and anxiety, tobacco \r\nuse and diet quality, and physiological factors such as inflammation and\r\n changes in the hypothalamic-pituitary-adrenal (HPA) axis. </p>\r\n\r\n\r\n\r\n<p>Persistently elevated levels of cortisol from being stressed has been\r\n connected to issues around diabetes but there are also issues around \r\ninflammatory pathways as well as autonomic processes that are affecting \r\npeople’s metabolic health. Professor Streed also showed a graphic \r\ndemonstrating how stress affects people who have diabetes, with a \r\nvicious cycle of affecting behaviour as well as physiology. </p>\r\n\r\n\r\n\r\n<p>The other areas in which they have data are overweight/obesity, \r\nsedentary behaviours and low physical activity. Professor Streed drew \r\nattention to work from 2018 showing that the risk factors for diabetes \r\nare higher among non-heterosexual US high-school students. Issues come \r\nup around engaging in physical activity and higher excess weight. </p>\r\n\r\n\r\n\r\n<p>With regard to what this means for adults, he showed data on \r\nself-reported diabetes by sexual orientation that he described as ‘a \r\nstart’ because it’s from the government and data on sexual orientation \r\nwas not collected uniformly across different states and therefore \r\nprobably an underestimate. It found that bisexual men have a higher \r\nprevalence of diabetes than their heterosexual peers and bisexual women \r\nhad lower rates compared with heterosexual women. </p>\r\n\r\n\r\n\r\n<p>Professor Streed and colleagues looked at a larger data set from \r\nalmost 200,000 veterans. Publication is pending but they found that \r\nsexual minority status was associated with 1.12 times the odds of \r\nprevalent diabetes, adjusted for age, race, Hispanic ethnicity, marital \r\nstatus, BMI, smoking, enrolment priority group and service \r\nconnectedness. </p>\r\n\r\n\r\n\r\n<p>For further reading on the specifics of the evidence available in the\r\n US on addressing cardiometabolic health for LGBTQ adults, Professor \r\nStreed directed the audience to the <a rel=\"noreferrer noopener\" href=\"http://www.ahajournals.org/doi/epub/10.1161/CIR.0000000000000914\" target=\"_blank\">AHA statement on LGBTQ cardiovascular health</a>. </p>\r\n\r\n\r\n\r\n<p>They also took the next step, he said, to be more specific for \r\ntransgender individuals as they feel there are unique factors for trans \r\npeople, including how hormone therapy affects risk – <a rel=\"noreferrer noopener\" href=\"http://www.ahajournals.org/doi/full/10.1161/CIR.0000000000001003\" target=\"_blank\">the AHA statement on this is also available to read</a>. </p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>Cardiovascular disease</strong></h4>\r\n\r\n\r\n\r\n<p>He moved on to discuss forthcoming work on cardiovascular disease \r\n(CVD) risk and outcomes among veterans by sexual orientation. When \r\naccounting for traditional risk factors for cardiovascular disease, LGB \r\nveterans had 1.12 times the odds of prevalent CVD compared with \r\nnon-sexual-minority veterans. With additional adjustment for other \r\nfactors such as BMI, diabetes, hypertension, lipids etc, there is still \r\n1.08 times the odds of CVD prevalence. We’re missing something in the \r\nmeasurable clinical data, he said – there’s some unmeasured factor \r\nthat’s accounting for a higher likelihood of poor outcomes in this \r\npopulation. This might be unmeasured stress or additional factors that \r\nget left out such as inflammatory processes.</p>\r\n\r\n\r\n\r\n<p>When it comes to understanding the mechanisms behind the impacts of \r\nstress, Professor Streed emphasised that we need to understand more \r\nabout the physiological changes that occur, whereas much of the research\r\n centres on psychosocial and behavioural factors. He and others are \r\nworking on trying to understand how vascular function changes in the \r\nface of stress, how it changes under hormone therapy for trans \r\nindividuals and how that may play out downstream. </p>\r\n\r\n\r\n\r\n<p>There is more research highlighting the unique factors of minority \r\nstress, he said, drawing attention to work from 2021 on cardiovascular \r\nand cortisol responses to experimentally induced minority stress. Two \r\ngroups had to give a talk to a crowd – a placebo group gave the talk but\r\n had no interaction with the crowd; the other gave a talk and also \r\ndidn’t interact with the crowd but were told that the crowd was \r\nanti-gay/lesbian/bisexual/trans. After five to 30 minutes rest after the\r\n talks, the intervention group’s heart rate remained elevated, heart \r\nrate variability dropped and cortisol remained elevated compared with \r\nthe placebo group – this is essentially testing for hypervigilance, said\r\n Professor Streed, and the fear was affecting people’s cardiovascular \r\nhealth.</p>\r\n\r\n\r\n\r\n<ul><li>A report on cardiometabolic aspects of transgender healthcare from \r\nthe 59th Annual Meeting of the EASD is upcoming on Horizons on January \r\n10 2024.</li></ul>\r\n\r\n\r\n\r\n<p><em>Any opinions expressed in this article are the responsibility of the EASD e-Learning Programme Director, Dr Eleanor D Kennedy.</em></p><p></p>', 0),
(5, 1713109285, 1713109360, 0, '2024-04-02 12:31:00', 'Is type 2 diabetes remission through diet sustainable?', '<p>Type 2 diabetes need no longer be a lifelong progressive \r\ncondition as remission is possible through diet, medication or surgery. \r\nFocusing on the low-calorie diet approach, there was a lively debate on \r\nthe motion ‘Is lasting remission of ty', '<p>Professor Roy Taylor of Newcastle University, who led the DiRECT \r\nlow-calorie diet trials, put up a robust defence of the motion. “At one \r\nyear, 46% of participants had achieved remission of type 2 diabetes and I\r\n would emphasise that this is in the real world because most type 2 \r\ndiabetes is managed in primary care in the UK,” he said. At two years, \r\nremission rates had dropped to 36%. After five years, people were still \r\nover 6 kg lighter, which is remarkable in the context of dietary studies\r\n and 13% were still in remission. “So remission is feasible in the real \r\nworld, though it is not necessarily easy or for everyone,” said \r\nProfessor Taylor.    </p>\r\n\r\n\r\n\r\n<p>So why might you recommend this approach to your patients? Quality of\r\n life improves quite early, with people reporting being able to chase \r\ntheir grandchildren or to do other things they hadn’t been able to do \r\nfor a while. This happens within about two weeks of going on the \r\nlow-calorie diet and this rapid weight loss is important to \r\nmotivation. “It is also worth striving for if your patient wants to \r\navoid a whole slew of adverse consequences, for the rate of serious \r\nadverse events over five years goes down from 70 to 40 per 100 \r\npatient-years,” said Professor Taylor. There is a big difference between\r\n those in the intervention and control groups in infections, renal \r\nfailure was seen only in controls and there were no cancers in the \r\nintervention group compared with eight in the control group.</p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>Maintaining remission</strong></h4>\r\n\r\n\r\n\r\n<p>We live in an obesogenic environment, so how easy is it to maintain \r\nremission? “Inform people that the amount of food they eat will be 25% \r\nless once they’ve lost weight,” said Professor Taylor. “The reason is \r\nsimple – it’s because they are smaller.”</p>\r\n\r\n\r\n\r\n<p>He recommends weekly weighing at home with a written record and \r\nregular follow-up. The NHS remission programme, which is now well \r\nunderway, is provided by a person with basic training, rather than a \r\nbusy healthcare professional because people do need external agencies to\r\n assist them. Weight regain often follows a life event, but this can be \r\ndealt with using a relapse plan, which involves reverting to total diet \r\nreplacement for one or more meals, depending on how much weight has been\r\n regained. </p>\r\n\r\n\r\n\r\n<p>The NHS remission programme aims for a 15 kg weight loss and, at 12 \r\nmonths, the average weight loss for 3,000 participants is already 10 \r\nkg. “This is quite remarkable and confirms what we were able to show in \r\nour independent psychology studies,” said Professor Taylor. “This method\r\n of weight loss depends on those who sign up for it and is not \r\nnecessarily for everyone.” </p>\r\n\r\n\r\n\r\n<p>He then turned to look at the trajectory of someone passing through \r\nprediabetes, diabetes and remission. With diabetes, their QRISK is 14% \r\nand heart age 71. If you then go down to the glucose tolerance range, \r\nQRISK reduces to 7% and heart age to 56, and underlying pathophysiology \r\nis reversed. “The macrovascular risk associated with prediabetes is \r\nlipid and hypertension driven and, after weight loss, lipids are \r\nnormal,” said Professor Taylor. “So don’t label this prediabetes – it’s \r\npost-diabetes. What patients are interested in is freedom from risk and \r\nthis is a really potent point to make.”</p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>Case studies</strong></h4>\r\n\r\n\r\n\r\n<p>To demonstrate his point, Professor Taylor turned to two case studies\r\n of remission. The first was a man who, in 2013, had had type 2 diabetes\r\n for several years. His weight was 126 kg and HbA1c was 9.2%. He had a \r\nCharcot foot and the other foot was expected to be amputated. His sons \r\nmade him take action and, in 2014, his weight had gone down to 94 kg and\r\n HbA1c was 6.2%. The year 2017 saw further improvements with weight at \r\n83 kg and HbA1c at 5.7%. But during the Covid lockdown, he did get his \r\ndiabetes back. The story has been written up by his sons and \r\ndaughter-in-law in the book ‘Fixing Dad’.  </p>\r\n\r\n\r\n\r\n<p>The second case history was Carlos who, in 2011, had already had a \r\nmyocardial infarction, was on insulin and had a non-healing foot ulcer. \r\nHis fasting blood glucose was 27 mmol/l and his weight 94 kg. He lost \r\nweight and his glucose went down but then he changed job and his \r\ndiabetes returned. He changed job again and his weight went down again. \r\nHe’s been in remission for nine years and the longest anyone has been in\r\n remission with this approach is now 18 years. “So, yes, remission is \r\ndurable,” Professor Taylor said. “But it depends what you call lasting. \r\nSeveral years is lasting in my book for it will push back complications.\r\n It is not for everyone and it is not simple. But is it feasible, as in \r\nthe wording of the motion? I would suggest it certainly is.”  </p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>Against the motion</strong></h4>\r\n\r\n\r\n\r\n<p>Kamlesh Khunti, Professor of Primary Care Diabetes & Vascular \r\nMedicine at the University of Leicester and part-time GP, made the case \r\nagainst the motion. “My view is based on the word ‘lasting’ and on the \r\ndefinition of remission,” he said. “It may be possible for a few, but we\r\n are talking here of a public health problem. We are looking at \r\nremission from two points of view. Roy is a world-class scientist while I\r\n am a pragmatic GP.”   </p>\r\n\r\n\r\n\r\n<p>He noted that there are multiple definitions of remission, which \r\nsuggests a problem, with the latest being HbA1c less than 6.5% three \r\nmonths after cessation of glucose-lowering therapies. “Why 6.5%?” asked \r\nProfessor Khunti. “If you look at data, you should be going lower, below\r\n the diabetes range. The increases in risk starts at HbA1c of 5.5%.” </p>\r\n\r\n\r\n\r\n<p>Turning to the various weight-loss trials, he noted that people tend \r\nto regain weight and fall out of remission, despite support. One example\r\n is the Look AHEAD trial, which involved intensive lifestyle \r\nintervention in people with type 2 diabetes and obesity or overweight, \r\nwhere remission rates were down to only 4% after four years, despite an \r\naverage of 10 kg being lost in the first year. </p>\r\n\r\n\r\n\r\n<p>“Adherence to diet-induced weight loss is difficult because of \r\nhormone changes that increase appetite, hunger and preference for \r\nenergy-dense foods,” he said. “But surgery and GLP-1 receptor agonists \r\ntarget some of these.” To back up his argument, he cited a review of 21 \r\nstudies, which showed only 5% maintenance of weight loss in the long \r\nterm. These low numbers are likely to be because it is an extremely \r\ndemanding task to follow participants for extended periods of time and \r\nto maintain sufficient numbers in the programme. </p>\r\n\r\n\r\n\r\n<p>“One of the worries I have is collateral fattening, which is excess \r\nfat deposited as result of body’s attempt to counter a deficit in lean \r\nmass through overeating following dieting,” he said. “For instance, in \r\nthe Minnesota Starvation Experiment – carried out in 1944/45 to \r\ninvestigate the impact of severe food restriction – participants gained \r\nmore fat mass on refeeding.” </p>\r\n\r\n\r\n\r\n<p>And there are other options for achieving remission, such as \r\nintensive insulin therapy, tirzepatide or semaglutide, but these \r\nwouldn’t be proper remission because people are still on medication. \r\nThere is also the option of metabolic surgery. The Swedish Obese \r\nSubjects study shows that 30% are still in remission at 14 years. \r\nHowever, surgery is not appropriate on a large scale and is associated \r\nwith morbidity and complications, but does offer benefit in terms of \r\nreducing the risk of microvascular and macrovascular diabetes \r\ncomplications. “I note that the EASD/ADA consensus on managing type 2 \r\ndiabetes has a section on metabolic surgery and GLP-1 receptor agonists,\r\n but nothing on remission by calorie restriction,” Professor Khunti \r\nconcluded.</p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>Challenges in clinical practice</strong></h4>\r\n\r\n\r\n\r\n<p>Professor Khunti went on to consider the problems of recruitment and \r\nretention for lifestyle studies. “Getting people onto these behavioural \r\nchange programmes is difficult,” he said. For instance, in the NHS \r\nDiabetes Prevention Programme, 1.9 million factsheets and 4.6 million \r\nbrochures were distributed in order to recruit 3,234 \r\nparticipants. “No-one tells you this,” he added. And, in a similar study\r\n in Finland, recruitment took five years.  </p>\r\n\r\n\r\n\r\n<p>Meanwhile, there is also remission that people achieve on their own. A\r\n study of over two million people in England with type 2 diabetes showed\r\n that only 1.7% went on to meet the criteria for remission. “These were \r\nmainly people with lower HbA1c who had had diabetes for less than a \r\nyear,” said Professor Khunti.  </p>\r\n\r\n\r\n\r\n<p>In the view of healthcare professionals, people in remission are not \r\noffered the support they need to stay in remission. Instead, they are \r\nconsidered as people who no longer need so much attention. “This is the \r\nworrying data that I have – people are being given false reassurance,” \r\nwarned Professor Khunti. “Those who had remission coded in their notes \r\nwere less likely to receive their care processes. For example, there was\r\n a 24% reduction in foot exams. We may lose these patients and they may \r\nthen come back with complications.” </p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>What is remission anyway?</strong></h4>\r\n\r\n\r\n\r\n<p>A key point in Professor Khunti’s rejection of the motion is the \r\nword ‘remission’. “Remission is wrong,” he said. “It gives false hope to\r\n the patient. I think we should call it remission of hyperglycaemia – \r\nthat is, euglycaemia with or without glucose-lowering therapy.”</p>\r\n\r\n\r\n\r\n<p>A problem with the current definition is that it takes a glucocentric\r\n approach and does not include longer-term outcomes. We should be \r\nlooking for longer-term weight loss maintenance and reduced micro- and \r\nmacrovascular outcomes. The very low-calorie diet approach does not, as \r\nyet, have data on this or on cancer. “People with type 2 diabetes want \r\nto live a long and happy life,” concluded Professor Khunti. He does not \r\nbelieve that remission through rapid weight loss is the way to ensure \r\nthis. </p>\r\n\r\n\r\n\r\n<h4 class=\"wp-block-heading\"><strong>Rebuttal and voting</strong></h4>\r\n\r\n\r\n\r\n<p>Professor Taylor disagreed, from his own evidence, that people do not\r\n want to take part in behavioural change programmes. While it is true \r\nthat surgery is very effective in achieving and maintaining remission, \r\nthis is meant for a population that is very obese. And we can now bring \r\nmedications like semaglutide to bear in helping to maintain weight loss \r\nin an obesogenic environment. Finally, when it comes to the \r\nword ‘remission’, this is used all the time in cancer and people are \r\nadvised that it does not mean their cancer has gone away. So there is no\r\n reason why remission can’t be used in the same way in type 2 \r\ndiabetes. “Lasting remission of type 2 diabetes in a real-world setting \r\nis feasible, although it is not easy,” he concluded.</p>\r\n\r\n\r\n\r\n<p>“To me, the word ‘lasting’ means for the rest of someone’s life,” \r\nreplied Professor Khunti. “Let’s give patients what they want – a long \r\nlife with no restrictions.” </p>\r\n\r\n\r\n\r\n<p>Earlier, only five people in the audience voted that they’d be \r\nwilling to go on a very low-calorie diet to achieve remission. On \r\nreflection, they were clearly won over by Professor Taylor’s argument \r\nand voted in favour of the motion by a large majority.</p>\r\n\r\n\r\n\r\n<p>To learn more, enrol on the EASD e-Learning course ‘<a href=\"https://easd-elearning.eu/courses/lifestyle-intervention/\" target=\"_blank\" rel=\"noreferrer noopener\">Lifestyle intervention</a>’.</p>\r\n\r\n\r\n\r\n<p><em>Any opinions expressed in this article are the responsibility of the EASD e-Learning Programme Director, Dr Eleanor D Kennedy.</em></p><p></p>', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news_category`
--

CREATE TABLE `news_category` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `desc` tinytext DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `news_category`
--

INSERT INTO `news_category` (`id`, `crdate`, `tstamp`, `deleted`, `name`, `desc`, `parent_id`) VALUES
(1, 0, 1713105786, 0, 'Journals', 'Journals .. Journals .. Journals .. Journals .. Journals .. Journals .. ', 0),
(2, 1711730146, 1713105810, 0, 'Conferences', 'Conferences ... Conferences ... Conferences ... Conferences ... Conferences ... Conferences ... <br>', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pce`
--

CREATE TABLE `pce` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(4) DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `img_size` int(11) DEFAULT NULL,
  `video_aspect` int(11) DEFAULT NULL,
  `video_transscript` text DEFAULT NULL,
  `audio_transscript` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `rel_table` varchar(255) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `pce`
--

INSERT INTO `pce` (`id`, `crdate`, `tstamp`, `deleted`, `type`, `title`, `text`, `img_size`, `video_aspect`, `video_transscript`, `audio_transscript`, `url`, `rel_table`, `rel_id`) VALUES
(30, 1712769480, 0, 0, 1, '', '', 0, 1, 'dsfsf', '', '', 'courses', 1),
(31, 1712769509, 0, 0, 1, '', '', 0, 1, 'dsfsf', '', '', 'courses', 1),
(32, 1712769590, 0, 0, 1, '', '', 0, 1, 'dsfdsf', '', '', 'courses', 1),
(33, 1712769632, 0, 0, 1, '', '', 0, 1, 'sdfds', '', '', 'courses', 1),
(34, 1712769687, 0, 0, 1, '', '', 0, 1, 'dsfdsf', '', '', 'courses', 1),
(35, 1712769736, 0, 0, 1, '', '', 0, 1, 'iouiouo', '', '', 'courses', 1),
(36, 1712769769, 0, 0, 1, '', '', 0, 1, 'iopop', '', '', 'courses', 1),
(37, 1712769803, 0, 0, 1, '', '', 0, 1, 'dsfds', '', '', 'courses', 1),
(38, 1712769811, 0, 0, 1, '', '', 0, 1, 'dsfdsfsd', '', '', 'courses', 1),
(39, 1713082018, 0, 0, 3, 'adfgdgfdfg', '<p>dafgadfgdfag<br></p>', 123, 1, '', '', '', 'courses', 1),
(40, 1713082031, 0, 0, 4, '', '', 3435, 1, '', '', '', 'courses', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `crdate` int(11) DEFAULT 0,
  `tstamp` int(11) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `type` tinyint(4) DEFAULT 0,
  `lastname` tinytext DEFAULT NULL,
  `firstname` tinytext DEFAULT NULL,
  `last_login_time` int(11) DEFAULT 0,
  `last_login_ip` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `crdate`, `tstamp`, `deleted`, `username`, `password`, `type`, `lastname`, `firstname`, `last_login_time`, `last_login_ip`) VALUES
(1, 1711284168, 1713081986, 0, 'admin', '4d9727d5d0efb81eb283b09204c0a3f5', 9, NULL, NULL, 1713081986, '127.0.0.1');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_category_id` (`course_category_id`);

--
-- Indizes für die Tabelle `course_2_user`
--
ALTER TABLE `course_2_user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `course_categorys`
--
ALTER TABLE `course_categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `diary_dates`
--
ALTER TABLE `diary_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `film_series`
--
ALTER TABLE `film_series`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `fs_film`
--
ALTER TABLE `fs_film`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indizes für die Tabelle `modul_2_user`
--
ALTER TABLE `modul_2_user`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_category_id` (`news_category_id`);

--
-- Indizes für die Tabelle `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pce`
--
ALTER TABLE `pce`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `course_2_user`
--
ALTER TABLE `course_2_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `course_categorys`
--
ALTER TABLE `course_categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `diary_dates`
--
ALTER TABLE `diary_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT für Tabelle `film_series`
--
ALTER TABLE `film_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `fs_film`
--
ALTER TABLE `fs_film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `modul_2_user`
--
ALTER TABLE `modul_2_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `pce`
--
ALTER TABLE `pce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`course_category_id`) REFERENCES `course_categorys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
