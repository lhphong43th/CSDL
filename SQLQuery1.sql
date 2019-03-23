create database QLSV
on
(
name='qlsvdata',
filename='Z:\qlsv_data.mdf'
)
log on 
(
name='qlsvlog',
filename='Z:\qlsv_log.ldf'
)

create table SVIEN
(
ten nvarchar(25) not null,
mssv char(4) check (mssv like '[a-z][0-9][0-9][0-9]'),
nam tinyint,
khoa nvarchar(10) not null default ('cntt'),
primary key (mssv)
)
create table DKIEN
(
mamh char(6),
mamh_truoc char (6),
primary key (mamh,mamh_truoc)
)
create table KETQUA
(
MASV char(4),
MAHP int,
DIEM decimal(3,1) check (diem>=0 and diem<=10),
primary key (masv,mahp)
)
create table MHOC
(
TEN_MH nvarchar(30) unique not null,
MAMH char(6) check (MAMH like '[a-z][a-z][a-z][0-9][0-9][0-9]'),
DIEM decimal(3,1) check (diem>=0 and diem<=10),
SOTINCHI int check (SOTINCHI>=1 and SOTINCHI<=10),
primary key (MAMH)
)
create table HOCPHAN
(
MAHP int check (MAHP >0),
MAMH char (6),
DIEM decimal,
SOTINCHI int check (SOTINCHI>=1 and SOTINCHI<=10),
primary key (mamh)
)
--dkien(mamh)-->mhoc(mamh)
alter table dkien add constraint fk_dkien_monhoc foreign key (mamh) references mhoc(mamh)
--ketqua(masv)-->SVien(mssv)
alter table ketqua add constraint fk_kqua_masv foreign key (masv) references svien(mssv)
--ketqua(mahp)-->hocphan(mahp)
alter table ketqua add constraint fk_kqua_mahp foreign key (mahp) references hocphan(mahp)
--hocphan(mamh)-->MHOC(mamh)
alter table hocphan add constraint fk_hocphan_mamh foreign key (mamh) references mhoc(mamh)
--dieukien(mamh_truoc)-->mhoc(mamh)
alter table dkien add constraint fk_dkien_mamh foreign key (mamh_truoc) references mhoc(mamh)

select * from SVien
insert into svien values (N'Nguyễn Hông Sơn', 'A001',1,'CNTT')
insert into svien values (N'lê Châu Bảo', 'B010',1,'CNTT')

select * from mhoc
insert into mhoc values (N'tin học đại cương', 'COS301',3,'CNTT')
insert into mhoc values (N'cấu trúc dữ liệu', 'COS312',3,'CNTT')
insert into mhoc values (N'toán rời rạc', 'COS111',2,'CNTT')
insert into mhoc values (N'Anh văn không chuyên 1', 'ENG101',4,'SP')
insert into mhoc values (N'Anh văn không chuyên 2', 'ENG102',3,'SP')
