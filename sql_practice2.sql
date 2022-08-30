CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
select * from workers;

alter table workers
add company_industry varchar(20)

-- TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers add column worker_address varchar(100) default('Maimi','FL','USA');

alter table workers
drop column worker_address

-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers 
rename company_industry to company_profession

alter table workers 
rename to employees
select * from employees;

alter table employees
alter column title type varchar(50);

alter table employees
add constraint titlem unique (title);







