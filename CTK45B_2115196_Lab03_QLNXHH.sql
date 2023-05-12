
/*	Học phần: Cơ sở dữ liệu
	Người thực hiện: Đậu Thị Tiểu Điệp
	MSSV: 2115196
	Lớp: CTK45B
	Ngày bắt đầu :23/02/2023
	Ngày kết thúc: 
*/
---------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU-------------
CREATE DATABASE Lab03__QLNXHH-- Lenh khai bao CSDL
go
use Lab03__QLNXHH
go
--lenh thao tac da xac dinh
create table HangHoa
(MAHH char(5) primary key,
TENHH char(40) not null,
DVT nvarchar(5) not null,
SOLUONGTON int not null
)
go

create table DoiTac
(MADT char(5) primary key,
TENDT nvarchar(30) not null,
DIACHI nvarchar(40) not null,
DIENTHOAI char(10) not null
)
go

create table KhaNangCC
(MADT char(5) references DOITAC(MADT),
MAHH char(5) references HANGHOA(MAHH),
primary key(MADT,MAHH)
)

create table HoaDon
(SOHD char(5) primary key,
NGAYLAPHOADON datetime not null,
MADT char(5) not null,
TONGTG int 
)
go
create table CT_HoaDon
(SOHD char(5) references HoaDon(SOHD),
MAHH char(5) references HangHoa(MAHH),
DONGIA INT not null,
SOLUONG int not null
primary key(SOHD,MAHH)
)
go

--------------------NHAP DU LIEU CHO CAC BANG----------------
--Nhap du lieu cho bang Hang Hoa
insert into HangHoa values ('CPU01',N'CPU INTEL,CELERON 600 BOX',N'CÁI',5)
insert into HangHoa values ('CPU02',N'CPU INTEL,PIII 700',N'CÁI',10)
insert into HangHoa values ('CPU03',N'CPU AMP K7 ATHL,ON 600',N'CÁI',8)
insert into HangHoa values ('HDD01',N'HDD 10.2 GB QUANTUM',N'CÁI',10)
insert into HangHoa values ('HDD02',N'HDD 13.6 GB SEAGATE',N'CÁI',15)
insert into HangHoa values ('HDD03',N'HDD 20 GB QUANTUM',N'CÁI',6)
insert into HangHoa values ('KB01',N'KB GENIUS',N'CÁI',12)
insert into HangHoa values ('KB02',N'KB MITSUMIMI',N'CÁI',5)
insert into HangHoa values ('MB01',N'GIGABYTE CHIPSET INTEL',N'CÁI',10)
insert into HangHoa values ('MB02',N'ACOPR BX CHIPSET VIA',N'CÁI',10)
insert into HangHoa values ('MB03',N'INTEL PHI CHIPSET INTEL',N'CÁI',10)
insert into HangHoa values ('MB04',N'ECS CHIPSET SIS',N'CÁI',10)
insert into HangHoa values ('MB05',N'ECS CHIPSET VIA',N'CÁI',10)
insert into HangHoa values ('MNT01',N'SAMSUNG 14"SYNCMASTER',N'CÁI',5)
insert into HangHoa values ('MNT02',N'LG 14"',N'CÁI',5)
insert into HangHoa values ('MNT03',N'ACER 14"',N'CÁI',8)
insert into HangHoa values ('MNT04',N'PHILIPS 14"',N'CÁI',6)
insert into HangHoa values ('MNT05',N'VIEWSONIC 14"',N'CÁI',7)
select * from HangHoa
delete from HangHoa

--Nhap du lieu bang doi tac
insert into DoiTac values('CC001',N'Cty TNC',N'176 BTX Q1-TP.HCM','08.8250259')
insert into DoiTac values('CC002',N'Cty Hoàng Long',N'15A TTT Q1-TP.HCM','08.8250898')
insert into DoiTac values('CC003',N'Cty Hợp nhất',N'152 BTX Q1-TP.HCM','08.8252376')
insert into DoiTac values('K0001',N'Nguyễn Minh Hải',N'91 Nguyễn Văn Trỗi TP.Đà Lạt','063.831129')
insert into DoiTac values('K0002',N'Như Quỳnh',N'21 Điện Biên Phủ NTrang','058590270')
insert into DoiTac values('K0003',N'Trần Nhật Duật',N'Lê Lợi TP.Huế','054.848376')
insert into DoiTac values('K0004',N'Phan Nguyễn Hùng Anh',N'11 Nam Kỳ Khởi Nghĩa-TP. Đà Lạt','063.823409')
select * from DoiTac
delete from DoiTac
 --Nhap Bang Kha Nang Cung Cap
