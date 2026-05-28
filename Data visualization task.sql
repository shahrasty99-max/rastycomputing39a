use school_db;
-- create table customers(
-- customer_id int auto_increment primary key,
-- customer_name varchar(100),
-- phone_number char(10) not null,
-- email varchar(100),
-- city varchar(100));

-- delimiter $$
-- create procedure addnewcontact(
--  in name varchar(100),
--  in s_phone char(10),
--  in s_email varchar(100),
--  in s_city varchar(100))
-- begin
-- declare exit handler for sqlexception
-- 	begin
-- 	select 'insertation fail' as status;
-- 	end;
-- 	insert into customers(customer_name,phone_number,email,city)values (name,s_phone,s_email,s_city);
-- end$$
-- delimiter $$
-- -- drop procedure  addnewcontact;
-- call addnewcontact('ram','9709876543','ram3@gmail.comm','ktm');

--   select * from customers;
 --- 2 ---------------------------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS SearchCustomer;
DELIMITER $$
CREATE PROCEDURE SearchCustomer(
    IN cname VARCHAR(100)
)
BEGIN
    SELECT * 
    FROM customers   -- use plural here
    WHERE customer_name LIKE CONCAT('%', cname, '%');
END $$
DELIMITER ;

DESCRIBE customers;
CALL SearchCustomer('ram');
SHOW PROCEDURE STATUS WHERE Db = 'school_db';
INSERT INTO customers (customer_name, email, phone_number)
VALUES 
    ('Ram Kumar', 'ram@gmail.com', '9800000000'),
    ('Sita Devi', 'sita@gmail.com', '9811111111'),
    ('Hari Ram', 'hari@gmail.com', '9822222222');
    drop procedure UpdateCustomerPhone;
DELIMITER $$
create procedure UpdateCustomerPhone(
    in cust_name VARCHAR(100),
    in new_phone VARCHAR(20)
)
begin
    UPDATE customers
    SET phone_number = new_phone
    WHERE customer_name = cust_name;
END $$
DELIMITER ;
CALL UpdateCustomerPhone('Ram Kumar', '9811223344');

delimiter $$
Create procedure DeleteCustomer(
    in cust_name VARCHAR(100)
)
begin
    DELETE FROM customers
    where customer_name = cust_name;
end $$
delimiter ;
Call DeleteCustomer('Ram Kumar');
create table contacts (
    contact_id int auto_increment primary key,
    customer_name varchar(100) not null,
    phone varchar(20) not null,
    email varchar(100),
    city varchar(100)
);

delimiter $$
create procedure add_contact(
    in cname varchar(100),
    in cphone varchar(20),
    in cemail varchar(100),
    in ccity varchar(100)
)
begin
    if cname = '' or cphone = '' then
        select 'error: name and phone cannot be empty' as message;
    else
        insert into contacts (customer_name, phone, email, city)
        values (cname, cphone, cemail, ccity);

        select last_insert_id() as contact_id,
               'contact saved successfully' as message;
    end if;
end $$
delimiter ;
call add_contact('ram kumar', '9811223344', 'ram@mail.com', 'kathmandu');

delimiter $$
create procedure search_contact(
    in partial_name varchar(100)
)
begin
    select *
    from contacts
    where customer_name like concat('%', partial_name, '%');
end $$
delimiter ;
call search_contact('ram');

delimiter $$
create procedure update_phone(
    in cid int,
    in new_phone varchar(20)
)
begin
    if exists (select 1 from contacts where contact_id = cid) then
        update contacts
        set phone = new_phone
        where contact_id = cid;

        select 'phone updated successfully' as message;
    else
        select 'error: contact not found' as message;
    end if;
end $$
delimiter ;
call update_phone(1, '9822334455');
delimiter $$
create procedure delete_contact(
    in cid int
)
begin
    if exists (select 1 from contacts where contact_id = cid) then
        delete from contacts
        where contact_id = cid;

        select 'contact deleted successfully' as message;
    else
        select 'error: contact not found' as message;
    end if;
end $$
delimiter ;
call delete_contact(1);


















  
  
  