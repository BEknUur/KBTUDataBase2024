--2task
CREATE  table users(
    id serial primary key,
    firstname varchar(50),
    lastname varchar(50)
);

--3 TASK
alter table users
add column isadmin int   check   (isadmin in(0,1));

--4TASK
alter table users
drop constraint  users_isadmin_check

alter table users
alter column isadmin type boolean
using isadmin::boolean;

--5TASK
alter table users
alter column isadmin set  default  true;

alter table users
add constraint users_pkey  primary key (ID);

create  table tasks(
    id serial primary key ,
    name varchar(50),
    user_id integer
);

DROP  table tasks;
