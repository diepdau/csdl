/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Đậu Thị Tiểu Điệp
   MSSV: 2115196
   Lớp: CTK45B
   Ngày bắt đầu: 23/02/2023
   Ngày kết thúc: ?????
*/	
----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
CREATE DATABASE Test2Lab07_QLSV -- lenh khai bao CSDL
go
use Test2Lab07_QLSV
go

create table Khoa
(MSKhoa char(2) primary key,
TenKhoa nvarchar(30) not null,
TenTat char(4) not null
)
go

create table Lop
(MSLop char(4) primary key,
TenLop char(30) not null,
MSKhoa char(2) references Khoa(MSKhoa),
NienKhoa char(4) not null,
)
go

create table Tinh
(MSTinh char(2) primary key,
TenTinh nvarchar(20) not null,
)
go
create table SinhVien
(MSSV char(7) primary key,
Ho nvarchar(20) not null,
Ten nvarchar(20) not null,
NgaySinh datetime not null,
MSTinh char(2) references Tinh(MSTinh),
NgayNhapHoc datetime not null,
MSLop char(4) references Lop(MSLop),
Phai char(4) not null,
DiaChi char(40) not null,
DienThoai char(10)
)
go



create table MonHoc
(MSMH char(4) primary key,
TenMH nvarchar(30) not null,
HeSo int not null
) 
go
create table BangDiem
(MSSV char(7) references SinhVien(MSSV),
MSMH char(4) references MonHoc(MSMH),
LanThi int not null,--CHỖ NÀY CẦN NOT NULL KO?
Diem float not null,
primary key(MSSV,MSMH,LanThi)
)


--NHAP DU LIEU CHO CAC BANG
--nhap dwu lieu bang Khoa
insert into Khoa values ('01',N'Công nghệ thông tin','CNTT')
insert into Khoa values ('02',N'Điện tử viễn thông','DTVT')
insert into Khoa values ('03',N'Quản trị kinh doanh','QTKD')
insert into Khoa values ('04',N'Công nghệ sinh học','CNSH')
select *from Khoa

--Nhap du lieu Lop
insert into Lop values('98TH','Tin hoc khoa 1998','01','1998')
insert into Lop values('98VT','Vien thong khoa 1998','02','1998')
insert into Lop values('99TH','Tin hoc khoa 1999','01','1999')
insert into Lop values('99VT','Vien thong khoa 1999','02','1999')
insert into Lop values('99QT','Quan tri khoa 1999','03','1999')
select *from Lop

--Nhap du lieu Tinh
insert into Tinh values('01','An Giang')
insert into Tinh values('02','TP HCM')
insert into Tinh values('03','Dong Nai')
insert into Tinh values('04','Long An')
insert into Tinh values('05','Hue')
insert into Tinh values('06','Ca Mau')
select *from Tinh

set dateformat dmy
go

