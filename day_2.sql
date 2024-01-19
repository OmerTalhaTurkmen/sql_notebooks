--------------------- DAY 2 ---------------------

-------------------- Review ---------------------

CREATE TABLE IF NOT EXISTS authors(
	id INTEGER,
	name VARCHAR(30),
	email VARCHAR(50)
);

INSERT INTO authors VALUES(1001, 'Necip Fazil', 'sair@gmail.com');
INSERT INTO authors VALUES(1001,'Nazım Hikmet','sair@mail.com');

INSERT INTO authors (name) VALUES('Atilla Ilhan');

SELECT *
FROM authors;

-- 9) Tabloya UNIQUE Constraint'i ekleme

CREATE TABLE programmers(
	id SERIAL,
	name VARCHAR(30),
	email VARCHAR(50) UNIQUE,
	salary REAL,
	prog_lang VARCHAR(20)
);

INSERT INTO programmers(name, email, salary, prog_lang) VALUES('Tom', 'mail@mail.com', 5000, 'Java');
INSERT INTO programmers(name, email, salary, prog_lang) VALUES('Jerry', 'mail@mail.com', 6000, 'JavaScript');
-- email must be unique
INSERT INTO programmers(email, salary, prog_lang) VALUES('mail3@mail.com', 6000, 'JavaScript');

SELECT * FROM programmers;

-- 10) Tabloya NOT NULL constraint'i ekleme

CREATE TABLE doctors(
	id SERIAL,
	name VARCHAR(30) NOT NULL,
	salary REAL,
	email VARCHAR(50) UNIQUE
);

INSERT INTO doctors(name, salary, email) VALUES('Dr. Gregory House', 6000, 'dr@mail.com');
INSERT INTO doctors(salary, email) VALUES(6000, 'doctor@mail.com');
-- name field cannot be null
INSERT INTO doctors(name, salary, email) VALUES('', 6000, 'doc@mail.com');

SELECT * from doctors

/*
CREATE TABLE y(
	name VARCHAR(30) NOT NULL CHECK (name <> '')
);

INSERT INTO y VALUES('')

SELECT * from y

*/

-- 11a) Tabloya Primary Key Constraint'i ekleme

CREATE TABLE students2(
	id INTEGER PRIMARY KEY, -- NOT NULL, UNIQUE, basla bir tablo ile iliskilendirilebilir
	name VARCHAR(50),
	grade REAL,
	register_date DATE
);

SELECT * FROM students2;

-- 11b) Baska bir sekilde PK CONSTRAINT ekleme yolu

CREATE TABLE students3(
	id INTEGER,
	name VARCHAR(50),
	grade REAL,
	register_date DATE,
	CONSTRAINT std_pk PRIMARY KEY(id) -- CONSTRAINT ile kisitlamaya custom isim verilebilir (optional)
);

SELECT * FROM students3;

--composite key

CREATE TABLE students4(
id INTEGER, --PK
name VARCHAR(50), --PK
grade REAL,
register_date DATE,
CONSTRAINT std4_pk PRIMARY KEY(id,name) -- CONSTRAINT ile kısıtlamaya özel isim verilebilir, zorunlu değildir
);

-- 12) Tabloya FOREIGN KEY Ekleme

CREATE TABLE address3(
	address_id INTEGER,
	street VARCHAR(50),
	city VARCHAR(20),
	student_id INTEGER,
	CONSTRAINT add_fk FOREIGN KEY(student_id) REFERENCES students3(id)
);

SELECT * FROM address3;

CREATE TABLE address2(
	address_id INTEGER,
	street VARCHAR(50),
	city VARCHAR(20),
	student_id INTEGER,
	FOREIGN KEY(student_id) REFERENCES students3(id)
);

SELECT * FROM address2;

-- 13) Tabloya CHECK Constraint'i ekleme

CREATE TABLE person(
	id INTEGER,
	name VARCHAR(50),
	salary REAL CHECK(salary>5000),
	age INTEGER CHECK(age>0)
);

INSERT INTO person VALUES(11, 'Ali Can', 6000, 23);

SELECT * FROM address2;



