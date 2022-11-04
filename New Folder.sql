--CREATE--Tablo oluşturma
CREATE TABLE ogretmenler
(
id char(4),
isim_soyisim varchar(30),
not_ort real,
kayıt_tarih date
);

--VAROLAN BİR TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE ogretmenler_ort
AS
SELECT isim_soyisim,not_ort
FROM ogrenciler;

--SELECT - DQL-
SELECT * FROM ogretmenler;
SELECT * FROM ogretmenler_ort;
SELECT isim_soyisim,kayıt_tarih FROM ogretmenler;
select isim_soyisim,kayıt_tarih from ogrenciler