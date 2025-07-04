-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Jul 2025 um 13:52
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
-- Datenbank: `daa_shop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `beschreibung` text NOT NULL,
  `preis` float NOT NULL,
  `deleted` int(11) NOT NULL,
  `kat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `name`, `beschreibung`, `preis`, `deleted`, `kat_id`) VALUES
(2, 'test 9999', 'dfg dfg adg dag dfag ', 3.56, 0, 1),
(3, 'Keyboard 33Xrrrr', 'supper keyboard', 56.34, 0, 3),
(4, 'Monitor 3000Z', 'der beste Monitor aller Zeiten !!!', 299.99, 0, 2),
(5, 'zzzzzz', 'wwwwwwww', 999.999, 1, 1),
(6, 'Tee Tasse 1000', 'trinken ist gut ', 9.88, 0, 4),
(7, 'neu', 'bla bla bla', 56.34, 0, 1),
(8, 'neu', 'bla bla bla', 56.34, 0, 1),
(9, 'gsdgfsdgf', 'adfgadfgadfg', 12, 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `beschreibung` text NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `eltern_kat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`id`, `name`, `beschreibung`, `deleted`, `eltern_kat_id`) VALUES
(1, 'Hosen 1000', 'tolle Hosen für alle ', 0, 3),
(2, 'Computer', 'Die besten die es gibt', 0, 0),
(3, 'Kleidung', 'alles was man braucht', 0, 0),
(4, 'Schuhe', 'super sind die dinger ', 0, 3),
(5, 'Macs', 'shgsfhggf', 0, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `deleted` int(11) NOT NULL,
  `usertype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `deleted`, `usertype_id`) VALUES
(1, 'abcdef', '635ae97e2c7d1e17c7f4427624b7052e', 0, 1),
(2, 'hans_wurst 22', '3110e2b3c01dec96b666dc285a283de9', 0, 2),
(5, 'hans_wurst4352354', '98765432', 0, 1),
(6, 'Kai_Niklas', '0248274e14df0fbc759199d7b7c92a7a', 0, 2),
(7, 'hans_wurst9999', '34efba371e789059802aef1ac66a7d9f', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `usertype`
--

INSERT INTO `usertype` (`id`, `name`, `deleted`) VALUES
(1, 'Admin', 0),
(2, 'Normal', 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kat_id_FK` (`kat_id`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usertype_FK` (`usertype_id`);

--
-- Indizes für die Tabelle `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `kat_id_FK` FOREIGN KEY (`kat_id`) REFERENCES `kategorie` (`id`);

--
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `usertype_FK` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
