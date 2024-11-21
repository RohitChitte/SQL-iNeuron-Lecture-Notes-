select * from First_View
use Human_Resources


-- creating views using queries 
create view Tview as
select 
emp1.sid_Employee,
emp1.FullName, 
emp1.sid_Manager,
emp1.FullName as ManagerName
from 
Management.EmployeeManagerTree emp1 left join 
Management.EmployeeManagerTree emp2 on emp1.sid_Manager = emp2.sid_Employee


select * from Tview

-- operation on 2 tables and saving the new output table. 
--select employee numnber , birthdate, name , hiredate,gender name
-- from employee and gender table. and then getting info of only female employees and sorting with birthdate column. 
-- INTO empfemalebirthdayes ## adding this statement will create new table in to database

select
emp_no,
birth_date,
first_name,
hire_date,
Gender.gender_name
INTO 
 empfemalebirthdays  --- this will create new table in database with name empfemalebirthdays
from 
Employees emp left join
Gender on emp.gender=Gender.gender
where 
emp.gender='F'
order by emp.birth_date


select * from empfemalebirthdays

--- using INSERT command 
--- to update row/record in table. 

-- before inserting record checking if record is present aldready.  
--Employees table have info of all working and non working existing and past employee

 select * from Employees ; 
 select * from Employees where emp_no = '10021'

 -- cureren Personnel has in fo of currently working employees. 
select * from Current_Personnel where emp_no = '10021'

select 'Employees' as T1 ,* from Employees where emp_no in (11021);
select 'Emp_Location' as T2 ,* from Employee_Location where emp_no in (11021);
select 'Emp_Movements' as T3 ,* from Employee_Movements_History where emp_no in (11021);
select 'Emp_Position' as T4,* from Employee_Position_History where emp_no in (11021);
select 'Emp_Salary' as T5,* from Salary_History where emp_no in (11021);


select 'Employees' as T1 ,* from Employees where emp_no in (11021);
select 'Employees' as T1 ,* from Employees where emp_no = '11021';
--select * from Salary_History where emp_no =  '10021' 
--select * from Salary_History where emp_no =  '10021' order by 5 desc 
--order by 5 desc signify that last 5 records are fetch or highest 5 records are fetch.   


-- as multiple columns from multiple tables are to be fetched joins are used. 
-- to perform joins all tbales must have same collumn with same datatype. 

select 
emp.sid_Employee, 
emp.emp_no,
sh.current_salary,
el.city, 
emh.sid_Department,
el.sid_Location, 
eph.sid_Position
from 
Employees emp inner join 
Employee_Location el on emp.sid_Employee = el.sid_Employee inner join 
Employee_Movements_History emh on  emp.sid_Employee = emh.sid_Employee inner join 
Employee_Position_History eph on emp.sid_Employee = eph.sid_Employee inner join 
Salary_History sh on emp.sid_Employee = sh.sid_Employee 
where emp.emp_no = '10021'

-- video SQl 5 timestamp 1:08:18 
-- above qurey modified to give only maximul salary record of emp_no 10021
select 
emp.sid_Employee, 
emp.emp_no,
(select max(current_salary) from Salary_History where emp_no = emp.emp_no) as current_salary,
el.city, 
emh.sid_Department,
el.sid_Location, 
eph.sid_Position
from 
Employees emp inner join 
Employee_Location el on emp.sid_Employee = el.sid_Employee inner join 
Employee_Movements_History emh on  emp.sid_Employee = emh.sid_Employee inner join 
Employee_Position_History eph on emp.sid_Employee = eph.sid_Employee inner join 
Salary_History sh on emp.sid_Employee = sh.sid_Employee 
where emp.emp_no = '10021'

select * from Salary_History where emp_no = '10021'
select max(current_salary) from Salary_History where emp_no = '10021'
select * from Salary_History where emp_no = '10021' and current_salary in (select max(current_salary) from Salary_History where emp_no = '10021')

-- inserting this record in current personnel table. 
insert into Current_Personnel(sid_Employee,emp_no,current_salary,current_location,sid_Department,sid_Location,sid_position)
select 
emp.sid_Employee, 
emp.emp_no,
(select max(current_salary) from Salary_History where emp_no = emp.emp_no) as current_salary,
el.city, 
emh.sid_Department,
el.sid_Location, 
eph.sid_Position
from 
Employees emp inner join 
Employee_Location el on emp.sid_Employee = el.sid_Employee inner join 
Employee_Movements_History emh on  emp.sid_Employee = emh.sid_Employee inner join 
Employee_Position_History eph on emp.sid_Employee = eph.sid_Employee inner join 
Salary_History sh on emp.sid_Employee = sh.sid_Employee 
where emp.emp_no = '10021'     


--fetching the location id for city Dunkerque from Geography table.
select sid_Location,City from Geography where City='Dunkerque'


select * from 
Current_Personnel cp inner join 
Geography geo on geo.City = cp.current_location
where sid_Employee  = 21

update Current_Personnel
set sid_Location = geo.sid_Location
from 
Current_Personnel cp inner join 
Geography geo on geo.City = cp.current_location 
where sid_Employee = 21


select * from Employee_Movements_History

-- concatenating 2 columns to 1 columns. 
-- cast function is used to do type casting
 update Employee_Movements_History 
 set test = cast(cast(sid_Employee as varchar(8)) + cast(sid_Department as varchar(8)) as int)




  