--nhap du lieu Sinh Vien
insert into SinhVien values('98TH001','Nguyen Van','An','06/08/80','01','03/09/98','98TH','Yes','12 Tran Hung Dao, Q.1','8234512')
insert into SinhVien values('98TH002','Le Thi','An','17/10/79','01','03/09/98','98TH','No','23 CMT8, Q.Tan Binh','0303234342')
insert into SinhVien values('98VT001','Nguyen Duc','Binh','25/11/81','02','03/09/98','98VT','Yes','245 Lac Long Quan, Q.11','8654323')
insert into SinhVien values('98VT002','Tran Ngoc','Anh','19/08/80','02','03/09/98','98VT','No','242 Tran Hung Dao, Q.1',null)
insert into SinhVien values('99TH001','Ly Van Hung','Dung','27/09/81','03','05/10/99','99TH','Yes','178 CMT8, Q.Tan Binh','7563213')
insert into SinhVien values('99TH002','Van Minh','Hoang','01/01/81','04','05/10/99','99TH','Yes','272 Ly Thuong Kiet, Q.10','8341234')
insert into SinhVien values('99TH003','Nguyen','Tuan','12/01/80','03','05/10/99','99TH','Yes','162 Tran Hung Dao, Q.5',null)
insert into SinhVien values('99TH004','Tran Van','Minh','25/06/81','04','05/10/99','99TH','Yes','147 Dien Bien Phu, Q.3','7236754')
insert into SinhVien values('99TH005','Nguyen Thai','Minh','01/01/80','04','05/10/99','99TH','Yes','345 Le Dai Hanh, Q.11',null)
insert into SinhVien values('99VT001','Le Ngoc','Mai','21/06/82','01','05/10/99','99VT','No','129 Tran Hung Dao, Q.1','0903124534')
insert into SinhVien values('99QT001','Nguyen Thi','Oanh','17/08/73','04','05/10/99','99QT','No','76 Hung Vuong, Q5','0901656324')
insert into SinhVien values('99QT002','Le My','Hanh','20/05/76','04','05/10/99','99QT','No','12 Pham Ngoc Thach, Q.3',null)
--THÊM KTRA
insert into SinhVien values('99TT009','Le My','Minh','20/05/76','04','05/10/99','99QT','No','12 Pham Ngoc Thach, Q.3',null)
select *from SinhVien
delete from SinhVien

--Nhap du lieu bang mon hoc
insert into MonHoc values('TA01','Nhap mon tin hoc',2)
insert into MonHoc values('TA02','Lap trinh co ban',3)
insert into MonHoc values('TB01','Cau truc du lieu',2)
insert into MonHoc values('TB02','Co so du lieu',2)
insert into MonHoc values('QA01','Kinh te vi mo',2)
insert into MonHoc values('QA02','Quan tri chat luong',3)
insert into MonHoc values('VA01','Dien tu co ban',2)
insert into MonHoc values('VA02','Mach so',3)
insert into MonHoc values('VB01','Truyen so lieu',3)
insert into MonHoc values('XA01','Vat ly dai cuong',2)
select *from MonHoc
delete from MonHoc

