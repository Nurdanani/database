--1--
create database lab2;
--2--
create table countries(
    country_id serial primary key,
    country_name varchar(200),
    region_id int,
    population int


);
--3--
insert into countries ( country_name, region_id, population)
VALUES ('USA', '2', '2000000');
--4--
insert into countries( country_name, region_id)
values('Russia', '1');

--5--
update countries
set region_id=NULL
where country_id=1;

--6--
insert into countries(country_name, region_id, population  ) VALUES
  ('Germany' , 3, 890000),
  ('Brasil', 5,9500000 ),
  ('Canada', 8, 19000000);

--7--
alter table countries alter column country_name set default 'Kazakhstan';
--8--
insert into countries(region_id, population) values (3, 560000);
--9--
insert into countries(country_name, region_id, population) values(default, default, default);
--10--
create table countries_new  (LIKE  countries);
--11--
insert into countries_new select*from countries;
--12--
update countries
set region_id=1
where region_id is NULL;
--13--
SELECT  population * 1.1 AS "'New Population'" FROM countries;
--14--
delete
from countries
where population<100000;
--15--
DELETE FROM countries_new
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING countries_new.*;

--16--
delete from countries
RETURNING *;