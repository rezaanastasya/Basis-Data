-- 1. Buat Basis Data
CREATE DATABASE retail_pendidikan;
USE retail_pendidikan;

-- 2. Buat Tabel
CREATE TABLE mahasiswa (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100),
  jurusan VARCHAR(50),
  jenis_kelamin ENUM('L', 'P')
);

CREATE TABLE produk_retail (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100),
  harga INT,
  stok INT
);

CREATE TABLE transaksi (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_mahasiswa INT,
  id_produk INT,
  tanggal DATE,
  jumlah INT,
  FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id),
  FOREIGN KEY (id_produk) REFERENCES produk_retail(id)
);

-- 3. Insert Data (minimal 5 tiap tabel)
INSERT INTO mahasiswa (nama, jurusan, jenis_kelamin) VALUES
('Andi', 'Teknik', 'L'),
('Budi', 'Ekonomi', 'L'),
('Citra', 'Pendidikan', 'P'),
('Dina', 'Kesehatan', 'P'),
('Elok', 'Teknik', 'P');

INSERT INTO produk_retail (nama_produk, harga, stok) VALUES
('Pulpen', 3000, 100),
('Buku Tulis', 5000, 50),
('Flashdisk 16GB', 60000, 20),
('Sticky Note', 4000, 80),
('Map Plastik', 2000, 150);

INSERT INTO transaksi (id_mahasiswa, id_produk, tanggal, jumlah) VALUES
(1, 1, '2025-06-10', 2),
(2, 3, '2025-06-10', 1),
(3, 2, '2025-06-11', 4),
(4, 4, '2025-06-11', 3),
(5, 5, '2025-06-11', 2);

-- 4. Update (3 Data)
UPDATE mahasiswa SET jurusan = 'Teknologi Informasi' WHERE id = 1;
UPDATE produk_retail SET harga = 5500 WHERE nama_produk = 'Buku Tulis';
UPDATE transaksi SET jumlah = 5 WHERE id = 3;

-- 5. Insert 2 → Lalu Delete
INSERT INTO mahasiswa (nama, jurusan, jenis_kelamin) VALUES
('Fitri', 'Pendidikan', 'P'),
('Gilang', 'Teknik', 'L');

-- Cek dulu
SELECT * FROM mahasiswa;

-- Delete 2 data terakhir
DELETE FROM mahasiswa WHERE nama IN ('Fitri', 'Gilang');

-- SELECT Semua Isi
SELECT * FROM mahasiswa;
SELECT * FROM produk_retail;
SELECT * FROM transaksi;
