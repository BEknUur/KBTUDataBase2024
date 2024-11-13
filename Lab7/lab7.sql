create database lab7;
CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    salary INTEGER,
    department_id INTEGER
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    budget INTEGER
);

Insert into countries(name)
values
('Kazakhstan'),
('Kyrgyzstan'),
('Russia'),
('Ukraine');



insert into employees(name,surname,salary,department_id)

values
('Beknur', 'Ualikhanuly', 1500000, 1),
('Abay', 'Kunanbayev', 140000, 2),
('Cristiano', 'Ronaldo', 99000000, 3),
('Lionel','Messi',12030330,4);


insert  into departments(budget)
values
(100000),
(1202020),
(2020202),
(2020202339);


--1
create index index_name
on countries(name);


--2
create index index_name_surname
on employees(name,surname);


--3
create unique index index_salary
on employees(salary);


--4
create index index_sunbstring
on employees(substring(name from 1 for 4));

--5
create index index_employees_department_join
on employees(department_id ,salary);

create index index_budget
on departments(budget);

