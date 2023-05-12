/*	Học phần: Cơ sở dữ liệu
	Người thực hiện: Đậu Thị Tiểu Điệp
	MSSV: 2115196
	Lớp: CTK45B
	Ngày bắt đầu :23/02/2023
	Ngày kết thúc: 
*/
---------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU-------------
CREATE DATABASE Lab04_QLDB-- Lenh khai bao CSDL
go
use Lab04_QLDB
go

create table Bao_TChi
(MaBaoTC char(4) primary key,
Ten nvarchar(20) not null,
DinhKy nvarchar(20) not null,
SoLuong int not null,
GiaBan int not null
)
go

create table PhatHanh
(MaBaoTC char(4) references Bao_TChi(MaBaoTC),
SoBaoTC int not null,
NgayPH datetime
primary key(MaBaoTC,SoBaoTC)
)


create table KhachHang
(MaKH char(4) primary key,
TenKH nvarchar(5) not null,
DiaChi nvarchar(10) not null
)
go

create table DatBao
(MaKH char(4) references KhachHang(MaKH),
MaBaoTC char(4) references Bao_TChi(MaBaoTC),
SLMua int not null,
NgayDM datetime not  null
primary key(MaKH,MaBaoTC)
)


--NHAP DU LIEU CHO BANG
--Nhập dữ liệu cho bảng báo tạp chí
insert into Bao_TChi values('TT01',N'Tuổi trẻ',N'Nhật báo',1000,1500)
insert into Bao_TChi values('KT01',N'Kiến thức ngày nay',N'Bán nguyệt san',3000,6000)
insert into Bao_TChi values('TN01',N'Thanh niên',N'Nhật báo',1000,2000)
insert into Bao_TChi values('PN01',N'Phụ nữ',N'Tuần báo',2000,4000)
insert into Bao_TChi values('PN02',N'Phụ nữ',N'Nhật báo',1000,2000)
select *from Bao_TChi
insert into Bao_TChi values('PN03',N'Phụ nữf',N'Nhật báo',1000,2000)
insert into Bao_TChi values('HT03',N'Hoa học trò',N'Nhật báo',1000,2000)
set dateformat dmy
go

--Nhập bảng ngày phát hành
insert into PhatHanh values('TT01',123,'15/12/2005')
insert into PhatHanh values('KT01',70,'15/12/2005')
insert into PhatHanh values('TT01',124,'16/12/2005')
insert into PhatHanh values('TN01',256,'17/12/2005')
insert into PhatHanh values('PN01',45,'23/12/2005')
insert into PhatHanh values('PN02',111,'18/12/2005')
insert into PhatHanh values('PN02',112,'19/12/2005')
insert into PhatHanh values('TT01',125,'17/12/2005')
insert into PhatHanh values('PN01',46,'30/12/2005')
select * from PhatHanh

--Nhập bảng khách hàng
insert into KhachHang values('KH01',N'LAN',N'2 NCT')
insert into KhachHang values('KH02',N'NAM',N'32 THĐ')
insert into KhachHang values('KH03',N'NGỌC',N'16 LHP')
select *from KhachHang

set dateformat dmy
go
--Nhập bảng đặt báo
insert into DatBao values('KH01','TT01',100,'12/01/2000')
insert into DatBao values('KH02','TN01',150,'01/05/2001')
insert into DatBao values('KH01','PN01',200,'25/06/2001')
insert into DatBao values('KH03','KT01',50,'17/03/2002')
insert into DatBao values('KH03','PN02',200,'26/08/2003')
insert into DatBao values('KH02','TT01',250,'15/01/2004')
insert into DatBao values('KH01','KT01',300,'14/10/2004')
--Thêm vào để ktra
insert into DatBao values('KH01','PN02',200,'28/06/2001')
insert into DatBao values('KH01','PN03',200,'28/06/2001')
insert into DatBao values('KH02','KT01',200,'28/06/2001')
select *from DatBao
delete from DatBao

