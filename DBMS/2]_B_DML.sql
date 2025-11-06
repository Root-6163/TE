"
    2 (b) Design and Develop SQL DDL statements which demonstrate the use of SQL objects such as Table,view ,index
Consider :Student (Roll, Name, Address) 
Subject (sub_code, sub_name)
Marks (Roll, sub_code, marks)
1. Create Tables.
2.create view on Subject
3.Create Index on Marks with sub_code.
    "
    
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

-- Create View : 

CREATE VIEW Subject_View AS
SELECT sub_code, sub_name
FROM Subject;

-- Create An Index on Marks Table (on sub_code)

CREATE INDEX idx_marks_subcode
ON Marks(sub_code);

-- Select 
SELECT * FROM Marks WHERE sub_code = 'CS101';
