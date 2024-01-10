use master
go

create database ChanNuoi
go
use ChanNuoi
go

create table Role
(
	Id int identity(1, 1) primary key,
	Ten nvarchar(100)
)

create table [User]
(
	Id int identity(1,1) primary key,
	UserName nvarchar(100),
	Password nvarchar(max),
	DisplayName nvarchar(100),
	IdRole int not null,
	foreign key (IdRole) references Role(Id)
)
go

-- Quan li co so du lieu ve san pham xu li chat thai chan nuoi
create table CSSXSanPhamXuLiChatThai
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)
go

create table SanPhamXuLiChatThai
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(100),
	Thongtin nvarchar(100)
)
go

create table CoSoKhaoNgiem
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	SDT varchar(50)
)
go

create table QuanLySanPhamXuLiChatThai
(
	IdSanPham int not null,
	IdCoSoSanXuat int not null,
	IdCoSoKhaoNghiem int not null,
	foreign key(IdSanPham) references SanPhamXuLiChatThai(Id),
	foreign key(IdCoSoSanXuat) references CSSXSanPhamXuLiChatThai(Id),
	foreign key(IdCoSoKhaoNghiem) references CoSoKhaoNgiem(Id)
)
go

-- quan li co so du lieu ve co so chan nuoi, che bien 
create table ToChuc
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	SDT varchar(50)
)
go


create table QuanLyVung
(
	Id int identity(1, 1) primary key,
	Ten nvarchar(100),
	TrangThai nvarchar(50)
)
go

create table CoSoChanNuoi
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(50),
	IdVung int,
	DieuKien nvarchar(100),
	IdToChuc int not null,

	foreign key (IdToChuc) references ToChuc(Id),
	foreign key(IdVung) references QuanLyVung(Id)
)
go

create table CoSoCheBien
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	SDT varchar(50),
)
go

create table QuanLiCheBien
(
	IdCoSoCheBien int not null,
	IdCoSoChanNuoi int not null,
	foreign key(IdCoSoCheBien) references CoSoCheBien(Id),
	foreign key(IdCoSoChanNuoi) references CoSoChanNuoi(Id)
)
go

create table CoQuanCap
(
	Id int identity(1, 1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	Email nvarchar(100),
	SDT varchar(50)
)
go

create table GiayChungNhan
(
	Id int identity(1, 1) primary key,
	IdCoQuanCap int not null,
	IdCoSoChanNuoi int not null,
	NgayCap date,

	foreign key(IdCoQuanCap) references CoQuanCap(Id),
	foreign key(IdCoSoChanNuoi) references CoSoChanNuoi(Id)
)
go

-- Quan li co so du lieu khac ve chan nuoi
create table DaiLyBanThuoc
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)
go

create table Thuoc
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(50)
)
go

create table CoSoGietMo
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)
go

create table KhuTamGiuTieuHuy
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)
go

create table DichBenh
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	CachTieuHuy nvarchar(300)
)
go

create table DongVat
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(100)
)
go

create table QuanLyDaiLyBanThuoc
(	
	IdDaiLy int not null,
	IdThuoc int not null,
	IdDongVat int not null,
	SoLuong int,
	foreign key(IdDaiLy) references DaiLyBanThuoc(Id),
	foreign key(IdThuoc) references Thuoc(Id),
	foreign key(IdDongVat) references DongVat(Id)
)
go

create table QuanLyTamGiuTieuHuy
(	
	Id int identity(1,1) primary key,
	IdBenh int not null,
	IdDongVat int not null,
	IdKhuTamGiuTieuHuy int not null,
	SoLuong int,
	ThoiGian date,
	foreign key(IdBenh) references DichBenh(Id),
	foreign key(IdDongVat) references DongVat(Id),
	foreign key(IdKhuTamGiuTieuHuy) references KhuTamGiuTieuHuy(Id)
)
go


create table QuanLyGietMo
(	
	IdDongVat int not null,
	IdCoSo int not null,
	SoLuong int,
	ThoiGian date,
	foreign key(IdDongVat) references DongVat(Id),
	foreign key(IdCoSo) references CoSoGietMo(Id)
)
go