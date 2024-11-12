create database lab7;

CREATE TABLE countries (
                           country_id SERIAL PRIMARY KEY,
                           name VARCHAR(100)
);

CREATE TABLE employees (
                           employee_id SERIAL PRIMARY KEY,
                           name VARCHAR(100) ,
                           surname VARCHAR(100) NOT NULL,
                           department_id INT,
                           salary FLOAT
);

CREATE TABLE departments (
                             department_id SERIAL PRIMARY KEY,
                             name VARCHAR(100),
                             budget FLOAT
);

INSERT INTO countries (name) VALUES
                                                   ('Kazakhstan'),
                                                   ('Russia'),
                                                   ('United States');

INSERT INTO departments (name, budget) VALUES
                                           ('Engineering', 1000000),
                                           ('Marketing', 500000),
                                           ('Sales', 750000);

INSERT INTO employees (name, surname, department_id, salary) VALUES
                                                                            ('John', 'Doe', 1, 75000),
                                                                            ('Jane', 'Smith', 2, 55000),
                                                                            ('Michael', 'Brown', 1, 80000),
                                                                            ('Emily', 'Davis', 3, 65000),
                                                                            ('Jessica', 'Wilson', 2, 60000);


--1
create index idx_countries_name on countries(name);
--2
create index idx_employees_name_surname on employees(name, surname);
--3
create unique index idx_employees_salary_range on employees(salary);
--4
create index idx_employees_name_substring on employees (substring(name from 1 for 4));
--5
create index idx_employees_department_id_salary on employees(department_id, salary);
create index idx_departments_department_id on departments(budget);