--1.Cho biết các tờ báo có định kì phát hành hàng tuần
select MaBaoTC, Ten, DinhKy,GiaBan
from Bao_TChi
where DinhKy=N'Tuần báo'
--2.Cho biết thông tin các tờ báo thuộc loại báo phụ nữ (mã báo tạp chí bắt đầu bằng VN)
select A.MaBaoTC, Ten, DinhKy, SoLuong,GiaBan,SoBaoTC,NgayPH,MaKH,SLMua,NgayDM
from Bao_TChi A, PhatHanh B,DatBao C
where A.MaBaoTC like 'PN%'and A.MaBaoTC=B.MaBaoTC and B.MaBaoTC=C.MaBaoTC
--3.Cho biết tên các khách hàng có đặt mua báo phụ nữ, không liệt kê khách hàng trùng
select C.MaKH,TenKH
from Bao_TChi A, DatBao B,KhachHang C
where A.MaBaoTC like 'PN%'and A.MaBaoTC=B.MaBaoTC and B.MaKH=C.MaKH
group by  C.MaKH,TenKH
--4.Cho biết tên các khách hàng có đặt mua báo có đặt mua tất cả các báo phụ nữ
select B.MaKH,B.TenKH,count(A.MaBaoTC)
from  KhachHang B,DatBao A
where A.MaBaoTC like 'PN%' and A.MaKH=B.MaKH
group by  B.MaKH,B.TenKH
having count(A.MaBaoTC) >= (select count(D.MaBaoTC)
								from Bao_TChi D
								where D.MaBaoTC like 'PN%')
--5.Cho biết các khách hàng không đặt mua báo thanh niên
select *
from KhachHang A
where A.MaKH not in (select B.MaKH
					from KhachHang B, DatBao C
					where B.MaKH=C.MaKH and C.MaBaoTC like 'TN%')
--6.Cho biết số tờ báo mà khách hàng đã mua
select A.MaKH,TenKH, count(MaBaoTC) as SoToBao
from KhachHang A,DatBao B
where A.MaKH=B.MaKH
group by A.MaKH, TenKH
--7.Cho biết số khách hàng đặt mua báo trong năm 2004
select count(A.MaKH)as SoKhachHang
from KhachHang A,DatBao B
where A.MaKH=B.MaKH and year(NgayDM)='2004'
--8.Cho biết thông tin đặt mua báo của các khách hàng (TenKH, Ten, DinhKy,SLMua, SoTien) , trong đó số SoTien=SLMua*DonGia
select TenKH, Ten, DinhKy,SLMua, GiaBan ,SLMua*GiaBan as SoTien
from Bao_TChi A, KhachHang B, DatBao C
where A.MaBaoTC=C.MaBaoTC and C.MaKH =B.MaKH
--9.Cho biết các tờ báo tạp chí (Ten, DinhKy) và tổng số lượng đặt mua của các khách hàng với tờ báo, tạp chí đó
select A.Ten, DinhKy, sum(SLMua) as TongSoLuongDM
from Bao_TChi A, DatBao C
where A.MaBaoTC=C.MaBaoTC 
group by A.Ten, DinhKy
--10.Cho biết tên các tờ báo dành cho học sinh sinh viên( mã báo tạp chí bắt đầu bằng HS)
select A.MaBaoTC, Ten,DinhKy
from Bao_TChi A
where A.MaBaoTC like 'HS%'
--11.Cho biết những tờ báo không có người đặt mua
select *
from Bao_TChi A
where A.MaBaoTC not in (select C.MaBaoTC
						from  DatBao C)
--12.Cho biết tên, định kỳ của những tờ báo có nhiều người đặt mua nhất
select A.MaBaoTC,A.Ten, DinhKy, count(B.MaKH) as SoKhachMua
from Bao_TChi A, DatBao B
where A.MaBaoTC=B.MaBaoTC 
group by A.MaBaoTC,A.Ten, DinhKy
having count(B.MaKH) >=all (select count(C.MaKH)
							from DatBao C
							group by C.MaBaoTC)

