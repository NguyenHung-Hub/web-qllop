use web_QLLop


SELECT*FROM classroom
SELECT*FROM student

-- Insert rows into table 'student'
INSERT INTO student
VALUES
( 
),
( -- second row: values for the columns in the list above
 Column1_Value, Column2_Value, Column3_Value
)
-- add more rows here
GO

use master

CREATE DATABASE web_QLLopHoc
go
USE web_QLLopHoc
go
CREATE TABLE classroom(
    id int not null IDENTITY PRIMARY KEY,
    className NVARCHAR(255),
    classAddress NVARCHAR(255)
)
GO
create TABLE student(
    idStudent int NOT NULL IDENTITY PRIMARY KEY,
    idClass int FOREIGN KEY REFERENCES classroom(id)
)

INSERT INTO classroom SELECT className, classAddress FROM web_QLLop.classroom

INSERT into classroom (className, classAddress)
SELECT className, classAddress from web_QLLop.dbo.classroom

use web_QLLopHoc
SELECT*FROM classroom

INSERT INTO student()
VALUES(1, )

use k16_toeic1

select *from DS

SELECT CAST((RAND()*4 + 1) as int);

ALTER TABLE student
add firstName NVARCHAR(255),
 lastName NVARCHAR(255),
 email NVARCHAR(255)

 select *FROM student 

use web_QLLopHoc
go
INSERT INTO student(idClass, firstName, lastName, email) SELECT (SELECT CAST((RAND()*4 + 1) as int)), F3, F4, F13  From k16_toeic1.dbo.DS

select *FROM classroom 
DELETE student
drop TABLE student

use web_QLLopHoc
go

UPDATE student
SET idClass = 5
WHERE idStudent > 6000 and idStudent <= 6000
GO

select *FROM student s JOIN 
classroom c ON s.idClass = c.id WHERE idClass = 2

select *FROM student  WHERE idClass = 2
UPDATE classroom
set className = 'Lap trinh Python'
WHERE id = 3

select *FROM student 

delete student
WHERE idStudent> 6010 AND idStudent <= 6000

select *FROM student 

UPDATE student
set idStudent = 11
where idStudent = 1501


