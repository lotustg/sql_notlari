CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

--toplam salary degeri 2500 üzeri olan bir calisan icin salary toplamını bulun

select name, sum(salary) as "total_salary" 
from workers 
group by name having sum(salary)>2500 --group by ardından where kullanılmaz

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.

select state, count(state) as number_of_employees 
from workers
group by state
having count(state)>1;--having group by in ardından filitreleme için kullanılır.

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.

select state, max(salary) from workers group by state having max(salary)<3000

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.

select company, min(salary)
as min_salary from workers
group by company having min(salary)>2000


--tekrarsız isimleri cagırın
select distinct name from workers ---distinct clause, cağırılan terimlerden tekrarli olanların ilkini alır. 

--Name değerlerini company kelime uzunluklarına göre sıralayın.

select name, company from workers order by length(company)

----Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.

select concat (name, ' ', state) as name_and_state from workers -- concat birleştrimek için kullanılır
order by length(concat (name, state))  ---veya length(name) + length(state)

select name|| ' '|| state as "uzunluk" from workers order by length (name|| ' '|| state) 

-- UNION OPERATOR;
-- iki query sonucunu birleştirmek için kullanılır,
--tekrarsız (unique) recordları verir
--tek bir stuna cok sutun koyabiliriz
--tek bir sutuna cok sutun koyarken mevvcut daata durumuna dikkat etmek gerekir. 


---salary degeri 3000 den yuksek olan state degerlerini ve 2000 den kücük olan name degerlerini tekrarsız olarak bulun

select state as "name and state", salary 
from workers 
where salary>3000

union

select name, salary 
from workers 
where salary<2000;


--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.

select state as "name and state", salary 
from workers 
where salary>3000

union All --> union ile aynı isi yapar ancak tekrarli degerleri de verir

select name, salary 
from workers 
where salary<2000;

--salary degeri 1000 den yuksek 2000 den az olan "ortak" name degerlerinni bulun

select name from workers
where salary > 1000

intersect -- iki sorgu sonucunun ortak degerini verir tekrarsız recordlarii verir

select name from workers
where salary < 2000

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name from workers
where salary<2000
intersect
select name from workers
where  company in('IBM','MICROSOFT','APPLE')

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) recordları verir.

--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.

select name from workers
where salary<3000
except
select name from workers
where company='GOOGLE'

------


CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;

----

CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;


/*   JOİNS;
	1-inner join; kesişim kümesini verir. AnB (A kesişim B)
	2-left join;  sol taraftaki kısmı verir  A yi verir
	3-right join; sağ taraftakinı verir   B yi verir
	4-Full join; iki table yi da verir
	5-Self join: tek table üzerinde calısırken tek table varmış gibi calisilir	
	*/
	
	--1) INNER JOIN
	
--Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.

select mc.company_name, o.order_id, o.order_date 
from my_companies mc Inner join orders o
on mc.company_id=o.company_id;

--left join; 
--my companies tablenin daki companyler ve order_id ve order_date degerlerini cagırın
select mc.company_name, o.order_id, o.order_date 
from my_companies mc left join orders o
on mc.company_id=o.company_id;

--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.

select mc.company_name, o.company_id, o.order_date 
from my_companies mc right join orders o
on mc.company_id=o.company_id;

--FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın

select mc.company_name, o.order_id, o.order_date 
from orders o  full join my_companies mc
on mc.company_id=o.company_id;

--SELF JOIN
CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers;

--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.
select employee.name as Employee, manager.name as Manager
from workers employee Full JOIN workers manager
on employee.manager_id = manager.id;

