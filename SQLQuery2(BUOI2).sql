--1
select *
from NhanVien
where phg=4
--2
select *
from NhanVien
where luong>3000
--3
select *
from NhanVien
where (Luong>2500 and phg=4) or (Luong>3000 and phg=5 )
--4
select HoNV+TENLOT+tenNV as HoVaTenNV
from NhanVien
where Dchi like '%TP HCM%'
--5
select HoNV+TENLOT+tenNV as HoVaTenNV
from NhanVien
where HoNV like 'N%'
--6
select NgSinh,Dchi
from NhanVien
where HoNV='Dinh' and TenLot='Ba' and TenNV='tien'
--7
select *
from NhanVien
where year(ngsinh)>=1960 and year(ngsinh)<1965
--8
select *,year(ngSinh) as namSinh
from NhanVien
--9
select *,datediff (year,ngsinh,getdate())as Tuoi
from NhanVien
--10
select TenPHG, DiaDiem
from PhongBan p, DiaDiem_PHG d
where p.MAPHG=d.MAPHG
--11.
select honv+tenlot+tennv as HoTenTP
from nhanvien,phongban
where trphg=manv
--12
select tennv, dchi
from nhanvien,phongban
where trphg=manv and tenphg='Nghien cuu' and maphg=phg
--13
select tenda, tenphg, honv, tenlot, tennv, ng_nhanchuc 
from nhanvien, dean,phongban
where DDIEM_DA ='HA NOI' AND MAPHG=PHONG AND manv=trphg
--14
select tennv, tentn
from nhanvien, thannhan
where ma_nvien=manv
--18
select tenda
from nhanvien, dean, phancong
where  honv='Dinh' and tenlot='Ba' and tennv='Tien'and soda=mada and manv=ma_nvien
--19
select count(*) from dean
--20
select count(*) from dean, phongban where tenphg='Nghien cuu' and maphg=phong
--21
select avg(luong) from nhanvien where phai='Nu'
--22
select count(*) 
from nhanvien, thannhan
where honv='Dinh' and tenlot='Ba' and tennv='Tien' and ma_nvien=manv
--23
select tenda, sum(thoigian) as TongTG
from dean, phancong
where soda=mada
group by tenda
--24
select tenda, count(*) as SLnv
from dean, phancong
where soda=mada
group by tenda
--25
select honv, tenlot, tennv , count(*) as SLTN
from nhanvien, thannhan
where manv=ma_nvien
group by honv, tenlot, tennv
--26
select honv, tenlot, tennv , count(*) as SLDA
from nhanvien, dean
where phg=phong
group by honv, tenlot, tennv
--28
select tenphg, avg(Luong)
from phongban, nhanvien
where maphg=phg
group by tenphg
--29
select tenphg, count(*) as SLNV
from nhanvien, phongban
where maphg=phg  
group by tenphg
having avg(Luong)>3500
--30
select tenphg, count(*) as LSDA
from   PHANCONG, PHONGBAN
where TRPHG=MA_NVIEN 
group by tenphg
