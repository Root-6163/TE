"
5 Unnamed PL/SQL code block: Use of Control structure and Exception handling is mandatory. Write a PL/SQL block of code for the following requirements:- 
Schema: 1. Borrower(Roll,Name,DateofIssue, NameofBook, Status)
 2. Fine (Roll, Date, Amt)  
1.Accept Roll & N ame of book from user.
2. Check the number of days (from date of issue), if days are between 15 to 30 then fine amount will be Rs 5per day.
 3. If no. of days>30, per day fine will be Rs 50 per day & for days less than 30, Rs. 5 per day.
 4. After submitting the book, status will change from I to R.
 5. If condition of fine is true, then details will be stored into fine table.
"

-----
"
We have to Write a procedure programing for automate to record the fine on the pending payment of customer
1. there is a borrow tabel in which we stored the borrowed records 
2. Fine table we stored Fine per Day
when WE Write a Name and ID it view us fine of the customer

Conditions 
if days == 15<day<30 :
then Fine should be 5 per day
elseif day > 30 then 
fine should be 50 per day
"
-- ============================================================
-- 📘 LIBRARY FINE MANAGEMENT SYSTEM (Updated Version)
-- Accepts Roll Number AND Book Name
-- Includes Control Structure + Exception Handling
-- ============================================================

-- 1️⃣ Drop old tables if they exist (for clean rerun)
DROP TABLE IF EXISTS fine;
DROP TABLE IF EXISTS borrower;

-- 2️⃣ Create borrower table
CREATE TABLE borrower (
    rollin INT PRIMARY KEY,
    name VARCHAR(50),
    dateofissue DATE,
    nameofbook VARCHAR(50),
    status VARCHAR(10)
);

-- 3️⃣ Create fine table
CREATE TABLE fine (
    rollno INT,
    returndate DATE,
    amount INT,
    FOREIGN KEY (rollno) REFERENCES borrower(rollin)
);

-- 4️⃣ Insert borrower records
INSERT INTO borrower VALUES 
(1, 'Girish',  '2022-12-31', 'DBMS', 'PEN'),
(2, 'Sakshi',  '2024-09-22', 'CN',   'PEN'),
(3, 'Shubham', '2025-04-23', 'AI',   'PEN'),
(4, 'Yash',    '2024-11-15', 'OS',   'PEN'),
(5, 'Rohan',   '2025-10-25', 'SEPM', 'PEN');

-- ============================================================
-- 5️⃣ Create Stored Procedure to Calculate Fine
-- ============================================================

DELIMITER $

CREATE PROCEDURE calc_fine_with_book(IN roll INT, IN bookname VARCHAR(50))
BEGIN
    DECLARE fine1 INT DEFAULT 0;
    DECLARE noofdays INT DEFAULT 0;
    DECLARE issuedate DATE;

    -- ⚠️ Exception Handling
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    SELECT '⚠️ Mandatory: Please ensure the Roll No. and Book Name exist in the Borrower table.';

    -- 1️⃣ Get issue date for borrower and book
    SELECT dateofissue INTO issuedate
    FROM borrower
    WHERE rollin = roll AND nameofbook = bookname;

    -- 2️⃣ Calculate number of days since issue
    SELECT DATEDIFF(CURDATE(), issuedate) INTO noofdays;

    -- 3️⃣ Fine calculation using Control Structure
    IF noofdays <= 15 THEN
        SET fine1 = 0;

    ELSEIF noofdays > 15 AND noofdays <= 30 THEN
        SET fine1 = noofdays * 5;

    ELSEIF noofdays > 30 THEN
        SET fine1 = ((noofdays - 30) * 50) + (15 * 5);
    END IF;

    -- 4️⃣ Insert fine record
    INSERT INTO fine (rollno, returndate, amount)
    VALUES (roll, CURDATE(), fine1);

    -- 5️⃣ Update borrower status to 'R'
    UPDATE borrower 
    SET status = 'R'
    WHERE rollin = roll AND nameofbook = bookname;

    -- 6️⃣ Display result
    SELECT 
        b.rollin AS 'Roll Number',
        b.name AS 'Borrower Name',
        b.nameofbook AS 'Book',
        DATEDIFF(CURDATE(), b.dateofissue) AS 'Days Passed',
        fine1 AS 'Fine Amount',
        b.status AS 'Status'
    FROM borrower b
    WHERE b.rollin = roll AND b.nameofbook = bookname;
