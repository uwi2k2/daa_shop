-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Jun 2025 um 11:57
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
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`id`, `name`, `beschreibung`, `preis`, `deleted`) VALUES
(2, 'test 9999', 'dfg dfg adg dag dfag ', 3.56, 0),
(3, 'Keyboard 33Xrrrr', 'supper keyboard', 56.34, 0),
(4, 'Monitor 3000Z', 'der beste Monitor aller Zeiten !!!', 299.99, 0),
(5, 'zzzzzz', 'wwwwwwww', 999.999, 1),
(6, 'Tee Tasse', 'trinken ist gut ', 9.88, 0),
(7, 'neu', 'bla bla bla', 56.34, 0),
(8, 'neu', 'bla bla bla', 56.34, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `deleted`) VALUES
(1, 'abcdef', '34ee0cca46450112cd6e0399c565f12d', 0),
(2, 'hans_wurst 22', '98765432', 0),
(3, 'hans_wurst', '98765432', 1),
(4, 'Peter_Lustig_3000', '34ee0cca46450112cd6e0399c565f12d', 0),
(5, 'hans_wurst4352354', '98765432', 0),
(6, 'Kai_Niklas', 'dfhgdhgfpass', 0),
(7, 'hans_wurst', '98765432', 0),
(8, 'hans_wurst', '98765432', 1),
(11, 'Gabi_lustig', '435345435', 0),
(12, 'hans_wurst', '98765432', 0),
(13, 'aus_html', 'html123', 0),
(14, 'neuer user 1000', 'dfgsdgfdsgf', 0),
(15, '', '', 0),
(16, '', '', 0),
(17, '', '', 0),
(18, '', '', 0),
(19, '', '', 0),
(20, '', '', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
