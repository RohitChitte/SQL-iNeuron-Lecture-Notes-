---Schema - is structure by which all the tables ,views, stored procedures are organised  
-- tables are created inside schema 
-- we use DDL and DML to defien structure of schema

create schema  SECIRE_AUDIT authorization dbo 
create table EMP_AUDIT (sid_employee int not null)

--- to define the users and then assign the roles. 
 --- assignin roles means being able to do operations like select or DML , DDL etc.
grant select on SCHEMA :: SECIRE_AUDIT to staff_audit
deny select on SCHEMA :: SECIRE_AUDIT to buisiness_user

select * from Employees

select 
emp_no,
len(last_name) as lengthoffname
from 
Employees

select
emp_no,
first_name,
last_name,
left(first_name,1) as initial, --return no of characters from left left(column_name,number of character from left)
left(first_name,1) + '.' + last_name as shotname   -- concatenation.
from
Employees


select count(*) from Current_Personnel where current_location like 'N.%'
-- alternative to above statement is --
select
count(current_location)
from
Current_Personnel
where 
CHARINDEX('N.',current_location)>0

-- both above and below queris give same result. 
select
count(current_location)
from
Current_Personnel
where
current_location like 'N. Vancouver'


select
emp_no,
current_location
from
Current_Personnel
where 
CHARINDEX('N.',current_location)>0

select 
emp_no , 
current_location,
REPLACE(current_location,'N.','North') as Updatename  --this will create a new column  by replacing the names with N. with North
from
Current_Personnel
where
CHARINDEX('N.',current_location)>0 

--- using loops 
--- printing numbers from 1 to 25 using loops
declare @conter int = 1
while @conter < 25
begin
print @conter
set @conter = @conter + 1;
end


--- creating a table with start dates of 52 weeks asuumeing week 1 starts with jan1
--- using loops
declare @tDate table(wNum int,wkdate date)

declare @num int = 1
declare @wfirst date = '2020-12-31'

while @num>-1
begin
insert into @tDate (wNum,wkdate)
select
@num,
dateadd(wk,@num,@wfirst)  ---dateadd() funciton dateadd(interwal,number_of_units_of_interval,startdate)
                           --- 2nd arg is @num because for num = 1 , 1 week will be added in date for num=2 ,2 weeks will be added.
select @num = @num + 1
if @num>52 BREAK
end;
select * from @tDate

---- execute to see behaviour of dateadd() funcitons.
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;
SELECT DATEADD(year, 2, '2017/08/25') AS DateAdd;

---operators like unioun,intersection

select * from Departments
union   ---operator display all unique values and eleminates duplicate values.
select * from Departments

select * from Departments
union all  --consider all rows in both tables. do not filter the duplicates. 
select * from Departments


select * from Departments
intersect -- gives only common rows and elimintes uncommon rows 
select * from Departments

--- reasons for slow query processing. 
--- designn of DB
--- busy server, Size of data is huge.

-- optimising the query. 
--index . 
use Human_Resources


select 
count(distinct sid_Employee)  as emp_pay
from
payroll.Employee_Payroll
where 
Pay_Date  = '2019-07-15'

-- hit 2nd  icon next to execure (Estimated Execution pan) 
-- go to table in left pane go to index option right click select new index -- non cluster index

-- indexing is the way to optimise the query. 
   
