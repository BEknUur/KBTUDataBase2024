create  table countries(
    country_id serial primary key ,
    country_name varchar(255),
    region_id integer,
    population integer
);
insert into countries(country_name, region_id, population) values('Germany',10,13200000);

select * from countries;
insert into countries(country_id,country_name)values(2,'France');

insert into countries(country_name, region_id, population) values('Spain',NULL,1450000);


insert into countries(country_name, region_id, population)
VALUES
('Russia',14,16700000),
('Argentina',15,565000),
('Brazil',16,40924424);

INSERT INTO countries (country_name, region_id, population)
VALUES (default,default,default);

CREATE TABLE countries_new as table countries;

select  * from countries_new;

update countries
set region_id=1
where region_id is null;

select * from countries;

select country_name,
population*1.1 as "New population"
from countries;

delete  from countries
where population<100000;


DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

select * from countries_new


DELETE FROM countries;


-- Some issues when i paste as default value for Kazakhstan