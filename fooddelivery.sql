-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2022 pada 05.51
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fooddelivery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'admin', NULL, '2022-05-03 22:02:38', 0),
(2, '::1', 'admin', NULL, '2022-05-03 22:03:23', 0),
(3, '::1', 'admin', NULL, '2022-05-03 22:03:30', 0),
(4, '::1', 'admin', NULL, '2022-05-03 22:05:05', 0),
(5, '::1', 'admin', NULL, '2022-05-03 22:08:03', 0),
(6, '::1', 'admin', 2, '2022-05-03 22:08:11', 0),
(7, '::1', 'admin@gmail.com', 2, '2022-05-03 22:10:17', 1),
(8, '::1', 'admin', NULL, '2022-05-03 22:18:19', 0),
(9, '::1', 'admin@gmail.com', 2, '2022-05-03 22:18:25', 1),
(10, '::1', 'admin', NULL, '2022-05-03 22:43:04', 0),
(11, '::1', 'admin@gmail.com', 2, '2022-05-03 22:43:10', 1),
(12, '::1', 'admin@gmail.com', 2, '2022-05-04 14:10:22', 1),
(13, '::1', 'admin@gmail.com', 2, '2022-05-04 19:11:39', 1),
(14, '::1', 'admin', NULL, '2022-05-04 19:26:30', 0),
(15, '::1', 'admin@gmail.com', 2, '2022-05-04 19:26:38', 1),
(16, '::1', 'dsa', NULL, '2022-05-04 19:28:34', 0),
(17, '::1', 'adas', NULL, '2022-05-04 19:32:45', 0),
(18, '::1', 'das', NULL, '2022-05-04 19:34:29', 0),
(19, '::1', 'dsad', NULL, '2022-05-04 19:34:43', 0),
(20, '::1', 'dxs', NULL, '2022-05-04 19:35:55', 0),
(21, '::1', 'admin', NULL, '2022-05-04 19:37:11', 0),
(22, '::1', 'admin@gmail.com', 2, '2022-05-04 19:37:16', 1),
(23, '::1', 'admin@gmail.com', 2, '2022-05-04 19:39:23', 1),
(24, '::1', 'admin@gmail.com', 2, '2022-05-04 19:44:09', 1),
(25, '::1', 'dsasd', NULL, '2022-05-04 19:44:45', 0),
(26, '::1', 'admin', NULL, '2022-05-04 19:45:16', 0),
(27, '::1', 'admin@gmail.com', 2, '2022-05-04 19:45:24', 1),
(28, '::1', 'admin@gmail.com', 2, '2022-05-04 22:27:17', 1),
(29, '::1', 'admin@gmail.com', 2, '2022-05-05 02:18:06', 1),
(30, '::1', 'admin@gmail.com', 2, '2022-05-05 05:12:45', 1),
(31, '::1', 'admin@gmail.com', 2, '2022-05-05 05:56:55', 1),
(32, '::1', 'admin@gmail.com', 2, '2022-05-05 06:03:12', 1),
(33, '::1', 'admin@gmail.com', 2, '2022-05-06 11:47:00', 1),
(34, '::1', 'admin@gmail.com', 2, '2022-05-06 21:46:37', 1),
(35, '::1', 'admin@gmail.com', 2, '2022-05-07 05:00:19', 1),
(36, '::1', 'admin@gmail.com', 2, '2022-05-07 10:07:03', 1),
(37, '::1', 'admin@gmail.com', 2, '2022-05-08 19:09:34', 1),
(38, '::1', 'admin@gmail.com', 2, '2022-05-10 11:54:27', 1),
(39, '::1', 'admin@gmail.com', 2, '2022-05-10 14:34:59', 1),
(40, '::1', 'admin', NULL, '2022-06-01 00:12:18', 0),
(41, '::1', 'admin', NULL, '2022-06-01 00:12:48', 0),
(42, '::1', 'admin', NULL, '2022-06-01 00:12:52', 0),
(43, '::1', 'admin', NULL, '2022-06-01 00:14:29', 0),
(44, '::1', 'admin@gmail.com', 2, '2022-06-01 00:14:34', 1),
(45, '::1', 'admin@gmail.com', 2, '2022-06-01 03:09:05', 1),
(46, '::1', 'admin@gmail.com', 2, '2022-06-01 06:42:04', 1),
(47, '::1', 'admin@gmail.com', 2, '2022-06-01 13:50:01', 1),
(48, '::1', 'admin@gmail.com', 2, '2022-06-01 19:24:26', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Minuman Hangat', '1', '2022-05-04 03:18:04', '2022-05-07 07:22:08'),
(9, 'Minuman Dingin', '1', '2022-05-07 07:22:14', '2022-05-08 19:16:48'),
(10, 'Makanan Ringan', '1', '2022-05-08 19:14:11', '2022-05-08 19:14:11'),
(11, 'Makanan Berat', '1', '2022-05-08 19:14:17', '2022-05-08 19:14:17'),
(12, 'Cemilan', '1', '2022-05-08 19:14:41', '2022-05-08 19:14:41'),
(13, 'Kue', '1', '2022-05-08 19:14:46', '2022-05-10 12:00:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(2) NOT NULL,
  `total` int(10) NOT NULL,
  `gambar` text NOT NULL,
  `expired` int(10) NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_pemesanan`
--

CREATE TABLE `log_pemesanan` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `qty` int(2) NOT NULL,
  `total` int(10) NOT NULL,
  `kd_pemesanan` varchar(11) NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `log_pemesanan`
--

INSERT INTO `log_pemesanan` (`id`, `nama_produk`, `harga`, `qty`, `total`, `kd_pemesanan`, `id_pelanggan`, `created_at`, `updated_at`) VALUES
(15, 'Nasi Goreng', 10000, 1, 10000, '14', 2, '2022-05-08 19:37:09', '2022-05-08 19:37:09'),
(16, 'Cireng Jawa Barat', 10000, 2, 20000, '15', 2, '2022-05-15 04:11:38', '2022-05-15 04:11:38'),
(17, 'Bakso  Goreng Malang', 15000, 2, 30000, '15', 2, '2022-05-15 04:11:38', '2022-05-15 04:11:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-04-13-112739', 'App\\Database\\Migrations\\Admin', 'default', 'App', 1650032552, 1),
(2, '2022-04-13-112753', 'App\\Database\\Migrations\\Pelanggan', 'default', 'App', 1650032552, 1),
(3, '2022-04-13-112757', 'App\\Database\\Migrations\\Pemesanan', 'default', 'App', 1650032552, 1),
(4, '2022-04-13-112802', 'App\\Database\\Migrations\\LogPemesanan', 'default', 'App', 1650032552, 1),
(5, '2022-04-13-112808', 'App\\Database\\Migrations\\Keranjang', 'default', 'App', 1650032552, 1),
(6, '2022-04-13-112813', 'App\\Database\\Migrations\\Produk', 'default', 'App', 1650032552, 1),
(7, '2022-04-13-112818', 'App\\Database\\Migrations\\Kategori', 'default', 'App', 1650032552, 1),
(8, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1651630678, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status_pelanggan` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `no_telp`, `email`, `password`, `status_pelanggan`, `created_at`, `updated_at`) VALUES
(2, 'Resa Auliana Risyan', '87749355656', 'resarisyan77@gmail.com', '$2y$10$JOhs5tgxkj3lEEYnOTig6.AERxN0hQrWxPh41P28bVw6bT0aoQUkO', '1', '2022-05-08 19:35:22', '2022-05-08 19:35:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `kd_pemesanan` int(11) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `total_bayar` int(10) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `status` enum('0','1','2','3','4') NOT NULL,
  `alamat_kirim` text NOT NULL,
  `noteCancel` text NOT NULL,
  `note` text NOT NULL,
  `payment` varchar(20) NOT NULL,
  `ongkir` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`kd_pemesanan`, `tgl_pesan`, `total_bayar`, `latitude`, `longitude`, `id_pelanggan`, `status`, `alamat_kirim`, `noteCancel`, `note`, `payment`, `ongkir`) VALUES
(14, '2022-05-08 19:00:00', 10500, -6.8201478898150985, 107.13971827179193, 2, '1', 'No. 96, Pamoyanan, Kecamatan Cianjur, Jawa Barat, Indonesia', '', '', 'Cash', 500),
(15, '2022-05-15 04:00:00', 52500, -6.8201478898150985, 107.13971827179193, 2, '1', 'No. 96, Pamoyanan, Kecamatan Cianjur, Jawa Barat, Indonesia', '', '', 'Cash', 2500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL,
  `status` enum('0','1') NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `harga`, `deskripsi`, `gambar`, `status`, `kategori`, `created_at`, `updated_at`) VALUES
(10, 'Nasi Goreng', 10000, 'Nasi goreng mantap', '1652055549_532be76ad1ea3b279ded.jpg', '1', 'Makanan Berat', '2022-05-08 19:19:09', '2022-05-08 19:30:53'),
(11, 'Kebab', 15000, 'Kebab mantap', '1652055637_6a7ad296d98651858ceb.jpg', '1', 'Makanan Berat', '2022-05-08 19:20:37', '2022-05-08 19:20:37'),
(12, 'Macaroni Schotel', 20000, 'Macaroni schotel mantap', '1652055714_200ec66274e21d5c86d3.jpg', '1', 'Makanan Berat', '2022-05-08 19:21:54', '2022-05-08 19:21:54'),
(13, 'Cireng Jawa Barat', 10000, 'Cireng asli Jawa Barat', '1652056243_bed9a3fe9d9d8b9fdba7.jpg', '1', 'Makanan Ringan', '2022-05-08 19:30:43', '2022-05-08 19:30:43'),
(14, 'Bakso  Goreng Malang', 15000, 'Bakso goreng khas malang', '1652056330_ed6e30a612a233e4a6e8.jpg', '1', 'Makanan Ringan', '2022-05-08 19:32:10', '2022-05-10 12:00:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'admin@gmail.com', 'admin', '$2y$10$KNme.DwwsScXAKaToqHeXuvWqPLfz2ig1txb30m7IAtk1JbzgKETq', NULL, NULL, NULL, '472c887869faa969240d3294ef26b327', NULL, NULL, 1, 0, '2022-05-03 22:07:37', '2022-05-03 22:07:37', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indeks untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indeks untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjang_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indeks untuk tabel `log_pemesanan`
--
ALTER TABLE `log_pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_pemesanan_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`kd_pemesanan`),
  ADD KEY `pemesanan_id_pelanggan_foreign` (`id_pelanggan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `log_pemesanan`
--
ALTER TABLE `log_pemesanan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `kd_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `log_pemesanan`
--
ALTER TABLE `log_pemesanan`
  ADD CONSTRAINT `log_pemesanan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
