create database QLSV 

use QLSV

create table SVIEN
(
ten nvarchar(25),
masv char(4), 
nam int,
khoa varchar(10),
primary key (masv)
)

create table DKIEN
(
mamh char(6) ,
mamh_truoc char(6) ,
primary key(mamh,mamh_truoc)
)

create table KETQUA
(
masv char(4),
mahp int,
diem decimal(3,1), 
primary key(masv,mahp)
)

create table MHOC
(
ten_mh nvarchar(30),
mamh char(6),
sotinchi int ,
khoa varchar(10),
primary key(mamh)
)

create table HOCPHAN
(
mahp int ,
mamh char(6),
hocky int,
namhoc varchar(10),
gv varchar(25),
primary key(mahp)
)
--Tao RB tham chieu
alter table hocphan add constraint fk_hocphan_mhoc foreign key (mamh) references mhoc(mamh)
alter table ketqua add constraint fk_kqua_svien foreign key (masv) references svien(masv)
alter table ketqua add constraint fk_kqua_hocphan foreign key (mahp) references hocphan(mahp)
alter table dkien add constraint fk_dkien_mhoc foreign key (mamh) references mhoc(mamh)
alter table dkien add constraint fk_dkien_mhoc2 foreign key (mamh_truoc) references mhoc(mamh)

--Nhap du lieu: svien, mhoc, hocphan, kqua, dkien

Insert into SVIEN values (N'Nguyễn Hồng Sơn','A001',1,'SP')
Insert into SVIEN values (N'Lê Châu Bảo','B010',2,'CNTT')

Insert into MHOC values ('Tin hoc dai cuong','COS301',3,'CNTT')
Insert into MHOC values ('Cau truc du lieu','COS312',3,'CNTT')
Insert into MHOC values ('Toan roi rac','COS111',4,'SP')
Insert into MHOC values ('Anh van khong chuyen 1','ENG101',4,'SP')
Insert into MHOC values ('Anh van khong chuyen 2','ENG102',3,'SP')

Insert into DKIEN values('COS312','COS301')
Insert into DKIEN values('COS312','COS111')
Insert into DKIEN values('ENG102','ENG101')

Insert into HOCPHAN values(1,'COS301',1,'2010-2011','KIM')
Insert into HOCPHAN values(2,'COS111',1,'2010-2011','TRANG')
Insert into HOCPHAN values(3,'ENG101',1,'2011-2012','NAM')
Insert into HOCPHAN values(4,'COS111',2,'2011-2012','DUY')
Insert into HOCPHAN values(5,'ENG102',2,'2011-2012','LOC')
Insert into HOCPHAN values(6,'COS301',2,'2011-2012','THUY')

Insert into KETQUA values ('A001',1,5.5)
Insert into KETQUA values ('A001',3,8)
Insert into KETQUA values ('B010',1,9)
Insert into KETQUA values ('B010',2,7.5)
Insert into KETQUA values ('B010',3,6)
Insert into KETQUA values ('B010',5,8)
Insert into KETQUA values ('B010',6,9)
Insert into KETQUA values ('A001',5,9.5)
--Cau 2
Alter table SVien add Dthoai varchar(9)
Alter table SVien add Phai char(3) check (phai='nam' or phai='nu')
--Cau 3
Alter table SVien alter column Dthoai varchar(11)
--Cau 4
Update SVien set Dthoai=01234111222 where MASV='A001'
--Cau 5
Alter table SVien Drop column Dthoai
--Cau 6
Insert into SVIEN values (N'Phan Quốc Tuấn','B012',1,'NULL','nam')
--Cau 7
Insert into HOCPHAN values(7,'COS301',1,'2011-2012','VAN')
--Cau 8
Insert into KETQUA values ('B012',7,9)
--Cau 9
Update SVien set ten = N'Pham Quoc Tuan', nam=2  where masv='B012'
Update SVien set ten=N'Nguyễn Hồng Sơn' where masv='A001'
Update SVien set ten=N'Lê Bảo Châu' where masv='B010'
--Câu 10
update KETQUA SET diem=9.5 where  mahp=7 and mssv=( select masv from SVIEN where ten='Pham Quoc Tuan')
--Cau 11
delete from KETQUA where masv='B012'
delete from HOCPHAN where mamh='COS301' and hocky=1 and namhoc='2011-2012'
delete from SVien where masv='B012'

--Cau 12
select * from SVIEN
select * from MHOC
select * from DKIEN
select * from HOCPHAN
select * from KETQUA


