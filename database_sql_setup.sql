-- SQL setup untuk Shaquille Garage
-- Cocok untuk MySQL / MariaDB

CREATE DATABASE IF NOT EXISTS shaquille_garage;
USE shaquille_garage;

CREATE TABLE IF NOT EXISTS work_orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  no_folio VARCHAR(100),
  no_wo VARCHAR(100),
  nama_pemilik VARCHAR(255),
  telepon VARCHAR(100),
  alamat TEXT,
  tipe_model VARCHAR(255),
  warna VARCHAR(100),
  tgl_booking VARCHAR(50),
  no_rangka VARCHAR(100),
  tgl_terima VARCHAR(50),
  no_mesin VARCHAR(100),
  tgl_penyerahan VARCHAR(50),
  km_terakhir INT DEFAULT 0,
  bahan_bakar VARCHAR(50),
  status_pelanggan VARCHAR(100),
  keluhan_utama TEXT,
  gejala_pertama TEXT,
  frekuensi_kejadian TEXT,
  mil_aktif VARCHAR(20),
  shift_lever VARCHAR(50),
  kondisi_kecepatan TEXT,
  kondisi_mesin TEXT,
  kondisi_lainnya TEXT,
  catatan_tambahan_keluhan TEXT,
  pemeriksaan_fisik TEXT,
  level_bensin INT DEFAULT 0,
  total_material DECIMAL(12,2) DEFAULT 0,
  total_jasa DECIMAL(12,2) DEFAULT 0,
  total_faktur DECIMAL(12,2) DEFAULT 0,
  dp DECIMAL(12,2) DEFAULT 0,
  opsi_ganti_part TEXT,
  metode_bayar VARCHAR(100),
  part_bekas VARCHAR(100),
  opsi_cuci VARCHAR(100),
  ttd_owner_url TEXT,
  ttd_bengkel_url TEXT,
  foto_inspeksi_url TEXT,
  status_pekerjaan VARCHAR(100),
  dibuat_oleh VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS inventory_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_item VARCHAR(100) UNIQUE,
  nama_barang VARCHAR(255),
  tipe_kategori VARCHAR(100),
  stock INT DEFAULT 0,
  harga_beli DECIMAL(12,2) DEFAULT 0,
  harga_jual DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS sale_details (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  no_wo VARCHAR(100),
  id_item VARCHAR(100),
  deskripsi TEXT,
  item_type VARCHAR(100),
  qty INT DEFAULT 0,
  price DECIMAL(12,2) DEFAULT 0,
  total_price DECIMAL(12,2) DEFAULT 0,
  cost_price DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_karyawan VARCHAR(255),
  role VARCHAR(100),
  pin VARCHAR(50),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS settings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  setting_key VARCHAR(255) UNIQUE,
  setting_value TEXT
);

INSERT INTO users (nama_karyawan, role, pin) VALUES
('Owner / Pemilik', 'Owner', '1234'),
('Service Advisor', 'Service Advisor', '2222'),
('Kasir Bengkel', 'Kasir', '3333'),
('Mekanik Bengkel', 'Mekanik', '4444')
ON DUPLICATE KEY UPDATE pin = VALUES(pin);

INSERT INTO inventory_items (id_item, nama_barang, tipe_kategori, stock, harga_beli, harga_jual) VALUES
('SP-001', 'Oli Mesin Shell Helix HX8 5W-30', 'Sparepart', 24, 95000, 135000),
('SP-002', 'Filter Oli Avanza/Xenia/Rush', 'Sparepart', 15, 25000, 45000),
('SP-003', 'Kampas Rem Depan Bendix Innova', 'Sparepart', 8, 280000, 395000),
('SP-004', 'Busi Iridium Denso Avanza', 'Sparepart', 40, 65000, 95000),
('JS-001', 'Jasa Service Berkala Ringan', 'Jasa', 999, 0, 150000),
('JS-002', 'Jasa Tune Up Engine & Gurah Mesin', 'Jasa', 999, 0, 250000),
('JS-003', 'Jasa Ganti Kampas Rem Depan', 'Jasa', 999, 0, 75000),
('JS-004', 'Jasa Turun Setengah Mesin (Top Overhaul)', 'Jasa', 999, 0, 1200000)
ON DUPLICATE KEY UPDATE nama_barang = VALUES(nama_barang);

INSERT INTO settings (setting_key, setting_value) VALUES
('reminder_interval', '180'),
('reminder_template', 'Halo {Nama}, reminder servis kendaraan Anda.'),
('bengkel_email', 'shaquille.garage@gmail.com')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);