insert into KhaNangCC values('CC001','CPU01')
insert into KhaNangCC values('CC001','HDD03')
insert into KhaNangCC values('CC001','KB01')
insert into KhaNangCC values('CC001','MB02')
insert into KhaNangCC values('CC001','MB04')
insert into KhaNangCC values('CC001','MNT01')
insert into KhaNangCC values('CC002','CPU01')
insert into KhaNangCC values('CC002','CPU02')
insert into KhaNangCC values('CC002','CPU03')
insert into KhaNangCC values('CC002','KB02')
insert into KhaNangCC values('CC002','MB01')
insert into KhaNangCC values('CC002','MB05')
insert into KhaNangCC values('CC002','MNT03')
insert into KhaNangCC values('CC003','HDD01')
insert into KhaNangCC values('CC003','HDD02')
insert into KhaNangCC values('CC003','HDD03')
insert into KhaNangCC values('CC003','MB03')
select * from KhaNangCC
delete from KhaNangCC
set dateformat dmy
go
--Nhap Bang Hoa Don
insert into HoaDon values('N0001','25/01/2006','CC001',null)
insert into HoaDon values('N0002','01/05/2006','CC002',null)
insert into HoaDon values('X0001','12/05/2006','K0001',null)
insert into HoaDon values('X0002','16/06/2006','K0002',null)
insert into HoaDon values('X0003','20/04/2006','K0001',null)
select * from HoaDon
Delete from HoaDon

--Nhap Bang CT Hoa Don
insert into CT_HoaDon values('N0001','CPU01',63,10)
insert into CT_HoaDon values('N0001','HDD03',97,7)
insert into CT_HoaDon values('N0001','KB01',6,5)
insert into CT_HoaDon values('N0001','MB02',57,5)
insert into CT_HoaDon values('N0001','MNT01',112,3)
insert into CT_HoaDon values('N0002','CPU02',115,3)
insert into CT_HoaDon values('N0002','KB02',5,7)
insert into CT_HoaDon values('N0002','MNT03',111,5)
insert into CT_HoaDon values('X0001','CPU01',67,2)
insert into CT_HoaDon values('X0001','HDD03',100,2)
insert into CT_HoaDon values('X0001','KB01',5,2)
insert into CT_HoaDon values('X0001','MB02',62,1)
insert into CT_HoaDon values('X0002','CPU01',67,1)
insert into CT_HoaDon values('X0002','KB02',7,1)
insert into CT_HoaDon values('X0002','MNT01',115,2)
insert into CT_HoaDon values('X0003','CPU01',67,1)
insert into CT_HoaDon values('X0003','MNT03',115,2)
select * from CT_HoaDon
delete from CT_HoaDon
--Liệt kê các mặt hàng thuộc loại đĩa cứng
select   A.MAHH,TENHH,DVT,SOLUONGTON
from HangHoa A
where MAHH like 'HDD%'
--Liệt kê các mặt hàng có lượng tồn trên 10
select A.TENHH, SOLUONGTON 
from HangHoa A
where SOLUONGTON > 10
--Cho biết thông tin của các nhà cung cấp ở thành phố Hồ Chí Minh
select MADT,TENDT,DIACHI,DIENTHOAI
from DOITAC
where MADT like 'CC%'and DIACHI like '%TP.HCM'
--Liệt kê hóa đơn nhập hàng trong tháng 5/2006, thông tin hiện thị gồm(sohd,ngaylaphd,ten,diachi,dien thoai nha cung cap , so mat hang)
--DIENTHOIANHACUNGCAP CHƯA ĐƯỢC=====================================
select C.SOHD,NGAYLAPHOADON,TENDT, DIACHI,  DIENTHOAI,count(MAHH) as SOMATHANG
from DoiTac A,HoaDon B,CT_HoaDon C
where A.MADT=B.MADT and month(NGAYLAPHOADON)='05' and year(NGAYLAPHOADON)='2006' AND B.SOHD=C.SOHD
group by C.SOHD,NGAYLAPHOADON,TENDT, DIACHI,DIENTHOAI

--Cho biết các nhà cung cấp có cung cấp đĩa cứng
select A.MADT,TENDT,DIACHI,DIENTHOAI,count(A.MaDT) as SoLanCC
from DoiTac A,HangHoa B,KhaNangCC C
where A.MADT=C.MADT and C.MAHH=B.MAHH and B.MAHH like 'HDD%'
group by  A.MADT,TENDT,DIACHI,DIENTHOAI


