/*	Học phần: Cơ sở dữ liệu
	Người thực hiện: Đậu Thị Tiểu Điệp
	MSSV: 2115196
	Lớp: CTK45B
	Ngày bắt đầu :23/02/2023
	Ngày kết thúc: 
*/
---------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU-------------
CREATE DATABASE TestLab05_QLTDL-- Lenh khai bao CSDL
go
use TestLab05_QLTDL
go

create table Tour
(MaTour char(4)primary key,
TongSoNgay int not null
)
go

create table ThanhPho
(MaTP int primary key,---KO BIẾT INT HAY CHAR?
TenTP nvarchar(20) not null 
)
go

create table Tour_TP
(MaTour char(4) references Tour(MaTour),
MaTP int references ThanhPho(MaTP),
SoNgay int not null,
primary key(MaTour,MaTP)
)

create table Lich_TourDL
(MaTour char(4) references Tour(MaTour),
NgayKH datetime,
TenHDV nvarchar(10) not null,
SoNguoi int not null,
TenKH nvarchar(20) not null,
primary key(MaTour,NgayKH)
)

--NHẬP DỮ LIỆU CHO BẢNG
--Nhập dữ liệu bảng Tour
insert into Tour values('T001',3)
insert into Tour values('T002',4)
insert into Tour values('T003',5)
insert into Tour values('T004',7)
select *from Tour

--Nhập dữ liệu bảng Thành Phố
insert into ThanhPho values(01,N'Đà Lạt')
insert into ThanhPho values(02,N'Nha Trang')
insert into ThanhPho values(03,N'Phan Thiết')
insert into ThanhPho values(04,N'Huế')
insert into ThanhPho values(05,N'Đà Nẵng')
select *from ThanhPho

--Nhập bảng Tour_TP
insert into Tour_TP values('T001',01,2)
insert into Tour_TP values('T001',03,1)
insert into Tour_TP values('T002',01,2)
insert into Tour_TP values('T002',02,2)
insert into Tour_TP values('T003',02,2)
insert into Tour_TP values('T003',01,1)
insert into Tour_TP values('T003',04,2)
insert into Tour_TP values('T004',02,2)
insert into Tour_TP values('T004',05,2)
insert into Tour_TP values('T004',04,3)
select *from Tour_TP
delete from Tour_TP
--thêm để ktra
insert into Tour_TP values('T004',01,3)
insert into Tour_TP values('T004',03,3)

set dateformat dmy
go

--Nhập bảng Lich_TourDL
insert into Lich_TourDL values('T001','14/02/2017',N'Vân',20,N'Nguyễn Hoàng')
insert into Lich_TourDL values('T002','14/02/2017',N'Nam',30,N'Lê Ngọc')
insert into Lich_TourDL values('T002','06/03/2017',N'Hùng',20,N'Lý Dũng')
insert into Lich_TourDL values('T003','18/02/2017',N'Dũng',20,N'Lý Dũng')
insert into Lich_TourDL values('T004','18/02/2017',N'Hùng',30,N'Dũng Nam')
insert into Lich_TourDL values('T003','10/03/2017',N'Nam',45,N'Nguyễn An')
insert into Lich_TourDL values('T002','28/04/2017',N'Vân',25,N'Ngọc Dung')
insert into Lich_TourDL values('T004','29/04/2017',N'Dũng',35,N'Lê Ngọc')
insert into Lich_TourDL values('T001','30/04/2017',N'Nam',25,N'Trần Nam')
insert into Lich_TourDL values('T003','15/06/2017',N'Vân',20,N'Trịnh Bá')
select *from Lich_TourDL

--(a) Cho biết các tour du lịch có tổng số ngày của tour từ 3 đến 5 ngày
select *
from Tour A
where A.TongSoNgay >=3 and A.TongSoNgay <=5
--(b) Cho biết thông tin các tour được tổ chức trong tháng 2 năm 2017
select *
from Lich_TourDL B
where month(NgayKH)=02 and year(NgayKH)=2017
--(c)Cho biết các Tour không đi qua thành phố Nha Trang
select *
from Tour 
where Tour.MaTour not in (select A.MaTour
						from Tour A,Tour_TP B, ThanhPho C
						where  C.TenTP ='Nha Trang'and B.MaTP=C.MaTP and A.MaTour=B.MaTour )
--(d) Cho biết số lượng thành phố mà mỗi Tour du lịch đi qua
select A.MaTour, count(B.MATP)as SoTP
from Tour A,Tour_TP B
where A.MaTour=B.MaTour 
group by A.MaTour
--(e) Cho biết số lượng tour du lịch mỗi hướng dẫn viên hướng dẫn
select A.TenHDV,count(A.MaTour)as SLTour
from Lich_TourDL A
group by  A.TenHDV
--(f) Cho biết tên thành phố có nhiều tour du lịch đi qua nhất
select A.TenTP,count(MaTour)as SoTour
from ThanhPho A, Tour_TP B
where A.MaTP=B.MaTP
group by A.TenTP
having count(MaTour) >= all (select count(C.MaTour)
							from Tour_TP C
							group by C.MaTP)
--(g) Cho biết thông tin của Tour du lịch đi qua tất cả các thành phố
select A.MaTour,A.TongSoNgay,count(B.MaTP) as SoTP
from Tour A, Tour_TP B
where A.MaTour=B.MaTour 
group by  A.MaTour,A.TongSoNgay
having count(B.MaTP)=(select count(ThanhPho.MaTP)
					from ThanhPho)
--(h) Lập ds các Tour đi qua thành phố ĐÀ Lạt
select A.MaTour,A.TongSoNgay
from Tour A,Tour_TP B, ThanhPho C
where C.TenTP =N'Đà Lạt'and B.MaTP=C.MaTP and A.MaTour=B.MaTour 

--(i) Cho biết thông tin của tour du lịch có tổng số lượng khách tham gia nhiểu nhất
select A.MaTour,A.TongSoNgay,sum(SoNguoi) as LuongKhachTG
from Tour A,Lich_TourDL B
where A.MaTour=B.MaTour
group by A.MaTour,A.TongSoNgay
having sum(SoNguoi) >=all(select sum(C.SoNguoi)
						from Lich_TourDL C
						group by C.MaTour)
--(j) Cho biết tên thành phố mà tất cả các Tour du lịch đều đi qua
select TenTP, count(B.MaTour) as SLTour
from ThanhPho A, Tour_TP B
where A.MaTP=B.MaTP 
group by TenTP
having count(B.MaTP)=(select count(Tour.MaTour)
						from Tour)