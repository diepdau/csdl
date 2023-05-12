/*	Học phần: Cơ sở dữ liệu
	Người thực hiện: Đậu Thị Tiểu Điệp
	MSSV: 2115196
	Lớp: CTK45B
	Ngày bắt đầu :23/02/2023
	Ngày kết thúc: 
*/
---------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU-------------
CREATE DATABASE TestLab02_QLSX-- Lenh khai bao CSDL
go
use TestLab02_QLSX
go
--lenh thao tac cac bang theo thu tu da xac dinh
create table ToSanXuat
(MaTSX char(4) primary key,
TenTSX nvarchar(30) not null unique
)
go 
create table CongNhan
(MACN char(5) primary key,
Ho nvarchar(20)not null,
Ten nvarchar(20) not null,
Phai nvarchar(5) not null,
NgaySinh datetime,
MaTSX char(4) references ToSanXuat (MaTSX)
)
go 

create table SanPham
(MASP char(5) primary key,
TenSP nvarchar(20)not null,
DVT nvarchar(5) not null,
TienCong int not null
)
go 


create table ThanhPham
(
MACN char(5) references CongNhan(MACN),
MASP char(5) references SanPham(MASP),
Ngay Datetime not null,
SoLuong int,
primary key(MACN,MASP,Ngay)
)
---------NHAP DU LIEU CO BANG------------
--Nhap duw lieu cho Bang To San Xuat
insert into ToSanXuat values ('TS01',N'Tổ 1')
insert into ToSanXuat values ('TS02',N'Tổ 2')
--Xem bảng tổ sản xuất
select * from ToSanXuat

set dateformat dmy --định dạng nhập dữ liệu ngày tháng theo kiểu ngày tháng năm
go
--Nhap bang CongNhan
insert into CongNhan values ('CN001',N'Nguyễn Trường',N'An',N'Nam','12/05/1981','TS01')
insert into CongNhan values ('CN002',N'Lê Thị Hồng',N'Giấm',N'Nữ','04/06/1980','TS01')
insert into CongNhan values ('CN003',N'Nguyễn Công',N'Thành',N'Nam','04/05/1981','TS02')
insert into CongNhan values ('CN004',N'Võ Hữu',N'Hạnh',N'Nam','15/02/1980','TS02')
insert into CongNhan values ('CN005',N'Lý Thanh',N'Hân',N'Nữ','03/12/1981','TS01')
select * from CongNhan
--Nhap bang san pham
insert into SanPham values ('SP001',N'Nồi đất',N'cái',10000)
insert into SanPham values ('SP002',N'Chén',N'cái',2000)
insert into SanPham values ('SP003',N'Bình gốm nhỏ',N'cái',20000)
insert into SanPham values ('SP004',N'Bình gốm lớn',N'cái',25000)
select * from SanPham


