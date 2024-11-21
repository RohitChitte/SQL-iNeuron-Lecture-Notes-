use Human_Resources

 
select * from Employees
--primary key is column with UNIQue and NOT Values. 

-- A TABLE CAN HAVE MULTIPLE PRIMARY KEYS. 

-- TOW WAYS OF DECLARING PRIMARY KEY.
-- USING UI GO TO TABLE RIGHT CLICK ON TABLE SELECT DESIGN RIGH CLICI ON COLUMN AND SELETCT SET PRIMARY KEY. 
-- 2ND OPTION USE BELOW QUERY. 
create table coffe (cid int NOT NULL PRIMARY KEY)

--A TABLE CAN HAVE MULTIPLE FOREIGN KEY
--A FOREIGN KEY IS USED TO CONNECT TO TABLES OR MULTIPLE TABLES 
-- FOREIGN KEY IS PRIMARY KEY OF OTHER OR SAME TABLE. 


-- constraint 
-- by default option enables us to insert default value for any column 
-- right click on table design select column in column properties default values and binding insert defalut value of colummn
-- getdate() default function attachd with from date column will insert today date after inserting a record. 
-- Not Specified string is defauol value to position column . 
 -- timestamp 30:00 video 6.  sql inerone. 

select * from Managers order by 1;
insert into Managers(sid_Employee,to_date) 
values(100617 ,'2001-01-01')

-- Not Null constraint. can be added by table design, slelect not null allowd or not check option .

-- SQL - aggregate function. 

-- count()
select count(sid_Employee) as emp_count from Employee_Location where City = 'Barstow'
select * from Employee_Location
select
City,
count(sid_Employee)  as emp_count
from 
Employee_Location
group by 
City

--counting employees from Australia only.
select * from Employee_Location
select
City,
count(sid_Employee)  as emp_count
from 
Employee_Location
where 
CountryRegionName = 'Australia'
group by 
City

--- here using where condition extrac rows with county = Australia then use group by operation on  City will grop according city colun 
--- then use count func on remaing column. 

--- if above query executed without gropby it thow error 
-- we connnot use aggragate funtin without groupby claues. 


select (City) ,count(sid_Employee) as emp_count  from Employee_Location group by City order by emp_count

--- there is difference in count and count distinct. 
select 
count(emp_no) as emp_count
 from 
 Salary_History
  
  -- count will count all rows in table duplicateds nulll values . etc. 
  -- above queries gives 901617

  select 
  count(distinct emp_no) as emp_count
  from 
  Salary_History

-- this above gives 258986 
-- used distinct keyword to get unique values. 



--- sum function .
--- problem of arthemetic overflow. 
---  arithemetic overflow -- if the  value is greater than the range of values a specific datatype can hold then this problem occure. 
--- every datatype can hold data upto specific range
--- reffer to range using this link  ----  https://keep.google.com/u/0/media/v2/1_WSO_gxFdIsyz6-Kv7mMb2b4gHVK9bIGFyAw0fFducKWeG64crLX3QlugSUSugr6/1j_wfSoSPFou79fpOIV0r3P3O6UEpFKUa3tZ344dOdf3ZDRLUCMH0Qz8ipWBLELGB?accept=image%2Fgif%2Cimage%2Fjpeg%2Cimage%2Fjpg%2Cimage%2Fpng%2Cimage%2Fwebp%2Caudio%2Faac&sz=1773

--e.g . 
-- sum 
select current_salary from Current_Personnel
select sum(cast(current_salary as decimal(18,2)))  from Current_Personnel
--select sum(current_salary) from Current_Personnel
--- (18,2)  18 for totla possible digits in number precision and 2 for scale digits after decimal
-- sum function by default return int data so we use cast to convert from decimalt to cast. 

-- avereage.
select avg(cast(current_salary as decimal(18,2)))  from Current_Personnel
select avg(cast(current_salary as decimal))  from Current_Personnel

---select avg(current_salary)  from Current_Personnel
--above gives arithematic overflow error. 

--min , max
-- getting the min and max salry of each employe. 
select 
max(current_salary) as max_salary, 
min(current_salary) as min_salary , 
abs(min(current_salary) - max(current_salary)) as SalaryMovement , 
emp_no
from 
Salary_History
group by 
emp_no

--  to get salary movement we are substaracting min salary - max salary so we get - values to get positive we use abs() funtion absolute funtin,. 

-- Having clause 
-- use 

select emp_no,current_salary from Salary_History

select emp_no,sum(current_salary) as total from Salary_History group by emp_no

select 
emp_no 
from 
Salary_History
where 
sum(current_salary)>60000
--- this gives error 
--- we can't use agragate funt in where clouse 
-- ues have cluse for that. 


-- can use aggregate function in select statement on columns but can't use conditions there
-- can use conditions in where clause but can't use aggregate function inside where claue. 

-- can use both aggregate funcitons and conditions both in having clause

select 
emp_no 
from
Salary_History
group by 
emp_no
having 
sum(current_salary) > 600000


--- impo interview question
-- difference in having clause and where clouas is 
--- we can't use aggreagate func with where but we can with having clouw
--- group by is mandatory in having but not in where cluawse.
-- we can use condition + aggregate funciions inside having claue 
select emp_no,current_salary from Salary_History
group by emp_no
having sum(current_salary)>60000


--- variables.
--- user difined and system 
--- variable is object which holds data of specific type like date, int ,flot , string. 

--- definig the variable 
-- declare @variable_name datatype = value

declare @myname as varchar(80)  = 'Rohit'
print @myname


declare @myphonenumber int -- declaring variable. 
set @myphonenumber = '0890845098'  --- this is other way of assighnein the value. 
select @myphonenumber  -- option to print staemen as above is using select 

---system defined variables.
---- to use system defiend varaible use @ two time.

select @@VERSION,@@SERVERNAME

select * from Employees
select @@ROWCOUNT  -- system defied variables. 

-- stored procedure is set of statements grouped in logical unit and strored in DB
-- e.g select , update statements arrange in logical sequence. 
-- advantage , increase performance of query , fast , easy to maintain, usefull for business usecase. 
--- stored procedures are functions in sql which are user defined. 
-- we define the stored procedure and the call then. 

create procedure 
EC @country varchar(50)
as 
select 
City,
count(sid_Employee) as emp_count
from 
Employee_Location
where 
CountryRegionName = @country
group by City
order by 
emp_count desc;

exec EC @country = 'Australia' 

-- new variable
declare @count_in varchar(50) = 'France' 
exec EC @country = @count_in;

--- created procedures are always stored in programabilty folder in DB  