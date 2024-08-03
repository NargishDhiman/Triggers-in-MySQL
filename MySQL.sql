show databases;
create database abc1;
use abc1;

create table All_Data(EmpId int,Empname varchar(30),Salary int,Department varchar(30));
create table Finance_Data(EmpId int,Empname varchar(30),Salary int,Department varchar(30));
create table Backend_Data(EmpId int,Empname varchar(30),Salary int,Department varchar(30));

# Insert:

Delimiter //
Create trigger Record1
before insert on All_Data
for each Row
Begin
If New.Department ="Finance"
Then
insert into Finance_Data values(New.EmpId,New.Empname,New.Salary,New.Department);
End if;
End //

show triggers;

insert into All_Data 
values
(1001,"Himani",45000,"IT"),
(1002,"Nisha",32000,"Sales"),
(1003,"Ritika",50000,"Finance"),
(1004,"Kusam",41000,"Sales");

insert into All_Data
values
(1005,"Ajay",20000,"Finance");

insert into All_Data
values
(1007,"Sashi",44000,"Finance");

# Update :

Delimiter //
Create trigger Record2
After Update on All_Data
for each Row
Begin
If New.Department="Finnce"
Then
insert into Finance_Data values(New.EmpId,New.Empname,New.Salary,New.Department);
End if;
End //

Update All_Data Set Department="Finance"
where EmpId=1006;

# Delete :

Delimiter //
Create trigger Record3
before delete on All_Data
for each row
Begin
insert into Backend_Data values(Old.EmpId,Old.Empname,Old.Salary,Old.Department);
End //

Delete from All_Data
where EmpId= 1006;

Delete from All_Data
where EmpId in (1007);

insert into All_Data
Select*from Backend_Data;

insert into All_Data
Select*from Finance_Data  # Error
where EmpId=1003;

Show triggers;

Drop trigger Record1;






