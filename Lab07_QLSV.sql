CREATE DATABASE Lab07_QLSV
go
use Lab07_QLSV
go

create table Khoa
(MSKhoa char(2) primary key,
TenKhoa nvarchar(30) not null,
TenTat char(4) not null)
go

create table Lop
(MSLop char(4) primary key,
TenLop char(30) not null,
MSKhoa char(2) references Khoa(MSKhoa),
NienKhoa char(4) not null,)
go

create table Tinh
(MSTinh char(2) primary key,
TenTinh nvarchar(20) not null,)
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
DienThoai char(10))
go

create table MonHoc
(MSMH char(4) primary key,
TenMH nvarchar(30) not null,
HeSo int not null) 
go

create table BangDiem
(MSSV char(7) references SinhVien(MSSV),
MSMH char(4) references MonHoc(MSMH),
LanThi int not null,
Diem float not null,
primary key(MSSV,MSMH,LanThi)
)
go

insert into Khoa values ('01',N'Công nghệ thông tin','CNTT')
insert into Khoa values ('02',N'Điện tử viễn thông','DTVT')
insert into Khoa values ('03',N'Quản trị kinh doanh','QTKD')
insert into Khoa values ('04',N'Công nghệ sinh học','CNSH')
select * from Khoa

insert into Lop values('98TH','Tin hoc khoa 1998','01','1998')
insert into Lop values('98VT','Vien thong khoa 1998','02','1998')
insert into Lop values('99TH','Tin hoc khoa 1999','01','1999')
insert into Lop values('99VT','Vien thong khoa 1999','02','1999')
insert into Lop values('99QT','Quan tri khoa 1999','03','1999')
select * from Lop

insert into Tinh values('01','An Giang')
insert into Tinh values('02','TP HCM')
insert into Tinh values('03','Dong Nai')
insert into Tinh values('04','Long An')
insert into Tinh values('05','Hue')
insert into Tinh values('06','Ca Mau')
select * from Tinh

set dateformat dmy
go


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
insert into SinhVien values('99TT009','Le My','Minh','20/05/76','04','05/10/99','99QT','No','12 Pham Ngoc Thach, Q.3',null)
select * from SinhVien

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
select * from MonHoc

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
select * from BangDiem

select* from KHOA
select* from LOP
select* from TINH
select* from MONHOC
select* from SinhVien
select* from BangDiem

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

--23) Thống kê số lượng sinh viên ở mỗi tỉnh theo mẫu 
create function fn_SoSinhVien(@MSTinh char(2),@Phai varchar(3)) returns int
as
	begin
	declare @SoSV int
	if exists (select * from Tinh where MSTinh = @MSTinh)
		begin
			select @SoSV = count(MSSV) 
			from SinhVien 
			where MSTinh = @MSTinh and Phai=@Phai
		end
		return @SoSV
	end



select a.MSTinh, a.TenTinh as N'Tên tỉnh',dbo.fn_SoSinhVien(a.MSTinh,'No') as N'Số SV Nữ',dbo.fn_SoSinhVien(a.MSTinh,'Yes') as N'Số SV Nam' ,count (b.MSSV) as N'Tổng cộng'
from Tinh a, SinhVien b
where a.MSTinh=b.MSTinh 
group by a.MSTinh, a.TenTinh

--24)Thống kê kết quả thi lần 1 môn "Cơ sở dữ liệu" ở các lớp
create function fn_SoSVKoDat (@MaLop char(4)) returns int
as
begin
	declare @SoSV int
	if exists (select *
				from Lop
				where MSLop = @MaLop)
	begin 
		select @SoSV = count(a.MSSV)
		from SinhVien a, BangDiem b, MonHoc c
		where MSLop = @MaLop and TenMH='Co So Du Lieu' and LanThi = 1 and Diem < 4 and a.MSSV = b.MSSV and b.MSMH = c.MSMH
	end
	return @SoSV
end

create function fn_SoSVDat (@MaLop char(4)) returns int
as
begin
	declare @SoSV int
	if exists (select *
				from Lop
				where MSLop = @MaLop)
	begin 
		select @SoSV = count(a.MSSV)
		from SinhVien a, BangDiem b, MonHoc c
		where MSLop = @MaLop and TenMH='Co So Du Lieu' and LanThi = 1 and Diem >= 4 and a.MSSV = b.MSSV and b.MSMH = c.MSMH
	end
	return @SoSV
end

select A.MSLop, TenLop, dbo.fn_SoSVDat (d.MSLop) as SoSVDat,
		(
		(dbo.fn_SoSVKoDat (d.MSLop)/
		(dbo.fn_SoSVDat (d.MSLop)+ dbo.fn_SoSVKoDat (d.MSLop))
		)
		)*100 as tyledat,
		dbo.fn_SoSVKoDat (d.MSLop) as SoSVKhongDat
