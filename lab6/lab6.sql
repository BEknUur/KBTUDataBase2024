Create database lab6;
create table locations(
    location_id SERIAL PRIMARY KEY ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);


create table departments(
    department_id serial primary key,
    department_name varchar(50) unique ,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references  departments
);


insert into locations(street_address, postal_code, city, state_province)
values
('TurgytOzala','12345','Almaty','Al'),
('IslamKarimova70','2309','Almaty','Au'),
('Burova20','1111','Oskemen','Vo'),
('Irtish4','770','Oskemen','Ea'),
('Rayimbek590','13','Almaty','Na');

insert into departments(department_name, budget, location_id)
values
('Sales',160000,1),
('Marketing',250000,2),
('Engineering',500000,3),
('Hr',450000,4),
('Finance',800000,5);

insert into employees(first_name, last_name, email, phone_number, salary, department_id)
values
('Beknur','Ualikhanuly','ualikhanulybeknur@gmail.com','87716252863',120000,1),
('Aisha','Bakbergenova','bkztx@gmail.com','87771761302',70000,2),
('Bekzat','Saparbekov','bekzat070@gmail.com','87071012006',500000,3),
('Turarbek','Satbaldiev','satuka@bk.ru','87756553005',150000,4),
('Bekzat','Shayirgozha','bekzat@shairgozha@gmail.com','87769713547',98000,5);


--3
select e.first_name,e.last_name,e.department_id,d.department_name
from employees e
join departments d on e.department_id = d.department_id;



--4
    select e.first_name,e.last_name,e.department_id,d.department_name
    from employees e
    join departments d on e.department_id=d.department_id
                         where  e.department_id=80 or e.department_id=40;

--5
select first_name,last_name,department_name,city,state_province
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

--6
    select  * from departments d
    left join employees e on d.department_id = e.department_id;

--7
select e.first_name,e.last_name,d2.department_id,d2.department_name
    from employees e
left join departments d2 on e.department_id = d2.department_id

