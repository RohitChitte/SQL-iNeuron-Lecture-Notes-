use adworks2019
/* selecting HumanResource.Employee table */
select * from HumanResources.Employee

/* select only those records whose gender is Male and vacation hr > 40 */
select * from HumanResources.Employee
where Gender = 'M' and  VacationHours>40


/* getting JobTitle,MaritalStatus, Gender,VacationHours columns for which gender is male and vacation hr > 40*/
select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
where Gender = 'M' and  VacationHours>40

/* sorting all records according to order of particular column */ 
/* in this case sorting values by vaccation hr in descending */ 
select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
where Gender = 'M' and  VacationHours>40
order by VacationHours desc 


/* here we may get some enteries with vacation hr more than 40 due to precedence */ 
select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
where Gender = 'M' or Gender = 'F' and  VacationHours>40
order by VacationHours desc 

/* to solve above problem use brackets */ 
select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
where (Gender = 'M' or Gender = 'F') and  VacationHours>40
order by VacationHours desc 

 /* optimised approach */ 
 /* in keyword is alternative to multiple or conditions */
 select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
--where (Gender = 'M' or Gender = 'F')
where Gender in ('M','F')
and 
VacationHours>40
order by 
VacationHours desc 


/* vacation hr in range */
select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
where (Gender in ('M','F')) and  (VacationHours>40 and VacationHours<80)
order by VacationHours  

/* alter native to and for range is keyword between */
select JobTitle,MaritalStatus, Gender,VacationHours from HumanResources.Employee
where (Gender in ('M','F')) and  (VacationHours between 40 and 60)
order by VacationHours


/* to check if null value is presetn */ 
select 
[BusinessEntityID],
[OrganizationNode]
from HumanResources.Employee 
where 
[OrganizationNode] is null;

select * from HumanResources.Employee

/* searching row where we are not clear abt content */
/* person name where name ends with erri */  
select 
[PersonType],
[FirstName],
[LastName]
from Person.Person 
where
FirstName like '_erri'

/* like keyword is used to search by pattern */ 

/* getting all distinct names excluding duplicates. */ 
select 
distinct FirstName 
from 
Person.Person


select 
count(distinct FirstName) 
from 
Person.Person

/* assigning alias */ 
/* renaming using as keyword */ 
select 
distinct FirstName as ef_name 
from 
Person.Person


select * from Sales.SalesOrderDetail

select OrderQty from Sales.SalesOrderDetail
order by OrderQty desc

/* selecting top 50 rows use top x keyword*/ 
select top 50 OrderQty from Sales.SalesOrderDetail

/* segmenting vacationhr column from Human resource tabel where vacation hr betwenn 20 and 50 is good 
vacatin hr above 50 is better and rest not specified */ 
select 
NationalIDNumber,
SalariedFlag,
VacationHours,
case
when VacationHours between 20 and 50 then 'Good'
when VacationHours >50 then 'Better' 
else 
'Not Specified' 
end
as [Status] 
from HumanResources.Employee

select MaritalStatus, 
case 
when MaritalStatus = 'S' then 'Single'
when MaritalStatus = 'M' then 'Married'
else 
'Not Specified' 
end
as Martial_Status_Description
from HumanResources.Employee



select HireDate
from HumanResources.Employee
/* time ralated information using select statement */ 
--Requirement is to extract top 10 rows of HireData column  from Employee table 
-- Display that dates in different columns of year , month , day 
select top 10 HireDate,
year([HireDate]) as [Year],
month([HireDate]) as [Month],
day([HireDate]) as [Day]
from HumanResources.Employee
-- year() ,month(), day() are some functions used on date datatype to extract respective values. 


-- deriving info not in table e.g age from DOB . 
-- from difference of HireDate and BirthDate
-- use Datediff(interval, start date, end date)
-- interval here is yy i.e difference in yeare 

select NationalIDNumber,HireDate,BirthDate,
Datediff(yy,BirthDate,HireDate) as Join_Age
from HumanResources.Employee

-- alternative way 
select NationalIDNumber,HireDate,BirthDate,(year(HireDate)-year(BirthDate)) as Age
from HumanResources.Employee



/* incrementing HireDay by  5 days and showing as join_day column*/ 
select NationalIDNumber , HireDate,JobTitle , 
DATEADD(dd,5,HireDate) as join_day
from HumanResources.Employee





