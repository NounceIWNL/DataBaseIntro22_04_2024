//sozdanie files
sqlite> .open dataBase.db
sqlite> .open DB.dbi

//check raspolozhenie
sqlite> .databases
main: C:\Users\gk\Downloads\DB.dbi r/w

//sozdanie table
sqlite> create table Mails (mail string);

//check kak looks schema
sqlite> .schema Mails
CREATE TABLE Mails (mail string);

//check nazvanie
sqlite> .tables
Mails

//dobavlenie String v file
sqlite> insert into Mails (mail) values('qwerty@gmail.com')


select name, mail, phone from users 
inner join users_info on users.id=users_info.id 
inner join mails_phones on users_info.mails_phones_id=mails_phones.id 
inner join mails on mails_phones.mail_id=mails.id
inner join phones on mails_phones.phone_id=phones.id; 

select mail, phone from mails
inner join mails_phones on mails_phones.mail_id=mails.id 
inner join phones on mails_phones.phone_id=phones.id; 

--вывести все неповторяющиеся mail
select distinct mail from mails;

CREATE TABLE IF NOT EXISTS "umails" (id integer primary key autoincrement, mail text unique);

--вывести пользователей с аккаунтом gmail
select mail from mails where mail like '%gmail%';
select mail from mails where mail not like '%gmail%';
select upper(mail) from mails where mail like '%gmail%';
pragma encoding;
--glob is case sensetive;
--like is insensetive;
select mail 

--Вывести пользователей с аккаунтом gmail и российским кодом телефона
select name, mail, phone from users 
inner join users_info on users.id=users_info.id 
inner join mails_phones on users_info.mails_phones_id=mails_phones.id 
inner join mails on mails_phones.mail_id=mails.id
inner join phones on mails_phones.phone_id=phones.id
where mail like '%gmail%' and phone like '___45%';

select u.id,u.name,m.id, m.mail, phone from users as u 
inner join users_info on u.id=users_info.id 
inner join mails_phones on users_info.mails_phones_id=mails_phones.id 
inner join mails as m on mails_phones.mail_id=m.id
inner join phones on mails_phones.phone_id=phones.id; 


select * from mails where mail match 


--СОЗДАНИЕ ТАБЛИЦ

drop table if exists employer;
drop table if exists salary_grade;
drop table if exists department;

CREATE TABLE employer (
                           id integer not null primary key autoincrement,
                           name varchar(15) not null,
                           job varchar(10),
                           manager_id integer,
                           hire_date text,
                           salary float,
                           commission float,
                           department_id integer);

CREATE TABLE department (
                      id integer not null primary key autoincrement,
                      name varchar(20) not null,
                      location varchar(15));

CREATE TABLE salary_grade (
                       grade integer,
                       min_salary integer,
                       max_salary integer);







--ЗАПОЛНЕНИЕ ТАБЛИЦ