set dateformat dmy --định dạng nhập dữ liệu ngày tháng theo kiểu ngày tháng năm
go
insert into ThanhPham values ('CN001','SP001','01/02/2007',10)
insert into ThanhPham values ('CN002','SP001','01/02/2007',5)
insert into ThanhPham values ('CN003','SP002','10/01/2007',50)
insert into ThanhPham values ('CN004','SP003','12/01/2007',10)
insert into ThanhPham values ('CN005','SP002','12/01/2007',100)
insert into ThanhPham values ('CN002','SP004','13/02/2007',10)
insert into ThanhPham values ('CN001','SP003','14/02/2007',15)
insert into ThanhPham values ('CN003','SP001','15/01/2007',20)
insert into ThanhPham values ('CN003','SP004','14/02/2007',15)
insert into ThanhPham values ('CN004','SP002','30/01/2007',100)
insert into ThanhPham values ('CN005','SP003','01/02/2007',50)
insert into ThanhPham values ('CN001','SP001','20/02/2007',30)
select * from ThanhPham
delete from ThanhPham
--xem tất cả các quan hệ trong CSDL
select * from ToSanXuat
select * from CongNhan
select * from SanPham
select * from ThanhPham
--Liệt kê các công nhân theo tổ sản xuất
select TenTSX,B.Ho+' '+B.Ten as HoTen,NgaySinh,Phai
from ToSanXuat A, CongNhan B
where A.MaTSX=B.MaTSX
order by TenTSX, Ten
--Liệt kê các Thành Phẩm mà công nhân 'Nguyễn Trường An' đã làm được 
select TenSP, Ngay, SoLuong,SoLuong* TienCong as ThanhTien
from SanPham A, ThanhPham B,CongNhan C
where A.MASP = B.MASP and B.MACN=C.MACN and Ho+' '+Ten=N'Nguyễn Trường An'
order by Ngay
--Thống kê số lượng công nhân theo từng tổ sản xuất
select A.MaTSX, TenTSX, count(MACN) as SoLuongCN
from ToSanXuat A, CongNhan B
where A.MaTSX=B.MaTSX 
group by A.MaTSX, TenTSX
--Tông số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được
select Ho,Ten, TenSP, sum(B.TienCong*C.SoLuong) as TongThanhTien,sum(C.SoLuong)as TongSLThanhPham
from CongNhan A, SanPham B, ThanhPham C
where A.MACN=C.MACN and C.MASP=B.MASP
group by Ho,Ten, TenSP



--Tổng số tiền công đã trả cho công nhân trong tháng 1/2007
select  sum(TienCong * SoLuong) as TongSoLuongThanhPham
from SanPham A , ThanhPham B, CongNhan C
where A.MASP=B.MASP and B.MACN=C.MACN and month(Ngay)='01'and year(Ngay)='2007'
--Tiền công của nhân viên có mã CN002
select  sum(SoLuong* TienCong)as TienCongNV
from CongNhan C,SanPham A, ThanhPham B
where A.MASP = B.MASP and B.MACN=C.MACN and month(Ngay)='02'and year(Ngay)='2006'and  C.MACN='CN002'
--Liệt kê các công nhân có sản xuất từ 3 loại trở lên
Select	Ho,Ten, COUNT(C.MASP) As SoSanXuat
From	ThanhPham C,SanPham B,CongNhan A
Where	B.MASP = C.MASP and C.MACN=A.MACN
Group by	Ho,Ten
having  COUNT(C.MASP)>=3
--Cập nhật giá tiền công các loại bình gốm thêm 1000
update SanPham
set TienCong=TienCong+1000
where TenSP like N'%Bình gốm%'

--Thêm bộ <'CN006','Lê Thị','Lan','Nữ','TS02'>vào bảng công nhân
insert into CongNhan
values('CN006',N'Lê Thị',N'Lan',N'Nữ',null,'TS02')

--A.Viết các hàm sau
--a. Tính tổng số công nhân của một tổ sản xuất cho trước
create function fn_TongCongNhan_ToSX(@ten nvarchar(30)) returns int
As
Begin
	declare @TongCN int
	if exists (select * from ToSanXuat where TenTSX = @ten) ---Nếu tồn tại lớp @ten tsx của CSDL
		Begin
		--Tính tổng số công nhân của 1 tổ sản xuất
		select @TongCN = count(MACN)
		from	CongNhan A, ToSanXuat B	
		where	A.MaTSX = B.MaTSX and B.TenTSX = @ten
		group by B.MaTSX
		End	
	 	
return @TongCN
End
--Thử nghiệm
print dbo.fn_TongCongNhan_ToSX(N'Tổ 1')

--b. Tính tổng số sản lượng sản xuất trong một tháng của một loại sản phẩm cho trước
create function fn_TongSLSX_1Thang_SP(@ten nvarchar(30),@month int) returns int
As
Begin
	declare @TongSL int
	if exists (select * from SanPham where TenSP = @ten) ---Nếu tồn tại lớp @ten tsx của CSDL
		Begin
		--Tính tổng số công nhân của 1 tổ sản xuất
			select @TongSL = sum(SoLuong)
			from	SanPham A, ThanhPham B	
			where	A.MASP = B.MASP and A.TenSP = @ten and month(Ngay)=@month
		End	
	 	
