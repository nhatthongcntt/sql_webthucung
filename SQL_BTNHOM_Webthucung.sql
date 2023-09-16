if exists (select name from SYS.databases where name = 'Data_Web_ThuCung')
drop database Data_Web_ThuCung
Go
Create Database Data_Web_ThuCung
Go
Use Data_Web_ThuCung
--------------------------------------------------------------------------
-- admin
Go
Create Table admin	(
  IDAD int NOT NULL,
  Hoten nvarchar(100) NOT NULL,
  SDT varchar(100) NOT NULL,
  Email varchar(100) NOT NULL,
  MatKhau varchar(100) NOT NULL,
  ChucVu nvarchar(100)
)
Go
Alter Table admin ADD primary key (IDAD)

Go
INSERT INTO dbo.admin (IDAD, Hoten, SDT, Email, MatKhau, ChucVu) VALUES
(1, N'Admin', '1234567890', 'tanbinh131001@gmail.com', '123456', N'admin');
--------------------------------------------------------------------------------
--các chủng loại thú cưng
Go
CREATE TABLE chungloai (
  idCL varchar(100) NOT NULL,
  tenCL nvarchar(100) NOT NULL,
  iconCL varchar(100) NOT NULL,
  idLoaiSP int NOT NULL
)
Go
Alter Table chungloai ADD Primary Key (idCL)
Go
INSERT INTO chungloai (idCL, tenCL, iconCL, idLoaiSP) VALUES
('CL01', N'Chó', 'cho.png', 1),
('CL02', N'Thỏ', 'tho.png', 1),
('CL03', N'Chuột', 'chuot.png', 1),
('CL04', N'Mèo', 'meo.png', 1),
('CL05', N'Chim', 'chim.png', 1);
----------------------------------------
---- chó: husky, alaska, vvvv
CREATE TABLE loai (
  idLoai varchar(100) NOT NULL,
  idCL varchar(100) NOT NULL,
  tenLoai nvarchar(100) NOT NULL
)
Go
Alter Table loai ADD Primary Key (idloai)
Go
INSERT INTO loai (idLoai, idCL, tenLoai) VALUES
('Loai01', 'CL01', N'Alaska'),
('Loai02', 'CL01', N'Boo'),
('Loai03', 'CL01', N'Husky '),
('Loai04', 'CL01', N'Fox Sóc'),
('Loai05', 'CL01', N'Pecgie'),
('Loai06', 'CL01', N'Poodle'),
('Loai07', 'CL01', N'Pug'),
('Loai08', 'CL02', N'Sussex'),
('Loai09', 'CL02', N'Minilop'),
('Loai10', 'CL02', N'Anogora'),
('Loai11', 'CL02', N'Himalayan'),
('Loai12', 'CL02', N'Lionhead'),
('Loai13', 'CL03', N'Chuột Bạch'),
('Loai14', 'CL03', N'Chuột Hamster '),
('Loai15', 'CL03', N'Chuột Lang'),
('Loai16', 'CL04', N'Ba Tư'),
('Loai17', 'CL04', N'Anh Lông Ngắn'),
('Loai18', 'CL04', N'Munchkin'),
('Loai19', 'CL04', N'Anh Lông Dài trắng'),
('Loai20', 'CL05', N'Chào Mào'),
('Loai21', 'CL05', N'Họa Mi'),
('Loai22', 'CL05', N'Vành Khuyên'),
('Loai23', 'CL05', N'Sáo'),
('Loai24', 'CL05', N'Họ Sâu')
----------------------------------------------------------------------
--chi tiết hóa đơn
Go
CREATE TABLE cthoadon (
  IDHoaDon int NOT NULL,
  IDSanPham int NOT NULL,
  Gia float NOT NULL,
  SoLuong int NOT NULL,
  DonGia float NOT NULL
)
Go
Alter Table cthoadon ADD Primary Key (idHoaDon, idsanpham)
INSERT INTO cthoadon (IDHoaDon, IDSanPham, Gia, SoLuong, DonGia) VALUES
(1, 101, 980000, 12, 11760000),
(2, 22, 980000, 123, 120540000);

