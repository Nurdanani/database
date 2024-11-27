create database lab9;

--1
create or replace function increase_value (a integer) returns integer as
    $$
    begin
        return a*10;
    end;
    $$ language plpgsql;
select increase_value(5);

--2
create or replace function compare_numbers(a int , b int ) returns varchar  as
    $$
    begin
      if a>b then
        return 'Greater';
      elseif a = b then
      return 'Equal';
      else
       return 'Lesser';
       end if;
    end;
    $$ language plpgsql;

select compare_numbers(5 , 8);

--3
create or replace function number_series(n int ) returns setof integer as
    $$
declare
    i integer :=1;
begin
   while i<= n loop
     return next i;
     i := i+1;
   end loop;
   return;
end;
$$ language plpgsql;

SELECT * FROM number_series(5);

--4
create table employee (
                          id SERIAL,
                          name VARCHAR(100),
                          salary FLOAT
);

INSERT INTO employee (name, salary) VALUES
                                        ('John', 50000),
                                        ('Anne', 60000),
                                        ('Alan', 55000);

create or replace function find_employee(e_name VARCHAR)
    returns table  (id INTEGER, name VARCHAR, salary FLOAT) as $$
BEGIN
    return query
        select  id, name, salary
        from employee
        where  name = e_name;
END;
$$ language plpgsql;

select * from find_employee('John');

drop function  find_employee;
drop table employee;

--5

CREATE TABLE products (
                          id SERIAL,
                          name VARCHAR(100),
                          category VARCHAR(100),
                          price float
);

INSERT INTO products (name, category, price) VALUES
                                                 ('Product1', 'Category1', 10.00),
                                                 ('Product2', 'Category1', 20.00),
                                                 ('Product3', 'Category2', 30.00);

create or replace function list_products(p_category VARCHAR)
    returns table  (id int, name varchar, price float) as $$
BEGIN
    return query
        select  id, name, price
        from  products
        where  category = p_category;
END;
$$ language plpgsql;

select * from list_products('Category1');

--6

create or replace function calculate_bonus(e_id int)
    returns float as $$
declare
    e_salary  float;
    bonus float;
BEGIN
    select salary into e_salary from employee where id = e_id;
     bonus := e_salary * 0.05;
    return bonus;
END;
$$ language plpgsql;


create or replace function update_salary(emp_id int )
    returns void as $$
declare
    bonus float;
BEGIN
    bonus := calculate_bonus(emp_id);
    update  employee set salary = salary + bonus where  id = emp_id;
END;
$$ language plpgsql;

select  update_salary(1);

select * from  employee where id = 1;


--7
create or replace function complex_calculation(n int , a varchar) returns varchar as
    $$
    declare
        res1 int;
        res2 varchar;
        final varchar;
    begin
        res1 := n*2;
        res2 := a || ' by 2';
        final := 'number ' || res1 ||' is '|| res2;
        return final ;
    end;
    $$ language plpgsql;

select * from complex_calculation(5, 'divided');