--nhap du lieu bang diem
insert into BangDiem values('98TH001','TA01',1,8.5)
insert into BangDiem values('98TH001','TA02',1,8)
insert into BangDiem values('98TH002','TA01',1,4)
insert into BangDiem values('98TH002','TA01',2,5.5)
insert into BangDiem values('98TH001','TB01',1,7.5)
insert into BangDiem values('98TH002','TB01',1,8)
insert into BangDiem values('98VT001','VA01',1,4)
insert into BangDiem values('98VT001','VA01',2,5)
insert into BangDiem values('98VT002','VA02',1,7.5)
insert into BangDiem values('99TH001','TA01',1,4)
insert into BangDiem values('99TH001','TA01',2,6)
insert into BangDiem values('99TH001','TB01',1,6.5)
insert into BangDiem values('99TH002','TB01',1,10)
insert into BangDiem values('99TH002','TB02',1,9)
insert into BangDiem values('99TH003','TA02',1,7.5)
insert into BangDiem values('99TH003','TB01',1,3)
insert into BangDiem values('99TH003','TB01',2,6)
insert into BangDiem values('99TH003','TB02',1,8)
insert into BangDiem values('99TH004','TB02',1,2)
insert into BangDiem values('99TH004','TB02',2,4)
insert into BangDiem values('99TH004','TB02',3,3)
insert into BangDiem values('99QT001','QA01',1,7)
insert into BangDiem values('99QT001','QA02',1,6.5)
insert into BangDiem values('99QT002','QA01',1,8.5)
insert into BangDiem values('99QT002','QA02',1,9)
select *from BangDiem
delete from BangDiem
--1) Liệt kê MSSV, Họ, Tên, Địa chỉ của tất cả các sinh viên
select A.MSSV, Ho, Ten, DiaChi
from SinhVien A
--2) Liệt kê MSSV, Họ, Tên, MS Tỉnh của tất cả các sinh viên. Sắp xếp kết quả theo MS tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên.
select A.MSSV, Ho, Ten, MSTinh
from SinhVien A
order by MSTinh,Ho,Ten
--3) Liệt kê các sinh viên nữ của tỉnh Long An
select A.MSSV, Ho,Ten
from SinhVien A, Tinh B
where A.MSTinh=B.MSTinh and Phai='No' and TenTinh=N'Long An'
--4) Liệt kê các sinh viên có sinh nhật trong tháng Giêng
select A.MSSV, Ho,Ten
from SinhVien A
where month(NgaySinh)=1
--5)Liệt kê các sinh viên có sinh nhật nhằm ngày 1/1
select A.MSSV, Ho,Ten
from SinhVien A
where day(NgaySinh)=1 and month(NgaySinh)=1
--6)Liệt kê các sinh viên có số điện thoại
select MSSV, Ho,Ten
from SinhVien
where DienThoai like '%'
--7)Liệt kê các sinh viên có số diện thoại di động 
select MSSV, Ho,Ten
from SinhVien
where DienThoai like '0%'
--8)Liệt kê các sinh viên tên 'Minh' học lớp '99TH'
select MSSV, Ho,Ten
from SinhVien
where Ten='Minh' and MSSV like'99TH%'
--9) Liệt kê các sinh viên có địa chỉ ở đường 'Tran Hung dao'
select MSSV, Ho,Ten
from SinhVien
where DiaChi like'%Tran Hung Dao%'
--10) Liệt kê các sinh viên có tên lót 'Van' (không liệt kê người họ 'Van')
select MSSV, Ho,Ten
from SinhVien
where Ho like'%_Van%'
--11) Liệt kê MSSV, Ho Ten (ghép họ tên thành 1 cột), Tuổi của các thành viên ở Tỉnh 'Long An'
select A.MSSV, Ho+' '+Ten as HoTen,year(getdate())-year(NgaySinh) as Tuoi
from SinhVien A, Tinh B
where A.MSTinh=B.MSTinh  and TenTinh=N'Long An'
--12)Liệt kê các sinh viên 'Nam' từ 23 đến 28 tuổi (lấy ngày tháng bắt đâu từ khi nào?)
select MSSV, Ho+' '+Ten
from SinhVien
where Phai ='Yes' and 23 <year(getdate())-year(NgaySinh) and year(getdate())-year(NgaySinh)<28
--13)Liệt kê các sinh viên nam từ 32 tuổi trở lên và các sinh viên nữ từ 27 tuổi trở lên
select MSSV, Ho,Ten
from SinhVien
where (Phai ='Yes' and 32> year(getdate())-year(NgaySinh))and (Phai ='No' and year(getdate())-year(NgaySinh)>27)
--14)Liệt kê các sinh viên khi nhập học còn dưới 18 tuổi, hoặc đã trên 25 tuổi
select MSSV, Ho+' '+ Ten
from SinhVien
where (25> year(getdate())-year(NgaySinh))and (year(getdate())-year(NgaySinh)>18)
--15)Liệt kê danh sách các sinh viên của khóa 99 (MSSV có hai kí tự đầu là '99' 
select MSSV, Ho,Ten
from SinhVien
where MSSV like '99%'
--16)Liệt kê MSSV, Điểm thi lần 1 môn 'Co so du lieu' của lớp '99TH'
select MSSV,Diem
from BangDiem A, MonHoc B
where TenMH='Co so du lieu' and A.MSMH=B.MSMH and A.MSSV like '99TH%' and LanThi = 1
--17) Liệt kê MSSV, Ho ten của các sinh viên '99TH' thi không đạt lần 1 môn 'Co so du lieu'
select MSSV,Diem
from BangDiem A, MonHoc B
where TenMH='Co so du lieu' and A.MSMH=B.MSMH and A.MSSV like '99TH%' and LanThi = 1 and Diem<4
--18) Liệt kê tất cả các điểm thi của sinh viên có mã số '99TH001' theo mẫu sau
select A.MSMH, TenMH,LanThi, Diem
from BangDiem A,MonHoc B
where MSSV = '99TH001' and A.MSMH=B.MSMH
--19)Liệt kê MSSV, họ tên, MSLop, của các sinh viên có điểm thi lần 1 môn 'Co so du lieu' tu 8 điểm trở lên
select A.MSSV, Ho +''+ten ,MSLop
from SinhVien A,BangDiem B, MonHoc C
where B.Diem>8 and B.LanThi=1 and TenMH='Co so du lieu' and C.MSMH=B.MSMH and B.MSSV=A.MSSV
--20)Liệt kê các tỉnh không có sinh viên nào theo học
select *
from Tinh 
where Tinh.MSTinh not in (select A.MSTinh
						  from SinhVien A)
