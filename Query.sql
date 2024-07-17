
-- Data Manipulation Language --
-- SELECT
-- Select semua kolom dari users --
SELECT * FROM users;
-- mencari id, paket dan alamat tujuan saja
SELECT id, paket, alamat_tujuan FROM `order`;
-- mencari data paket
SELECT id, paket, alamat_tujuan, tanggal, harga, status FROM `order`;
-- INSERT
-- INSERT INTO users (nama_lengkap, username, password, no_hp, no_ktp, alamat, tanggal_lahir, email, role_id, created_at, updated_at)
-- VALUES ('nano', 'nano', 'password123', '08123456789', '3212222804030002', 'Jawa Barat, Bandung', '15-05-1990', 'nano@gmail.com', 2, NOW(), NOW());

-- UPDATE
-- update record data harga dengan status di terima di id 1
UPDATE `order`
SET harga = 350000, status = 'Diterima'
WHERE id = 1;

-- delete record data dengan id 1
-- DELETE FROM `order`
-- WHERE id = 1;

-- Manipulasi Satu Tabel
-- WHERE
-- menampilkan data order dengan status/kondisi/where Diterima
SELECT * FROM `order`
WHERE status = 'Diterima';
-- ORDER BY
-- mencari DATA paket dengan tanggal dari belakang
SELECT * FROM `order`
ORDER BY tanggal DESC;
-- LIMIT
SELECT * FROM `order`
ORDER BY tanggal DESC
LIMIT 5;

-- Manipulasi 2 tabel atau lebih
-- JOIN
SELECT o.id, o.paket, o.alamat_tujuan, u.nama_lengkap
FROM `order` o
INNER JOIN users u ON o.users_id = u.id;
-- UNION
SELECT username AS name FROM users
UNION
SELECT role_name AS name FROM roles;
-- INTERSECT
-- SELECT role_name FROM roles
-- INTERSECT
-- SELECT role_id FROM users;

-- EXCEPT
-- SELECT username FROM users
-- EXCEPT
-- SELECT username FROM deleted_users;

-- Fungsi Agregasi --
-- total order
SELECT COUNT(*) AS total_orders FROM `order`;
-- harga tertinggi --
SELECT MAX(harga) AS harga_tertinggi FROM `order`;
-- harga terendah --
SELECT MIN(harga) AS harga_terendah FROM `order`;
-- rata-rata di attribute harga --
SELECT AVG(harga) AS average_price FROM `order`;
-- total harga keseluruhan --
SELECT SUM(harga) AS total_revenue FROM `order`;