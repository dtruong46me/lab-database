USE layloihoi_db;

-- Câu 1:Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ có số lượng lớn hơn 3 và 
-- nhỏ hơn 10. (1 điểm)
SELECT * FROM chi_tiet_su_dung_dich_vu
WHERE soluong > 3
AND soluong < 10;

-- Câu 2: Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ so với 
-- giá phòng hiện tại, chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 10. (1 điểm)
-- SELECT * FROM phong;
UPDATE phong 
SET giaphong = giaphong + 10000 
WHERE sokhachtoida > 10;

-- Câu 3: Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) có trạng thái đặt (TrangThaiDat) 
-- là “Da huy”. (1 điểm)
-- SELECT * FROM dat_phong;
DELETE FROM dat_phong
WHERE trangthaidat = 'Da huy';

-- Câu 4: Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, 
-- “N”, “M” và có độ dài tối đa là 20 ký tự. (1 điểm)
SELECT tenkh 
FROM khach_hang
WHERE tenkh LIKE 'H%'
OR tenkh LIKE 'N%'
OR tenkh LIKE 'M%';

-- Câu 5: Hiển thị TenKH của tất cả các khách hàng có trong hệ thống, TenKH nào trùng nhau 
-- thì chỉ hiển thị một lần. Sinh viên sử dụng hai cách khác nhau để thực hiện yêu cầu trên,
-- mỗi cách sẽ được 0,5 điểm. (1 điểm)


-- Câu 6: Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm có DonViTinh là
-- “lon” và có DonGia lớn hơn 10,000 VNĐ hoặc những dịch vụ đi kèm có DonViTinh là “Cai” và
-- có DonGia nhỏ hơn 5,000 VNĐ. (1 điểm)

-- Câu 7: Hiển thị MaDatPhong, MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, MaKH, TenKH,
-- SoDT, NgayDat, GioBatDau, GioKetThuc, MaDichVu, SoLuong, DonGia của những đơn đặt phòng
-- có năm đặt phòng là “2016”, “2017” và đặt những phòng có giá phòng > 50,000 VNĐ/ 1 giờ. (1 điểm)

-- Câu 8: Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH, NgayDat, TongTienHat,
-- TongTienSuDungDichVu, TongTienThanhToan tương ứng với từng mã đặt phòng có trong bảng
-- DAT_PHONG. Những đơn đặt phòng nào không sử dụng dịch vụ đi kèm thì cũng liệt kê thông
-- tin của đơn đặt phòng đó ra. (1 điểm)
-- TongTienHat = GiaPhong * (GioKetThuc – GioBatDau)
-- TongTienSuDungDichVu = SoLuong * DonGia
-- TongTienThanhToan = TongTienHat + sum (TongTienSuDungDichVu)

-- Câu 9: Hiển thị MaKH, TenKH, DiaChi, SoDT của những khách hàng đã từng đặt phòng karaoke
-- có địa chỉ ở “Hoa xuan”. (1 điểm)

-- Câu 10: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat của những phòng
-- được khách hàng đặt có số lần đặt lớn hơn 2 lần và trạng thái đặt là “Da dat”. (1 điểm)