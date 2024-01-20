--HOMEWORK 1--
/*
1) Tablo Oluşturma

filmler isminde bir tablo oluşturunuz.
film_isim(varchar(50)), tür(varchar(20)), 
süre(real), imdb(numeric(2,1)) 
sütunları olsun. 


2)  Data ekleme
a-filmler tablosuna tüm fieldlarıyla 3 tane kayıt ekleyiniz.
b-“ ogretmenler” isminde tablo olusturun.
Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet” field’lari olsun
(uygun data tiplerini kullanınız.).
“ogretmenler” tablosuna bilgileri asagidaki gibi olan kisileri ekleyin.
kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
kimlik_no: 234431224, isim: Ali Guler, brans : Fizik, cinsiyet: erkek.


3)Var olan tablodan yeni tablo oluşturmak 
 “film_imdb” isminde bir tabloyu  “filmler” tablosundan oluşturunuz.
İçinde “film_isim” ve “imdb” field’lari olsun


4) bazı fieldları olan kayıt ekleme
a-"filmler" tablosuna 
film_isim:"Ayla", “film_imdb”:9.87,
film_isim:"Shrek", “film_imdb”:9.83
olan kayıtları ekleyiniz.


b-“ogretmenler” tablosuna bilgileri 
kimlik_no: 567597624, isim: Veli Guler
olan kişiyi ekleyiniz.

*/

-- 1)

CREATE TABLE filmler(
	film_isim VARCHAR(50),
	tür VARCHAR(20), 
	süre REAL,
	imdb NUMERIC(2,1)
);


-- 2)

INSERT INTO filmler VALUES('X', 'Horror', 2.5, 8.8);
INSERT INTO filmler VALUES('Y', 'Adventure', 2, 7.2);
INSERT INTO filmler VALUES('Z', 'Sci-Fi', 1.8, 5.5);

SELECT * from filmler;

CREATE TABLE ogretmenler(
	kimlik_no INTEGER,
	isim VARCHAR(30), 
	brans VARCHAR(50),
	cinsiyet VARCHAR(10)
);

INSERT INTO ogretmenler VALUES(234431223, 'Ayse Guler', 'Matematik', 'kadin');
INSERT INTO ogretmenler VALUES(234431224, 'Ali Guler', 'Fizik', 'erkek');

SELECT * from ogretmenler;

-- 3)

CREATE TABLE film_imdb AS SELECT film_isim, imdb FROM filmler;

-- 4a)

INSERT INTO filmler (film_isim, imdb) VALUES('Ayla', 9.87);
INSERT INTO filmler (film_isim, imdb) VALUES('Shrek', 9.83);

SELECT * from filmler;

-- 4b)

INSERT INTO ogretmenler (kimlik_no, isim) VALUES(567597624, 'Veli Guler');

SELECT * from ogretmenler;




