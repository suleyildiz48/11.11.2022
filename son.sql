CREATE TABLE tedarikciler
(
tedarikci_id int,
tedarikci_ismi varchar(20),
tedarikci_adres varchar(30),
ulasim_tarihi date
);


CREATE TABLE tedarikci_ziyaret
AS
SELECT tedarikci_ismi, ulasim_tarihi FROM tedarikciler;

CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,
maas int
) ;

-- Primary Key oluşturma 1 yol
CREATE TABLE ogrenciler4
(
id char(4) PRIMARY KEY,
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);


-- Primary Key oluşturma 1 yol
CREATE TABLE ogrenciler5
(
id char(4) PRIMARY KEY,
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);


-- Primary key oluşturma 2. yol
CREATE TABLE ogrenciler4
(
id char(4),
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date,
CONSTRAINT ogrpk PRIMARY KEY (id)
);


CREATE TABLE tedarikciler3
(
tedarikci_id char(5) ,
tedarikci_ismi varchar(20),
iletisim_ismi varchar(20),
CONSTRAINT tdrkpk PRIMARY KEY (tedarikci_id)
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(10),
CONSTRAINT tdrkfk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
)

CREATE TABLE calisanlar
(
id char(9) Primary Key,
isim varchar(10) Unique,
maas int not null,
ise_baslama date
)
CREATE TABLE adresler
(
adres_id char(10),
sokak varchar(10),
cadde varchar(10),
sehir varchar(10),
CONSTRAINT adrsfk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
)
6:46
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
6:46
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');