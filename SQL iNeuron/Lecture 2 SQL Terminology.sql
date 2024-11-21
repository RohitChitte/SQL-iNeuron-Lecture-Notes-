create database d_tableau
use d_tableau
 create table e_data (e_id int)
 select * from e_data
 insert into e_data (e_id) 
 values(112)

 update [dbo].[e_data]
 set [e_id] = 100
 where [e_id] = 112


 create table t_product (p_name varchar(30))
 insert into t_product 
 values('pro1')(p_name) 
 select * from t_product

 alter database [AdventureWorks2019] modify name = adworks2019

 alter table e_data 
 add pro_id int IDENTITY(1,5);
/* IDENTITY(1,5) is used to inset recurring values 1 and increment of 5 in pro_id column
of e_data column when new record is inserted in table value correspoinding to that in pro_id 
is incremented by 5 
*/ 

 insert into e_data (e_id) values(113) 
 insert into e_data (e_id) values(114) 
  
  select * from [dbo].[e_data]

  /* updating the size of p_name column of t_product table
   from varchar(30) to varchar(12) 
  */ 

  alter table [dbo].[t_product]
	alter column [p_name] varchar(12) 

use d_tableau_copy

select * from e_data
/* database in use can't be dropped */ 
use d_tableau


drop database d_tableau_copy

/* 
