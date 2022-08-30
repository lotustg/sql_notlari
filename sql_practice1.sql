    --sql_practice 1--                                                                        
create table personel                                                                         
(                                                                                             
id serial primary key  ,                                                                      
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
																							  
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

select * from personel;

select isim, yas, maas from personel;

select * from personel where id=8

select isim, id, yas, email from personel where id=5

select * from personel where yas>30;

select * from personel where maas<> 21000--   21000 olmayan  ---  =! bunuda kabul ediyor

select * from personel where isim ilike  'A%';

select * from personel where isim ilike  '%n';

select * from personel where email ilike '%gmail.com'

select * from personel where email not like '%gmail.com' --null ı getirmedi.  % ile arama yaptıgımız için null gelmez

select * from personel where id=3 or id=5 or id=7 or id=9;
--veya
select * from personel where id in(3,5,7,9)

select * from personel where yas not in (39,48,54) 

select * from personel where yas between 30 and 40 --veya
select * from personel where yas > 30 and yas<40

select * from personel where yas not between 30 and 40

select * from personel where email is null;

select * from personel  order by yas;

select * from personel order by maas;

select * from personel order by yas desc;

select * from personel order by maas desc;

select * from personel order by maas desc limit 3;




