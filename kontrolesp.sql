-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Bulan Mei 2022 pada 08.25
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kontrolesp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_kontrol`
--

CREATE TABLE `tabel_kontrol` (
  `ID` int(20) NOT NULL,
  `DEVICE` varchar(20) NOT NULL,
  `BOARD` varchar(20) NOT NULL,
  `GPIO` int(20) NOT NULL,
  `STATE` int(20) NOT NULL,
  `TYPE` enum('Active High','Active Low') NOT NULL,
  `LOGTIME` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tabel_kontrol`
--

INSERT INTO `tabel_kontrol` (`ID`, `DEVICE`, `BOARD`, `GPIO`, `STATE`, `TYPE`, `LOGTIME`) VALUES
(43, 'lampu', '1', 5, 1, 'Active High', '2022-05-12 05:37:47'),
(44, 'Lampu', '1', 4, 1, 'Active High', '2022-05-11 13:41:26'),
(45, 'Lampu', '1', 0, 1, 'Active High', '2022-05-11 13:41:23'),
(46, 'Lampu', '1', 14, 1, 'Active High', '2022-05-11 13:41:22');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_kontrol`
--
ALTER TABLE `tabel_kontrol`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tabel_kontrol`
--
ALTER TABLE `tabel_kontrol`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