-----------------------------------------------------------------------------
-- hóa đơn
Go
CREATE TABLE hoadon (
  IDHD int NOT NULL,
  IDKH int NOT NULL,
  NgayLap date NOT NULL,
  TongTien float NOT NULL DEFAULT '0',
  SoDienThoai varchar(20) NOT NULL
)
Go
Alter Table hoadon ADD Primary Key (idHD)
Go
INSERT INTO hoadon (IDHD, IDKH, NgayLap, TongTien, SoDienThoai) VALUES
(1, 14, '20230914', 11760000, '0123'),
(2, 24, '20230914', 120540000, '0123');
------------------------------------------------------------------------------
-- khách hàng
Go
CREATE TABLE khachhang (
  IDKH int NOT NULL,
  HoTenKH nvarchar(100) NOT NULL,
  EmailKH varchar(100) NOT NULL,
  SDTKH varchar(20) NOT NULL,
  DiaChiKH nvarchar(100) NOT NULL,
  gioitinhKH nvarchar(100),
  IDUser int NOT NULL
)
Go
Alter Table khachhang ADD Primary Key (IDKH)
Go
INSERT INTO khachhang (IDKH, HoTenKH, EmailKH, SDTKH, DiaChiKH, gioitinhKH, IDUser) VALUES
(1, N'Lê Thị Lệ', 'jangho2020@gmail.com', '987654321', N'quận 12',N'Nữ', 1),
(2, N'Trần Hoài Bão', 'jangho2021@gmail.com', '0123456', N'quận 1',N'Nam', 2),
(3, N'Nguyễn Thị Na', 'jangho2022@gmail.com', '0123', N'quận Thủ Đức','Nữ', 3),
(4, N'Trần Trung Chánh', 'jangho2023@gmail.com', '0123', N'quận Gò Vấp','Nam', 4);
--------------------------------------------------------------------------------------------------
-- tài khoản
Go
CREATE TABLE taikhoan (
  IDUser int NOT NULL,
  Email varchar(100) NOT NULL,
  SDT varchar(100) NOT NULL,
  MatKhau varchar(100) NOT NULL
)
Go
Alter Table taikhoan ADD Primary Key (IDUSER)
Go
INSERT INTO taikhoan (IDUser, Email, SDT, MatKhau) VALUES
(1, 'jangho2020@gmail.com', '987654321', '123456'),
(2, 'jangho2021@gmail.com', '0123456', '123456'),
(3, 'jangho2022@gmail.com', '0123', '123456'),
(4, 'jangho2023@gmail.com', '0123', '123456');
--------------------------------------------------------------------------------------------------
-- loại sản phẩm
Go
CREATE TABLE loaisanpham (
  idLoaiSP int NOT NULL,
  tenLoaiSP nvarchar(100) NOT NULL
)
Go
Alter Table loaisanpham ADD Primary Key (idloaiSP)
Go
INSERT INTO loaisanpham (idLoaiSP, tenLoaiSP) VALUES
(1, N'Thú nuôi'),
(2, N'Thức ăn'),
(3, N'Lồng thú'),
(4, N'Phụ kiện khác');
----------------------------------------------
-- 1. giới thiệu thú nuôi
Go
CREATE TABLE thunuoi (
  idThu int NOT NULL,
  idLoai varchar(100) NOT NULL,
  tenThu nvarchar(100) NOT NULL,
  tuoiThu nvarchar(100) NOT NULL,
  canNangThu nvarchar(100) NOT NULL,
  gioiTinhThu nvarchar(100) NOT NULL,
  hinhThu nvarchar(100) NOT NULL,
  giaThu float NOT NULL,
  moTaThuNuoi nvarchar(1000) NOT NULL,
  idLoaiSP int NOT NULL
)
Go
Alter Table thunuoi ADD Primary Key (idThu)
Go
INSERT INTO thunuoi (idThu, idLoai, tenThu, tuoiThu, canNangThu, gioiTinhThu, hinhThu, giaThu, moTaThuNuoi, idLoaiSP) VALUES
(1, 'Loai01', N'Alaska Đen Trắng', '0.8', '3', N'Đực', N'.jpg', 678000, N'vẻ ngoài dũng mãnh, nhanh nhẹn và khá thông minh,màu: đen trắng	',1),
(2, 'Loai01', N'Alaska Nâu Đỏ 2', '0.9', '2.5', N'Đực', N'.jpg', 654000, N'vẻ ngoài dũng mãnh, nhanh nhẹn và khá thông, màu: nâu đỏ',1),
(3, 'Loai01', N'Alaska Xám Trắng', '1.3', '3.5', N'Cái', N'.jpg', 355000, N'vẻ ngoài dũng mãnh, nhanh nhẹn và khá thông minh,màu: xám trắng',1),
(4, 'Loai02', N'Boo Nâu', '1.5', '2.5', N'Cái', N'.jpg', 784000, N'lông dày và dài (cần cắt tỉa để ngắn lại), mặt tròn, mõm ngắn thay vì mặt cáo, mõm dài của phốc sóc truyền thống',1),
(5, 'Loai03', N'Husky Nâu Đỏ', '0.9', '3', N'Đực', N'.jpg', 667000, N'Lông kép dày - lông trong dày & lông ngoài mềm.chân, mõm, đốm cuối đuôi là lông trắng, đa phần màu nâu đỏ',1),
(6, 'Loai03', N'Husky Đen', '0.8', '2', N'Cái', N'.jpg', 888000, N'Lông kép dày - lông trong dày & lông ngoài mềm.chân, mõm, đốm cuối đuôi là lông trắng, đa phần màu nâu đen',1),
(7, 'Loai03', N'Husky Xám Trắng', '0.7', '2', N'Đực', N'.jpg', 889000, N'Lông kép dày - lông trong dày & lông ngoài mềm.chân, mõm, đốm cuối đuôi là lông trắng, đa phần màu xám trắng',1),
(8, 'Loai04', N'Fox Sóc Trắng\r\n', '2', '2.9', N'Đực', N'.jpg', 977000, N'lông dày, mập mạp, mõm ngắn, mặt gấu. lông bông gòn',1),
(9, 'Loai05', N'Pecgie', '0.9', '3.9', N'Đực', N'.jpg', 980000, N'vết căn không  hở,2 chân trước thẳng và đều nhau. Xương bả vai và xương đòn mạnh, dài tương đương và sát với thân hình. Cổ chân dài khoảng 1/3 so với chiều dài cẳng chân',1),
(10, 'Loai06', N'Poodle', '1.8', '4.1', N'Đực', N'.jpg', 795000, N'Cao < 25,4cm, trọng lượng từ 2,5 – 4kg	',1),
(11, 'Loai07', N'Pug', '1.6', '3.6', N'Đực', N'.jpg', 986000, N'mặt ngắn, mũi ngắn và ngộ nghĩnh',1),
(12, 'Loai08', N'Sussex', '1.5', '1.5', N'Đực', N'.jpg', 670000, N'Lông chủ yếu có màu vàng và màu kem. Cân nặng trung bình từ 3,2-3,6 kg.',1),
(13, 'Loai09', N'Minilop', '2', '1.9', N'Cái', N'.jpg', 500000, N'Mini Lop là một giống thỏ rất phổ biến đó là đặc trưng trên khắp nước Mỹ . Với bộ lông dày và tai cụp. Rất được ưa chuộng và nuôi như thú kiểng',1),
(14, 'Loai10', N'Anogora', '2', '4.6', N'Đực', N'.jpg', 300000, N'lông mềm, mượt và xù bông, đẹp và đáng yêu, nổi tiếng bởi bộ lông xù to gấp nhiều lần cơ thể. Bề ngoài chúng Loài thỏ khổng lồ, lông xù như cục bông, tuy chỉ nặng hơn 2 kg nhưng trông giống như sinh vật khổng lồ khi sở hữu lớp lông dày tới 50 cm',1),
(15, 'Loai11', N'Himalayan', '2', '3.9', N'Đực', N'.jpg', 400000, N'lông có màu trắng toàn bộ. khi lớn lên mới xuất hiện màu đen ở các vùng tai, chân, đuôi, mũi và màu đen này phân bố nhiều/ít, hình dạng thế nào còn tuỳ thuộc vào nhiệt độ môi trường chú thỏ sinh sống',1),
(16, 'Loai12', N'Lionhead', '1', '2.6', N'Đực', N'.jpg', 400000, N'kích thước rất nhỏ kích thước của một bé thỏ sư tử lion head chỉ tối đa tới 2kg Với bộ lông xù',1),
(17, 'Loai13', N'Chuột Bạch', '0.2', '0.2', N'Đực', N'.jpg', 80000, N'vẻ ngoài trắng nhỏ hình dáng, đường nét khuôn mặt thon với mỏ dài như chuột nhà.',1),
(18, 'Loai14', N'Chuột Hamster', '0.4', '0.39', N'Đực', N'.jpg', 80000, N'Chuột hamster có kích thước nhỏ; bộ lông mềm bao phủ khắp cơ thể,Chuột hams có đuôi nhưng cực kì ngắn và có 1 lớp lông mỏng bao phủ dường như chẳng để làm gì cả. Răng của chuột hams dài, có hai răng cửa to lớn',1),
(19, 'Loai15', N'Chuột Lang', '0.6', '0.35', N'Cái', N'.jpg', 80000, N'chiều dài từ 20 đến 25 cm,Tai của chúng rất nhạy, có thể nghe các âm thanh nhỏ. Lông có hai lớp để giữ ấm cơ thể. Nó thường sống trung bình bốn đến năm năm',1),
(20, 'Loai16', N'Ba Tư', '0.6', '0.9', N'Trống', N'.jpg', 350000, N'Lông 2 lớp với lớp lông dài phía ngoài và lớp lông ngắn khá dày ở bên trong. Đuôi của chúng luôn xù nên việc chăm sóc cho bộ lông của giống mèo này là một công việc rất quan trọng nhất',1),
(21, 'Loai17', N'Anh Lông Ngắn', '1.5', '2.3', 'Cái', N'.jpg', 150000, N'Thân hình mũm mĩm, lông ngắn và dày cùng với khuôn mặt to. Màu sắc phổ biến nhất là màu xám xanh	',1),
(22, 'Loai18', N'Munchkin', '0.5', '1.2', N'Cái', N'.jpg', 450000, N'Đôi chân ngắn cùng với dáng đi chảy mỡ,Chiều dài cơ thể Munchkin gấp 2,5 lần chiều cao (chiều cao của giống mèo này là 18-20 cm).Bốn chân không bao giờ được duỗi thẳng, không khuỵu gối khiến Munchkin cực kỳ đáng yêu. Cân nặng của chúng chỉ từ  2-5 kg.',1),
(23, 'Loai19', N'Anh Lông Dài Trắng', '0.7', '1.6', N'Đực', N'.jpg', 230000, N'bộ lông cực kỳ dài, giúp chúng giữ ấm rất tốt. Màu lông màu trắng',1),
(24, 'Loai20', N'Chào Mào Yếm Khít', '2', '0.3', N'Trống ', N'.jpg', 200000, N'có phần yếm màu đen nhìn như một vòng tròn rất đẹp mắt, thường thấy ở gốc bổi Trà My của Bác Sơn Cao.Từ phần đầu đến xuống phía ức cả hai bên đều có 1 vòng màu đen tạo thành cái yếm và khít nhau',1),
(25, 'Loai20', N'Chào Mào Ô', '2', '0.2', N'Trống', N'.jpg', 200000, N'phía trước yếm, bụng của chúng có một màu đen tuyền',1),
(26, 'Loai20', N'Chào Mào Trung Mang ', '3', '0.3', N'Mái', N'.jpg', 200000, N'mào lân hoặc hơi lân, hầu to, má trắng sốp, nhưng bộ yếm lại không đậm, sâu (yếm treo) hoặc khoảng giữa 2 yếm thay vì màu trắng thì lại có màu hơi xám.Về ngoại hình thì giống chào mào Trung Mang hơi nhỏ, thon dài hơn giống nơi khác khoảng 3cm, mũ cao vươn ra phía trước và vòng cổ màu đen chạm nhau dưới ức. Đặc biệt loài chim này mà đi thi đấu thì khỏi phải nói, rất là hung đấy.',1),
(28, 'Loai21', N'Họa Mi Vàng', '3', '0.3', N'Mái', N'.jpg', 150000, N'Chọn lông khô, tơi, mỏng, ngắn, ít hoa, sáng màu, vùng lông trắng dưới bụng  rộng,Tảng đầu to, phẳng, gáy phải dài, lông đầu thưa và ngắn,  ít hoa  ,hai bên thái dương  vuông ',1),
(29, 'Loai22', N'Vành Khuyên Vàng', '3', '0.35', N'Trống', N'.jpg', 130000, N'phần lông ở dưới mỏ, ở ngực và bụng chim có sắc lông vàng óng.',1),
(30, 'Loai22', N'Vành Khuyên Xanh', '2', '0.36', N'Trống', N'.jpg', 130000, N'màu lông xanh phớt ở trên lưng, bụng có màu vàng chanh, phần lông dưới mỏ có màu vàng lục',1),
(31, 'Loai23', N'Sáo Đá Đầu Trắng', '4', '0.33', N'Mái', N'.jpg', 100000, N'Kích thước 24cm. Toàn bộ đầu có màu lông trắng. Khi bay để lộ mảng lông trắng lớn ở gốc lông cánh sơ cấp. Mỏ đỏ. Chim mái và chim non có màu tối.',1),
(32, 'Loai23', N'Sáo Đá Xanh', '4', '0.34', N'Mái', N'.jpg', 100000, N'Kích thước 22cm. Bộ lông có nhiều màu xen kẽ, mỏ nhọn sắc, màu vàng. Mùa đông có rất nhiều đốm trắng và nâu sẫm, mỏ màu nâu. Chim non màu nâu tối, họng hơi xám và mỏ màu tối.',1),
(33, 'Loai23', N'Sáo Hồng', '2', '0.25', N'Trống', N'.jpg', 100000, N'Kích thước 22cm. Chim trống trưởng thành vào mùa xuân và mùa thu có bộ lông màu hồng và đen dễ nhận thấy. Chim mái có màu lông tối hơn. Đầu mùa đông màu hồng bị các mút lông nâu sẫm lấn át, nhưng sau đó mất dần đi.',1),
(34, 'Loai23', N'Sáo Nâu', '3', '0.36', N'Mái', N'.jpg', 350000, N'Kích thước 25cm. Chim trưởng thành có bộ lông màu nâu tối, đầu đen. Mỏ, da vùng mắt và giò có màu vàng. Chim non có màu xỉn hơn. Khi bay thấy rõ vạt lông trắng ở cánh.	',1),
(35, 'Loai24', N'Sâu Lưng Ôliu', '2', '0.25', N'Mái', N'.jpg', 150000, N' kích thước 9cm. Chim trống: Có màu đỏ tươi ở phía lưng kéo dài từ trán xuống gốc đuôi. Chim mái: Phía lưng có màu xanh ôliu, hông đỏ sẫm và đuôi đen; mặt bụng màu ô liu nhạt. Chim non: Không có màu đỏ thẫm nhưng mỏ màu da cam tươi',1),
(36, 'Loai24', N'Sâu Họng Trắng', '4', '0.3', N'Trống', N'.jpg', 140000, N'"Loài chim này có chiều dài 10 cm, đuôi ngắn, mỏ cong dày ngắn và lưỡi hình ống. Các đặc trưng cuối phản ánh tầm quan trọng của mật hoa trong chế độ ăn uống của nó, mặc dù quả, nhện và côn trùng cũng được nó ăn. Chim sâu họng trắng trống có phần lưng màu lam-đen, họng và ngực trên trắng, ngực dưới và bụng vàng. Chim mái xỉn màu hơn,với phần lưng màu nâu ô liu."',1),	
(37, 'Loai24', N'Sâu Ngực Vàng', '5', '0.29', N'Mái', N'.jpg', 140000, N'Kích thước 8cm. Kích thước rất nhỏ, trông có màu xám, mặt bụng sáng hơn, mắt đen. Chim non có mỏ đen.',1);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- giới thiệu thức ăn
Go
CREATE TABLE thucan (
  idThucAn nvarchar(100) NOT NULL,
  idCL varchar(100) NOT NULL,
  tenThucAn nvarchar(100) NOT NULL,
  hinhThucAn nvarchar(100) NOT NULL,
  giaThucAn int NOT NULL,
  moTaThucAn nvarchar(255) NOT NULL,
  idLoaiSP int NOT NULL
)
Go
Alter Table thucan ADD Primary Key (idThucan)
Go
INSERT INTO thucan (idThucAn, idCL, tenThucAn, hinhThucAn, giaThucAn, moTaThucAn, idLoaiSP) VALUES
('TA01', 'CL01', N'Cookie Xương', N'.jpg', 10, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA02', 'CL01', N'RoYal Canin', N'.jpg', 135, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA03', 'CL01', N'Thanh Gân Bò', N'.jpg', 55, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA04', 'CL01', N'Thức Ăn Huấn Luyện Vị Gà', N'.jpg', 25, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA05', 'CL02', N'Cỏ nén nâu', N'.jpg', 150, N'Đối với thỏ con từ 2 tháng tuổi bạn nên tập ăn', 2),
('TA06', 'CL02', N'Thức ăn nén thanh', N'.jpg', 120, N'Giúp pet mài răng tốt', 2),
('TA07', 'CL02', N'Cỏ khô GEX TYMOTHY ', N'.jpg', 295, N'Ngăn ngừa các bệnh tiêu hóa đường ruột', 2),
('TA08', 'CL02', N'Cỏ nén WEIOUS ', N'.jpg', 50, N'Cung cấp đủ dinh dưỡng cho Thỏ', 2),
('TA09', 'CL03', N'Bánh Trứng Alex', N'.jpg', 40, N'Tăng chất đạm cân bằng tiêu hóa', 2),
('TA10', 'CL03', N'Đu Đủ Dẻo', N'.jpg', 40, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA11', 'CL03', N'Dứa Dẻo', N'.jpg', 40, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA12', 'CL03', N'Xương Sữa', N'.jpg', 50, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA13', 'CL04', N'PateRoYal', N'.jpg', 45, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA14', 'CL04', N'Thức Ăn Dinh Dưỡng Cao Vị Heo', N'.jpg', 45, N'Tăng  cân bằng tiêu hóa', 2),
('TA15', 'CL04', N'Thức Ăn Sẵn Thịt Gà', N'.jpg', 32, N'Tăng  cân bằng tiêu hóa', 2),
('TA16', 'CL04', N'Thức Ăn Snacks', N'.jpg', 95, N'Tăng  cân bằng tiêu hóa', 2),
('TA17', 'CL03', N'Thức ăn nén thanh', N'.jpg', 120, N'Giúp pet mài răng tốt', 2),
('TA18', 'CL05', N'Cám Chào Mào', N'.jpg', 35, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA19', 'CL05', N'Cám Chích Chòe', N'.jpg', 55, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA20', 'CL05', N'Cám Họa Mi', N'.jpg', 55, N'Tăng chất sơ cân bằng tiêu hóa', 2),
('TA21', 'CL05', N'Cám Vành Khuyên ', N'.jpg', 65, N'Tăng chất sơ cân bằng tiêu hóa', 2);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--giới thiệu lồng thú
Go
CREATE TABLE longthu (
  idLongThu varchar(100) NOT NULL,
  idCL varchar(100) NOT NULL,
  tenLongThu nvarchar(100) NOT NULL,
  hinhLongThu nvarchar(100) NOT NULL,
  giaLongThu int NOT NULL,
  soLuongThuTrongLong int NOT NULL,
  moTaLongThuNuoi nvarchar(2000) NOT NULL,
  idLoaiSP int NOT NULL
)
Go
Alter Table longthu ADD Primary Key (idLongThu)
Go
INSERT INTO longthu (idLongThu, idCL, tenLongThu, hinhLongThu, giaLongThu, soLuongThuTrongLong, moTaLongThuNuoi, idLoaiSP) VALUES
('Long01', 'CL01', N'Dây Dắt Trợ Lực', N'.jpg', 90, 1, N'đi chơi thoải mái mà thú cưng của mình không bị bắt mắt, hay nó chạy đi mất .Chất liệu chắc chắn và thiết kế dày dặn cho độ bền cao, đồng thời tạo cảm giác êm ái khi đeo. Thiết kế khóa giúp bạn dễ dàng đeo hoặc tháo mở dây và vòng một cách nhanh chóng.', 3),
('Long02', 'CL01', N'Dây Giữ Chó trên Ô Tô', N'.jpg', 60, 1, N'đi chơi thoải mái mà thú cưng của mình không bị bắt mắt, hay nó chạy đi mất .Chất liệu chắc chắn và thiết kế dày dặn cho độ bền cao, đồng thời tạo cảm giác êm ái khi đeo. Thiết kế khóa giúp bạn dễ dàng đeo hoặc tháo mở dây và vòng một cách nhanh chóng.', 3),
('Long03', 'CL01', N'Dây Tập Chạy', N'.jpg', 85, 1, N'đi chơi thoải mái mà thú cưng của mình không bị bắt mắt, hay nó chạy đi mất .Chất liệu chắc chắn và thiết kế dày dặn cho độ bền cao, đồng thời tạo cảm giác êm ái khi đeo. Thiết kế khóa giúp bạn dễ dàng đeo hoặc tháo mở dây và vòng một cách nhanh chóng.', 3),
('Long04', 'CL01', N'Nơ Đeo Cổ Chuông', N'.jpg', 75, 1, N'Vòng đeo được thiết kế nhằm mục đích tránh thất lạc', 3),
('Long05', 'CL01', N'Vòng Cổ In Hình', N'.jpg', 25, 1, N'Vòng đeo được thiết kế nhằm mục đích tránh thất lạc những hình ảnh vô cùng dễ thương', 3),
('Long06', 'CL02', N'Lồng Thỏ Loại 1', N'.jpg', 170, 2, N'Lồng 2 ngăn dành cho thỏ từ độ tuổi 2 đến 3 tuổi', 3),
('Long07', 'CL02', N'Lồng Thỏ Loại 2', N'.jpg', 180, 3, N'Lồng 2 ngăn dành cho thỏ từ độ tuổi 2 đến 3 tuổi', 3),
('Long08', 'CL02', N'Lồng Thỏ Loại 3', N'.jpg', 220, 3, N'Lồng 2 ngăn dành cho thỏ từ độ tuổi 2 đến 3 tuổi', 3),
('Long09', 'CL02', N'Lồng Thỏ Loại 4', N'.jpg', 195, 4, N'Lồng 2 ngăn dành cho thỏ từ độ tuổi 2 đến 3 tuổi', 3),
('Long10', 'CL03', N'Lồng Nhà Dẻo', N'.jpg', 320, 5, N'Bánh xe chạy đồ chơi, đường kính 10cm, giúp Hamster vừa sinh hoạt vừa vui chơi giải trí.Thiết bị hỗ trợ gắn bánh xe vào lồng Khay đựng thức ăn cho Hamster.', 3),
('Long11', 'CL03', N'Lồng Sân Chơi Nhỏ', N'.jpg', 240, 6, N'Bánh xe chạy đồ chơi, đường kính 10cm, giúp Hamster vừa sinh hoạt vừa vui chơi giải trí.Thiết bị hỗ trợ gắn bánh xe vào lồng Khay đựng thức ăn cho Hamster.', 3),
('Long12', 'CL03', N'Lồng Túi Đeo', N'.jpg', 160, 4, N'Bánh xe chạy đồ chơi, đường kính 10cm, giúp Hamster vừa sinh hoạt vừa vui chơi giải trí.Thiết bị hỗ trợ gắn bánh xe vào lồng Khay đựng thức ăn cho Hamster.', 3),
('Long13', 'CL03', N'Lồng Vòm Lớn', N'.jpg', 240, 9, N'Bánh xe chạy đồ chơi, đường kính 10cm, giúp Hamster vừa sinh hoạt vừa vui chơi giải trí.Thiết bị hỗ trợ gắn bánh xe vào lồng Khay đựng thức ăn cho Hamster.', 3),
('Long14', 'CL03', N'Lồng Xách Tay', N'.jpg', 180, 3, N'Lồng được thiết kế để xách tay vô cùng tiện lợi', 3),
('Long15', 'CL04', N'Dây Dắt Vòng Hoa', N'.jpg', 60, 1, N'Phần dây có tay cầm thoải mái , phần vòng cổ có chốt điều chỉnh to- nhỏ, hai phần được nối với nhau bằng khóa inox rất chắc chắn và có thể tháo rời tiện lợi', 3),
('Long16', 'CL04', N'Vòng Cổ Da Đính Đá', N'.jpg', 120, 1, N'kích thước 1,5 x 30cm, được làm từ da bò dẻo dài chịu mài mòn cao mà vẫn thoáng khí , tạo cảm giác thoải mái cho vật nuôi khi sử dụng. Móc khóa được làm từ inox,sáng bóng bền đẹp, mang đến vẻ thời trang cho vật nuôi ', 3),
('Long17', 'CL04', N'Vòng Cổ Đệm Hoa', N'.jpg', 40, 1, N'size 1.5 cm : 45.000, size 2 cm : 55.000, size 2.5 cm :65.000, size 3 cm : 75.000', 3),
('Long18', 'CL04', N'Vòng Cổ Đệm', N'.jpg', 50, 1, N'Được làm bằng vải cotton cao cấp tạo cảm giác thoải mái cho thú cưng. Khóa cài được làm bằng inox không gỉ, rất an toàn và dễ sử dụng. Đặc biệt có nhiều màu sắc có thể tùy chỉnh kích thước sử dụng, không bám bụi và mau khô, có lót đệm êm ái', 3),
('Long19', 'CL04', N'Vòng Cổ SiliCon', N'.jpg', 40, 1, N'Vòng cổ được làm từ silicon mềm mại, đảm bảo không gây tổn thương cho vật nuôi, đi kèm vòng là chiếc chuông nhỏ phát ra tiếng kêu leng keng vui tai mỗi khi thú nuôi đi lại, vòng cổ có thể điều chỉnh to- nhỏ tùy ứng và có inox để móc vào dây dắt', 3),
('Long20', 'CL05', N'Lồng Bầu', N'.jpg', 1400, 1, N'Phù hợp với nuôi chào mào có tật bu lồng, ngoái, lộn.', 3),
('Long21', 'CL05', N'Lồng Đấu Tre', N'.jpg', 900, 1, N'Đáy lồng làm bằng tre, đẹp, sang trọng.', 3),
('Long22', 'CL05', N'Lồng Kỹ', N'.jpg', 1200, 1, N'Thanh lồng mảnh, cứng tuyệt đối.', 3),
('Long23', 'CL05', N'Lồng Tròn', N'.jpg', 1100, 1, N'Phù hợp với nuôi chào mào có tật bu lồng, ngoái, lộn.', 3);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- giới thiệu các phụ kiện khác
Go
CREATE TABLE phukienkhac (
  idPhuKienKhac int NOT NULL,
  tenPhuKienKhac nvarchar(100) NOT NULL,
  hinhPhuKienKhac nvarchar(100) NOT NULL,
  giaPhuKienKhac int NOT NULL,
  moTaPhuKienKhac nvarchar(1000) NOT NULL,
  idLoaiSP int NOT NULL
)
Go
Alter Table phukienkhac ADD Primary Key (idPhuKienKhac)
INSERT INTO phukienkhac (idPhuKienKhac, tenPhuKienKhac, hinhPhuKienKhac, giaPhuKienKhac, moTaPhuKienKhac, idLoaiSP) VALUES
(1, N'BaoLo Đeo Lồng Chim', N'BaoLo Đeo Lồng Chim.jpg', 160, N'Ba lô được thiết kê đơn giản tiện dụng để có thể đeo lồng chim khi đang chạy xe một mình hoặc là cánh tay của bạn đang bận phải xách vật khác', 4),
(2, N'Bát Phíp Tròn Chuột', N'Bát Phíp Tròn Chuột.jpg', 30, N'Bát được thiết kế dùng để đựng thức ăn cho các bé chuột ', 4),
(3, N'Bát Sứ Tròn Chuột ', N'Bát Sứ Tròn Chuột .jpg', 15, N'Bát được thiết kế để đựng thức ăn , Bát được làm từ sứ rất kiểu cách', 4),
(4, N'Máng Sành Thỏ', N'Máng Sành Thỏ.jpg', 15, N'Máng dành cho thỏ ăn sẽ giúp các bạn không phải đau đầu trong việc nghĩ nên lấy vật gì để đựng đồ ăn cho thỏ nữa đúng không nào. Chúng tôi cung cấp hai loại máng thỏ. Trên đây là máng làm từ vật liệu Sành. Các bạn có thể tham khảo', 4),
(5, N'Máng Tôn Thỏ', N'Máng Tôn Thỏ.jpg', 15, N'Máng dành cho thỏ ăn sẽ giúp các bạn không phải đau đầu trong việc nghĩ nên lấy vật gì để đựng đồ ăn cho thỏ nữa đúng không nào. Chúng tôi cung cấp hai loại máng thỏ. Trên đây là máng làm từ vật liệu tôn.Các bạn có thể tham khảo', 4),
(6, N'Móc Lồng Chim', N'Móc Lồng Chim.jpg', 75, N'Trong quá trình sử dụng có thể thay đổi nhiều loại móc cho lồng chim thì quả là một điều thú vị cho các bạn đam mê thú chơi chim đúng không nào . Hôm nay chúng ta mang đến một sản phẩm mới về móc lồng chim nhằm phục vụ thêm nhu cầu của các bạn', 4),
(7, N'VanInox Thỏ Nước', N'VanInox Thỏ Nước.jpg', 10, N'Nhằm mục đích để cho các bé thỏ có thể uống nước tiện lợi hơn thì chúng tôi còn bán thêm các loại van dành riêng cho các bé thỏ ', 4),
(8, N'Van Đồng Thỏ Nước', N'VanĐồng Thỏ Nước.jpg', 3, N'Nhằm mục đích để cho các bé thỏ có thể uống nước tiện lợi hơn thì chúng tôi còn bán thêm các loại van dành riêng cho các bé thỏ ', 4);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- khóa phụ
-- ràng buộc bảng chủng loài
Go
Alter table loai
ADD CONSTRAINT idchungloai_frkey FOREIGN KEY (idCL) REFERENCES chungloai (idCL)
--
-- ràng buộc bảng khách hàng
Go
ALTER TABLE khachhang
ADD CONSTRAINT IDUser_FRK FOREIGN KEY (IDUser) REFERENCES taikhoan (IDUser)
--
-- loại sản phẩm có 4 sản phẩm nên có 4 ràng buộc
-- ràng buộc bảng thú nuôi
Go
ALTER TABLE thunuoi
ADD CONSTRAINT idthu_frkey FOREIGN KEY (idLoaiSP) REFERENCES loaisanpham (idLoaiSP)
-- ràng buộc bảng thức ăn
Go
ALTER TABLE thucan
ADD CONSTRAINT idloaisp_thucan_frkey FOREIGN KEY (idLoaiSP) REFERENCES loaisanpham (idLoaiSP)
--ràng buộc bảng lồng thú
Go
ALTER TABLE longthu
ADD CONSTRAINT idloaisp_long_frkey FOREIGN KEY (idLoaiSP) REFERENCES loaisanpham (idLoaiSP)
-- ràng buộc bảng phụ kiện khác
Go
ALTER TABLE phukienkhac
ADD CONSTRAINT idloaisp_pkk_frkey FOREIGN KEY (idLoaiSP) REFERENCES loaisanpham (idLoaiSP)