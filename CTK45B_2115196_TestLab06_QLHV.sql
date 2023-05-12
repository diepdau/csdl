/*	Học phần: Cơ sở dữ liệu
	Người thực hiện: Đậu Thị Tiểu Điệp
	MSSV: 2115196
	Lớp: CTK45B
	Ngày bắt đầu :23/02/2023
	Ngày kết thúc: 
*/
---------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU-------------
CREATE DATABASE TestLab06_QLHV-- Lenh khai bao CSDL
go
use TestLab06_QLHV
go



create table GiaoVien
(MSGV char(4) primary key,
HoGV nvarchar(20) not null,
TenGV nvarchar(10) not null,
DienThoai char(6) not null,
)
go
 
create table CaHoc
(Ca int primary key,
GioBatDau datetime not null,
GioKetThuc datetime not null,
)
go

create table Lop
(MaLop char(4) primary key,
TenLop char(20) not null,
NgayKG datetime not null,
HocPhi bigint not null,
Ca int references CaHoc(Ca),
SoTiet int not null,
SoHocVien int not null,
MSGV char(4) references GiaoVien(MSGV)
)
go

create table HocVien
(MSHV char(6) primary key,
Ho nvarchar(20) not null,
Ten nvarchar(10) not null,
NgaySinh datetime not null,
Phai nvarchar(4) not null,
MaLop char(4) references Lop(MaLop),
)
go

create table HocPhi
(SoBL char(4) primary key,
MSHV char(6) references HocVien(MSHV),
NgayThu datetime not null,
SoTien bigint not null,
NoiDung char(30) not null,
NguoiThu nvarchar(4) not null,
)
go

--NHẬP DỮ LIỆU CHO BẢNG
--nhập dữ liệu cho bảng Giáo Viên
insert into GiaoVien values('G001',N'Lê Hoàng',N'Anh','858936')
insert into GiaoVien values('G002',N'Nguyễn Ngọc',N'Lan','858936')
insert into GiaoVien values('G003',N'Trần Minh',N'Hùng','858936')
insert into GiaoVien values('G004',N'Võ Thanh',N'Trung','858936')
select *from GiaoVien

set dateformat dmy
go

--Nhập dữ liệu cho bảng Ca Học
insert into CaHoc values(1,'7:30','10:45')
insert into CaHoc values(2,'13:30','16:45')
insert into CaHoc values(3,'17:30','20:45')
select *from CaHoc

set dateformat dmy
go

--Nhập dữ liệu cho bảng Lớp
insert into Lop values('E114','Excel 3-5-7','02/01/2008',120000,1,45,3,'G003')
insert into Lop values('E115','Excel 2-4-6','22/01/2008',120000,3,45,0,'G001')
insert into Lop values('W123','Word 2-4-6','18/02/2008',100000,3,30,1,'G001')
insert into Lop values('W124','Word 3-5-7','01/03/2008',100000,1,30,0,'G002')
insert into Lop values('A075','Access 2-4-6','18/12/2008',150000,3,60,3,'G003')
select *from Lop

set dateformat dmy
go

----Nhập dữ liệu cho bảng Học Viên
insert into HocVien values('A07501',N'Lê Văn',N'Minh','10/06/1998',N'Nam','A075')
insert into HocVien values('A07502',N'Nguyễn Thị',N'Mai','20/04/1998',N'Nữ','A075')
insert into HocVien values('A07503',N'Lê Ngọc',N'Tuấn','10/06/1994',N'Nam','A075')
insert into HocVien values('E11401',N'Vương Tuấn',N'Vũ','25/03/1999',N'Nam','E114')
insert into HocVien values('E11402',N'Lý Ngọc',N'Hân','01/12/1995',N'Nữ','E114')
insert into HocVien values('E11403',N'Trần Mai',N'Linh','04/06/1990',N'Nữ','E114')
insert into HocVien values('W12301',N'Nguyễn Ngọc',N'Tuyết','12/05/1996',N'Nữ','W123')
select *from HocVien

set dateformat dmy
go

--Nhập bảng học phí
insert into HocPhi values('0001','E11401','02/01/2008',120000,'HP Excel 3-5-7',N'Vân')
insert into HocPhi values('0002','E11402','02/01/2008',120000,'HP Excel 3-5-7',N'Vân')
insert into HocPhi values('0003','E11403','02/01/2008',80000,'HP Excel 3-5-7',N'Vân')
insert into HocPhi values('0004','W12301','18/02/2008',100000,'HP Word 2-4-6',N'Lan')
insert into HocPhi values('0005','A07501','16/12/2008',150000,'HP Access 2-4-6',N'Lan')
insert into HocPhi values('0006','A07502','16/12/2008',100000,'HP Access 2-4-6',N'Lan')
insert into HocPhi values('0007','A07503','18/12/2008',150000,'HP Access 2-4-6',N'Vân')
insert into HocPhi values('0008','A07502','15/01/2009',50000,'HP Access 2-4-6',N'Vân')
select *from HocPhi