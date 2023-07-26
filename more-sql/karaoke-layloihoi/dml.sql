USE layloihoi_db;

INSERT INTO phong(maphong, loaiphong, sokhachtoida, giaphong) VALUES
('P0001', 'Loai 1', 20, 60000),
('P0002', 'Loai 1', 25, 80000),
('P0003', 'Loai 2', 15, 50000),
('P0004', 'Loai 3', 20, 50000);

INSERT INTO khach_hang VALUES
('KH0001', 'Nguyen Van A', 'Hoa Xuan', 1111111111),
('KH0002', 'Nguyen Van B', 'Hoa Hai', 1111111112),
('KH0003', 'Phan Van A', 'Cam Le', 1111111113),
('KH0004', 'Phan Van A', 'Hoa Xuan', 1111111114);

INSERT INTO dich_vu_di_kem VALUES
('DV001', 'Beer', 'lon', 10000),
('DV002', 'Nuoc ngot', 'lon', 10000),
('DV003', 'Trai cay', 'dia', 10000),
('DV004', 'khan uot', 'cai', 10000);

INSERT INTO dat_phong(madatphong, maphong, makh, ngaydat, giobatdau, gioketthuc, tiendatcoc, trangthaidat) VALUES
('DP0001', 'P0001', 'KH0002', '2018-03-26', '11:00', '13:30', 100000, 'Da dat'),
('DP0002', 'P0001', 'KH0003', '2018-03-27', '17:15', '19:15', 50000, 'Da huy'),
('DP0003', 'P0002', 'KH0002', '2018-03-26', '20:30', '22:15', 100000, 'Da dat'),
('DP0004', 'P0003', 'KH0001', '2018-04-01', '19:30', '21:15', 200000, 'Da dat');

INSERT INTO chi_tiet_su_dung_dich_vu VALUES
('DP0001', 'DV001', 20),
('DP0001', 'DV003', 3),
('DP0001', 'DV002', 10),
('DP0002', 'DV002', 10),
('DP0002', 'DV003', 1),
('DP0003', 'DV003', 2),
('DP0003', 'DV004', 10);