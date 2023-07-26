DROP DATABASE IF EXISTS layloihoi_db;
CREATE DATABASE layloihoi_db;
USE layloihoi_db;

CREATE TABLE IF NOT EXISTS phong (
    maphong CHAR(20) PRIMARY KEY,
    loaiphong VARCHAR(50),
    sokhachtoida INT,
    giaphong FLOAT,
    mota CHAR(255)
);

CREATE TABLE IF NOT EXISTS khach_hang (
    makh CHAR(20) PRIMARY KEY,
    tenkh VARCHAR(100),
    diachi VARCHAR(100),
    sdt char(20)
);

CREATE TABLE IF NOT EXISTS dich_vu_di_kem (
    madv CHAR(20) PRIMARY KEY,
    tendv CHAR(50),
    donvitinh CHAR(20),
    dongia FLOAT
);

CREATE TABLE IF NOT EXISTS dat_phong (
    madatphong CHAR(20) PRIMARY KEY,
    maphong CHAR(20),
    FOREIGN KEY (maphong) REFERENCES phong(maphong),
    makh CHAR(20),
    FOREIGN KEY (makh) REFERENCES khach_hang(makh),
    ngaydat DATE,
    giobatdau TIME,
    gioketthuc TIME,
    tiendatcoc FLOAT,
    ghichu CHAR(255),
    trangthaidat VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS chi_tiet_su_dung_dich_vu (
    madatphong CHAR(20),
    madv CHAR(20),
    PRIMARY KEY (madatphong, madv),
    FOREIGN KEY (madatphong) REFERENCES dat_phong(madatphong),
    FOREIGN KEY (madv) REFERENCES dich_vu_di_kem(madv),
    soluong INT
);