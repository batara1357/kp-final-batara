-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Mar 2023 pada 05.33
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraandinas`
--

CREATE TABLE `kendaraandinas` (
  `nama` varchar(25) NOT NULL,
  `nrp` varchar(25) NOT NULL,
  `satker` varchar(20) NOT NULL,
  `nomor_al` varchar(20) NOT NULL,
  `nomor_pusat` varchar(25) NOT NULL,
  `merktype_kendaraan` varchar(10) NOT NULL,
  `tahun_pembuatan` varchar(10) NOT NULL,
  `nomor_mesin` varchar(30) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kendaraandinas`
--

INSERT INTO `kendaraandinas` (`nama`, `nrp`, `satker`, `nomor_al`, `nomor_pusat`, `merktype_kendaraan`, `tahun_pembuatan`, `nomor_mesin`, `kondisi`, `foto`) VALUES
('HAMKA', '132789', 'Bama KRI TBN-520', 'B-3426-DYU', '5634-23', 'HONDA', '2017', 'BF453789Y673', 'BAIK', 'C:UsersRyzenPicturesfortuner.jpg'),
('BATARA', '172391', 'Aslog Pangkolinlamil', 'B-1287-YUK', '3422-78', 'TOYOTA', '2019', 'GH64R5678439', 'BAIK', 'C:UsersRyzenPicturescivic.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `nrp` varchar(20) NOT NULL,
  `jenis_service` varchar(20) NOT NULL,
  `sparepart` varchar(20) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `jumlah` varchar(20) NOT NULL,
  `keluhan` varchar(20) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_kembali` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `service`
--

INSERT INTO `service` (`nrp`, `jenis_service`, `sparepart`, `kode_barang`, `jumlah`, `keluhan`, `tanggal_masuk`, `tanggal_kembali`) VALUES
('172391', 'Ringan', 'oli', 'brg02', '1', 'rem', '05/03/2023', '30/04/2023');

--
-- Trigger `service`
--
DELIMITER $$
CREATE TRIGGER `stok` AFTER INSERT ON `service` FOR EACH ROW BEGIN

   UPDATE stok  SET qty = qty - NEW.jumlah

   WHERE kode_barang = NEW.kode_barang;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `kode_barang` varchar(20) NOT NULL,
  `sparepart` varchar(25) NOT NULL,
  `qty` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`kode_barang`, `sparepart`, `qty`) VALUES
('brg01', 'rem', 4),
('brg02', 'oli', 9),
('brg03', 'lampu', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `nrp` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `satker` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`nrp`, `nama`, `satker`) VALUES
('2018230107', 'JUJU', 'Kadiskomlek '),
('2019230107', 'BATARA', 'Dandenmako');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_status`
--

CREATE TABLE `tbl_status` (
  `nrp` varchar(20) NOT NULL,
  `nomer_al` varchar(20) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `tahun` varchar(15) NOT NULL,
  `kondisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_status`
--

INSERT INTO `tbl_status` (`nrp`, `nomer_al`, `merk`, `tahun`, `kondisi`) VALUES
('2018230107', 'EW210967', 'BMW', '2018', 'BAIK'),
('2019230107', 'RE342109', 'HONDA', '2019', 'BAIK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `nrp` varchar(20) NOT NULL,
  `admin_master` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`nrp`, `admin_master`, `password`, `status`) VALUES
('2016230107', 'giju', 'a', 'SLOG'),
('2017230107', 'batara', '1', 'SLOG'),
('2018230107', 'juju', '123', 'ADMINISTRATOR'),
('2019230107', 'batara', '123', 'ADMINISTRATOR');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kendaraandinas`
--
ALTER TABLE `kendaraandinas`
  ADD PRIMARY KEY (`nrp`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`nrp`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`nrp`);

--
-- Indeks untuk tabel `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`nrp`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`nrp`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `stok` (`kode_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
