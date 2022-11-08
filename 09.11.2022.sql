CREATE TABLE insanlar3
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
9:43
INSERT INTO insanlar3 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar3 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar3 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar3 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar3 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar3 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar3

--insanlar3 tablosundaki dataları adrese göre sıralayınız
select * from insanlar3
ORDER BY adres;

 -- Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar3
WHERE isim='Mine'
ORDER BY ssn;
 
--insanlar tablosundaki soyismi Bulut olanları isim sirali olarak listeleyin
SELECT *FROM insanlar3
WHERE isim='Mine'
ORDER BY ssn;

-- Insanlar tablosundaki soyismi Bulut olanlari adres sirali olarak listeleyin
SELECT * FROM insanlar3
WHERE soyisim='Bulut'
ORDER BY 4; -- Sıralamada field numarası da kullanabiliriz
/*
NOT:Ascending (ASC) doğal sıralam küçükten büyüğe, yazılmasada defauld olarak natural sıralama yapar
    Descending (DESC) Büyükten küçüğe
*/
-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar3
ORDER BY ssn DESC;

CREATE TABLE manav
(
isim varchar(50),  Urun_adi varchar(50),  Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--1) Isme gore alinan toplam urunleri sorgulayınız
SELECT isim, sum(urun_miktar) FROM manav
GROUP BY isim
ORDER BY isim

SELECT isim, sum(urun_miktar) as urun_miktari FROM manav
GROUP BY isim
ORDER BY urun_miktari DESC

select * from manav

--2) Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi,COUNT(isim) FROM manav
GROUP BY urun_adi

SELECT COUNT(isim) FROM manav

--3) Alinan kilo miktarina gore musteri sayisi
SELECT urun_miktar,COUNT(isim) AS alinan_urunler_kisi_sayisi FROM manav
GROUP BY urun_miktar

CREATE TABLE personel5
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel5 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel5 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel5 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel5 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel5 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel5 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel5 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel5

--1 sehre gore toplam personel sayisini bulun
SELECT sehir, COUNT(isim) as calisan_sayisi FROM personel5
GROUP BY sehir

--2 Isme gore toplam maaslari bulun
SELECT isim, sum(maas) FROM personel5
GROUP BY isim

--3 Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT(isim) as calisan_sayisi FROM personel5
WHERE maas>5000
GROUP BY sirket;

--4 Her sirket icin Min ve Max maasi bulun
SELECT sirket, min(maas) as en_dusuk_maas, max(maas) as en_yuksek_maas FROM personel5
GROUP BY sirket;

-- HAVING KOMUTU

--5 Her sirketin MIN	maaslarini eger 3500’den buyukse goster
SELECT sirket,min(maas) as en_dusuk_maas FROM personel5
GROUP BY sirket
HAVING min(maas)>3500

--6 Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi  ve toplam maasi gosteren sorgu yaziniz
SELECT isim, sum(maas) as toplam_maas FROM personel5
GROUP BY isim
HAVING sum(maas)>10000;