return @TongSL
End

--Thử nghiệm
print dbo.fn_TongSLSX_1Thang_SP(N'Nồi đất',01)
--c. Tính tổng tiền công tháng của một công nhân cho trước
select  sum(SoLuong* TienCong)as TienCongNV
from CongNhan C,SanPham A, ThanhPham B
where A.MASP = B.MASP and B.MACN=C.MACN and month(Ngay)='02'and year(Ngay)='2007'and  C.MACN='CN002'

create function fn_TongTienCong(@macn char(20),@month int) returns int
As
Begin
	declare @TongTien int
	if exists (select * from CongNhan where MACN = @macn) ---Nếu tồn tại lớp @ten tsx của CSDL
		Begin
		--Tính tổng số tiền công nhân của 1 nhanvien
			select @TongTien = sum(SoLuong* TienCong)
			from	CongNhan C,SanPham A, ThanhPham B
			where A.MASP = B.MASP and B.MACN=C.MACN and C.MACN= @macn and month(Ngay)=@month
		End	
	 	
return @TongTien
End
--Thử nghiệm
print dbo.fn_TongTienCong('CN002',02)
--d. Tính tổng thu nhập trong một năm của một tổ sản xuất cho trước===CHƯA ĐÚNG 1075
create function fn_TongThuNhap_Nam_TSX(@tento nvarchar(30),@year int) returns int
As
Begin
	declare @TongTN int
	if exists (select * from ToSanXuat where TenTSX = @tento) 
		Begin
			select @TongTN = sum(SoLuong* TienCong)
			from	CongNhan A,SanPham b, ToSanXuat C,ThanhPham D	
			where	 C.TenTSX = @tento and C.MaTSX=A.MaTSX and A.MACN=D.MACN and year(Ngay)=@year
		End	
	 	
return @TongTN
End

--Thử nghiệm	
print dbo.fn_TongThuNhap_Nam_TSX(N'Tổ 2',2007)
--e. Tính tổng sản lượng sản sản xuất của một loại sản phẩm trong một khoảng thời gian cho trước
create function fn_TongSLSX_TheoTG(@ten nvarchar(30),@ngaythang Datetime) returns int
As
Begin
	declare @TongSL int
	if exists (select * from SanPham where TenSP = @ten) ---Nếu tồn tại lớp @ten tsx của CSDL
		Begin
		--Tính tổng số công nhân của 1 tổ sản xuất
			select @TongSL = sum(SoLuong)
			from	SanPham A, ThanhPham B	
			where	A.MASP = B.MASP and A.TenSP = @ten and month(Ngay)=month(@ngaythang) and year(Ngay)=year(@ngaythang)and day(Ngay)=day(@ngaythang)
		End	
	 	
return @TongSL
End

--Thử nghiệm
set dateformat dmy
go

print dbo.fn_TongSLSX_TheoTG(N'Nồi đất','01/02/2007')
--B.Viết các thủ tục sau
--a. In danh sách các công nhân của một tổ sản xuất cho trước
CREATE PROCEDURE usp_InDSCN
    @MaTo char(10)
AS
BEGIN

    SELECT * FROM CongNhan 
    WHERE MaTSX = @MaTo

END

exec usp_InDSCN 'TS01'
exec usp_InDSCN 'TS02'

--b. In bảng chấm công sản xuất trong tháng của một công nhân cho trước (bao gồm Tên sản phẩm, đơn vị tính, số lượng sản xuất trong tháng , đơn giá, giá tiền)

CREATE PROCEDURE usp_InBangChamCong11
    @ma char(10)
AS
BEGIN

    SELECT TenSP,DVT,dbo.fn_TongSLSX_1Thang_SP(A.TenSP,01) as TongSL,TienCong as DonGia,TienCong*SoLuong as ThanhTien
	 FROM SanPham A,ThanhPham B
    WHERE B.MACN=@ma and A.MASP=B.MASP 

END
exec usp_InBangChamCong11 'CN005'