BEGIN;
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id) 
 values (68319,'KAYLING','PRESIDENT',null,'1991-11-18',6000.00,null,1001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
values (66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00,null, 3001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
values (67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550.00, null, 1001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957.00, null, 2001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00, null, 2001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100.00, null, 2001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.00, null, 2001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (64989, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00, 3001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (65271, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00, 3001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00, 3001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (68454, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00, 3001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, null, 2001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050.00, null, 3001);
insert into employer(id,name,job,manager_id,hire_date,salary,commission,department_id)
 values (69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, null, 1001);

insert into department (id,name,location) values (1001, 'FINANCE', 'SYDNEY');
insert into department (id,name,location) values (2001, 'AUDIT', 'MELBOURNE');
insert into department (id,name,location) values (3001, 'MARKETING', 'PERTH');
insert into department (id,name,location) values (4001, 'PRODUCTION', 'BRISBANE');

insert into salary_grade (grade,min_salary,max_salary) values (1,800,1300);
insert into salary_grade (grade,min_salary,max_salary) values (2,1301,1500);
insert into salary_grade (grade,min_salary,max_salary) values (3,1501,2100);
insert into salary_grade (grade,min_salary,max_salary) values (4,2101,3100);
insert into salary_grade (grade,min_salary,max_salary) values (5,3101,9999);
commit; 





--Запросы:
--суммарная зарплата всех менеджеров (MANAGER)

select sum(salary) from employer where job='MANAGER';

--Напишите запрос в SQL, чтобы отобразить общую зарплату сотрудников, относящихся к 3 классу.

select sum(salary) from employer where job='MANAGER';
--Перечислить сотрудников в отделе 1001, чья зарплата превышает среднюю зарплату сотрудников в отделе 2001
--Напишите запрос в SQL, чтобы отобразить сотрудников, имя менеджера которых JONAS

select name from employer where name like '%JONAS%';



-----06.05.2024------



select employer.id, employer.name, employer.job,employer.salary,
department.name, department.location from employer
	join department on department.id=employer.department_id where (job like 'manager' or job like 'analyst')
	and (location like 'sydney' or location like 'perth'); 
	
	
drop table salary;
create temp table salary as select e2.department_id, avg(salary) as mean 
from employer as e2 group by e2.department_id; 

select e1.id, name, salary, t.mean from employer as e1 inner join salary as t
on t.department_id=e1.department_id; 

select distinct e1.id, e1.name from employer as e1
inner join employer as e2 where e1.id=e2.manager_id; 

-----выбрать менеджера каждого сотрудника-----
select id, name from employer
where id in(select manager_id from employer);



create temp table salaries as(select e2.department_id int, mean float) as;


--Name, Position--
create view emp_dep as select e.name, e.job, d.name
 as department from employer as e inner join department as d on e.department_id=d.id;
 
 
 ----index-----
 create index idx_name on employer(name);
 
 
 ---explain----
 explain query plan select name from employer;
 explain query plan select name, salary from employer;
 explain query plan select * from employer;
 explain query plan select name from employer where name glob 'A*';
 
 ----trigger----

 drop table if exists new_employer;
 drop trigger if exists trg_new_employer;
 CREATE TABLE new_employer (id integer not null primary key autoincrement,
                            name varchar(15) not null);
 create trigger trg_insert_employer after insert on employer
 begin
 insert into new_employer(name) values (new.name);
  end; 
  
  
  
 ----example-----
drop table if exists inventory;
drop table if exists character;
drop table if exists race;
drop table if exists class;
drop table if exists item;

CREATE TABLE character (
                           id integer not null primary key autoincrement,
                           name text not null,
                           race_id integer,
                           class_id integer);

CREATE TABLE race (
                      id integer not null primary key autoincrement,
                      name text not null);

CREATE TABLE class (
                       id integer not null primary key autoincrement,
                       name text not null);

CREATE TABLE item (
					id integer not null primary key autoincrement,
                    name text not null,
                    price integer default 0, 
					weight float,
                    rarity integer default 1,
                    maximum integer default 1,
					check(rarity>=1 and rarity<=5));

CREATE TABLE inventory (
                           id integer not null primary key autoincrement,
                           character_id integer,
                           item_id integer); 
BEGIN;
INSERT INTO character(name, race_id, class_id) VALUES('Dorath',2,4);
INSERT INTO character(name, race_id, class_id) VALUES('Eoner',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Loruthan',5,1);
INSERT INTO character(name, race_id, class_id) VALUES('Garndal',6,1);
INSERT INTO character(name, race_id, class_id) VALUES('Doriolin',2,3);
INSERT INTO character(name, race_id, class_id) VALUES('Werunth',5,5);
INSERT INTO character(name, race_id, class_id) VALUES('Throk',3,3);
INSERT INTO character(name, race_id, class_id) VALUES('Melkorn',3,1);
INSERT INTO character(name, race_id, class_id) VALUES('Eldron',4,2);
INSERT INTO character(name, race_id, class_id) VALUES('Meralia',6,6);
INSERT INTO character(name, race_id, class_id) VALUES('Alwund',1,6);
INSERT INTO character(name, race_id, class_id) VALUES('Yverath',3,3);
INSERT INTO character(name, race_id, class_id) VALUES('Dorath',6,2);
INSERT INTO character(name, race_id, class_id) VALUES('Oristor',5,1);
INSERT INTO character(name, race_id, class_id) VALUES('Loruthan',2,4);
INSERT INTO character(name, race_id, class_id) VALUES('Melkorn',3,2);
INSERT INTO character(name, race_id, class_id) VALUES('Eltharien',4,5);
INSERT INTO character(name, race_id, class_id) VALUES('Tarathiel',4,3);
INSERT INTO character(name, race_id, class_id) VALUES('Dorath',4,5);
INSERT INTO character(name, race_id, class_id) VALUES('Galeron',4,1);
INSERT INTO character(name, race_id, class_id) VALUES('Tarathiel',5,4);
INSERT INTO character(name, race_id, class_id) VALUES('Zuroth',5,5);
INSERT INTO character(name, race_id, class_id) VALUES('Throk',4,4);
INSERT INTO character(name, race_id, class_id) VALUES('Turin',3,2);
INSERT INTO character(name, race_id, class_id) VALUES('Turin',6,6);
INSERT INTO character(name, race_id, class_id) VALUES('Doriolin',6,5);
INSERT INTO character(name, race_id, class_id) VALUES('Eoren',5,2);
INSERT INTO character(name, race_id, class_id) VALUES('Melron',5,5);
INSERT INTO character(name, race_id, class_id) VALUES('Melron',3,3);
INSERT INTO character(name, race_id, class_id) VALUES('Turimbar',6,4);
INSERT INTO character(name, race_id, class_id) VALUES('Garndal',5,4);
INSERT INTO character(name, race_id, class_id) VALUES('Eoren',4,4);
INSERT INTO character(name, race_id, class_id) VALUES('Eoner',4,4);
INSERT INTO character(name, race_id, class_id) VALUES('Melion',4,6);
INSERT INTO character(name, race_id, class_id) VALUES('Reolath',1,1);
INSERT INTO character(name, race_id, class_id) VALUES('Njorn',2,3);
INSERT INTO character(name, race_id, class_id) VALUES('Doriolin',6,2);
INSERT INTO character(name, race_id, class_id) VALUES('Throk',5,4);
INSERT INTO character(name, race_id, class_id) VALUES('Melron',4,5);
INSERT INTO character(name, race_id, class_id) VALUES('Eldron',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Dorath',1,2);
INSERT INTO character(name, race_id, class_id) VALUES('Eldron',3,2);
INSERT INTO character(name, race_id, class_id) VALUES('Dorath',4,3);
INSERT INTO character(name, race_id, class_id) VALUES('Theolas',3,1);
INSERT INTO character(name, race_id, class_id) VALUES('Relath',1,1);
INSERT INTO character(name, race_id, class_id) VALUES('Sharian',4,6);
INSERT INTO character(name, race_id, class_id) VALUES('Alwund',6,5);
INSERT INTO character(name, race_id, class_id) VALUES('Eoren',1,2);
INSERT INTO character(name, race_id, class_id) VALUES('Melron',6,1);
INSERT INTO character(name, race_id, class_id) VALUES('Dalior',2,2);
INSERT INTO character(name, race_id, class_id) VALUES('Theolas',5,6);
INSERT INTO character(name, race_id, class_id) VALUES('Zuroth',6,5);
INSERT INTO character(name, race_id, class_id) VALUES('Eoren',3,5);
INSERT INTO character(name, race_id, class_id) VALUES('Harelath',5,6);
INSERT INTO character(name, race_id, class_id) VALUES('Elthar',1,2);
INSERT INTO character(name, race_id, class_id) VALUES('Eoner',1,4);
INSERT INTO character(name, race_id, class_id) VALUES('Turimbar',1,2);
INSERT INTO character(name, race_id, class_id) VALUES('Maiel',1,5);
INSERT INTO character(name, race_id, class_id) VALUES('Eoner',3,1);
INSERT INTO character(name, race_id, class_id) VALUES('Deraldorio',6,1);
INSERT INTO character(name, race_id, class_id) VALUES('Eoren',1,5);
INSERT INTO character(name, race_id, class_id) VALUES('Njorn',4,5);
INSERT INTO character(name, race_id, class_id) VALUES('Doriolin',6,3);
INSERT INTO character(name, race_id, class_id) VALUES('Werunth',6,6);
INSERT INTO character(name, race_id, class_id) VALUES('Deraldorio',3,4);
INSERT INTO character(name, race_id, class_id) VALUES('Loruthan',6,5);
INSERT INTO character(name, race_id, class_id) VALUES('Relath',3,6);
INSERT INTO character(name, race_id, class_id) VALUES('Werunth',1,5);
INSERT INTO character(name, race_id, class_id) VALUES('Oristor',5,6);
INSERT INTO character(name, race_id, class_id) VALUES('Theolas',1,1);
INSERT INTO character(name, race_id, class_id) VALUES('Melkorn',5,1);
INSERT INTO character(name, race_id, class_id) VALUES('Dorath',6,3);
INSERT INTO character(name, race_id, class_id) VALUES('Vuldred',2,4);
INSERT INTO character(name, race_id, class_id) VALUES('Werunth',3,3);
INSERT INTO character(name, race_id, class_id) VALUES('Eldron',1,2);
INSERT INTO character(name, race_id, class_id) VALUES('Eoner',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Elthar',6,6);
INSERT INTO character(name, race_id, class_id) VALUES('Garndal',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Maiel',4,2);
INSERT INTO character(name, race_id, class_id) VALUES('Maiel',3,3);
INSERT INTO character(name, race_id, class_id) VALUES('Sharian',5,2);
INSERT INTO character(name, race_id, class_id) VALUES('Doriolin',1,6);
INSERT INTO character(name, race_id, class_id) VALUES('Njorn',2,6);
INSERT INTO character(name, race_id, class_id) VALUES('Werunth',3,3);
INSERT INTO character(name, race_id, class_id) VALUES('Oristor',1,5);
INSERT INTO character(name, race_id, class_id) VALUES('Throk',2,3);
INSERT INTO character(name, race_id, class_id) VALUES('Theolas',5,4);
INSERT INTO character(name, race_id, class_id) VALUES('Eldron',5,5);
INSERT INTO character(name, race_id, class_id) VALUES('Dalior',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Doriolin',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Reolath',3,6);
INSERT INTO character(name, race_id, class_id) VALUES('Dalior',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Oristor',5,6);
INSERT INTO character(name, race_id, class_id) VALUES('Deraldorio',6,4);
INSERT INTO character(name, race_id, class_id) VALUES('Theolas',2,3);
INSERT INTO character(name, race_id, class_id) VALUES('Loruthan',6,4);
INSERT INTO character(name, race_id, class_id) VALUES('Melkorn',2,3);
INSERT INTO character(name, race_id, class_id) VALUES('Eltharien',1,3);
INSERT INTO character(name, race_id, class_id) VALUES('Garndal',4,5);
INSERT INTO character(name, race_id, class_id) VALUES('Turimbar',1,4);
INSERT INTO race VALUES(1,'Dwarves');
INSERT INTO race VALUES(2,'Elves');
INSERT INTO race VALUES(3,'Humans');
INSERT INTO race VALUES(4,'Goblins');
INSERT INTO race VALUES(5,'Orcs');
INSERT INTO class VALUES(1,'Warrior');
INSERT INTO class VALUES(2,'Gunslinger');
INSERT INTO class VALUES(3,'Archer');
INSERT INTO class VALUES(4,'Assassin');
INSERT INTO class VALUES(5,'Tank');
INSERT INTO item VALUES(1,'Adobe',426,8.0,5,22);
INSERT INTO item VALUES(2,'Aluminum Ingot',694,13.0,1,19);
INSERT INTO item VALUES(3,'Animal Bone',1184,13.0,4,24);
INSERT INTO item VALUES(4,'Animal Fat',1717,12.0,4,23);
INSERT INTO item VALUES(5,'Animal Hide',1420,8.0,5,9);
INSERT INTO item VALUES(6,'Bamboo Stick',1227,4.0,5,15);
INSERT INTO item VALUES(7,'Beeswax',1669,18.0,1,9);
INSERT INTO item VALUES(8,'Black Dye',1872,17.0,1,16);
INSERT INTO item VALUES(9,'Blue Alloy',1808,11.0,5,16);
INSERT INTO item VALUES(10,'Blue Coral Powder',547,11.0,1,24);
INSERT INTO item VALUES(11,'Blue Dye',1340,19.0,1,14);
INSERT INTO item VALUES(12,'Blue Metal',1091,2.0,3,19);
INSERT INTO item VALUES(13,'Bolts',1747,1.0,2,16);
INSERT INTO item VALUES(14,'Brick',866,12.0,2,3);
INSERT INTO item VALUES(15,'Bronze Ingot',1904,3.0,5,2);
INSERT INTO item VALUES(16,'Carved Wood',384,7.0,3,9);
INSERT INTO item VALUES(17,'Cattail',803,7.0,3,19);
INSERT INTO item VALUES(18,'Cement',1315,18.0,4,25);
INSERT INTO item VALUES(19,'Charcoal',91,19.0,5,9);
INSERT INTO item VALUES(20,'Clay',1775,12.0,3,22);
INSERT INTO item VALUES(21,'Cloth',1309,17.0,3,5);
INSERT INTO item VALUES(22,'Coal',645,3.0,2,1);
INSERT INTO item VALUES(23,'Copper Ingot',53,0.0,4,19);
INSERT INTO item VALUES(24,'Copper Ore',183,10.0,1,9);
INSERT INTO item VALUES(25,'Crafted Leather',604,10.0,5,24);
INSERT INTO item VALUES(26,'Cursed Wood',1208,18.0,1,16);
INSERT INTO item VALUES(27,'Duct Tape',1993,16.0,1,12);
INSERT INTO item VALUES(28,'Electronic Components',1348,10.0,2,10);
INSERT INTO item VALUES(29,'Empty Can',888,6.0,1,6);
INSERT INTO item VALUES(30,'Feather',1542,7.0,4,14);
INSERT INTO item VALUES(31,'Fertile Soil',1604,6.0,1,23);
INSERT INTO item VALUES(32,'Firewood',377,18.0,1,20);
INSERT INTO item VALUES(33,'Flint',837,8.0,1,24);
INSERT INTO item VALUES(34,'Gas',1372,5.0,5,23);
INSERT INTO item VALUES(35,'Glass',1968,4.0,5,21);
INSERT INTO item VALUES(36,'Glue',1348,10.0,1,25);
INSERT INTO item VALUES(37,'Gold Ingot',260,13.0,3,19);
INSERT INTO item VALUES(38,'Gold Nugget',969,6.0,3,17);
INSERT INTO item VALUES(39,'Gravel',114,4.0,5,17);
INSERT INTO item VALUES(40,'Green Dye',1225,19.0,5,15);
INSERT INTO item VALUES(41,'Hard Skin',334,4.0,4,20);
INSERT INTO item VALUES(42,'Hardwood',101,9.0,2,4);
INSERT INTO item VALUES(43,'Iron Ingot',480,18.0,2,13);
INSERT INTO item VALUES(44,'Iron Ore',367,15.0,2,2);
INSERT INTO item VALUES(45,'Jade',1988,11.0,1,20);
INSERT INTO item VALUES(46,'Large Stone',874,12.0,5,23);
INSERT INTO item VALUES(47,'Leather',112,15.0,1,5);
INSERT INTO item VALUES(48,'Leather Straps',1826,12.0,3,12);
INSERT INTO item VALUES(49,'Marble',1007,13.0,1,19);
INSERT INTO item VALUES(50,'Metal Scraps',1187,3.0,2,17);
INSERT INTO item VALUES(51,'Metal Shard',1115,5.0,5,13);
INSERT INTO item VALUES(52,'Metal Wire',946,10.0,1,14);
INSERT INTO item VALUES(53,'Monster Scales',1583,5.0,3,21);
INSERT INTO item VALUES(54,'Nails',360,8.0,3,8);
INSERT INTO item VALUES(55,'Orange Dye',32,13.0,4,5);
INSERT INTO item VALUES(56,'Paper',879,14.0,5,22);
INSERT INTO item VALUES(57,'Plant Fiber',1685,11.0,5,13);
INSERT INTO item VALUES(58,'Plastic',1475,13.0,2,11);
INSERT INTO item VALUES(59,'Purple Coral Powder',386,6.0,4,9);
INSERT INTO item VALUES(60,'Purple Dye',1519,6.0,3,3);
INSERT INTO item VALUES(61,'Quartz',1703,2.0,3,15);
INSERT INTO item VALUES(62,'Red Coral Powder',1557,14.0,5,15);
INSERT INTO item VALUES(63,'Red Dye',111,0.0,1,19);
INSERT INTO item VALUES(64,'Rooftiles',1029,15.0,5,10);
INSERT INTO item VALUES(65,'Rope',741,10.0,2,6);
INSERT INTO item VALUES(66,'Rubber',1818,6.0,5,24);
INSERT INTO item VALUES(67,'Sand',592,16.0,3,3);
INSERT INTO item VALUES(68,'Sharp Stone',72,1.0,2,4);
INSERT INTO item VALUES(69,'Silicon',369,5.0,4,1);
INSERT INTO item VALUES(70,'Silver Ingot',247,4.0,4,15);
INSERT INTO item VALUES(71,'Silver Ore',1128,19.0,3,19);
INSERT INTO item VALUES(72,'Slate',528,18.0,2,16);
INSERT INTO item VALUES(73,'Small Stone',424,8.0,3,7);
INSERT INTO item VALUES(74,'Steel Ingot',1486,17.0,3,18);
INSERT INTO item VALUES(75,'Steel Plates',210,1.0,3,6);
INSERT INTO item VALUES(76,'Stick',1492,2.0,1,14);
INSERT INTO item VALUES(77,'Straws',214,12.0,3,20);
INSERT INTO item VALUES(78,'Thread',381,12.0,3,20);
INSERT INTO item VALUES(79,'Timber',755,5.0,4,20);
INSERT INTO item VALUES(80,'Tin',1636,11.0,3,9);
INSERT INTO item VALUES(81,'Titanium Dust',182,15.0,4,6);
INSERT INTO item VALUES(82,'Titanium Ingot',1094,16.0,3,10);
INSERT INTO item VALUES(83,'Turquoise',1170,13.0,1,10);
INSERT INTO item VALUES(84,'Varnish',58,5.0,4,24);
INSERT INTO item VALUES(85,'Whetstone',532,15.0,3,1);
INSERT INTO item VALUES(86,'White Coral Powder',904,0.0,5,22);
INSERT INTO item VALUES(87,'White Dye',1464,16.0,5,5);
INSERT INTO item VALUES(88,'Wood Log',66,15.0,5,8);
INSERT INTO item VALUES(89,'Wood Planks',597,8.0,2,21);
INSERT INTO item VALUES(90,'Wool',1945,10.0,2,10);
INSERT INTO item VALUES(91,'Yellow Coral Powder',910,9.0,4,14);
INSERT INTO item VALUES(92,'Yellow Dye',1462,9.0,5,5);
INSERT INTO inventory(character_id,item_id) VALUES(24,33);
INSERT INTO inventory(character_id,item_id) VALUES(8,22);
INSERT INTO inventory(character_id,item_id) VALUES(4,36);
INSERT INTO inventory(character_id,item_id) VALUES(10,84);
INSERT INTO inventory(character_id,item_id) VALUES(21,89);
INSERT INTO inventory(character_id,item_id) VALUES(19,35);
INSERT INTO inventory(character_id,item_id) VALUES(18,41);
INSERT INTO inventory(character_id,item_id) VALUES(4,37);
INSERT INTO inventory(character_id,item_id) VALUES(7,56);
INSERT INTO inventory(character_id,item_id) VALUES(24,60);
INSERT INTO inventory(character_id,item_id) VALUES(15,24);
INSERT INTO inventory(character_id,item_id) VALUES(18,48);
INSERT INTO inventory(character_id,item_id) VALUES(10,82);
INSERT INTO inventory(character_id,item_id) VALUES(15,22);
INSERT INTO inventory(character_id,item_id) VALUES(20,41);
INSERT INTO inventory(character_id,item_id) VALUES(32,70);
INSERT INTO inventory(character_id,item_id) VALUES(35,53);
INSERT INTO inventory(character_id,item_id) VALUES(3,25);
INSERT INTO inventory(character_id,item_id) VALUES(20,29);
INSERT INTO inventory(character_id,item_id) VALUES(34,60);
INSERT INTO inventory(character_id,item_id) VALUES(25,22);
INSERT INTO inventory(character_id,item_id) VALUES(33,25);
INSERT INTO inventory(character_id,item_id) VALUES(22,16);
INSERT INTO inventory(character_id,item_id) VALUES(10,12);
INSERT INTO inventory(character_id,item_id) VALUES(13,78);
INSERT INTO inventory(character_id,item_id) VALUES(21,33);
INSERT INTO inventory(character_id,item_id) VALUES(20,13);
INSERT INTO inventory(character_id,item_id) VALUES(26,57);
INSERT INTO inventory(character_id,item_id) VALUES(6,22);
INSERT INTO inventory(character_id,item_id) VALUES(33,13);
INSERT INTO inventory(character_id,item_id) VALUES(30,27);
INSERT INTO inventory(character_id,item_id) VALUES(35,32);
INSERT INTO inventory(character_id,item_id) VALUES(7,29);
INSERT INTO inventory(character_id,item_id) VALUES(35,42);
INSERT INTO inventory(character_id,item_id) VALUES(6,20);
INSERT INTO inventory(character_id,item_id) VALUES(17,62);
INSERT INTO inventory(character_id,item_id) VALUES(20,83);
INSERT INTO inventory(character_id,item_id) VALUES(29,79);
INSERT INTO inventory(character_id,item_id) VALUES(30,42);
INSERT INTO inventory(character_id,item_id) VALUES(11,5);
INSERT INTO inventory(character_id,item_id) VALUES(6,34);
INSERT INTO inventory(character_id,item_id) VALUES(3,3);
INSERT INTO inventory(character_id,item_id) VALUES(16,44);
INSERT INTO inventory(character_id,item_id) VALUES(18,65);
INSERT INTO inventory(character_id,item_id) VALUES(33,6);
INSERT INTO inventory(character_id,item_id) VALUES(13,35);
INSERT INTO inventory(character_id,item_id) VALUES(25,23);
INSERT INTO inventory(character_id,item_id) VALUES(26,50);
INSERT INTO inventory(character_id,item_id) VALUES(29,10);
INSERT INTO inventory(character_id,item_id) VALUES(20,41);
INSERT INTO inventory(character_id,item_id) VALUES(25,79);
INSERT INTO inventory(character_id,item_id) VALUES(28,78);
INSERT INTO inventory(character_id,item_id) VALUES(35,14);
INSERT INTO inventory(character_id,item_id) VALUES(1,72);
INSERT INTO inventory(character_id,item_id) VALUES(2,5);
INSERT INTO inventory(character_id,item_id) VALUES(28,73);
INSERT INTO inventory(character_id,item_id) VALUES(33,76);
INSERT INTO inventory(character_id,item_id) VALUES(1,1);
INSERT INTO inventory(character_id,item_id) VALUES(8,52);
INSERT INTO inventory(character_id,item_id) VALUES(25,60);
INSERT INTO inventory(character_id,item_id) VALUES(34,69);
INSERT INTO inventory(character_id,item_id) VALUES(26,57);
INSERT INTO inventory(character_id,item_id) VALUES(29,89);
INSERT INTO inventory(character_id,item_id) VALUES(13,76);
INSERT INTO inventory(character_id,item_id) VALUES(8,47);
INSERT INTO inventory(character_id,item_id) VALUES(31,4);
INSERT INTO inventory(character_id,item_id) VALUES(24,1);
INSERT INTO inventory(character_id,item_id) VALUES(11,22);
INSERT INTO inventory(character_id,item_id) VALUES(35,79);
INSERT INTO inventory(character_id,item_id) VALUES(33,81);
INSERT INTO inventory(character_id,item_id) VALUES(32,51);
INSERT INTO inventory(character_id,item_id) VALUES(12,59);
INSERT INTO inventory(character_id,item_id) VALUES(19,29);
INSERT INTO inventory(character_id,item_id) VALUES(7,24);
INSERT INTO inventory(character_id,item_id) VALUES(15,76);
INSERT INTO inventory(character_id,item_id) VALUES(24,62);
INSERT INTO inventory(character_id,item_id) VALUES(32,60);
INSERT INTO inventory(character_id,item_id) VALUES(18,54);
INSERT INTO inventory(character_id,item_id) VALUES(20,21);
INSERT INTO inventory(character_id,item_id) VALUES(11,2);
INSERT INTO inventory(character_id,item_id) VALUES(16,13);
INSERT INTO inventory(character_id,item_id) VALUES(29,53);
INSERT INTO inventory(character_id,item_id) VALUES(3,17);
INSERT INTO inventory(character_id,item_id) VALUES(26,7);
INSERT INTO inventory(character_id,item_id) VALUES(18,8);
INSERT INTO inventory(character_id,item_id) VALUES(17,42);
INSERT INTO inventory(character_id,item_id) VALUES(21,18);
INSERT INTO inventory(character_id,item_id) VALUES(5,34);
INSERT INTO inventory(character_id,item_id) VALUES(7,17);
INSERT INTO inventory(character_id,item_id) VALUES(11,24);
INSERT INTO inventory(character_id,item_id) VALUES(10,58);
INSERT INTO inventory(character_id,item_id) VALUES(30,36);
INSERT INTO inventory(character_id,item_id) VALUES(24,86);
INSERT INTO inventory(character_id,item_id) VALUES(2,40);
INSERT INTO inventory(character_id,item_id) VALUES(18,75);
INSERT INTO inventory(character_id,item_id) VALUES(19,65);
INSERT INTO inventory(character_id,item_id) VALUES(29,31);
INSERT INTO inventory(character_id,item_id) VALUES(12,48);
INSERT INTO inventory(character_id,item_id) VALUES(34,57);
INSERT INTO inventory(character_id,item_id) VALUES(20,54);
INSERT INTO inventory(character_id,item_id) VALUES(35,32);
INSERT INTO inventory(character_id,item_id) VALUES(5,66);
INSERT INTO inventory(character_id,item_id) VALUES(33,8);
INSERT INTO inventory(character_id,item_id) VALUES(11,76);
INSERT INTO inventory(character_id,item_id) VALUES(1,74);
INSERT INTO inventory(character_id,item_id) VALUES(17,36);
INSERT INTO inventory(character_id,item_id) VALUES(3,20);
INSERT INTO inventory(character_id,item_id) VALUES(35,68);
INSERT INTO inventory(character_id,item_id) VALUES(28,63);
INSERT INTO inventory(character_id,item_id) VALUES(11,84);
INSERT INTO inventory(character_id,item_id) VALUES(21,83);
INSERT INTO inventory(character_id,item_id) VALUES(27,88);
INSERT INTO inventory(character_id,item_id) VALUES(31,49);
INSERT INTO inventory(character_id,item_id) VALUES(19,75);
INSERT INTO inventory(character_id,item_id) VALUES(26,11);
INSERT INTO inventory(character_id,item_id) VALUES(19,66);
INSERT INTO inventory(character_id,item_id) VALUES(27,84);
INSERT INTO inventory(character_id,item_id) VALUES(16,10);
INSERT INTO inventory(character_id,item_id) VALUES(15,86);
INSERT INTO inventory(character_id,item_id) VALUES(20,13);
INSERT INTO inventory(character_id,item_id) VALUES(3,50);
INSERT INTO inventory(character_id,item_id) VALUES(7,65);
INSERT INTO inventory(character_id,item_id) VALUES(29,80);
INSERT INTO inventory(character_id,item_id) VALUES(9,36);
INSERT INTO inventory(character_id,item_id) VALUES(26,92);
INSERT INTO inventory(character_id,item_id) VALUES(3,21);
INSERT INTO inventory(character_id,item_id) VALUES(7,41);
INSERT INTO inventory(character_id,item_id) VALUES(20,14);
INSERT INTO inventory(character_id,item_id) VALUES(12,12);
INSERT INTO inventory(character_id,item_id) VALUES(22,8);
INSERT INTO inventory(character_id,item_id) VALUES(18,28);
INSERT INTO inventory(character_id,item_id) VALUES(21,35);
INSERT INTO inventory(character_id,item_id) VALUES(33,30);
INSERT INTO inventory(character_id,item_id) VALUES(17,38);
INSERT INTO inventory(character_id,item_id) VALUES(15,60);
INSERT INTO inventory(character_id,item_id) VALUES(15,3);
INSERT INTO inventory(character_id,item_id) VALUES(27,5);
INSERT INTO inventory(character_id,item_id) VALUES(11,7);
INSERT INTO inventory(character_id,item_id) VALUES(18,48);
INSERT INTO inventory(character_id,item_id) VALUES(18,43);
INSERT INTO inventory(character_id,item_id) VALUES(26,61);
INSERT INTO inventory(character_id,item_id) VALUES(35,24);
INSERT INTO inventory(character_id,item_id) VALUES(9,36);
INSERT INTO inventory(character_id,item_id) VALUES(5,85);
INSERT INTO inventory(character_id,item_id) VALUES(1,11);
INSERT INTO inventory(character_id,item_id) VALUES(30,59);
INSERT INTO inventory(character_id,item_id) VALUES(20,81);
INSERT INTO inventory(character_id,item_id) VALUES(28,49);
INSERT INTO inventory(character_id,item_id) VALUES(25,34);
INSERT INTO inventory(character_id,item_id) VALUES(9,69);
INSERT INTO inventory(character_id,item_id) VALUES(21,18);
INSERT INTO inventory(character_id,item_id) VALUES(17,43);
INSERT INTO inventory(character_id,item_id) VALUES(14,90);
INSERT INTO inventory(character_id,item_id) VALUES(6,70);
INSERT INTO inventory(character_id,item_id) VALUES(20,49);
INSERT INTO inventory(character_id,item_id) VALUES(9,77);
INSERT INTO inventory(character_id,item_id) VALUES(19,68);
INSERT INTO inventory(character_id,item_id) VALUES(30,21);
INSERT INTO inventory(character_id,item_id) VALUES(3,10);
INSERT INTO inventory(character_id,item_id) VALUES(35,76);
INSERT INTO inventory(character_id,item_id) VALUES(21,27);
INSERT INTO inventory(character_id,item_id) VALUES(2,69);
INSERT INTO inventory(character_id,item_id) VALUES(20,52);
INSERT INTO inventory(character_id,item_id) VALUES(24,72);
INSERT INTO inventory(character_id,item_id) VALUES(15,14);
INSERT INTO inventory(character_id,item_id) VALUES(8,28);
INSERT INTO inventory(character_id,item_id) VALUES(8,64);
INSERT INTO inventory(character_id,item_id) VALUES(7,62);
INSERT INTO inventory(character_id,item_id) VALUES(28,13);
INSERT INTO inventory(character_id,item_id) VALUES(1,21);
INSERT INTO inventory(character_id,item_id) VALUES(27,59);
INSERT INTO inventory(character_id,item_id) VALUES(14,79);
INSERT INTO inventory(character_id,item_id) VALUES(16,75);
INSERT INTO inventory(character_id,item_id) VALUES(28,19);
INSERT INTO inventory(character_id,item_id) VALUES(10,85);
INSERT INTO inventory(character_id,item_id) VALUES(34,11);
INSERT INTO inventory(character_id,item_id) VALUES(16,19);
INSERT INTO inventory(character_id,item_id) VALUES(24,90);
INSERT INTO inventory(character_id,item_id) VALUES(11,38);
INSERT INTO inventory(character_id,item_id) VALUES(23,60);
INSERT INTO inventory(character_id,item_id) VALUES(16,45);
INSERT INTO inventory(character_id,item_id) VALUES(35,63);
INSERT INTO inventory(character_id,item_id) VALUES(23,6);
INSERT INTO inventory(character_id,item_id) VALUES(31,71);
INSERT INTO inventory(character_id,item_id) VALUES(3,7);
INSERT INTO inventory(character_id,item_id) VALUES(15,76);
INSERT INTO inventory(character_id,item_id) VALUES(31,86);
INSERT INTO inventory(character_id,item_id) VALUES(29,83);
INSERT INTO inventory(character_id,item_id) VALUES(15,30);
INSERT INTO inventory(character_id,item_id) VALUES(16,79);
INSERT INTO inventory(character_id,item_id) VALUES(14,66);
INSERT INTO inventory(character_id,item_id) VALUES(1,83);
INSERT INTO inventory(character_id,item_id) VALUES(29,35);
INSERT INTO inventory(character_id,item_id) VALUES(3,26);
INSERT INTO inventory(character_id,item_id) VALUES(28,46);
INSERT INTO inventory(character_id,item_id) VALUES(23,82);
INSERT INTO inventory(character_id,item_id) VALUES(8,4);
INSERT INTO inventory(character_id,item_id) VALUES(4,45);
INSERT INTO inventory(character_id,item_id) VALUES(14,40);
INSERT INTO inventory(character_id,item_id) VALUES(10,2);
INSERT INTO inventory(character_id,item_id) VALUES(16,51);
INSERT INTO inventory(character_id,item_id) VALUES(3,29);
INSERT INTO inventory(character_id,item_id) VALUES(21,18);
INSERT INTO inventory(character_id,item_id) VALUES(22,3);
INSERT INTO inventory(character_id,item_id) VALUES(26,59);
INSERT INTO inventory(character_id,item_id) VALUES(22,29);
INSERT INTO inventory(character_id,item_id) VALUES(22,81);
INSERT INTO inventory(character_id,item_id) VALUES(8,58);
INSERT INTO inventory(character_id,item_id) VALUES(35,84);
INSERT INTO inventory(character_id,item_id) VALUES(29,32);
INSERT INTO inventory(character_id,item_id) VALUES(30,30);
INSERT INTO inventory(character_id,item_id) VALUES(26,28);
INSERT INTO inventory(character_id,item_id) VALUES(15,13);
INSERT INTO inventory(character_id,item_id) VALUES(1,91);
INSERT INTO inventory(character_id,item_id) VALUES(21,89);
INSERT INTO inventory(character_id,item_id) VALUES(18,87);
INSERT INTO inventory(character_id,item_id) VALUES(14,46);
INSERT INTO inventory(character_id,item_id) VALUES(7,34);
INSERT INTO inventory(character_id,item_id) VALUES(10,10);
INSERT INTO inventory(character_id,item_id) VALUES(18,46);
INSERT INTO inventory(character_id,item_id) VALUES(7,45);
INSERT INTO inventory(character_id,item_id) VALUES(6,48);
INSERT INTO inventory(character_id,item_id) VALUES(3,63);
INSERT INTO inventory(character_id,item_id) VALUES(16,82);
INSERT INTO inventory(character_id,item_id) VALUES(10,61);
INSERT INTO inventory(character_id,item_id) VALUES(16,25);
INSERT INTO inventory(character_id,item_id) VALUES(19,13);
INSERT INTO inventory(character_id,item_id) VALUES(1,32);
INSERT INTO inventory(character_id,item_id) VALUES(10,76);
INSERT INTO inventory(character_id,item_id) VALUES(17,85);
INSERT INTO inventory(character_id,item_id) VALUES(9,59);
INSERT INTO inventory(character_id,item_id) VALUES(28,54);
INSERT INTO inventory(character_id,item_id) VALUES(9,46);
INSERT INTO inventory(character_id,item_id) VALUES(28,40);
INSERT INTO inventory(character_id,item_id) VALUES(4,48);
INSERT INTO inventory(character_id,item_id) VALUES(10,47);
INSERT INTO inventory(character_id,item_id) VALUES(4,9);
INSERT INTO inventory(character_id,item_id) VALUES(30,69);
INSERT INTO inventory(character_id,item_id) VALUES(18,10);
INSERT INTO inventory(character_id,item_id) VALUES(15,22);
INSERT INTO inventory(character_id,item_id) VALUES(13,59);
INSERT INTO inventory(character_id,item_id) VALUES(30,72);
INSERT INTO inventory(character_id,item_id) VALUES(7,79);
INSERT INTO inventory(character_id,item_id) VALUES(18,57);
INSERT INTO inventory(character_id,item_id) VALUES(21,12);
INSERT INTO inventory(character_id,item_id) VALUES(10,2);
INSERT INTO inventory(character_id,item_id) VALUES(3,20);
INSERT INTO inventory(character_id,item_id) VALUES(15,48);
INSERT INTO inventory(character_id,item_id) VALUES(14,14);
INSERT INTO inventory(character_id,item_id) VALUES(16,14);
INSERT INTO inventory(character_id,item_id) VALUES(17,7);
INSERT INTO inventory(character_id,item_id) VALUES(35,13);
INSERT INTO inventory(character_id,item_id) VALUES(29,1);
INSERT INTO inventory(character_id,item_id) VALUES(15,12);
INSERT INTO inventory(character_id,item_id) VALUES(24,82);
INSERT INTO inventory(character_id,item_id) VALUES(9,6);
INSERT INTO inventory(character_id,item_id) VALUES(26,45);
INSERT INTO inventory(character_id,item_id) VALUES(28,23);
INSERT INTO inventory(character_id,item_id) VALUES(2,47);
INSERT INTO inventory(character_id,item_id) VALUES(34,40);
INSERT INTO inventory(character_id,item_id) VALUES(32,5);
INSERT INTO inventory(character_id,item_id) VALUES(18,63);
INSERT INTO inventory(character_id,item_id) VALUES(1,50);
INSERT INTO inventory(character_id,item_id) VALUES(5,27);
INSERT INTO inventory(character_id,item_id) VALUES(24,80);
INSERT INTO inventory(character_id,item_id) VALUES(9,57);
INSERT INTO inventory(character_id,item_id) VALUES(34,66);
INSERT INTO inventory(character_id,item_id) VALUES(3,25);
INSERT INTO inventory(character_id,item_id) VALUES(10,49);
INSERT INTO inventory(character_id,item_id) VALUES(35,48);
INSERT INTO inventory(character_id,item_id) VALUES(3,25);
INSERT INTO inventory(character_id,item_id) VALUES(2,74);
INSERT INTO inventory(character_id,item_id) VALUES(29,44);
INSERT INTO inventory(character_id,item_id) VALUES(10,91);
INSERT INTO inventory(character_id,item_id) VALUES(30,86);
INSERT INTO inventory(character_id,item_id) VALUES(9,55);
INSERT INTO inventory(character_id,item_id) VALUES(20,40);
INSERT INTO inventory(character_id,item_id) VALUES(24,80);
INSERT INTO inventory(character_id,item_id) VALUES(25,35);
INSERT INTO inventory(character_id,item_id) VALUES(30,33);
INSERT INTO inventory(character_id,item_id) VALUES(9,32);
INSERT INTO inventory(character_id,item_id) VALUES(11,69);
INSERT INTO inventory(character_id,item_id) VALUES(13,66);
INSERT INTO inventory(character_id,item_id) VALUES(35,48);
INSERT INTO inventory(character_id,item_id) VALUES(21,28);
INSERT INTO inventory(character_id,item_id) VALUES(23,10);
INSERT INTO inventory(character_id,item_id) VALUES(28,54);
INSERT INTO inventory(character_id,item_id) VALUES(6,6);
INSERT INTO inventory(character_id,item_id) VALUES(33,54);
INSERT INTO inventory(character_id,item_id) VALUES(17,11);
INSERT INTO inventory(character_id,item_id) VALUES(5,69);
INSERT INTO inventory(character_id,item_id) VALUES(27,35);
INSERT INTO inventory(character_id,item_id) VALUES(29,24);
INSERT INTO inventory(character_id,item_id) VALUES(33,4);
INSERT INTO inventory(character_id,item_id) VALUES(34,32);
INSERT INTO inventory(character_id,item_id) VALUES(26,9);
INSERT INTO inventory(character_id,item_id) VALUES(3,90);
INSERT INTO inventory(character_id,item_id) VALUES(34,13);
INSERT INTO inventory(character_id,item_id) VALUES(12,80);
INSERT INTO inventory(character_id,item_id) VALUES(2,15);
INSERT INTO inventory(character_id,item_id) VALUES(28,6);
INSERT INTO inventory(character_id,item_id) VALUES(16,2);
INSERT INTO inventory(character_id,item_id) VALUES(6,5);
INSERT INTO inventory(character_id,item_id) VALUES(15,55);
INSERT INTO inventory(character_id,item_id) VALUES(34,78);
INSERT INTO inventory(character_id,item_id) VALUES(29,77);
INSERT INTO inventory(character_id,item_id) VALUES(15,58);
INSERT INTO inventory(character_id,item_id) VALUES(19,29);
INSERT INTO inventory(character_id,item_id) VALUES(27,13);
INSERT INTO inventory(character_id,item_id) VALUES(31,76);
INSERT INTO inventory(character_id,item_id) VALUES(10,77);
INSERT INTO inventory(character_id,item_id) VALUES(14,87);
INSERT INTO inventory(character_id,item_id) VALUES(29,7);
INSERT INTO inventory(character_id,item_id) VALUES(15,6);
INSERT INTO inventory(character_id,item_id) VALUES(21,54);
INSERT INTO inventory(character_id,item_id) VALUES(16,80);
INSERT INTO inventory(character_id,item_id) VALUES(14,40);
INSERT INTO inventory(character_id,item_id) VALUES(14,91);
INSERT INTO inventory(character_id,item_id) VALUES(9,49);
INSERT INTO inventory(character_id,item_id) VALUES(2,19);
INSERT INTO inventory(character_id,item_id) VALUES(8,77);
INSERT INTO inventory(character_id,item_id) VALUES(9,62);
INSERT INTO inventory(character_id,item_id) VALUES(2,2);
INSERT INTO inventory(character_id,item_id) VALUES(2,72);
INSERT INTO inventory(character_id,item_id) VALUES(6,24);
INSERT INTO inventory(character_id,item_id) VALUES(31,56);
INSERT INTO inventory(character_id,item_id) VALUES(1,74);
INSERT INTO inventory(character_id,item_id) VALUES(33,43);
INSERT INTO inventory(character_id,item_id) VALUES(23,35);
INSERT INTO inventory(character_id,item_id) VALUES(3,19);
INSERT INTO inventory(character_id,item_id) VALUES(30,9);
INSERT INTO inventory(character_id,item_id) VALUES(1,73);
INSERT INTO inventory(character_id,item_id) VALUES(12,25);
INSERT INTO inventory(character_id,item_id) VALUES(28,18);
INSERT INTO inventory(character_id,item_id) VALUES(35,88);
INSERT INTO inventory(character_id,item_id) VALUES(11,80);
INSERT INTO inventory(character_id,item_id) VALUES(28,17);
INSERT INTO inventory(character_id,item_id) VALUES(4,41);
INSERT INTO inventory(character_id,item_id) VALUES(10,45);
INSERT INTO inventory(character_id,item_id) VALUES(7,60);
INSERT INTO inventory(character_id,item_id) VALUES(33,13);
INSERT INTO inventory(character_id,item_id) VALUES(32,91);
INSERT INTO inventory(character_id,item_id) VALUES(16,55);
INSERT INTO inventory(character_id,item_id) VALUES(18,85);
INSERT INTO inventory(character_id,item_id) VALUES(1,72);
INSERT INTO inventory(character_id,item_id) VALUES(5,70);
INSERT INTO inventory(character_id,item_id) VALUES(4,73);
INSERT INTO inventory(character_id,item_id) VALUES(28,89);
INSERT INTO inventory(character_id,item_id) VALUES(27,89);
INSERT INTO inventory(character_id,item_id) VALUES(2,34);
INSERT INTO inventory(character_id,item_id) VALUES(34,84);
INSERT INTO inventory(character_id,item_id) VALUES(32,57);
INSERT INTO inventory(character_id,item_id) VALUES(19,30);
INSERT INTO inventory(character_id,item_id) VALUES(2,31);
INSERT INTO inventory(character_id,item_id) VALUES(8,71);
INSERT INTO inventory(character_id,item_id) VALUES(13,61);
INSERT INTO inventory(character_id,item_id) VALUES(6,6);
INSERT INTO inventory(character_id,item_id) VALUES(18,82);
INSERT INTO inventory(character_id,item_id) VALUES(23,88);
INSERT INTO inventory(character_id,item_id) VALUES(15,66);
INSERT INTO inventory(character_id,item_id) VALUES(19,33);
INSERT INTO inventory(character_id,item_id) VALUES(33,25);
INSERT INTO inventory(character_id,item_id) VALUES(26,74);
INSERT INTO inventory(character_id,item_id) VALUES(27,73);
INSERT INTO inventory(character_id,item_id) VALUES(5,81);
INSERT INTO inventory(character_id,item_id) VALUES(4,80);
INSERT INTO inventory(character_id,item_id) VALUES(15,46);
INSERT INTO inventory(character_id,item_id) VALUES(5,50);
INSERT INTO inventory(character_id,item_id) VALUES(2,19);
INSERT INTO inventory(character_id,item_id) VALUES(5,72);
INSERT INTO inventory(character_id,item_id) VALUES(14,72);
INSERT INTO inventory(character_id,item_id) VALUES(22,11);
INSERT INTO inventory(character_id,item_id) VALUES(1,33);
INSERT INTO inventory(character_id,item_id) VALUES(14,8);
INSERT INTO inventory(character_id,item_id) VALUES(6,57);
INSERT INTO inventory(character_id,item_id) VALUES(6,85);
INSERT INTO inventory(character_id,item_id) VALUES(26,43);
INSERT INTO inventory(character_id,item_id) VALUES(19,36);
INSERT INTO inventory(character_id,item_id) VALUES(12,16);
INSERT INTO inventory(character_id,item_id) VALUES(20,71);
INSERT INTO inventory(character_id,item_id) VALUES(24,77);
INSERT INTO inventory(character_id,item_id) VALUES(25,64);
INSERT INTO inventory(character_id,item_id) VALUES(12,6);
INSERT INTO inventory(character_id,item_id) VALUES(19,4);
INSERT INTO inventory(character_id,item_id) VALUES(27,28);
INSERT INTO inventory(character_id,item_id) VALUES(11,32);
INSERT INTO inventory(character_id,item_id) VALUES(21,4);
INSERT INTO inventory(character_id,item_id) VALUES(34,70);
INSERT INTO inventory(character_id,item_id) VALUES(6,26);
INSERT INTO inventory(character_id,item_id) VALUES(6,79);
INSERT INTO inventory(character_id,item_id) VALUES(1,69);
INSERT INTO inventory(character_id,item_id) VALUES(30,21);
INSERT INTO inventory(character_id,item_id) VALUES(19,60);
INSERT INTO inventory(character_id,item_id) VALUES(32,65);
INSERT INTO inventory(character_id,item_id) VALUES(21,58);
INSERT INTO inventory(character_id,item_id) VALUES(35,48);
INSERT INTO inventory(character_id,item_id) VALUES(35,67);
INSERT INTO inventory(character_id,item_id) VALUES(7,42);
INSERT INTO inventory(character_id,item_id) VALUES(8,48);
INSERT INTO inventory(character_id,item_id) VALUES(8,53);
INSERT INTO inventory(character_id,item_id) VALUES(30,70);
INSERT INTO inventory(character_id,item_id) VALUES(24,10);
INSERT INTO inventory(character_id,item_id) VALUES(13,34);
INSERT INTO inventory(character_id,item_id) VALUES(31,91);
INSERT INTO inventory(character_id,item_id) VALUES(30,24);
INSERT INTO inventory(character_id,item_id) VALUES(25,89);
INSERT INTO inventory(character_id,item_id) VALUES(31,6);
INSERT INTO inventory(character_id,item_id) VALUES(18,56);
INSERT INTO inventory(character_id,item_id) VALUES(9,4);
INSERT INTO inventory(character_id,item_id) VALUES(18,85);
INSERT INTO inventory(character_id,item_id) VALUES(30,14);
INSERT INTO inventory(character_id,item_id) VALUES(14,57);
INSERT INTO inventory(character_id,item_id) VALUES(22,42);
INSERT INTO inventory(character_id,item_id) VALUES(30,81);
INSERT INTO inventory(character_id,item_id) VALUES(30,12);
INSERT INTO inventory(character_id,item_id) VALUES(31,82);
INSERT INTO inventory(character_id,item_id) VALUES(2,36);
INSERT INTO inventory(character_id,item_id) VALUES(32,38);
INSERT INTO inventory(character_id,item_id) VALUES(23,72);
INSERT INTO inventory(character_id,item_id) VALUES(29,85);
INSERT INTO inventory(character_id,item_id) VALUES(31,55);
INSERT INTO inventory(character_id,item_id) VALUES(7,10);
INSERT INTO inventory(character_id,item_id) VALUES(25,66);
INSERT INTO inventory(character_id,item_id) VALUES(15,42);
INSERT INTO inventory(character_id,item_id) VALUES(8,49);
INSERT INTO inventory(character_id,item_id) VALUES(20,55);
INSERT INTO inventory(character_id,item_id) VALUES(35,27);
INSERT INTO inventory(character_id,item_id) VALUES(8,57);
INSERT INTO inventory(character_id,item_id) VALUES(5,59);
INSERT INTO inventory(character_id,item_id) VALUES(19,78);
INSERT INTO inventory(character_id,item_id) VALUES(13,6);
INSERT INTO inventory(character_id,item_id) VALUES(30,88);
INSERT INTO inventory(character_id,item_id) VALUES(12,58);
INSERT INTO inventory(character_id,item_id) VALUES(28,2);
INSERT INTO inventory(character_id,item_id) VALUES(19,12);
INSERT INTO inventory(character_id,item_id) VALUES(12,80);
INSERT INTO inventory(character_id,item_id) VALUES(31,36);
INSERT INTO inventory(character_id,item_id) VALUES(10,7);
INSERT INTO inventory(character_id,item_id) VALUES(1,19);
INSERT INTO inventory(character_id,item_id) VALUES(12,65);
INSERT INTO inventory(character_id,item_id) VALUES(21,50);
INSERT INTO inventory(character_id,item_id) VALUES(10,61);
INSERT INTO inventory(character_id,item_id) VALUES(13,76);
INSERT INTO inventory(character_id,item_id) VALUES(35,36);
INSERT INTO inventory(character_id,item_id) VALUES(22,24);
INSERT INTO inventory(character_id,item_id) VALUES(12,76);
INSERT INTO inventory(character_id,item_id) VALUES(16,54);
INSERT INTO inventory(character_id,item_id) VALUES(24,82);
INSERT INTO inventory(character_id,item_id) VALUES(22,89);
INSERT INTO inventory(character_id,item_id) VALUES(29,76);
INSERT INTO inventory(character_id,item_id) VALUES(5,76);
INSERT INTO inventory(character_id,item_id) VALUES(34,16);
INSERT INTO inventory(character_id,item_id) VALUES(1,30);
INSERT INTO inventory(character_id,item_id) VALUES(24,4);
INSERT INTO inventory(character_id,item_id) VALUES(11,63);
INSERT INTO inventory(character_id,item_id) VALUES(11,14);
INSERT INTO inventory(character_id,item_id) VALUES(33,32);
INSERT INTO inventory(character_id,item_id) VALUES(14,8);
INSERT INTO inventory(character_id,item_id) VALUES(31,58);
INSERT INTO inventory(character_id,item_id) VALUES(28,30);
INSERT INTO inventory(character_id,item_id) VALUES(32,80);
INSERT INTO inventory(character_id,item_id) VALUES(16,61);
INSERT INTO inventory(character_id,item_id) VALUES(11,16);
INSERT INTO inventory(character_id,item_id) VALUES(29,48);
INSERT INTO inventory(character_id,item_id) VALUES(9,45);
INSERT INTO inventory(character_id,item_id) VALUES(8,69);
INSERT INTO inventory(character_id,item_id) VALUES(19,74);
INSERT INTO inventory(character_id,item_id) VALUES(28,29);
INSERT INTO inventory(character_id,item_id) VALUES(10,30);
INSERT INTO inventory(character_id,item_id) VALUES(3,21);
INSERT INTO inventory(character_id,item_id) VALUES(31,63);
INSERT INTO inventory(character_id,item_id) VALUES(31,62);
INSERT INTO inventory(character_id,item_id) VALUES(32,65);
INSERT INTO inventory(character_id,item_id) VALUES(20,36);
INSERT INTO inventory(character_id,item_id) VALUES(32,2);
INSERT INTO inventory(character_id,item_id) VALUES(30,31);
INSERT INTO inventory(character_id,item_id) VALUES(31,60);
INSERT INTO inventory(character_id,item_id) VALUES(29,82);
INSERT INTO inventory(character_id,item_id) VALUES(20,47);
INSERT INTO inventory(character_id,item_id) VALUES(22,78);
INSERT INTO inventory(character_id,item_id) VALUES(27,56);
INSERT INTO inventory(character_id,item_id) VALUES(25,60);
INSERT INTO inventory(character_id,item_id) VALUES(23,47);
INSERT INTO inventory(character_id,item_id) VALUES(35,91);
INSERT INTO inventory(character_id,item_id) VALUES(6,47);
INSERT INTO inventory(character_id,item_id) VALUES(6,29);
INSERT INTO inventory(character_id,item_id) VALUES(23,19);
INSERT INTO inventory(character_id,item_id) VALUES(20,36);
INSERT INTO inventory(character_id,item_id) VALUES(9,41);
INSERT INTO inventory(character_id,item_id) VALUES(15,32);
INSERT INTO inventory(character_id,item_id) VALUES(30,26);
INSERT INTO inventory(character_id,item_id) VALUES(28,88);
INSERT INTO inventory(character_id,item_id) VALUES(35,7);
INSERT INTO inventory(character_id,item_id) VALUES(26,74);
INSERT INTO inventory(character_id,item_id) VALUES(13,57);
INSERT INTO inventory(character_id,item_id) VALUES(4,89);
INSERT INTO inventory(character_id,item_id) VALUES(22,53);
INSERT INTO inventory(character_id,item_id) VALUES(29,74);
INSERT INTO inventory(character_id,item_id) VALUES(22,63);
INSERT INTO inventory(character_id,item_id) VALUES(11,91);
INSERT INTO inventory(character_id,item_id) VALUES(26,61);
INSERT INTO inventory(character_id,item_id) VALUES(22,45);
INSERT INTO inventory(character_id,item_id) VALUES(17,23);
INSERT INTO inventory(character_id,item_id) VALUES(31,92);
INSERT INTO inventory(character_id,item_id) VALUES(4,11);
INSERT INTO inventory(character_id,item_id) VALUES(15,61);
INSERT INTO inventory(character_id,item_id) VALUES(35,51);
INSERT INTO inventory(character_id,item_id) VALUES(2,79);
INSERT INTO inventory(character_id,item_id) VALUES(24,38);
INSERT INTO inventory(character_id,item_id) VALUES(14,71);
INSERT INTO inventory(character_id,item_id) VALUES(7,60);
INSERT INTO inventory(character_id,item_id) VALUES(1,87);
INSERT INTO inventory(character_id,item_id) VALUES(14,13);
INSERT INTO inventory(character_id,item_id) VALUES(17,91);
INSERT INTO inventory(character_id,item_id) VALUES(7,86);
INSERT INTO inventory(character_id,item_id) VALUES(17,43);
INSERT INTO inventory(character_id,item_id) VALUES(30,85);
INSERT INTO inventory(character_id,item_id) VALUES(1,68);
INSERT INTO inventory(character_id,item_id) VALUES(35,19);
INSERT INTO inventory(character_id,item_id) VALUES(31,50);
INSERT INTO inventory(character_id,item_id) VALUES(16,31);
INSERT INTO inventory(character_id,item_id) VALUES(27,78);
INSERT INTO inventory(character_id,item_id) VALUES(6,17);
INSERT INTO inventory(character_id,item_id) VALUES(19,30);
INSERT INTO inventory(character_id,item_id) VALUES(12,92);
INSERT INTO inventory(character_id,item_id) VALUES(1,70);
INSERT INTO inventory(character_id,item_id) VALUES(1,41);
INSERT INTO inventory(character_id,item_id) VALUES(29,66);
INSERT INTO inventory(character_id,item_id) VALUES(5,14);
INSERT INTO inventory(character_id,item_id) VALUES(1,6);
INSERT INTO inventory(character_id,item_id) VALUES(4,72);
INSERT INTO inventory(character_id,item_id) VALUES(20,37);
INSERT INTO inventory(character_id,item_id) VALUES(26,22);
INSERT INTO inventory(character_id,item_id) VALUES(33,3);
INSERT INTO inventory(character_id,item_id) VALUES(9,87);
INSERT INTO inventory(character_id,item_id) VALUES(18,70);
INSERT INTO inventory(character_id,item_id) VALUES(24,73);
INSERT INTO inventory(character_id,item_id) VALUES(29,28);
INSERT INTO inventory(character_id,item_id) VALUES(20,56);
INSERT INTO inventory(character_id,item_id) VALUES(7,80);
INSERT INTO inventory(character_id,item_id) VALUES(19,13);
INSERT INTO inventory(character_id,item_id) VALUES(2,22);
INSERT INTO inventory(character_id,item_id) VALUES(2,69);
INSERT INTO inventory(character_id,item_id) VALUES(35,33);
INSERT INTO inventory(character_id,item_id) VALUES(13,23);
INSERT INTO inventory(character_id,item_id) VALUES(19,80);
INSERT INTO inventory(character_id,item_id) VALUES(21,5);
INSERT INTO inventory(character_id,item_id) VALUES(17,28);
INSERT INTO inventory(character_id,item_id) VALUES(1,56);
INSERT INTO inventory(character_id,item_id) VALUES(20,22);
INSERT INTO inventory(character_id,item_id) VALUES(15,74);
INSERT INTO inventory(character_id,item_id) VALUES(2,56);
INSERT INTO inventory(character_id,item_id) VALUES(23,27);
INSERT INTO inventory(character_id,item_id) VALUES(26,27);
INSERT INTO inventory(character_id,item_id) VALUES(7,27);
INSERT INTO inventory(character_id,item_id) VALUES(15,89);
INSERT INTO inventory(character_id,item_id) VALUES(3,42);
INSERT INTO inventory(character_id,item_id) VALUES(12,8);
INSERT INTO inventory(character_id,item_id) VALUES(14,22);
INSERT INTO inventory(character_id,item_id) VALUES(33,84);
INSERT INTO inventory(character_id,item_id) VALUES(6,81);
INSERT INTO inventory(character_id,item_id) VALUES(32,61);
INSERT INTO inventory(character_id,item_id) VALUES(6,77);
INSERT INTO inventory(character_id,item_id) VALUES(13,16);
INSERT INTO inventory(character_id,item_id) VALUES(16,12);
INSERT INTO inventory(character_id,item_id) VALUES(19,84);
INSERT INTO inventory(character_id,item_id) VALUES(19,90);
INSERT INTO inventory(character_id,item_id) VALUES(7,9);
INSERT INTO inventory(character_id,item_id) VALUES(30,6);
INSERT INTO inventory(character_id,item_id) VALUES(20,75);
INSERT INTO inventory(character_id,item_id) VALUES(4,76);
INSERT INTO inventory(character_id,item_id) VALUES(10,69);
INSERT INTO inventory(character_id,item_id) VALUES(24,86);
INSERT INTO inventory(character_id,item_id) VALUES(20,56);
INSERT INTO inventory(character_id,item_id) VALUES(21,21);
INSERT INTO inventory(character_id,item_id) VALUES(18,63);
INSERT INTO inventory(character_id,item_id) VALUES(21,7);
INSERT INTO inventory(character_id,item_id) VALUES(20,52);
INSERT INTO inventory(character_id,item_id) VALUES(27,35);
INSERT INTO inventory(character_id,item_id) VALUES(12,6);
INSERT INTO inventory(character_id,item_id) VALUES(24,46);
INSERT INTO inventory(character_id,item_id) VALUES(29,14);
INSERT INTO inventory(character_id,item_id) VALUES(23,53);
INSERT INTO inventory(character_id,item_id) VALUES(22,36);
INSERT INTO inventory(character_id,item_id) VALUES(9,52);
INSERT INTO inventory(character_id,item_id) VALUES(10,87);
INSERT INTO inventory(character_id,item_id) VALUES(5,10);
INSERT INTO inventory(character_id,item_id) VALUES(6,88);
INSERT INTO inventory(character_id,item_id) VALUES(6,50);
INSERT INTO inventory(character_id,item_id) VALUES(5,58);
INSERT INTO inventory(character_id,item_id) VALUES(31,22);
INSERT INTO inventory(character_id,item_id) VALUES(13,54);
INSERT INTO inventory(character_id,item_id) VALUES(16,54);
INSERT INTO inventory(character_id,item_id) VALUES(28,34);
INSERT INTO inventory(character_id,item_id) VALUES(23,57);
INSERT INTO inventory(character_id,item_id) VALUES(12,28);
INSERT INTO inventory(character_id,item_id) VALUES(3,17);
INSERT INTO inventory(character_id,item_id) VALUES(15,28);
INSERT INTO inventory(character_id,item_id) VALUES(12,9);
INSERT INTO inventory(character_id,item_id) VALUES(4,76);
INSERT INTO inventory(character_id,item_id) VALUES(20,16);
INSERT INTO inventory(character_id,item_id) VALUES(22,52);
INSERT INTO inventory(character_id,item_id) VALUES(1,88);
INSERT INTO inventory(character_id,item_id) VALUES(21,11);
INSERT INTO inventory(character_id,item_id) VALUES(3,81);
INSERT INTO inventory(character_id,item_id) VALUES(5,89);
INSERT INTO inventory(character_id,item_id) VALUES(23,5);
INSERT INTO inventory(character_id,item_id) VALUES(4,49);
INSERT INTO inventory(character_id,item_id) VALUES(32,29);
INSERT INTO inventory(character_id,item_id) VALUES(33,50);
INSERT INTO inventory(character_id,item_id) VALUES(7,61);
INSERT INTO inventory(character_id,item_id) VALUES(23,8);
INSERT INTO inventory(character_id,item_id) VALUES(7,49);
INSERT INTO inventory(character_id,item_id) VALUES(18,62);
INSERT INTO inventory(character_id,item_id) VALUES(7,40);
INSERT INTO inventory(character_id,item_id) VALUES(13,39);
INSERT INTO inventory(character_id,item_id) VALUES(33,43);
INSERT INTO inventory(character_id,item_id) VALUES(5,69);
INSERT INTO inventory(character_id,item_id) VALUES(14,83);
INSERT INTO inventory(character_id,item_id) VALUES(8,17);
INSERT INTO inventory(character_id,item_id) VALUES(35,39);
INSERT INTO inventory(character_id,item_id) VALUES(26,45);
INSERT INTO inventory(character_id,item_id) VALUES(17,53);
INSERT INTO inventory(character_id,item_id) VALUES(33,45);
INSERT INTO inventory(character_id,item_id) VALUES(34,52);
INSERT INTO inventory(character_id,item_id) VALUES(35,6);
INSERT INTO inventory(character_id,item_id) VALUES(17,53);
INSERT INTO inventory(character_id,item_id) VALUES(9,92);
INSERT INTO inventory(character_id,item_id) VALUES(20,18);
INSERT INTO inventory(character_id,item_id) VALUES(35,87);
INSERT INTO inventory(character_id,item_id) VALUES(12,31);
INSERT INTO inventory(character_id,item_id) VALUES(22,13);
INSERT INTO inventory(character_id,item_id) VALUES(3,72);
INSERT INTO inventory(character_id,item_id) VALUES(21,43);
INSERT INTO inventory(character_id,item_id) VALUES(21,40);
INSERT INTO inventory(character_id,item_id) VALUES(25,37);
INSERT INTO inventory(character_id,item_id) VALUES(3,69);
INSERT INTO inventory(character_id,item_id) VALUES(22,8);
INSERT INTO inventory(character_id,item_id) VALUES(3,4);
INSERT INTO inventory(character_id,item_id) VALUES(30,85);
INSERT INTO inventory(character_id,item_id) VALUES(18,52);
INSERT INTO inventory(character_id,item_id) VALUES(14,80);
INSERT INTO inventory(character_id,item_id) VALUES(32,59);
INSERT INTO inventory(character_id,item_id) VALUES(2,38);
INSERT INTO inventory(character_id,item_id) VALUES(1,90);
INSERT INTO inventory(character_id,item_id) VALUES(5,67);
INSERT INTO inventory(character_id,item_id) VALUES(18,62);
INSERT INTO inventory(character_id,item_id) VALUES(11,88);
INSERT INTO inventory(character_id,item_id) VALUES(7,23);
INSERT INTO inventory(character_id,item_id) VALUES(9,6);
INSERT INTO inventory(character_id,item_id) VALUES(17,41);
INSERT INTO inventory(character_id,item_id) VALUES(5,5);
INSERT INTO inventory(character_id,item_id) VALUES(19,42);
INSERT INTO inventory(character_id,item_id) VALUES(27,76);
INSERT INTO inventory(character_id,item_id) VALUES(35,9);
INSERT INTO inventory(character_id,item_id) VALUES(8,29);
INSERT INTO inventory(character_id,item_id) VALUES(26,92);
INSERT INTO inventory(character_id,item_id) VALUES(28,12);
INSERT INTO inventory(character_id,item_id) VALUES(14,24);
INSERT INTO inventory(character_id,item_id) VALUES(2,9);
INSERT INTO inventory(character_id,item_id) VALUES(29,82);
INSERT INTO inventory(character_id,item_id) VALUES(29,28);
INSERT INTO inventory(character_id,item_id) VALUES(18,1);
INSERT INTO inventory(character_id,item_id) VALUES(23,53);
INSERT INTO inventory(character_id,item_id) VALUES(33,25);
INSERT INTO inventory(character_id,item_id) VALUES(11,53);
INSERT INTO inventory(character_id,item_id) VALUES(31,43);
INSERT INTO inventory(character_id,item_id) VALUES(15,37);
INSERT INTO inventory(character_id,item_id) VALUES(28,59);
INSERT INTO inventory(character_id,item_id) VALUES(8,58);
INSERT INTO inventory(character_id,item_id) VALUES(7,35);
INSERT INTO inventory(character_id,item_id) VALUES(24,25);
INSERT INTO inventory(character_id,item_id) VALUES(20,77);
INSERT INTO inventory(character_id,item_id) VALUES(24,71);
INSERT INTO inventory(character_id,item_id) VALUES(13,28);
INSERT INTO inventory(character_id,item_id) VALUES(8,34);
INSERT INTO inventory(character_id,item_id) VALUES(22,32);
INSERT INTO inventory(character_id,item_id) VALUES(28,68);
INSERT INTO inventory(character_id,item_id) VALUES(24,24);
INSERT INTO inventory(character_id,item_id) VALUES(6,45);
INSERT INTO inventory(character_id,item_id) VALUES(30,78);
INSERT INTO inventory(character_id,item_id) VALUES(25,89);
INSERT INTO inventory(character_id,item_id) VALUES(10,10);
INSERT INTO inventory(character_id,item_id) VALUES(18,7);
INSERT INTO inventory(character_id,item_id) VALUES(8,31);
INSERT INTO inventory(character_id,item_id) VALUES(27,61);
INSERT INTO inventory(character_id,item_id) VALUES(2,75);
INSERT INTO inventory(character_id,item_id) VALUES(16,25);
INSERT INTO inventory(character_id,item_id) VALUES(6,6);
INSERT INTO inventory(character_id,item_id) VALUES(21,53);
INSERT INTO inventory(character_id,item_id) VALUES(13,83);
INSERT INTO inventory(character_id,item_id) VALUES(31,47);
INSERT INTO inventory(character_id,item_id) VALUES(6,35);
INSERT INTO inventory(character_id,item_id) VALUES(23,39);
INSERT INTO inventory(character_id,item_id) VALUES(30,67);
INSERT INTO inventory(character_id,item_id) VALUES(18,75);
INSERT INTO inventory(character_id,item_id) VALUES(32,92);
INSERT INTO inventory(character_id,item_id) VALUES(22,30);
INSERT INTO inventory(character_id,item_id) VALUES(26,34);
INSERT INTO inventory(character_id,item_id) VALUES(16,28);
INSERT INTO inventory(character_id,item_id) VALUES(6,14);
INSERT INTO inventory(character_id,item_id) VALUES(4,78);
INSERT INTO inventory(character_id,item_id) VALUES(19,78);
INSERT INTO inventory(character_id,item_id) VALUES(3,5);
INSERT INTO inventory(character_id,item_id) VALUES(1,47);
INSERT INTO inventory(character_id,item_id) VALUES(5,54);
INSERT INTO inventory(character_id,item_id) VALUES(17,33);
INSERT INTO inventory(character_id,item_id) VALUES(28,42);
INSERT INTO inventory(character_id,item_id) VALUES(15,44);
INSERT INTO inventory(character_id,item_id) VALUES(32,87);
INSERT INTO inventory(character_id,item_id) VALUES(17,58);
INSERT INTO inventory(character_id,item_id) VALUES(35,55);
INSERT INTO inventory(character_id,item_id) VALUES(27,30);
INSERT INTO inventory(character_id,item_id) VALUES(32,83);
INSERT INTO inventory(character_id,item_id) VALUES(8,55);
INSERT INTO inventory(character_id,item_id) VALUES(25,13);
INSERT INTO inventory(character_id,item_id) VALUES(26,77);
INSERT INTO inventory(character_id,item_id) VALUES(29,45);
INSERT INTO inventory(character_id,item_id) VALUES(35,46);
INSERT INTO inventory(character_id,item_id) VALUES(3,2);
INSERT INTO inventory(character_id,item_id) VALUES(2,9);
INSERT INTO inventory(character_id,item_id) VALUES(13,49);
INSERT INTO inventory(character_id,item_id) VALUES(7,38);
INSERT INTO inventory(character_id,item_id) VALUES(8,49);
INSERT INTO inventory(character_id,item_id) VALUES(31,22);
INSERT INTO inventory(character_id,item_id) VALUES(19,2);
INSERT INTO inventory(character_id,item_id) VALUES(2,48);
INSERT INTO inventory(character_id,item_id) VALUES(14,89);
INSERT INTO inventory(character_id,item_id) VALUES(8,37);
INSERT INTO inventory(character_id,item_id) VALUES(11,17);
INSERT INTO inventory(character_id,item_id) VALUES(2,73);
INSERT INTO inventory(character_id,item_id) VALUES(3,53);
INSERT INTO inventory(character_id,item_id) VALUES(1,72);
INSERT INTO inventory(character_id,item_id) VALUES(31,37);
INSERT INTO inventory(character_id,item_id) VALUES(19,88);
INSERT INTO inventory(character_id,item_id) VALUES(31,19);
INSERT INTO inventory(character_id,item_id) VALUES(34,19);
INSERT INTO inventory(character_id,item_id) VALUES(12,75);
INSERT INTO inventory(character_id,item_id) VALUES(30,90);
INSERT INTO inventory(character_id,item_id) VALUES(16,34);
INSERT INTO inventory(character_id,item_id) VALUES(12,73);
INSERT INTO inventory(character_id,item_id) VALUES(24,56);
INSERT INTO inventory(character_id,item_id) VALUES(5,67);
INSERT INTO inventory(character_id,item_id) VALUES(31,5);
INSERT INTO inventory(character_id,item_id) VALUES(19,31);
INSERT INTO inventory(character_id,item_id) VALUES(5,76);
INSERT INTO inventory(character_id,item_id) VALUES(33,63);
INSERT INTO inventory(character_id,item_id) VALUES(20,40);
INSERT INTO inventory(character_id,item_id) VALUES(22,21);
INSERT INTO inventory(character_id,item_id) VALUES(26,71);
INSERT INTO inventory(character_id,item_id) VALUES(33,80);
INSERT INTO inventory(character_id,item_id) VALUES(33,79);
INSERT INTO inventory(character_id,item_id) VALUES(29,50);
INSERT INTO inventory(character_id,item_id) VALUES(35,23);
INSERT INTO inventory(character_id,item_id) VALUES(4,84);
INSERT INTO inventory(character_id,item_id) VALUES(32,92);
INSERT INTO inventory(character_id,item_id) VALUES(24,6);
INSERT INTO inventory(character_id,item_id) VALUES(19,67);
INSERT INTO inventory(character_id,item_id) VALUES(6,81);
INSERT INTO inventory(character_id,item_id) VALUES(1,68);
INSERT INTO inventory(character_id,item_id) VALUES(8,39);
INSERT INTO inventory(character_id,item_id) VALUES(14,59);
INSERT INTO inventory(character_id,item_id) VALUES(18,63);
INSERT INTO inventory(character_id,item_id) VALUES(2,62);
INSERT INTO inventory(character_id,item_id) VALUES(19,82);
INSERT INTO inventory(character_id,item_id) VALUES(5,55);
INSERT INTO inventory(character_id,item_id) VALUES(3,42);
INSERT INTO inventory(character_id,item_id) VALUES(21,4);
INSERT INTO inventory(character_id,item_id) VALUES(28,37);
INSERT INTO inventory(character_id,item_id) VALUES(8,87);
INSERT INTO inventory(character_id,item_id) VALUES(9,26);
INSERT INTO inventory(character_id,item_id) VALUES(2,51);
INSERT INTO inventory(character_id,item_id) VALUES(20,72);
INSERT INTO inventory(character_id,item_id) VALUES(28,25);
INSERT INTO inventory(character_id,item_id) VALUES(34,72);
INSERT INTO inventory(character_id,item_id) VALUES(18,40);
INSERT INTO inventory(character_id,item_id) VALUES(33,34);
INSERT INTO inventory(character_id,item_id) VALUES(16,39);
INSERT INTO inventory(character_id,item_id) VALUES(31,19);
INSERT INTO inventory(character_id,item_id) VALUES(17,43);
INSERT INTO inventory(character_id,item_id) VALUES(35,71);
INSERT INTO inventory(character_id,item_id) VALUES(35,52);
INSERT INTO inventory(character_id,item_id) VALUES(5,34);
INSERT INTO inventory(character_id,item_id) VALUES(18,14);
INSERT INTO inventory(character_id,item_id) VALUES(31,13);
INSERT INTO inventory(character_id,item_id) VALUES(11,40);
INSERT INTO inventory(character_id,item_id) VALUES(33,82);
INSERT INTO inventory(character_id,item_id) VALUES(1,84);
INSERT INTO inventory(character_id,item_id) VALUES(19,12);
INSERT INTO inventory(character_id,item_id) VALUES(22,70);
INSERT INTO inventory(character_id,item_id) VALUES(20,46);
INSERT INTO inventory(character_id,item_id) VALUES(12,75);
INSERT INTO inventory(character_id,item_id) VALUES(22,83);
INSERT INTO inventory(character_id,item_id) VALUES(19,92);
INSERT INTO inventory(character_id,item_id) VALUES(32,21);
INSERT INTO inventory(character_id,item_id) VALUES(14,91);
INSERT INTO inventory(character_id,item_id) VALUES(3,59);
INSERT INTO inventory(character_id,item_id) VALUES(3,7);
INSERT INTO inventory(character_id,item_id) VALUES(33,83);
INSERT INTO inventory(character_id,item_id) VALUES(22,63);
INSERT INTO inventory(character_id,item_id) VALUES(21,16);
INSERT INTO inventory(character_id,item_id) VALUES(32,73);
INSERT INTO inventory(character_id,item_id) VALUES(6,61);
INSERT INTO inventory(character_id,item_id) VALUES(35,9);
INSERT INTO inventory(character_id,item_id) VALUES(35,1);
INSERT INTO inventory(character_id,item_id) VALUES(24,56);
INSERT INTO inventory(character_id,item_id) VALUES(17,64);
INSERT INTO inventory(character_id,item_id) VALUES(17,40);
INSERT INTO inventory(character_id,item_id) VALUES(34,7);
INSERT INTO inventory(character_id,item_id) VALUES(19,9);
INSERT INTO inventory(character_id,item_id) VALUES(2,43);
INSERT INTO inventory(character_id,item_id) VALUES(29,75);
INSERT INTO inventory(character_id,item_id) VALUES(7,2);
INSERT INTO inventory(character_id,item_id) VALUES(7,63);
INSERT INTO inventory(character_id,item_id) VALUES(1,31);
INSERT INTO inventory(character_id,item_id) VALUES(4,64);
INSERT INTO inventory(character_id,item_id) VALUES(15,33);
INSERT INTO inventory(character_id,item_id) VALUES(3,68);
INSERT INTO inventory(character_id,item_id) VALUES(7,76);
INSERT INTO inventory(character_id,item_id) VALUES(3,60);
INSERT INTO inventory(character_id,item_id) VALUES(30,48);
INSERT INTO inventory(character_id,item_id) VALUES(6,81);
INSERT INTO inventory(character_id,item_id) VALUES(8,54);
INSERT INTO inventory(character_id,item_id) VALUES(9,31);
INSERT INTO inventory(character_id,item_id) VALUES(7,41);
INSERT INTO inventory(character_id,item_id) VALUES(26,51);
INSERT INTO inventory(character_id,item_id) VALUES(21,62);
INSERT INTO inventory(character_id,item_id) VALUES(3,6);
INSERT INTO inventory(character_id,item_id) VALUES(22,13);
INSERT INTO inventory(character_id,item_id) VALUES(31,30);
INSERT INTO inventory(character_id,item_id) VALUES(34,92);
INSERT INTO inventory(character_id,item_id) VALUES(11,62);
INSERT INTO inventory(character_id,item_id) VALUES(30,77);
INSERT INTO inventory(character_id,item_id) VALUES(5,46);
INSERT INTO inventory(character_id,item_id) VALUES(28,17);
INSERT INTO inventory(character_id,item_id) VALUES(6,59);
INSERT INTO inventory(character_id,item_id) VALUES(30,8);
INSERT INTO inventory(character_id,item_id) VALUES(10,85);
INSERT INTO inventory(character_id,item_id) VALUES(26,56);
INSERT INTO inventory(character_id,item_id) VALUES(16,20);
INSERT INTO inventory(character_id,item_id) VALUES(23,81);
INSERT INTO inventory(character_id,item_id) VALUES(32,10);
INSERT INTO inventory(character_id,item_id) VALUES(20,66);
INSERT INTO inventory(character_id,item_id) VALUES(2,64);
INSERT INTO inventory(character_id,item_id) VALUES(23,71);
INSERT INTO inventory(character_id,item_id) VALUES(11,62);
INSERT INTO inventory(character_id,item_id) VALUES(33,76);
INSERT INTO inventory(character_id,item_id) VALUES(19,28);
INSERT INTO inventory(character_id,item_id) VALUES(28,43);
INSERT INTO inventory(character_id,item_id) VALUES(11,10);
INSERT INTO inventory(character_id,item_id) VALUES(20,29);
INSERT INTO inventory(character_id,item_id) VALUES(15,52);
INSERT INTO inventory(character_id,item_id) VALUES(20,85);
INSERT INTO inventory(character_id,item_id) VALUES(34,37);
INSERT INTO inventory(character_id,item_id) VALUES(30,86);
INSERT INTO inventory(character_id,item_id) VALUES(29,51);
INSERT INTO inventory(character_id,item_id) VALUES(28,68);
INSERT INTO inventory(character_id,item_id) VALUES(10,49);
INSERT INTO inventory(character_id,item_id) VALUES(7,35);
INSERT INTO inventory(character_id,item_id) VALUES(17,77);
INSERT INTO inventory(character_id,item_id) VALUES(1,40);
INSERT INTO inventory(character_id,item_id) VALUES(17,91);
INSERT INTO inventory(character_id,item_id) VALUES(22,73);
INSERT INTO inventory(character_id,item_id) VALUES(22,34);
INSERT INTO inventory(character_id,item_id) VALUES(26,12);
INSERT INTO inventory(character_id,item_id) VALUES(25,9);
INSERT INTO inventory(character_id,item_id) VALUES(8,4);
INSERT INTO inventory(character_id,item_id) VALUES(30,62);
INSERT INTO inventory(character_id,item_id) VALUES(3,72);
INSERT INTO inventory(character_id,item_id) VALUES(23,1);
INSERT INTO inventory(character_id,item_id) VALUES(31,4);
INSERT INTO inventory(character_id,item_id) VALUES(31,81);
INSERT INTO inventory(character_id,item_id) VALUES(9,25);
INSERT INTO inventory(character_id,item_id) VALUES(5,1);
INSERT INTO inventory(character_id,item_id) VALUES(19,21);
INSERT INTO inventory(character_id,item_id) VALUES(20,17);
INSERT INTO inventory(character_id,item_id) VALUES(18,85);
INSERT INTO inventory(character_id,item_id) VALUES(27,82);
INSERT INTO inventory(character_id,item_id) VALUES(25,41);
INSERT INTO inventory(character_id,item_id) VALUES(14,84);
INSERT INTO inventory(character_id,item_id) VALUES(30,58);
INSERT INTO inventory(character_id,item_id) VALUES(20,39);
INSERT INTO inventory(character_id,item_id) VALUES(12,90);
INSERT INTO inventory(character_id,item_id) VALUES(6,90);
INSERT INTO inventory(character_id,item_id) VALUES(6,4);
INSERT INTO inventory(character_id,item_id) VALUES(3,85);
INSERT INTO inventory(character_id,item_id) VALUES(19,38);
INSERT INTO inventory(character_id,item_id) VALUES(35,5);
INSERT INTO inventory(character_id,item_id) VALUES(3,77);
INSERT INTO inventory(character_id,item_id) VALUES(1,2);
INSERT INTO inventory(character_id,item_id) VALUES(19,52);
INSERT INTO inventory(character_id,item_id) VALUES(26,56);
INSERT INTO inventory(character_id,item_id) VALUES(33,73);
INSERT INTO inventory(character_id,item_id) VALUES(13,15);
INSERT INTO inventory(character_id,item_id) VALUES(1,18);
INSERT INTO inventory(character_id,item_id) VALUES(25,22);
INSERT INTO inventory(character_id,item_id) VALUES(17,56);
INSERT INTO inventory(character_id,item_id) VALUES(32,80);
INSERT INTO inventory(character_id,item_id) VALUES(24,62);
INSERT INTO inventory(character_id,item_id) VALUES(21,46);
INSERT INTO inventory(character_id,item_id) VALUES(23,85);
INSERT INTO inventory(character_id,item_id) VALUES(27,20);
INSERT INTO inventory(character_id,item_id) VALUES(17,11);
INSERT INTO inventory(character_id,item_id) VALUES(35,38);
INSERT INTO inventory(character_id,item_id) VALUES(24,19);
INSERT INTO inventory(character_id,item_id) VALUES(29,47);
INSERT INTO inventory(character_id,item_id) VALUES(13,52);
INSERT INTO inventory(character_id,item_id) VALUES(12,55);
INSERT INTO inventory(character_id,item_id) VALUES(17,49);
INSERT INTO inventory(character_id,item_id) VALUES(19,82);
INSERT INTO inventory(character_id,item_id) VALUES(32,5);
INSERT INTO inventory(character_id,item_id) VALUES(35,44);
INSERT INTO inventory(character_id,item_id) VALUES(9,91);
INSERT INTO inventory(character_id,item_id) VALUES(17,15);
INSERT INTO inventory(character_id,item_id) VALUES(16,50);
INSERT INTO inventory(character_id,item_id) VALUES(10,60);
INSERT INTO inventory(character_id,item_id) VALUES(6,80);
INSERT INTO inventory(character_id,item_id) VALUES(6,59);
INSERT INTO inventory(character_id,item_id) VALUES(32,45);
INSERT INTO inventory(character_id,item_id) VALUES(16,82);
INSERT INTO inventory(character_id,item_id) VALUES(8,71);
INSERT INTO inventory(character_id,item_id) VALUES(31,73);
INSERT INTO inventory(character_id,item_id) VALUES(18,36);
INSERT INTO inventory(character_id,item_id) VALUES(26,76);
INSERT INTO inventory(character_id,item_id) VALUES(34,12);
INSERT INTO inventory(character_id,item_id) VALUES(13,46);
INSERT INTO inventory(character_id,item_id) VALUES(34,78);
INSERT INTO inventory(character_id,item_id) VALUES(30,51);
INSERT INTO inventory(character_id,item_id) VALUES(34,38);
INSERT INTO inventory(character_id,item_id) VALUES(5,8);
INSERT INTO inventory(character_id,item_id) VALUES(1,5);
INSERT INTO inventory(character_id,item_id) VALUES(12,38);
INSERT INTO inventory(character_id,item_id) VALUES(28,80);
INSERT INTO inventory(character_id,item_id) VALUES(10,61);
INSERT INTO inventory(character_id,item_id) VALUES(6,10);
INSERT INTO inventory(character_id,item_id) VALUES(2,89);
INSERT INTO inventory(character_id,item_id) VALUES(15,10);
INSERT INTO inventory(character_id,item_id) VALUES(29,72);
INSERT INTO inventory(character_id,item_id) VALUES(10,22);
INSERT INTO inventory(character_id,item_id) VALUES(4,33);
INSERT INTO inventory(character_id,item_id) VALUES(11,83);
INSERT INTO inventory(character_id,item_id) VALUES(8,88);
INSERT INTO inventory(character_id,item_id) VALUES(21,13);
INSERT INTO inventory(character_id,item_id) VALUES(28,90);
INSERT INTO inventory(character_id,item_id) VALUES(16,50);
INSERT INTO inventory(character_id,item_id) VALUES(25,9);
INSERT INTO inventory(character_id,item_id) VALUES(20,30);
INSERT INTO inventory(character_id,item_id) VALUES(7,30);
INSERT INTO inventory(character_id,item_id) VALUES(15,66);
INSERT INTO inventory(character_id,item_id) VALUES(9,52);
INSERT INTO inventory(character_id,item_id) VALUES(33,11);
INSERT INTO inventory(character_id,item_id) VALUES(18,61);
INSERT INTO inventory(character_id,item_id) VALUES(30,87);
INSERT INTO inventory(character_id,item_id) VALUES(33,47);
INSERT INTO inventory(character_id,item_id) VALUES(10,12);
INSERT INTO inventory(character_id,item_id) VALUES(3,17);
INSERT INTO inventory(character_id,item_id) VALUES(22,49);
INSERT INTO inventory(character_id,item_id) VALUES(7,35);
INSERT INTO inventory(character_id,item_id) VALUES(15,81);
INSERT INTO inventory(character_id,item_id) VALUES(2,61);
INSERT INTO inventory(character_id,item_id) VALUES(11,61);
INSERT INTO inventory(character_id,item_id) VALUES(26,48);
INSERT INTO inventory(character_id,item_id) VALUES(12,2);
INSERT INTO inventory(character_id,item_id) VALUES(11,35);
INSERT INTO inventory(character_id,item_id) VALUES(14,53);
INSERT INTO inventory(character_id,item_id) VALUES(22,13);
INSERT INTO inventory(character_id,item_id) VALUES(23,33);
INSERT INTO inventory(character_id,item_id) VALUES(29,47);
INSERT INTO inventory(character_id,item_id) VALUES(31,67);
INSERT INTO inventory(character_id,item_id) VALUES(25,75);
INSERT INTO inventory(character_id,item_id) VALUES(12,51);
INSERT INTO inventory(character_id,item_id) VALUES(27,92);
INSERT INTO inventory(character_id,item_id) VALUES(15,86);
INSERT INTO inventory(character_id,item_id) VALUES(27,20);
INSERT INTO inventory(character_id,item_id) VALUES(23,16);
INSERT INTO inventory(character_id,item_id) VALUES(27,64);
INSERT INTO inventory(character_id,item_id) VALUES(10,46);
INSERT INTO inventory(character_id,item_id) VALUES(25,22);
INSERT INTO inventory(character_id,item_id) VALUES(2,78);
INSERT INTO inventory(character_id,item_id) VALUES(28,2);
INSERT INTO inventory(character_id,item_id) VALUES(14,14);
INSERT INTO inventory(character_id,item_id) VALUES(34,23);
INSERT INTO inventory(character_id,item_id) VALUES(14,62);
INSERT INTO inventory(character_id,item_id) VALUES(34,36);
INSERT INTO inventory(character_id,item_id) VALUES(32,9);
INSERT INTO inventory(character_id,item_id) VALUES(30,31);
INSERT INTO inventory(character_id,item_id) VALUES(31,80);
INSERT INTO inventory(character_id,item_id) VALUES(27,6);
INSERT INTO inventory(character_id,item_id) VALUES(17,67);
INSERT INTO inventory(character_id,item_id) VALUES(33,43);
INSERT INTO inventory(character_id,item_id) VALUES(3,53);
INSERT INTO inventory(character_id,item_id) VALUES(21,63);
INSERT INTO inventory(character_id,item_id) VALUES(3,71);
INSERT INTO inventory(character_id,item_id) VALUES(3,18);
INSERT INTO inventory(character_id,item_id) VALUES(33,84);
INSERT INTO inventory(character_id,item_id) VALUES(13,37);
INSERT INTO inventory(character_id,item_id) VALUES(3,84);
INSERT INTO inventory(character_id,item_id) VALUES(17,72);
INSERT INTO inventory(character_id,item_id) VALUES(31,35);
INSERT INTO inventory(character_id,item_id) VALUES(21,67);
COMMIT;


---задание-----

--Вывести персонажей, их расы и классы
select character.name, race.name, class.name from character 
inner join race on character.race_id=race.id inner join class on character.class_id=class.id;

--Сколько у каждого персонажа вещей в инвентаре?
select character.name, count * from character inner join inventory on character.id=inventory.character_id
inner join item on inventory.item_id=item.id group by character.name; 

--У кого из эльфов имя начинается на "T"?
select character.name, race.name from character 
inner join race on character.race_id=race.id where character.name
 like 'T%' and race.name='Elves';

--У кого из воинов самое короткое имя?
--Вывести список всех людей-лучников
--Какой класс воинов самый распространенный у гномов?
--Вывести количество персонажей в каждой расе
--Сколько персонажей не принадлежат к известной расе?
--У кого из гномов есть серебро?
--Каждому гному раздать по серебряной руде (Silver ore)
--Вывести по 3 самых тяжелых вещи в инвентаре для каждого персонажа
--Удалить из инвентаря вещи, если их количество превышает 30 для одного персонажа
 












