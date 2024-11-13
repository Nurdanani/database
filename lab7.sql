create database lab7;

CREATE TABLE countries (
                           name VARCHAR(100)
);

DO
$$
    DECLARE
        i INTEGER := 0;
    BEGIN
        WHILE i < 1000000
            LOOP
                INSERT INTO countries (name)
                VALUES (md5(random()::text));
                i := i + 1;
            END LOOP;
    END
$$;

CREATE TABLE employees (
                           name VARCHAR(100) ,
                           surname VARCHAR(100) ,
                           department_id INT,
                           salary FLOAT
);

CREATE TABLE departments (
                             department_id SERIAL PRIMARY KEY,
                             name VARCHAR(100),
                             budget FLOAT
);

drop table countries;

--1
create index idx_countries_name on countries(name);
SELECT * FROM countries WHERE name = 'france';
--2
create index idx_employees_name_surname on employees(name, surname);
--SELECT * FROM employees WHERE name = ‘string’ AND surname = ‘string’;

--3
create unique index idx_employees_salary_range on employees(salary);
--SELECT * FROM employees WHERE salary < value1 AND salary > value2;
--4
create index idx_employees_name_substring on employees (substring(name from 1 for 4));
-- SELECT * FROM employees WHERE substring(name from 1 for 4) = ‘abcd’;
--5
create index idx_employees_department_id_salary on employees(department_id, salary);
create index idx_departments_department_id on departments(budget);
/*seLECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id WHERE
d.budget > value2 AND e.salary < value2;*/
