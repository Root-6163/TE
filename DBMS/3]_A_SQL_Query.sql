"
3 (a) Design  SQL queries for suitable database application using SQL DML statements: 
Consider :Student (Roll, Name, Address) 
Subject (sub_code, sub_name)
Marks (Roll, sub_code, marks)
1.Insert  5 minimum values in all tables
2. Update row where the values are subcode=”DMS”
3. find the student whose marks are less<75.
4. Delete the record of the student whose name=”Pratik”
"

-- Create Tables 
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

-- Insert Values
-- Insert into Student table
INSERT INTO Student (Roll, Name, Address) VALUES
(1, 'Pratik', 'Pune'),
(2, 'Sneha', 'Mumbai'),
(3, 'Rohit', 'Nagpur'),
(4, 'Aarav', 'Delhi'),
(5, 'Meera', 'Nashik');

-- Insert into Subject table
INSERT INTO Subject (sub_code, sub_name) VALUES
('DBMS', 'Database Management System'),
('OS', 'Operating System'),
('CN', 'Computer Networks'),
('DMS', 'Discrete Mathematics'),
('SE', 'Software Engineering');

-- Insert into Marks table
INSERT INTO Marks (Roll, sub_code, marks) VALUES
(1, 'DBMS', 85),
(2, 'OS', 65),
(3, 'CN', 90),
(4, 'DMS', 70),
(5, 'SE', 55);


-- Update Row Where the Values are subcode="DMS"
UPDATE Subject
SET sub_name = 'Discrete Mathematical Structures'
WHERE sub_code = 'DMS';


-- Find marks < 75
SELECT s.Roll, s.Name, s.Address, m.sub_code, m.marks
FROM Student s
JOIN Marks m ON s.Roll = m.Roll
WHERE m.marks < 75;

-- Delete the REcord name="Pratik"
DELETE FROM Student
WHERE Name = 'Pratik';
