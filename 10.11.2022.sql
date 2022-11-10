CREATE TABLE sirketler (
sirket_id int,
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
12:07
CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id

select * from sirketler
select * from siparisler

--LEFT JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id
SELECT * from sirketler
SELECT * from siparisler

--RIGHT JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler RIGHT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id

--FULL JOIN
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun

SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler FULL JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id

CREATE TABLE personel8
(
id int,
isim varchar(20),
title varchar(60), yonetici_id int
);

INSERT INTO personel8 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel8 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel8 VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel8 VALUES(4, 'Fatma Can', 'CEO', 5);

SELECT * FROM personel8

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
SELECT p1.isim as personel_isim, p2.isim as yonetici_isim
FROM personel8 p1 INNER JOIN personel8 p2
ON p1.yonetici_id = p2.id

CREATE TABLE musteriler2
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler2 (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);

--SORU	: Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler2 WHERE isim LIKE 'A%';
--Eğer büyük küçük harf farketmeksizin sorgulama yapmak isterseniz -ilike- kullanabilirsiniz
SELECT * FROM musteriler2 WHERE isim ILIKE 'a%';
-- Like kullanımı 2 yol
-- Like kullanımı yerine ~~ bu sembolleri de kullanabilirsiniz
SELECT * FROM musteriler2 WHERE isim ~~ 'A%';
-- Like kullanımında sembol kullanıyorsak ve büyük küçük harf gözetmeksizin sorgu yapmak istersek ~~* sembollerini kullanabiliriz
SELECT * FROM musteriler2 WHERE isim ~~* 'a%';

CREATE TABLE kelimeler
(
id int UNIQUE,
kelime varchar(50) NOT NULL, Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU: Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ 'h[ai]t'
--SORU: Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ 'h[a-k]t'
--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ '[mi]'
--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ '^[as]'
--Regexp-Like kullanımında başlangıç belirtmek için ^ sembol kullanılır
--SORU	: m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~ '[mf]$'
--Regexp-Like kullanımında sonuç belirtmek için $ sembol kullanılır
--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime NOT LIKE 'h%'
SELECT * FROM kelimeler WHERE kelime !~~ 'h%'
--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime !~~ '%a%'
--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime !~~ '_de%'
--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime !~ '[_eio]'
--UPPER(Belirtilen field'daki verileri büyük harf yazar)
--LOWER(Belirtilen field'daki verileri küçük harf yazar)
--INITCAP(Belirtilen field'daki verilerin ilk harfini büyük yazar)
SELECT UPPER(kelime) as kelime FROM kelimeler
SELECT LOWER(kelime) as kelime FROM kelimeler
SELECT INITCAP(kelime) as kelime FROM kelimeler

CREATE TABLE musteri_urun
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma');
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma');
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

SELECT * FROM musteri_urun

--urun isimlerini distinct komutuyla gruplayalım
SELECT DISTINCT urun_isim from musteri_urun

--Musteri isimlerini gruplayınız
SELECT DISTINCT musteri_isim from musteri_urun

-- Tabloda kac farklı çeşit meyve vardır
SELECT COUNT(distinct(urun_isim)) as meyve_sayisi from musteri_urun