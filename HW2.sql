/*
2-sqlpractice_db database içinde musteri isminde tablo oluşturunuz.
      musteri_no(integer)
      isim (string,50 karakter)
      yas (int)
      cinsiyet (string 1:K/E)
      gelir(real)
      meslek(string,20 karakter)
      sehir (string,20 karakter)

constraintler:

musteri_no:primary key, otomatik olarak artırılsın

isim:not null ve not empty,yas:18 den büyük
*/

CREATE TABLE musteri(
	musteri_no SERIAL PRIMARY KEY,
	isim VARCHAR(50) NOT NULL CHECK(isim<>''),
	yas INTEGER CHECK(yas>18),
	cinsiyet CHAR(1),
	gelir REAL,
	meslek VARCHAR(20),
	sehir VARCHAR(20)
);

-- 3-musteri tablosuna kayıt ekleyiniz.

INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir)
VALUES('ALİ', 35, 'E', 2500, 'MÜHENDİS', 'İSTANBUL');

INSERT INTO musteri(isim, yas, cinsiyet, gelir, meslek, sehir)
VALUES('BURAK',   25, 'E', 3500, 'MİMAR',       'İZMİR'),
	('CEYHUN',  45, 'E', 2000, 'MÜHENDİS',    'ANKARA'),
	('DEMET',   30, 'K', 3000, 'ÖĞRETMEN',    'ANKARA'),
	('FERHAT',  40, 'E', 2500, 'MİMAR',       'İZMİR'),
	('GALİP',   55, 'E', 4000, 'ÖĞRETMEN',    'İSTANBUL'),
	('KÖKSAL',  25, 'E', 2000, 'AVUKAT',      'İZMİR'),
	('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL'),
	('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL'),
	('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA'),
	('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA'),
	('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL'),
	('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL'),
	('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR'),
	('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR'),
	('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR'),
	('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');


/*
musteri tablosunda;

4-Tüm kayıtları listeleyiniz.

5-Tüm kayıtlardan isim ve meslek bilgilerini görüntüleyiniz
*/

SELECT * FROM musteri;

SELECT isim, meslek FROM musteri;

/*

6-sqlpractice_db databaseinde ;

“sehirler” isimli bir Table olusturun. 

Tabloda “alan_kodu”, “isim”, “nufus”  field’lari olsun.

Isim field’i null değer alamasın.

“alan_kodu” field’ini “Primary Key” yapin.

*/

CREATE TABLE sehirler(
	alan_kodu INT PRIMARY KEY,
	isim VARCHAR(50) NOT NULL,
	nufus INTEGER
);

/*

7-sqlpractice_db databaseinde;

a- “tedarikciler3” isimli bir tablo olusturun.

Tabloda “tedarikci_id”, “tedarikci_ismi”,  “iletisim_isim” field’lari olsun

“iletisim_isim”  fieldı tekrarsız olsun.

“tedarikci_id” yi Primary Key yapin.

b- “urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun

“tedarikci_id” yi Foreign Key yapin.

*/

CREATE TABLE tedarikciler3(
	tedarikci_id INT PRIMARY KEY,
	tedarikci_ismi VARCHAR(50),
	iletisim_isim VARCHAR(50) UNIQUE
);


CREATE TABLE urunler(
	tedarikci_id INT,
	urun_id INT,
	CONSTRAINT urunler_fk FOREIGN KEY(tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);






