"
6 PL/SQL Stored Procedure and Stored Function. 
Write a Stored Procedure namely proc_Grade for the categorization of student. 
If marks scored by students in examination is <=1500 and marks>=990 then student will be placed in distinction category 
if marks scored are between 989 and900 category is first class
if marks 899 and 825 category is Higher Second Class. 
Write a PL/SQL block for using   procedure   created   with   above   requirement. 
    Stud_Marks(name, total_marks) 
    Result(Roll,Name, Class)
"

"
Distinct Class ---> 900 <= Marks <= 1500
First Class ---> 900 <= Marks <= 989
Higher Second Class ---> 825 <= Marks <= 899
"
-- ============================================================
-- ✅ Create Database and Tables
-- ============================================================
CREATE DATABASE Score;
USE Score;

-- Create student marks table
CREATE TABLE stud_marks (
    name VARCHAR(20),
    total_marks INT(5)
);

-- Create result table
CREATE TABLE Result (
    roll_no INT(3) PRIMARY KEY,
    name VARCHAR(20),
    class VARCHAR(20)
);

-- ============================================================
-- ✅ Insert Sample Data
-- ============================================================
INSERT INTO stud_marks VALUES ('Suresh', 995);
INSERT INTO stud_marks VALUES ('Harish', 865);
INSERT INTO stud_marks VALUES ('Samart', 920);
INSERT INTO stud_marks VALUES ('Mohan', 1000);
INSERT INTO stud_marks VALUES ('Soham', 745);

SELECT * FROM stud_marks;

INSERT INTO Result (roll_no, name) VALUES (1, 'Suresh');
INSERT INTO Result (roll_no, name) VALUES (2, 'Harish');
INSERT INTO Result (roll_no, name) VALUES (3, 'Samart');
INSERT INTO Result (roll_no, name) VALUES (4, 'Mohan');
INSERT INTO Result (roll_no, name) VALUES (5, 'Soham');

SELECT * FROM Result;

-- ============================================================
-- ✅ Stored Procedure: proc_Grade
-- ============================================================
DELIMITER $$

CREATE PROCEDURE proc_Grade(IN r INT, OUT grade VARCHAR(25))
BEGIN
    DECLARE m INT;

    -- Get marks for student based on roll number
    SELECT total_marks 
    INTO m 
    FROM stud_marks 
    WHERE name = (SELECT name FROM Result WHERE roll_no = r);

    -- Assign grade category
    IF m >= 990 AND m <= 1500 THEN
        SET grade = 'Distinction';
        UPDATE Result SET class = 'Distinction' WHERE roll_no = r;

    ELSEIF m >= 900 AND m <= 989 THEN
        SET grade = 'First Class';
        UPDATE Result SET class = 'First Class' WHERE roll_no = r;

    ELSEIF m >= 825 AND m <= 899 THEN
        SET grade = 'Higher Second Class';
        UPDATE Result SET class = 'Higher Second Class' WHERE roll_no = r;

    ELSE
        SET grade = '--';
        UPDATE Result SET class = '--' WHERE roll_no = r;
    END IF;
END $$

DELIMITER ;

-- ============================================================
-- ✅ Stored Function: func_Grade
-- ============================================================
DELIMITER $$

CREATE FUNCTION func_Grade(r INT)
RETURNS VARCHAR(25)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(25);
    CALL proc_Grade(r, grade);
    RETURN grade;
END $$

DELIMITER ;

-- ============================================================
-- ✅ Test the Function & Procedure
-- ============================================================
SELECT func_Grade(1);
SELECT func_Grade(2);
SELECT func_Grade(3);
SELECT func_Grade(4);
SELECT func_Grade(5);

-- View the updated results
SELECT * FROM Result;

--Copy Paste 

CREATE DATABASE Score;
USE Score;

CREATE TABLE stud_marks (
    name VARCHAR(20),
    total_marks INT(5)
);

CREATE TABLE Result (
    roll_no INT(3) PRIMARY KEY,
    name VARCHAR(20),
    class VARCHAR(30)
);

INSERT INTO stud_marks VALUES 
('Suresh', 995),
('Harish', 865),
('Samarth', 920),
('Mohan', 1000),
('Soham', 745);

INSERT INTO Result (roll_no, name) VALUES 
(1, 'Suresh'),
(2, 'Harish'),
(3, 'Samarth'),
(4, 'Mohan'),
(5, 'Soham');

DELIMITER $$

CREATE PROCEDURE proc_Grade(IN r INT, OUT grade VARCHAR(30))
BEGIN
    DECLARE m INT;

    SELECT total_marks INTO m 
    FROM stud_marks 
    WHERE name = (SELECT name FROM Result WHERE roll_no = r);

    IF m >= 990 AND m <= 1500 THEN
        SET grade = 'Distinction';
        UPDATE Result SET class = 'Distinction' WHERE roll_no = r;
    ELSEIF m >= 900 AND m <= 989 THEN
        SET grade = 'First Class';
        UPDATE Result SET class = 'First Class' WHERE roll_no = r;
    ELSEIF m >= 825 AND m <= 899 THEN
        SET grade = 'Higher Second Class';
        UPDATE Result SET class = 'Higher Second Class' WHERE roll_no = r;
    ELSE
        SET grade = 'Fail';
        UPDATE Result SET class = 'Fail' WHERE roll_no = r;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION func_Grade(r INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(30);
    CALL proc_Grade(r, grade);
    RETURN grade;
END $$

DELIMITER ;

SELECT func_Grade(1);
SELECT func_Grade(2);
SELECT func_Grade(3);
SELECT func_Grade(4);
SELECT func_Grade(5);

SELECT * FROM Result;
