use Human_Resources

select * from dbo.Employees
select * from dbo.Gender 

/* Inner join */ 
select
emp_no,
birth_date,
first_name, 
gender_name, 
emp.gender
from 
Employees emp inner join 
gender gen on gen.gender = emp.gender

-- inner join
select  
first_name, 
last_name, 
position, 
from_date

from Employees emp inner join Managers mag 
on emp.sid_Employee = mag.sid_Employee

where first_name = 'Margareta'

--left join . 
select  
first_name, 
last_name, 
position, 
from_date

from Employees emp left join Managers mag 
on emp.sid_Employee = mag.sid_Employee
order by from_date desc
-- alternative to above statement is . 
--order by 4 desc 
--where first_name = 'Margareta'

select * from gender 
select * from Employees

--right join
-- we have all records from right table and common in both tables.
select 
gen.gender,
gen.gender_name,
birth_date,
emp_no,
first_name, 
last_name
from
Employees emp  right join gender gen 
on gen.gender = Emp.gender 

select * from dbo.Current_Personnel
select * from dbo.Geography

-- full join . 
select 
cp.emp_no,
City,
CountryRegionName
from
Current_Personnel cp full join Geography geo 
on cp.sid_Location = geo.sid_Location
order by emp_no


-- join can be applied on more than 2 tables. 
--    common column must exits in the tables to join 
-- employee, manager, salaray tables have sid_employee column common 

select
emp.emp_no,
first_name,
last_name, 
position
from_date,
slh.current_salary,
slh.sal_from_date
slh,sal_to_date
from 
Employees emp inner join Managers mag 
on emp.sid_Employee = mag.sid_Employee inner join
Salary_History slh on emp.sid_Employee = slh.sid_Employee

 
 -- Multiple type of joins on multiple tables
  select * from Employee_Location
  select * from Geography

  select 
  emp.emp_no , 
  first_name, 
  last_name, 
  emplo.PostalCode localcode,  -- renaming the column
  geo.PostalCode Globalcode
  from 
  Employees emp inner join 
  Employee_Location emplo on emp.sid_Employee  = emplo.sid_Employee left join 
  Geography geo on geo.PostalCode = emplo.PostalCode


  -- self join is performed on same table. 
  select * from Management.EmployeeManagerTree

  select 
  emp1.sid_Employee, 
  emp1.FullName ,
  emp1.sid_Manager , 
  emp2.FullName as manager_name
  from 
  Management.EmployeeManagerTree emp1 left join 
  Management.EmployeeManagerTree emp2 on  emp1.sid_Manager = emp2.sid_Employee


  -- saving the qureries. 
  