--13.Cho biết khách hàng đặt mua nhiều báo, tạp chí nhất
select A.MaKH,A.TenKH, count(B.MaBaoTC) as SoBaoDuocMua
from KhachHang A, DatBao B
where A.MaKH=B.MaKH 
group by A.MaKH,A.TenKH
having count(B.MaBaoTC) >=all (select count(C.MaBaoTC)
							from DatBao C
							group by C.MaKH)
--14.Cho biết các tờ báo phát hành định kỳ 1 tháng 2 lần
select A.MaBaoTC, Ten,DinhKy
from Bao_TChi A
where A.DinhKy like N'Bán nguyệt san'
--15.Cho biết các tờ báo tạp chí có từ 3 khách hàng đặt trở lên==VẪN CHẢ HIỂU
select B.MaBaoTC, Ten,count(A.MaKH)as SLKhachMua
from DatBao A,Bao_TChi B
where A.MaBaoTC=B.MaBaoTC 
group by B.MaBaoTC, Ten
having count(A.MaKH)>=3
--A.VIết các hàm sau
--a. Tính tổng số tiền mua báo/ tạp chí của một khách hàng cho trước
create function fn_TongTienBaoKhach5(@tenKhach nvarchar(30)) returns int
As
Begin
	declare @Tong int
	if exists (select * from KhachHang where TenKH = @tenKhach) ---Nếu tồn tại lớp @ten tsx của CSDL
		Begin
		--Tính tổng số công nhân của 1 tổ sản xuất
		select @Tong= SLMua * GiaBan
		from	Bao_TChi A ,DatBao B,KhachHang C
		where	C.TenKH=@tenKhach and C.MaKH=B.MaKH and  a.MaBaoTC=b.MaBaoTC
		End	
	 	
return @Tong
End
--Thử nghiệm
print dbo.fn_TongTienBaoKhach5(N'NGỌC')
--b. Tính tổng số tiền thu được của một tờ báo/ tạp chí cho trước
create function fn_TongTienBao1(@ten nvarchar(30)) returns int
As
Begin
	declare @Tong int
	if exists (select * from Bao_TChi where Ten = @ten) ---Nếu tồn tại lớp @ten tsx của CSDL
		Begin
		--Tính tổng số công nhân của 1 tổ sản xuất
		select @Tong= SLMua * GiaBan
		from	Bao_TChi A ,DatBao B
		where	A.Ten=@ten and a.MaBaoTC=b.MaBaoTC
		group by b.MaBaoTC,SLMua, GiaBan
		End	
	 	
return @Tong
End
--Thử nghiệm
print dbo.fn_TongTienBao1(N'Thanh niên')
--B. Viết các thủ tục sau
--a. In danh mục báo tạp chí phải giao cho một khách hàng cho trước
CREATE PROCEDURE usp_InDSBaoTC17
 @ten nvarchar(20)
AS
BEGIN

    SELECT A.MaBaoTC,A.Ten
	FROM KhachHang C,Bao_TChi A,DatBao B
    WHERE C.TenKH=@ten and A.MaBaoTC=B.MaBaoTC and B.MaKH=C.MaKH

END
exec dbo.usp_InDSBaoTC17 N'NGỌC'
--b. In danh sách khách hàng đặt mua báo/ tạp chí cho trước

CREATE PROCEDURE usp_InDSKhachDMB128
    @tenbao_tc nvarchar(20)
AS
BEGIN

    SELECT C.MaKH,C.TenKH
	FROM KhachHang C,Bao_TChi A,DatBao B
    WHERE A.Ten=@tenbao_tc and A.MaBaoTC=B.MaBaoTC and B.MaKH=C.MaKH

END
exec dbo.usp_InDSKhachDMB128 N'Phụ nữ'
