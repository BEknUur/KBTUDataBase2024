create database  lab9;


create table employees(
first_name text,
last_name text,
salary int
);
insert into employees(first_name, last_name, salary)
values
('Beknur','Ualikhanuly',200000),
('asdfg','asd',3003030),
('Bekzat','Saparbek',229292);


create table products(
    product_id serial,
    name text,
    category text,
    price int
);
insert into products(name, category, price)
values
('Phone','Electronics',100000),
('Table','Furniture',10000),
('Laptop','Electronics',250000);


--1

create or replace function  increase_value(
    num integer
)
returns integer as
$$
begin
    return num+10;
end;


    $$
language  plpgsql;

select increase_value(10);


--2

create or replace  function compare_numbers(
    a integer ,b integer ,out  result text
)
as $$
    begin
        if a>b then
            result:=' Greater';
        elsif a<b then
            result:='Lesser';
        else
            result:=' Equal';
            end if;
    end;
    $$
language  plpgsql;

select compare_numbers(10,20);


--3
create or replace function number_series(
    n integer
)
returns table(series integer)as
$$
BEGIN
    for series in 1..n loop
        return query  select series;
        end loop;
end;
    $$
language  plpgsql;

select * from number_series(10);


--4
create or replace  function  find_employee(
    name text
)
returns table(first_name text, last_name text ,salary int)as
    $$
begin
    return query select * from employees where (name=employees.first_name);
end;
$$
language  plpgsql;

select * from find_employee('Beknur');



--5

create or replace function list_products(
    given_category text
)
returns table(product_id int,name text,category text,price int)as
    $$
    begin
        return  query
        select * from products where given_category=products.category;
    end;
    $$
language  plpgsql;


select * from list_products('Furniture');



--6
create or replace  function  calculate_bonus(name text)
returns int as
$$
    declare
        bonus int;
begin
        select salary*0.10 into bonus from employees
        where employees.first_name=name;
        return bonus;
    end;
    $$
language  plpgsql;

create or replace  function  update_salary(name text)
returns void  as
    $$
declare
    bonus int;
    begin
    bonus:=calculate_bonus(name);
    update employees
    set salary=salary+bonus
    where name=employees.first_name;
end;
    $$
language  plpgsql;
select * from calculate_bonus('Beknur');
select * from update_salary('Beknur');

select * from employees;


--7
CREATE OR REPLACE PROCEDURE complex_calculation(input_number INTEGER, input_string VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
    result_string VARCHAR;
    result_number INTEGER;
    final_result VARCHAR;
BEGIN
    <<main>>
    BEGIN
        <<work_with_string>>
        DECLARE
            reversed_string VARCHAR;
        BEGIN
            reversed_string := REVERSE(input_string); -
            result_string := 'Reversed_string: ' || reversed_string;
        END work_with_string;

      
        <<work_with_num>>
        DECLARE
            square INTEGER;
        BEGIN
            square := input_number * input_number; 
            result_number := square;
        END work_with_num;

        
        final_result := result_string || ' ; Squared number: ' || result_number;
        RAISE NOTICE 'Final Result: %', final_result; 
    END main;
END;
$$;


CALL complex_calculation(10, 'Beknur');
