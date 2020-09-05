-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2020 at 12:49 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id` int(100) NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `tlpn` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_owner` int(11) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id`, `nama_kasir`, `tlpn`, `username`, `password`, `id_owner`, `level`) VALUES
(122, 'Suratmi', '0898256734', 'ratmi', 'ratmi', 111116, 'Kasir'),
(123, 'M Dani', '0892367844', 'dani', 'dani', 111117, 'Kasir'),
(124, 'Putra', '0892987432', 'uta', 'uta', 111116, 'Kasir'),
(130, 'Febry a', '089508022224', 'feb', 'feb', 111117, 'Kasir');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `nama_own` varchar(100) NOT NULL,
  `nama_laundry` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tlpn` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id`, `nama_own`, `nama_laundry`, `alamat`, `tlpn`, `username`, `password`, `level`) VALUES
(111116, 'Heru Triyono', 'Omah Laundry', 'JL.Imogiri Timur KM 11 Trimulyo Jetis Bantul Yogyakarta', '08930222259', 'heru', 'heru', 'owner'),
(111117, 'Bambang Sulistya', 'Fast Laundry', 'Jl.Imogiti Barat KM 11 Ponggok Jetis Bantul Yogyakarta', '0876543298', 'sulis', 'sulis', 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(100) NOT NULL,
  `paket` varchar(100) NOT NULL,
  `harga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `paket`, `harga`) VALUES
(32, 'Cuci', 2500),
(33, 'Cuci + Setrika', 5000),
(34, 'Setrika', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `tlpn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `tlpn`) VALUES
(1000102, 'Miko Saputra', 'Blawong II, Trimulya, Jetis, Bantul, Yogyakarta', '087896432367'),
(1000103, 'M Zudan', 'Blawong I, Trimulya, Jetis, Bantul, Yogyakarta', '085654392732'),
(1000104, 'Yanto', 'Bembem I, Trimulya, Jetis, Bantul, Yogyakarta', '086432323567'),
(1000105, 'Ririn', 'Bembem II, Trimulya, Jetis, Bantul, Yogyakarta', '086756546546'),
(1000107, 'Rinda', 'Ponggok I, Trimulya, Jetis, Bantul, Yogyakarta', '089967257431'),
(1000110, 'Fadli', 'Ponggok II, Trimulya, Jetis, Bantul, Yogyakarta', '08775475485'),
(1000111, 'Fahrun', 'Blawong II, Trimulya, Jetis, Bantul, Yogyakarta', '085453443545'),
(1000112, 'Udin', 'Blawong II, Trimulya, Jetis, Bantul, Yogyakarta', '0843435454544'),
(1000113, 'Satria', 'Blawong II, Trimulya, Jetis, Bantul, Yogyakarta', '089434636473'),
(1000114, 'Saprul', 'Blawong II, Trimulya, Jetis, Bantul, Yogyakarta', '0854578457487');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_input` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_owner` int(100) DEFAULT NULL,
  `berat` float NOT NULL,
  `total` float NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pelanggan`, `id_input`, `id_paket`, `id_owner`, `berat`, `total`, `tanggal`) VALUES
(101020155, 1000103, 1, 33, 111116, 4, 20000, '2020-09-05 10:38:12'),
(101020156, 1000104, 1, 34, 111116, 6, 12000, '2020-09-05 10:38:25'),
(101020157, 1000102, 130, 32, 111117, 4, 10000, '2020-09-05 10:42:10'),
(101020158, 1000105, 130, 34, 111117, 5.9, 11800, '2020-09-05 10:42:23'),
(101020159, 1000107, 123, 33, 111117, 5, 25000, '2020-09-05 10:42:52'),
(101020160, 1000110, 123, 34, 111117, 1, 2000, '2020-09-05 10:43:01'),
(101020161, 1000111, 122, 32, 111116, 3, 7500, '2020-09-05 10:43:26'),
(101020162, 1000112, 122, 33, 111116, 0.9, 4500, '2020-09-05 10:43:35'),
(101020163, 1000113, 124, 32, 111116, 8, 20000, '2020-09-05 10:44:01'),
(101020164, 1000114, 124, 34, 111116, 3, 6000, '2020-09-05 10:44:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tlpn` (`tlpn`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_owner` (`id_owner`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `tlpn` (`tlpn`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `tlpn` (`tlpn`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `id_owner` (`id_owner`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111120;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000132;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101020165;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
