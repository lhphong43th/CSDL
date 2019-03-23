--Cau 1
select *
from NHANVIEN
where PHG=4
--Cau 2
select *
from NHANVIEN
where LUONG>3000
--Cau 3
select *
from NHANVIEN
where LUONG>2500 and PHG=4 or LUONG>3000 and PHG=5
--Cau 4
select HoNV+TenLot+TenNV AS HOVATEN
from NhanVien
where DChi like '% HCM%'
--Cau 5
select HONV+TENLOT+TENNV as HOVATEN
from NHANVIEN
where HoNV like 'N%'
--Cau 6
select NgSinh,Dchi
from NhanVien
where HoNV='Dinh' and TenLot='Ba' and TenNV='tien'
--Cau 7
select *
from NhanVien
where year(NgSinh)>=1960 and year(NgSinh)<1965
--Cau 8
select *, year(NgSinh) as NamSinh
from NhanVien
--Cau 9
select *, DATEDIFF(year,ngsinh,getdate()) as Tuoi
from NhanVien
--Cau 10
select TENPHG, DIADIEM
from PHONGBAN P, DIADIEM_PHG D
where P.MAPHG=D.MAPHG