create database lab6;
--2
create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
     department_id SERIAL PRIMARY KEY ,
     department_name VARCHAR (50) UNIQUE ,
     budget INTEGER,
     location_id INTEGER REFERENCES locations
);

create table employees(
      employee_id SERIAL PRIMARY KEY,
      first_name VARCHAR(50),
      Last_name VARCHAR (50),
      email VARCHAR (50),
      phone_number VARCHAR(20),
      salary INTEGER,
      department_id INTEGER REFERENCES departments
);

INSERT INTO locations (street_address, postal_code, city, state_province) VALUES
                                                                              ('123 Main St', '12345', 'Springfield', 'IL'),
                                                                              ('456 Oak St', '54321', 'Shelbyville', 'IL'),
                                                                              ('789 Maple Ave', '67890', 'Capital City', 'NY');


INSERT INTO departments (department_name, budget, location_id) VALUES
                                                                   ('HR', 50000, 1),
                                                                   ('Finance', 75000, 2),
                                                                   ('IT', 100000, 1),
                                                                   ('Sales', 60000, 3),
                                                                   ('Marketing', 55000, 3);


INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
                                                                                              ('John', 'Doe', 'john.doe@example.com', '555-1234', 60000, 1),
                                                                                              ('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 65000, 2),
                                                                                              ('Jim', 'Brown', 'jim.brown@example.com', '555-8765', 70000, 3),
                                                                                              ('Jake', 'Davis', 'jake.davis@example.com', '555-4321', 55000, 4),
                                                                                              ('Jill', 'White', 'jill.white@example.com', '555-6789', 58000, 5),
                                                                                              ('Bill', 'Green', 'bill.green@example.com', '555-2468', 72000, 3),
                                                                                              ('Betty', 'Black', 'betty.black@example.com', '555-1357', 53000, NULL);

--3
select e.first_name, e.Last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

--4
select e.first_name, e.Last_name, e.department_id, d.department_name
from employees e
         join departments d on e.department_id = d.department_id
where e.department_id in (40,80) ;

--5
select e.first_name , e.last_name, d.department_name, l.city , l.state_province
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

--6
select d.department_id, d.department_name, e.employee_id, e.first_name, e.last_name
from departments d
left join employees e on d.department_id = e.department_id;

--7
select e.first_name , e.Last_name, e.department_id, d.department_name
from employees e
left join departments d on d.department_id = e.department_id;
