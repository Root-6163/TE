"
    2 (a) Design and Develop SQL DDL statements which demonstrate the use of SQL objects such as Table.
Consider :Student (Roll, Name, Address) 
Subject (sub_code, sub_name
Marks (Roll, sub_code, marks)	
        1. Create Tables.
        2. Add new column  DOB into the table Student.
        3. Modify the data types of any column.
        4. Rename the column name sub_code to code.
        5. Rename the table name Subject to Sub.
        6. Drop the tables .
        7. Truncate the  tables
    "
##
" Create Table "
CREATE TABLE Student (
    Roll INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE Subject (
    sub_code VARCHAR(10) PRIMARY KEY,
    sub_name VARCHAR(50)
);

CREATE TABLE Marks (
    Roll INT,
    sub_code VARCHAR(10),
    marks INT,
    FOREIGN KEY (Roll) REFERENCES Student(Roll),
    FOREIGN KEY (sub_code) REFERENCES Subject(sub_code)
);

"ADD New Column "
ALTER TABLE Student
ADD DOB DATE;

" Modify Data Column "

ALTER TABLE Student
ALTER COLUMN Name TYPE VARCHAR(80);

"Rename The Column "
ALTER TABLE Subject
RENAME COLUMN sub_code TO code;

ALTER TABLE Subject
RENAME TO Sub;

"Drop Table "
DROP TABLE Marks;
DROP TABLE Sub;
DROP TABLE Student;

" Truncate The table "
TRUNCATE TABLE Marks;
TRUNCATE TABLE Subject;
TRUNCATE TABLE Student;
