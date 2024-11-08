
--1
create index index_name
on countries(name);

--2
create index index_name_surname
on emplyees(name,surname);


--3
create unique index index_salary
on employees(salary);
--4
create index index_name_prefix
on employees(substring(name from 1 for 4));
--5
create index index_employees_department_join
on employees(department_id ,salary);

create index index_budget
on employees(budget);