--Cho biết cửa hàng bán bao nhiêu mặt hàng(BÁN CHO KHÁCH NÊN LIKE PHẦN MADT)
select C.SOHD,A.MADT,TENDT,count(MAHH) as SOMATHANG
from DoiTac A,HoaDon B,CT_HoaDon C
where A.MADT=B.MADT and B.SOHD=C.SOHD and A.MADT like 'K%'
group by C.SOHD,A.MADT,NGAYLAPHOADON,TENDT
--Cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp
select A.MADT,TENDT,count(MAHH) as SOMATHANG
from DoiTac A, KhaNangcc B
where A.MADT=B.MADT
group by A.MADT,TENDT

--Tính tổng doanh thu năm 2006==========1007
select SUM(SOLUONG * DONGIA) AS TongDoanhThu
from HoaDon B,CT_HoaDon C
where B.SOHD=C.SOHD and year(NgayLapHoaDon)='2006' and C.SOHD like 'X%'

--19.Liệt kê thông tin bán hàng tháng 5 /2006 bao gồm============thông tin bán hàng là cả nhập và xuất>?
select A.MAHH, TENHH,DVT, SOLUONG,SOLUONG * DONGIA AS TONGTHANHTIEN
from HangHoa A,HoaDon B,CT_HoaDon C
where month(NGAYLAPHOADON)='05' and year(NGAYLAPHOADON)='2006' AND B.SOHD=C.SOHD and C.MAHH=A.MAHH and C.SOHD like 'X%'

--21.Tính và cập nhật tổng các trị giá của các hóa đơn
update HoaDon
set TONGTG=(select sum(DonGia*SoLuong)
			from CT_HoaDon 
			where CT_HoaDon.SOHD=HoaDon.SOHD)
------------Truy vấn lồng------------------
--6.Cho biết các nhà cung cấp có thể cung cấp tất cả đĩa cứng
select A.MADT,TENDT, count(C.MAHH) as SoLoaiDC
from DoiTac A,HangHoa B,KhaNangCC C
where A.MADT=C.MADT and C.MAHH=B.MAHH and B.MAHH like 'HDD%' 
group by A.MADT,TENDT
having count(C.MAHH) = (select count(E.MAHH)
						from HangHoa E
						where E.MAHH like 'HDD%')
--7.Cho biết tên nhà cung cấp không cung cấp đĩa cứng
select *
from  DoiTac B
where  B.MADT not in (select C.MADT
					from HangHoa A,KhaNangCC C
					where A.MAHH=C.MAHH and A.MAHH like 'HDD%' ) and  
					B.MADT not in (select D.MADT
									from DoiTac D
									where D.MADT like 'K%')

					
--8.Cho biết thông tin của mặt hàng chưa bán được
select *
from HangHoa A
where A.MAHH not in (select B.MAHH
					 from CT_HoaDon B,HangHoa C
					 where B.MAHH=C.MAHH)
--9.Cho biết tên và tổng số lượng bán hàng của hàng bán chạy nhất (tính theo số lượng)
select A.MAHH, TENHH, sum(SOLUONG) as TongSL
from HangHoa A, CT_HoaDon B
where A.MAHH=B.MAHH and B.SOHD like 'X%'
group by A.MAHH, TENHH 
having  sum(SOLUONG) >=all (select sum(C.SOLUONG)
							from CT_HoaDon C
							where  C.SOHD like 'X%'
							group by C.MAHH)

--10.Cho biết tên và tổng số lượng mặt hàng nhập về ít nhất
select A.MAHH, TENHH, sum(SOLUONG) as TongSL
from HangHoa A, CT_HoaDon B
where A.MAHH=B.MAHH and B.SOHD like 'N%'
group by A.MAHH, TENHH 
having  sum(SOLUONG) <=all (select sum(C.SOLUONG)
							from CT_HoaDon C
							where  C.SOHD like 'N%'
							group by C.MAHH)
--11.Cho biết hóa đơn nhập nhiều mặt hàng nhất
select  B.SOHD,C.NGAYLAPHOADON,C.MADT,count(B.MAHH)as SLNhap
from  CT_HoaDon B,HoaDon C
where B.SOHD like 'N%' and B.SOHD=C.SOHD
group by  B.SOHD,C.NGAYLAPHOADON,C.MADT
having  count(B.MAHH) >=all (select count(D.MAHH)
							from CT_HoaDon D
							where  D.SOHD like 'N%'
							group by D.SOHD)
--12.Cho biết các mặt hàng không được nhập trong tháng 1/2006
select A.MAHH, A.TENHH
from HangHoa A
where A.MAHH not in (select A.MAHH  
					from  CT_HoaDon A,HoaDon B
					where  A.SOHD=B.SOHD and A.SOHD like 'N%' and month(NGAYLAPHOADON)='01' and year(NGAYLAPHOADON)='2006')

