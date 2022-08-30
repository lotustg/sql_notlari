--select - similar to - regex(regular expressions)--

/*
similar to: daha karmaşık pattern()kalıp sorgulama işlemi için similar to kullanılabilir
sadece postgreSQL de kullanılır. butuk kucuk harf onemlidir. 
regex: herhangi bir kod,metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir soz dizimi olan bir yapıdır.(my SQL'de REGEXP_LİKE olarak kullanılır) postgreSQL'de ~ karak
teri ile kullanılır
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   
   --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   select * from kelimeler;
   
select * from kelimeler where kelime similar to '%(ot|at)%'
   
	   select * from kelimeler where kelime ~*'ot' or kelime ~*'at';
	   
	   select * from kelimeler where kelime similar to 'ho%|hi%';
	   
	   --regex ile;
	   
select * from kelimeler where kelime ~*'h[oi](.*)'   --regexte . (nokta bir karakteri temsil eder)
--regex te ikinci karakter için köşeli parantez[] kullanılır.	   

select * from kelimeler where kelime similar to '%t|%m';
--regex ile
select * from kelimeler where kelime ~*'.*[tm]$';  --$ işareti bitişi gösterir.

select * from kelimeler where kelime like 'h_t';
--similar to ile;
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
--regex ile;
select * from kelimeler where kelime ~*'h[a-z,A-Z,0-9]t';

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye
   --herhangi bir karakter olan “kelime" değerlerini çağırın.
select * from kelimeler where kelime similar to 'h[a-e]%t';
select kelime from kelimeler where kelime ~*'h[a-e](.*)t';

--select * from kelimeler where kelime like 'h(a%,e)t';

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın
select * from kelimeler where kelime ~'^[say](.*)'

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$';
select * from kelimeler where kelime ~ '^h[ai]t$'
select * from kelimeler where kelime similar to 'h(a|i)t'

--İlk harfi 'b' dan ‘b' ye bir karakter olan ve ikinci harfi herhangi bir karakter 
---olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select * from kelimeler where kelime ~'^[b-s].l(.*)';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime like '%o%o%';
select * from kelimeler where kelime similar to '%[o][o]%';

select * from kelimeler where kelime similar to '%[o]{2}%';

select * from kelimeler where kelime similar to '%[o]{4}%';

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[asy].[mf]$'
select * from kelimeler where kelime similar to '%[a|s|y](.*)[m|f]$';

	   