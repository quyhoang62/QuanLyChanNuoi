create database ChanNuoi
go
use ChanNuoi
go

create table Role
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100)
)

create table [User]
(
	Id int identity(1,1) primary key,
	UserName nvarchar(100),
	Password nvarchar(max),
	DisplayName nvarchar(100),
	IdRole int not null,
	foreign key(IdRole) references Role(Id)
)



-- Quan li co so du lieu ve san pham xu li chat thai chan nuoi
create table CSSXSanPhamXuLiChatThai
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)

create table SanPhamXuLiChatThai
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(100),
	Thongtin nvarchar(100)
)

create table CoSoKhaoNgiem
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	SDT varchar(50)
)

create table QuanLySanPhamXuLiChatThai
(
	IdSanPham int not null,
	IdCoSoSanXuat int not null,
	IdCoSoKhaoNghiem int not null,
	foreign key(IdSanPham) references SanPhamXuLiChatThai(Id),
	foreign key(IdCoSoSanXuat) references CSSXSanPhamXuLiChatThai(Id),
	foreign key(IdCoSoKhaoNghiem) references CoSoKhaoNgiem(Id)
)

-- quan li co so du lieu ve co so chan nuoi, che bien 
create table ToChuc
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	SDT varchar(50)
)

create table QuanLyVung
(
	MaVung int primary key,
	Ten nvarchar(100),
	TrangThai nvarchar(100)
)

create table CoSoCheBien
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	SDT varchar(50)
)

create table CoQuanCapChungNhan
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(100),
	SDT varchar(50),
	Email varchar(50)
)

create table CoSoChanNuoi
(	
	Id int identity(1,1) primary key,
	MaVung int not null,
	MaLoaiHinhChanNuoi int,
	DieuKienChanNuoi nvarchar(100),
	IdToChuc int not null,
	foreign key(MaVung) references QuanLyVungAnToan(MaVung),
	foreign key(IdToChuc) references ToChuc(Id)
)

create table QuanLyCheBien
(
	IdCoSoCheBien int not null,
	IdCoSoChanNuoi int not null,
	foreign key(IdCoSoCheBien) references CoSoCheBien(Id),
	foreign key(IdCoSoChanNuoi) references CoSoChanNuoi(Id)
)

create table GiayChungNhan
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	NgayCap date,
	IdCoQuanCap int not null,
	IdCoSoChanNuoi int not null,
	foreign key(IdCoQuanCap) references CoQuanCapChungNhan(Id),
	foreign key(IdCoSoChanNuoi) references CoSoChanNuoi(Id)
)


-- Quan li co so du lieu khac ve chan nuoi
create table DaiLyBanThuoc
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)

create table Thuoc
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(50),
	SoLuong int
)

create table CoSoGietMo
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)

create table KhuTamGiuTieuHuy
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	DiaChi nvarchar(200),
	SDT varchar(50)
)

create table DichBenh
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	CachTieuHuy nvarchar(300)
)

create table DongVat
(
	Id int identity(1,1) primary key,
	Ten nvarchar(100),
	Loai nvarchar(100)
)

create table QuanLyDaiLyBanThuoc
(	
	IdDaiLy int not null,
	IdThuoc int not null,
	IdDongVat int not null,
	foreign key(IdDaiLy) references DaiLyBanThuoc(Id),
	foreign key(IdThuoc) references Thuoc(Id),
	foreign key(IdDongVat) references DongVat(Id)
)

create table QuanLyTamGiuTieuHuy
(	
	IdBenh int not null,
	IdDongVat int not null,
	IdKhuTamGiuTieuHuy int not null,
	SoLuong int,
	ThoiGian date,
	foreign key(IdBenh) references DichBenh(Id),
	foreign key(IdDongVat) references DongVat(Id),
	foreign key(IdKhuTamGiuTieuHuy) references KhuTamGiuTieuHuy(Id)
)


create table QuanLyGietMo
(	
	IdDongVat int not null,
	IdCoSo int not null,
	SoLuong int,
	ThoiGian date,
	foreign key(IdDongVat) references DongVat(Id),
	foreign key(IdCoSo) references CoSoGietMo(Id)
)