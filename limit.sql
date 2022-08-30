--LİMİT--

--kisiler tablosundan ilk 5 veriyi listeleyiniz

select * from kisiler limit 5

--- ilk iki veriden sonra ilk 5 veriyi listeleyin

select * from kisiler  limit 5 offset 2

--id degeri 5 ten buyuk olan iki veriyi listeleyin

select * from kisiler where id>5 limit 2

--maası en yuksek 3 kisinin bilgilerini listeleyin

select * from kisiler order by maas desc limit 3

-- -- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz

select * from kisiler order by maas desc limit 3 offset 3