--13.Cho biết tên mặt hàng không bán được tháng 6/2006
select A.MAHH, A.TENHH
from HangHoa A
where A.MAHH not in (select C.MAHH
					from HoaDon B, CT_HoaDon C
					where B.SOHD=C.SOHD and B.SOHD like 'X%' and month(NGAYLAPHOADON)=06 and year(NGAYLAPHOADON)=2006)
					
--16.Cho biết thông tin cuả khách hàng có giao dịch với khách hanhg nhiều nhất
select A.MADT,A.TENDT,count(B.SOHD) as LanGiaoDich
from DoiTac A, HoaDon B
where A.MADT=B.MADT and A.MADT like 'K%'
group by A.MADT,A.TENDT
having count(B.SOHD)>=all (select count(C.SOHD)
							from HoaDon C 
							where A.MADT like 'K%'
							group by C.MADT)
--18.Cho biết loại mặt hàng bán chạy nhất
select A.MAHH, TENHH, count(B.MAHH) as SoLanXuat
from HangHoa A, CT_HoaDon B
where A.MAHH=B.MAHH and B.SOHD like 'X%'
group by A.MAHH, TENHH 
having  count(B.MAHH)  >=all (select count(C.MAHH) 
							from CT_HoaDon C
							where  C.SOHD like 'X%'
							group by C.MAHH)
--20.Liệt kê thông tin mặt hàng có nhiều người mua nhất=-==========
select A.MAHH, TENHH, count(D.MADT) as SoLanDuocMua
from HangHoa A, CT_HoaDon B,HoaDon D
where A.MAHH=B.MAHH and B.SOHD like 'X%'and D.SOHD=B.SOHD
group by A.MAHH, TENHH 
having  count(B.MAHH)  >=all (select count(C.MAHH) 
							from CT_HoaDon C
							where  C.SOHD like 'X%'
							group by C.MAHH)
--Viết các hàm sau:
--a. Tính tổng số lượng nhập trong một khoảng thời gian của một mặt hàng cho trước

create function fn_TongNhap_TrongKhoangThoiGian0242(@MA char(5), @tuNgay date, @denNgay date) returns int
As
Begin
	declare @tongNhap int
	if exists (select * from CT_HoaDon where MAHH = @MA) 
		Begin
		SELECT @tongNhap = SUM(CTHD.SoLuong)
		FROM CT_HoaDon CTHD,HoaDon HD
		WHERE MAHH = @MA AND CTHD.SOHD LIKE 'N%' AND CTHD.SOHD=HD.SOHD AND  NGAYLAPHOADON BETWEEN @tuNgay AND @denNgay
		
		End	
	 	
return @tongNhap
End
--THỬ
SET DATEFORMAT DMY
GO
print dbo.fn_TongNhap_TrongKhoangThoiGian0242('CPU02', '24/01/2006', '8/05/2006')
--b. Tính tổng số lượng xuất trong một khoảng thời gian của một mặt hàng cho trước
SET DATEFORMAT DMY
GO
create function fn_TongXuat_TrongKhoangThoiGian0242(@MA char(5), @tuNgay date, @denNgay date) returns int
As
Begin
	declare @tongXuat int
	if exists (select * from CT_HoaDon where MAHH = @MA) 
		Begin
		SELECT @tongXuat = SUM(CTHD.SoLuong)
		FROM CT_HoaDon CTHD,HoaDon HD
		WHERE MAHH = @MA AND CTHD.SOHD LIKE 'X%' AND CTHD.SOHD=HD.SOHD AND  NGAYLAPHOADON BETWEEN @tuNgay AND @denNgay
		group by MAHH
		End	
	 	
return @tongXuat
End
--THỬ
SET DATEFORMAT DMY
GO
print dbo.fn_TongXuat_TrongKhoangThoiGian0242('HDD03', '24/05/2006', '15/05/2006')
--c. Tính tổng doanh thu cho một tháng cho trước
--d. Tính tổng doanh thu cho một mặt hàng trong một khoảng thời gian cho trước
--e. Tính tổng số tiền nhập hàng trong một khoảng thời gian cho trước
--f. Tính tổng số tiền của một hóa đơn cho trước
--Viết các thủ tục sau
--a. Cập nhật số lượng tồn của một mặt hàng khi nhập hàng hoặc xuất hàng
--b. Cập nhật thông tin trị giá của một hóa đơn
--c. In đầy đủ thông tin của một hóa đơn
		
						
	

						
						








