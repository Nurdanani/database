--1--
create database lab11;
--2--
create table users(
     id int,
     firstname varchar(50),
     lastname varchar(50)

);
--3--
alter table users
    add column isadmin integer;
--4--
ALTER TABLE users
    ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING isadmin::boolean;

--5--
alter table users
    alter column isadmin set default false;
--6--
alter table users
    add primary key(id);
--7--
create table tasks(
    id  serial,
    name varchar(50),
    user_id int,
    primary key(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

--8--
drop table tasks;
--9--
drop database lab11;