END$
DELIMITER ;

-- ============================================================
-- 6️⃣ Execute procedure for each borrower (for testing)
-- ============================================================
CALL calc_fine_with_book(1, 'DBMS');
CALL calc_fine_with_book(2, 'CN');
CALL calc_fine_with_book(3, 'AI');
CALL calc_fine_with_book(4, 'OS');
CALL calc_fine_with_book(5, 'SEPM');

-- ============================================================
-- 7️⃣ View Fine Table
-- ============================================================
SELECT * FROM fine;

-- COPY Paste
DROP TABLE IF EXISTS fine;
DROP TABLE IF EXISTS borrower;

CREATE TABLE borrower (
    rollin INT PRIMARY KEY,
    name VARCHAR(50),
    dateofissue DATE,
    nameofbook VARCHAR(50),
    status VARCHAR(10)
);

CREATE TABLE fine (
    rollno INT,
    returndate DATE,
    amount INT,
    FOREIGN KEY (rollno) REFERENCES borrower(rollin)
);

INSERT INTO borrower VALUES 
(1, 'Girish',  '2022-12-31', 'DBMS', 'PEN'),
(2, 'Sakshi',  '2024-09-22', 'CN',   'PEN'),
(3, 'Shubham', '2025-04-23', 'AI',   'PEN'),
(4, 'Yash',    '2024-11-15', 'OS',   'PEN'),
(5, 'Rohan',   '2025-10-25', 'SEPM', 'PEN');

DELIMITER $

CREATE PROCEDURE calc_fine_with_book(IN roll INT, IN bookname VARCHAR(50))
BEGIN
    DECLARE fine1 INT DEFAULT 0;
    DECLARE noofdays INT DEFAULT 0;
    DECLARE issuedate DATE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    SELECT '⚠️ Mandatory: Please ensure the Roll No. and Book Name exist in the Borrower table.';

    SELECT dateofissue INTO issuedate
    FROM borrower
    WHERE rollin = roll AND nameofbook = bookname;

    SELECT DATEDIFF(CURDATE(), issuedate) INTO noofdays;

    IF noofdays <= 15 THEN
        SET fine1 = 0;
    ELSEIF noofdays > 15 AND noofdays <= 30 THEN
        SET fine1 = noofdays * 5;
    ELSEIF noofdays > 30 THEN
        SET fine1 = ((noofdays - 30) * 50) + (15 * 5);
    END IF;

    INSERT INTO fine (rollno, returndate, amount)
    VALUES (roll, CURDATE(), fine1);

    UPDATE borrower 
    SET status = 'R'
    WHERE rollin = roll AND nameofbook = bookname;

    SELECT 
        b.rollin AS 'Roll Number',
        b.name AS 'Borrower Name',
        b.nameofbook AS 'Book',
        DATEDIFF(CURDATE(), b.dateofissue) AS 'Days Passed',
        fine1 AS 'Fine Amount',
        b.status AS 'Status'
    FROM borrower b
    WHERE b.rollin = roll AND b.nameofbook = bookname;
END$
DELIMITER ;

CALL calc_fine_with_book(1, 'DBMS');
CALL calc_fine_with_book(2, 'CN');
CALL calc_fine_with_book(3, 'AI');
CALL calc_fine_with_book(4, 'OS');
CALL calc_fine_with_book(5, 'SEPM');

SELECT * FROM fine;

