--AGGREGATE METHOD kullanımı

/* 
Aggregate metodları (sum,--topla count,--say min,--en kucuk deger max,--en buyuk deger avg--ortalama)
subquery içinde kullanılır 
ancak sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum ( arada bosluk olmamali)
*/
select * from calisanlar2

--calisanlar 2 tablosundaki en yüksek maas degerini listeleyin

select max(maas) from calisanlar2

-- calısanlar tablosunda maasların toplamını listeleyin
select sum(maas) from calisanlar2

--calısanlar tablosundaki maas ortalamalarını listeleyin
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2
--en dusuk maas
select min(maas) from calisanlar2

--calısanlar tablosundaki kac kisinin maas aldığını listeleyin
select count(maas) from calisanlar2

select * from markalar
--her markasnın ismini calısan sayisini ve o markaya ait calısanların toplam maasını listeleyin

select marka_isim, calisan_sayisi, 
(select sum(maas) from calisanlar2 where marka_isim=isyeri) AS toplam_maas from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum 
--ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim, calisan_sayisi, 
(select max(maas)from calisanlar2 where marka_isim=isyeri) 
as maxmaas, (select min(maas)from calisanlar2 where marka_isim=isyeri) 
as minmaas from markalar

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

select marka_id, marka_isim, (select count(sehir) from calisanlar2 where marka_isim=isyeri)
as sehir_sayisi from markalar

--Interview Question: En yüksek ikinci maas değerini çağırın.

select max(maas) AS en_yuksek_ikinci_maas from calisanlar2
where maas< (select max(maas) from calisanlar2)

--en dusuk ikinci maas
select min(maas) AS en_dusuk_ikinci_maas from calisanlar2
where maas> (select min(maas) from calisanlar2)

--en yüksek ücüncü maas degeri

select max(maas) AS en_yuksek_ucuncu_maas from calisanlar2
where maas< (select max(maas) from calisanlar2 where maas<(select max(maas) from calisanlar2))

--en dusuk ucuncu maas
select min(maas) AS en_dusuk_ucuncu_maas from calisanlar2
where maas> (select min(maas) from calisanlar2 where maas> (select min(maas) from calisanlar2))
