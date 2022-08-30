--IS NULL, IS NOT NULL, COALESCE--
/* 
İS NULL VE İS NOT NULL BOOLEAN OPERATORLERİDİR. BİR İFADENİN NUL OLUP OLMADIĞINI KONTROL EDER.
COALESCE (birleştirme) bir fonksiyondur ve içerisindeki parametrelerden Null olmayan ilk ifadeyi dondurur.

*/
CREATE TABLE insanlar (
ssn CHAR(9),	-- Social Security Number	
isim VARCHAR(50), 	adres VARCHAR(50) );
	
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select* from insanlar where isim is null 

update insanlar
set isim ='no name' 
where isim is null

select * from insanlar

update insanlar 
set isim=null
where isim= 'no name'

--coklu degisimlede her değişim için SET....WHERE isim is NULL gibi ifade yazmamak için
--COALESCE (birleştirme) kullanılır.

/* isimi null olanlara henüz isim girilmedi
adresi null olanlara henüz aders girilmedi
ssn i nul olanlara no ssn atayalim */

update insanlar
set isim =coalesce (isim, 'Henüz isim girilmedi'),
adres= coalesce (adres, 'Henüz adres gitilmedi'),
ssn = coalesce (ssn, 'No SSN');

