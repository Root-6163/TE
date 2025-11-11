"
8 Database Trigger 
  (All Types: Row level and Statement level triggers, Before and After Triggers). 
  Write a database trigger on Library table. 
  The System should keep track of the records that are being updated or deleted. 
  The old value of updated or deleted records should be added in Library_Audit table
"

-- ============================================================
-- ✅ Create Database and Use It
-- ============================================================
CREATE DATABASE lib;
USE lib;

-- ============================================================
-- ✅ Create Main Table and Audit Table
-- ============================================================
CREATE TABLE library (
    bno INT(5),
    bname VARCHAR(40),
    author VARCHAR(20),
    allowed_days INT(5)
);

CREATE TABLE library_audit (
    bno INT(5),
    old_all_days INT(5),
    new_all_days INT(5)
);

-- ============================================================
-- ✅ Insert Sample Records
-- ============================================================
INSERT INTO library VALUES
(1, 'Database Systems', 'Connally T', 10),
(2, 'System Programming', 'John Donovan', 20),
(3, 'Computer Network & Internet', 'Douglas E. Comer', 18),
(4, 'Agile Project Management', 'Ken Schwaber', 24),
(5, 'Python for Data Analysis', 'Wes McKinney', 12);

SELECT * FROM library;

-- ============================================================
-- ✅ Create Trigger for Auditing Updates
-- ============================================================
DELIMITER $$

CREATE TRIGGER tr1
BEFORE UPDATE ON library
FOR EACH ROW
BEGIN
    INSERT INTO library_audit (bno, old_all_days, new_all_days)
    VALUES (NEW.bno, OLD.allowed_days, NEW.allowed_days);
END $$

DELIMITER ;

-- ============================================================
-- ✅ Perform Updates (Trigger Fires Automatically)
-- ============================================================
UPDATE library SET allowed_days = 15 WHERE bno = 1;
UPDATE library SET allowed_days = 25 WHERE bno = 2;
UPDATE library SET allowed_days = 13 WHERE bno = 3;
UPDATE library SET allowed_days = 19 WHERE bno = 4;
UPDATE library SET allowed_days = 17 WHERE bno = 5;

-- ============================================================
-- ✅ View Final Data
-- ============================================================
SELECT * FROM library;
SELECT * FROM library_audit;


--copy Paste
CREATE DATABASE lib;
USE lib;

CREATE TABLE library (
    bno INT(5),
    bname VARCHAR(40),
    author VARCHAR(30),
    allowed_days INT(5)
);

CREATE TABLE library_audit (
    bno INT(5),
    bname VARCHAR(40),
    author VARCHAR(30),
    old_allowed_days INT(5),
    new_allowed_days INT(5),
    action_type VARCHAR(20),
    action_date DATETIME
);

INSERT INTO library VALUES
(1, 'Database Systems', 'Connally T', 10),
(2, 'System Programming', 'John Donovan', 20),
(3, 'Computer Networks', 'Douglas Comer', 18),
(4, 'Agile Project Management', 'Ken Schwaber', 24),
(5, 'Python for Data Analysis', 'Wes McKinney', 12);

DELIMITER $$

CREATE TRIGGER trg_library_update
BEFORE UPDATE ON library
FOR EACH ROW
BEGIN
    INSERT INTO library_audit 
        (bno, bname, author, old_allowed_days, new_allowed_days, action_type, action_date)
    VALUES 
        (OLD.bno, OLD.bname, OLD.author, OLD.allowed_days, NEW.allowed_days, 'UPDATE', NOW());
END$$

CREATE TRIGGER trg_library_delete
BEFORE DELETE ON library
FOR EACH ROW
BEGIN
    INSERT INTO library_audit 
        (bno, bname, author, old_allowed_days, new_allowed_days, action_type, action_date)
    VALUES 
        (OLD.bno, OLD.bname, OLD.author, OLD.allowed_days, NULL, 'DELETE', NOW());
END$$

DELIMITER ;

UPDATE library SET allowed_days = 15 WHERE bno = 1;
UPDATE library SET allowed_days = 25 WHERE bno = 2;
DELETE FROM library WHERE bno = 5;

SELECT * FROM library;
SELECT * FROM library_audit;
