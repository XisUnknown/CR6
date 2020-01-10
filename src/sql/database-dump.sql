-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Jan 2020 um 11:21
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `school`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE `class` (
  `classID` int(11) NOT NULL,
  `class` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `class`
--

INSERT INTO `class` (`classID`, `class`) VALUES
(1, '1a'),
(2, '1b'),
(3, '2a'),
(4, '2b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `student`
--

INSERT INTO `student` (`studentID`, `name`, `surname`, `email`, `classID`) VALUES
(1, 'Johnny', 'Bravo', 'Johnny.Bravo@gmail.com', 1),
(2, 'Lucy', 'Liu', 'Lucy.Liu@gmail.com', 1),
(4, 'Josef', 'Huber', 'Josef.Huber@gmail.com', 1),
(6, 'Wojciech', 'Wojciechowski', 'Wojciech.W@gmail.com', 2),
(7, 'Susi', 'Kurz', 'Susi.Kurz@gmail.com', 2),
(8, 'Lina', 'Moshammer', 'Lina.Moshammer@gmail.com', 3),
(9, 'Mina', 'Schwan', 'Mina.Schwan@gmail.com', 3),
(10, 'Hans', 'Stehmayer', 'Hans.S@gmail.com', 3),
(11, 'Maria', 'Wendel', 'Maria.Wendel@gmail.com', 2),
(12, 'Max', 'Mad', 'Mad.Max@gmail.com', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `teacher`
--

INSERT INTO `teacher` (`teacherID`, `name`, `surname`, `email`) VALUES
(1, 'John', 'Doe', 'John.Doe@gmail.com'),
(2, 'Jane', 'Doe', 'Jane.Doe@gmail.com'),
(3, 'Jack', 'Johnson', 'Jack.Johnson@gmail.com'),
(4, 'John', 'Jackson', 'John.Jackson@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacherclass`
--

CREATE TABLE `teacherclass` (
  `teacherID` int(11) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `teacherclass`
--

INSERT INTO `teacherclass` (`teacherID`, `classID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 3),
(4, 4);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classID`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `classID` (`classID`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`);

--
-- Indizes für die Tabelle `teacherclass`
--
ALTER TABLE `teacherclass`
  ADD PRIMARY KEY (`teacherID`,`classID`),
  ADD UNIQUE KEY `teacherID` (`teacherID`,`classID`),
  ADD KEY `classID` (`classID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `class`
--
ALTER TABLE `class`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`);

--
-- Constraints der Tabelle `teacherclass`
--
ALTER TABLE `teacherclass`
  ADD CONSTRAINT `teacherclass_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`),
  ADD CONSTRAINT `teacherclass_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