from Lop A, MonHoc B, BangDiem C,SinhVien D
where TenMH='Co so du lieu' and B.MSMH=C.MSMH and LanThi = 1 and C.MSSV= D.MSSV and D.MSLop= A.MSLop 
group by A.MSLop, TenLop, D.MSLop

--25)Lọc ra điểm cao nhất trong các lần thi cho các sinh viên theo mẫu sau (điểm in ra của mỗi môn là điểm cao nhất trong các lần thi của môn đó)
select C.MSSV, B.MSMH,B.TenMH, B.HeSo, MAX(C.Diem) AS DiemCaoNhat,MAX(C.Diem)*B.HeSo as DiemHS
from BangDiem C
inner join MonHoc B on C.MSMH = B.MSMH
group by C.MSSV, B.MSMH,B.TenMH, B.HeSo;

--26)lập bảng thống kê theo mẫu sau 
select A.MSSV, Ho,Ten,(sum(Diem*HeSo)/sum(HeSo)) as ĐTB
from SinhVien A, BangDiem B,MonHoc C
where A.MSSV=B.MSSV and B.MSMH=C.MSMH
group by A.MSSV, Ho,Ten

--27) Thống kê số lượng sinh viên tỉnh Long Am đang theo học ở các khoa
select D.NienKhoa,B.MSKhoa ,TenKhoa,count(MSSV) as SoLuongSV
from Tinh A, Khoa B,SinhVien C,Lop D
where TenTinh=N'Long An' and A.MSTinh=C.MSTinh and C.MSLop=D.MSLop and D.MSKhoa=B.MSKhoa
group by    D.NienKhoa,B.MSKhoa ,TenKhoa

-- 28) nhập vòa mssv, in ra bảng điểm của sinh viên(điểm in ra lấy điểm cao nhất trong các lần thi)
create proc usp_XuatDiemSV
@MSSV char(7) 
as 
begin
	if not exists(select* from SinhVien where MSSV=@MSSV)
		print N'MSSV không tồn tại'

	else if  exists(select *from SinhVien where @MSSV = MSSV and MSSV not in(select MSSV from BangDiem))
		print N'MSSV không tam gia bất kỳ kỳ thi nào!!!'

	else
		begin
			select a.MSMH, b.TenMH as N'Tên MH', b.HeSo as N'Hệ số',Max(a.Diem) as N'Điểm' 
			from BangDiem a, MonHoc b
			where a.MSMH=b.MSMH and a.MSSV=@MSSV
			group by a.MSMH, b.TenMH, b.HeSo
		end
end

exec usp_XuatDiemSV '98TH001'
exec usp_XuatDiemSV '99TH004'
exec usp_XuatDiemSV '99TH005'
-- 29) Nhập vào mã số lớp, in ra bảng tổng kết của lớp đó
create function fn_XepLoai (@MSSV char(7)) returns nvarchar(10)
as
	begin
	declare @XepLoai nvarchar(10)
	if exists (select * from SinhVien where MSSV=@MSSV)
		begin		
		if exists (select *
			from BangDiem
			where MSSV =@MSSV 
			having AVG(Diem)<4)
			set @XepLoai = N'Kém'
		else if	exists (select *
			from BangDiem
			where MSSV =@MSSV 
			having AVG(Diem)<5 )
			set @XepLoai = N'Yếu'
		else if	exists (select *
			from BangDiem
			where MSSV =@MSSV 
			having AVG(Diem)<7 )
			set @XepLoai = N'Trung bình'
		else if	exists (select *
			from BangDiem
			where MSSV =@MSSV 
			having AVG(Diem)<8)
			set @XepLoai = N'Khá'
		else if	exists (select *
			from BangDiem
			where MSSV =@MSSV 
			having AVG(Diem)<9)
			set @XepLoai = N'Giỏi'
		else 
			set @XepLoai =N'Xuất sắc'
		end
		return @XepLoai
	end
		


create proc usp_BangTongKet
@MSLop char(4)
as
	if not exists(select* from Lop where MSLop=@MSLop)
		print N'Mã số lớp không tồn tại'
	else 
	begin 
		select a.MSSV, b.Ho as N'Họ', b.Ten as N'Tên', AVG(a.Diem) as N'ĐTB',dbo.fn_XepLoai(a.MSSV) as N'Xếp loại'
		from BangDiem a, SinhVien b
		where a.MSSV=b.MSSV and b.MSLop= @MSLop
		group by a.MSSV, b.Ho, b.Ten

	end

exec dbo.usp_BangTongKet '98TH'
exec dbo.usp_BangTongKet '99TH'
exec dbo.usp_BangTongKet '98VT'
exec dbo.usp_BangTongKet '99QT'
