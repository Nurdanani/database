create database lab10;
CREATE TABLE Books(
                      book_id INTEGER PRIMARY KEY,
                      title VARCHAR,
                      author VARCHAR,
                      price DECIMAL,
                      quantity INTEGER
);


CREATE TABLE Orders(
                       order_id INTEGER PRIMARY KEY,
                       book_id INTEGER ,
                       customer_id INTEGER,
                       order_date DATE,
                       quantity INTEGER,
    foreign key (book_id) references Books(book_id)
);


CREATE TABLE Customers(
                          customer_id INTEGER PRIMARY KEY,
                          name VARCHAR,
                          email VARCHAR
);


INSERT INTO Books VALUES
                      (1, ' Database 101', 'A. Smith', 40.00, 10),
                      (2, 'Learn SQL', 'B.Johnson', 35.00, 15),
                      (3, 'Advanced DB', 'C.Lee', 50.00, 5);

INSERT INTO Customers VALUES
                          (101, 'John Doe', 'johndoe@example.com'),
                          (102, 'Jane Doe', 'janedoe@example.com');


--1
begin transaction ;
insert into Orders(order_id, book_id, customer_id, order_date, quantity)
values (1, 1, 101, current_date, 2 );

update Books
set quantity = quantity-2
where book_id = 1;
commit;

--2
do $$
    begin
        if (select quantity from books where book_id = 3) >= 10 then
            insert into orders(order_id, book_id, customer_id, order_date, quantity)
            values (5, 3, 10, current_date, 10);

            update books
            set quantity = quantity - 10
            where book_id = 3;

            commit;
        else
            rollback;
        end if;
    end $$;




--3

set transaction isolation level read committed ;
begin;
update Books
set price = price*1.5
where book_id =1;

commit;

--3.2
begin;
set transaction isolation level read committed ;
select price from Books where book_id=1;
commit;
select price from Books where book_id=1;



--4
begin;
update Customers
set email = 'nnn_email@exxxxx.com'
where customer_id= 101;
commit;

select email from Customers where customer_id=101;


