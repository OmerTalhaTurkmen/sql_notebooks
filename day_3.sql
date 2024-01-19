----------------------- DAY 3 -----------------------
---------------------- Review -----------------------

CREATE TABLE calisanlar(
	id char(5) PRIMARY KEY,
	isim varchar(50) UNIQUE,
	maas int NOT NULL,
	ise_baslama date
); -- Parent / Referenced Table

CREATE TABLE adresler(
	adres_id char(5), -- null / duplicate kabul eder
	sokak varchar(30),
	cadde varchar(30),
	sehir varchar(20),
	FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
); -- Child Table



INSERT INTO calisanlar VALUES('10002', 'Donatello' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10003', null, 5000, '2018-04-14');
-- Unique: NULL kabul eder.
INSERT INTO calisanlar VALUES('10004', 'Donatello', 5000, '2018-04-14'); -- Name must be unique
INSERT INTO calisanlar VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Leonardo', null, '2019-04-12'); -- maas null olamaz
INSERT INTO calisanlar VALUES('10007', 'Raphael', '', '2018-04-14'); -- maas data type integer
INSERT INTO calisanlar VALUES('', 'April', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'Ms.April', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('10002', 'Splinter' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'Fred' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Betty' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Kaya Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Taş Sok', '30.Cad.','Konya'); 

INSERT INTO adresler VALUES('10012','Taş Sok', '30.Cad.','Konya'); -- PK de böyle bir id olmadigi icin etmez


INSERT INTO adresler VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');


SELECT * FROM calisanlar;
SELECT * FROM adresler;

-- 14-)  WHERE Condition

SELECT *
FROM calisanlar
WHERE isim='Donatello';

SELECT *
FROM calisanlar
WHERE maas>5000;

SELECT isim, maas
FROM calisanlar
WHERE maas>5000;

SELECT * FROM adresler
WHERE sehir='Konya'
AND adres_id='10002';

SELECT cadde, sehir FROM adresler
WHERE sehir='Konya'
OR sehir='Bursa';

-- 15-) Tablodan kayit silme: DELETE FROM...

CREATE TABLE ogrenciler1
(
	id int,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int       
);

INSERT INTO ogrenciler1 VALUES(122, 'Kerem Can', 'Fatma',75),
	(123, 'Ali Can', 'Hasan',75),
	(124, 'Veli Han', 'Ayse',85),
	(125, 'Kemal Tan', 'Hasan',85),
	(126, 'Ahmet Ran', 'Ayse',95),
	(127, 'Mustafa Bak', 'Can',99),
	(128, 'Mustafa Bak', 'Ali', 99),
	(129, 'Mehmet Bak', 'Alihan', 89);

SELECT * FROM ogrenciler1;

-- Id 123 olan kaydi silelim

DELETE FROM ogrenciler1
WHERE id=123;

DELETE FROM ogrenciler1
WHERE isim='Ahmet Ran'
OR isim='Veli Han';

-- 16a) Tablodaki tüm recordlari silme

DELETE FROM students;

SELECT * FROM students;

-- 16b) Tablodaki tüm recordlari silme: TRUNCATE

SELECT * FROM doctors;

TRUNCATE TABLE doctors;

--1 truncate komutu tablo üzeriinde bir işlem geliştirir. ddl alt komutunda yer alır
--2 delete komutu data manipulation langueage alt grubunda yer alır dml
--3 truncate table da where komutu kullanılamaz
--4 truncate table delete from komutundan daha hızlı çalışır. delete table satır satır silme gerçekleştirir. truncate table doğruan tabloyu siler.
--5 truncate table silme işleminigerçekleştirirken tablonun tamamını kilitler ve başka bir komut bu tabloya ulaşamaz.
--6 delete from komuta ile yapılan işlemler geri alınabilir. truncate table geri alınamaz. riskli bir komuttur.


-- 17) parent-child ilişkisi olan tablolarda kayıt silme
SELECT * FROM calisanlar;--parent
SELECT * FROM adresler;---child

DELETE FROM calisanlar;
--ref alınan kayıtlar old için silmez
DELETE FROM calisanlar WHERE id='10002';
--id=10002 kayıt adresler tarafından ref alındığı için
--FK kısıtlaması silmeye izin vermez.

DELETE FROM adresler WHERE adres_id='10002';
DELETE FROM calisanlar WHERE id='10002';
--ref alınan kayıt silinerek ilişki koparıldı..
--artık ref olmadığından silmeye izin verir

CREATE TABLE talebeler
(
id int primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);--parent

CREATE TABLE notlar( 
talebe_id int,
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id) ON DELETE CASCADE
);--child

INSERT INTO talebeler VALUES(122, 'Kerem Can', 'Fatma',75),
(123, 'Ali Can', 'Hasan',75),
(124, 'Veli Han', 'Ayse',85),
(125, 'Kemal Tan', 'Hasan',85),
(126, 'Ahmet Ran', 'Ayse',95),
(127, 'Mustafa Bak', 'Can',99),
(128, 'Mustafa Bak', 'Ali', 99),
(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO notlar VALUES ('123','kimya',75),
 ('124', 'fizik',65),
 ('125', 'tarih',90),
 ('126', 'Matematik',90),
 ('127', 'Matematik',90),
 (null, 'tarih',90);

SELECT * FROM talebeler;
SELECT * FROM notlar;

-- Notlar tablosundan id=123 olan recordi silelim

DELETE FROM notlar
WHERE talebe_id=123;

-- Notlar tablosundan id=126 olan recordi silelim

DELETE FROM notlar
WHERE talebe_id=126;

-- ON DELETE CASCADE ile önce referans alan kayit, ardindan ilgili kayit tablodan silindi.

DELETE FROM talebeler;


-- 19) Tabloyu tamamen SCHEMA dan silme:

DROP TABLE talebeler;

DROP TABLE talebeler CASCADE;
-- Notlar tablosunda tanimli FK constrainti kaldirilir ardindan tablo silinir.

DROP TABLE IF EXISTS talebeler1;

CREATE TABLE musteriler  (
	urun_id int,  
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;

-- Müşteriler tablosundan ürün ismi 'Orange', 'Apple' veya 'Apricot' olan verileri listeleyiniz.

SELECT * FROM musteriler
WHERE urun_isim='Orange'
OR urun_isim='Apple'
OR urun_isim='Apricot';

SELECT * FROM musteriler
WHERE urun_isim IN ('Orange', 'Apple', 'Apricot');

SELECT * FROM musteriler
WHERE urun_isim<>'Palm';

-- Müşteriler tablosundan ürün ismi 'Orange', 'Apple' ve 'Apricot' olmayan verileri listeleyiniz.

SELECT * FROM musteriler
WHERE urun_isim NOT IN ('Orange', 'Apple', 'Apricot');


-- 21) BETWEEN .... AND ... komutu

-- Müşteriler tablosunda urun_id 20 ile 30(dahil) arasinda olan urunlerin tum bilgilerini listeleyiniz

SELECT * FROM musteriler
WHERE urun_id>=20 AND urun_id<=30;

SELECT * FROM musteriler
WHERE urun_id BETWEEEN 20 AND 30; -- 20 ve 30 dahil

-- Müşteriler tablosunda urun_id 20den küçük veya 30dan büyük olan urunlerin tum bilgilerini listeleyiniz

SELECT * FROM musteriler
WHERE urun_id NOT BETWEEN 20 AND 30;