--21)Liệt kê các sinh viên hiện chưa có điểm thi môn nào là tìm sinh viên đã có điểm thi 
select A.MSSV, ho, Ten
from SinhVien A 
where A.MSSV not in (select B.MSSV
					from BangDiem B)

--Truy vấn gom nhóm
--22)Thống kê lượng sinh viên ở mỗi lớp theo mẫu sau:MSLop, TenLop,SoLuongSVC
select B.MSLop, TenLop, count(MSSV) as SoLuongSV
from Lop A, SinhVien B
where A.MSLop=B.MSLop
group by B.MSLop, TenLop
--23) Thống kê số lượng sinh viên ở mỗi tỉnh theo mẫu =========================  CHƯA LÀM ĐƯỢC
select A.MSTinh,TenTinh,count(Phai)as SVNam, count(MSSV) as TongCong
from Tinh A, SinhVien B
where A.MSTinh= B.MSTinh
group by A.MSTinh,TenTinh
--24)Thống kê kết quả thi lần 1 môn "Cơ sở dữ liệu" ở các lớp
select A.MSLop, TenLop, count(C.MSSV) as SoSVDat
from Lop A, MonHoc B, BangDiem C,SinhVien D
where TenMH='Co so du lieu' and B.MSMH=C.MSMH and LanThi =1 and Diem > 4 and C.MSSV= D.MSSV and D.MSLop= A.MSLop 
group by A.MSLop, TenLop

--25)Lọc ra điểm cao nhất trong các lần thi cho các sinh viên theo mẫu sau (điểm in ra của mỗi môn là điểm cao nhất trong các lần thi của môn đó)
select C.MSSV, C.MSMH,TenMH, HeSo, Diem, Diem*HeSo
from MonHoc B,BangDiem C
where B.MSMH=C.MSMH and Diem in (select max(Diem)
									from BangDiem
									group by MSSV, MSMH)
group by C.MSSV, C.MSMH,TenMH, HeSo,Diem
 ------------------------------------------HỎI CHẤM ĐÁNG GHÉT


--26)lập bảng thống kê theo mẫu sau 
select A.MSSV, Ho,Ten,(sum(Diem*HeSo)/sum(HeSo)) as ĐTB
from SinhVien A, BangDiem B,MonHoc C
where A.MSSV=B.MSSV and B.MSMH=C.MSMH
group by A.MSSV, Ho,Ten

--27) Thống kê số lượng sinh viên tỉnh Long Am đang theo học ở các khoa================CON THAC AMC NIEN KHOA NAM HOC
select D.NienKhoa,B.MSKhoa ,TenKhoa,count(MSSV) as SoLuongSV
from Tinh A, Khoa B,SinhVien C,Lop D
where TenTinh=N'Long An' and A.MSTinh=C.MSTinh and C.MSLop=D.MSLop and D.MSKhoa=B.MSKhoa
group by    D.NienKhoa,B.MSKhoa ,TenKhoa
