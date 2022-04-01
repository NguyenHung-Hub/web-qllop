create database web_QLLop
go

use web_QLLop
go

create table classroom(
	id int identity not null primary key,
	className nvarchar(255),
	classAddress nvarchar(255)
)

create table student(
	idStudent int identity not null primary key,
	idClass int foreign key references classroom(id),
	firstName nvarchar(255),
	lastName nvarchar(255),
	email nvarchar(255)
)


use web_QLLop
select *from classroom