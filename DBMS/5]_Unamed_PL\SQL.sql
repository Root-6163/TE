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
--  LIBRARY FINE MANAGEMENT - FULL SCRIPT
-- ============================================================

-- 1️⃣ Create borrower table
CREATE TABLE borrower (
    rollin INT PRIMARY KEY,
    name VARCHAR(20),
    dateofissue DATE,
    nameofbook VARCHAR(20),
    status VARCHAR(20)
);

-- 2️⃣ Create fine table
CREATE TABLE fine (
    rollno INT,
    returndate DATE,
    amount INT,
    FOREIGN KEY (rollno) REFERENCES borrower(rollin)
);

-- 3️⃣ Insert sample records into borrower table
INSERT INTO borrower VALUES (1, 'abc', '2017-08-01', 'SEPM', 'PEN');
INSERT INTO borrower VALUES (2, 'xyz', '2017-07-01', 'DBMS', 'PEN');
INSERT INTO borrower VALUES (3, 'pqr', '2017-08-15', 'DBMS', 'PEN');

-- ============================================================
-- 4️⃣ Create stored procedure to calculate fine
-- ============================================================
DELIMITER $

CREATE PROCEDURE calc_fine_lib6(IN roll INT)
BEGIN
    DECLARE fine1 INT;
    DECLARE noofdays INT;
    DECLARE issuedate DATE;

    -- Handle SQL exceptions gracefully
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    SELECT 'create table definition';

    -- Get the issue date for the borrower
    SELECT dateofissue INTO issuedate 
    FROM borrower 
    WHERE rollin = roll;

    -- Calculate number of days since issue
    SELECT DATEDIFF(CURDATE(), issuedate) INTO noofdays;

    -- Calculate fine based on days overdue
    IF noofdays > 15 AND noofdays <= 30 THEN
        SET fine1 = noofdays * 5;
        INSERT INTO fine VALUES(roll, CURDATE(), fine1);

    ELSEIF noofdays > 30 THEN
        SET fine1 = ((noofdays - 30) * 5) + (15 * 5);
        INSERT INTO fine VALUES(roll, CURDATE(), fine1);

    ELSE
        INSERT INTO fine VALUES(roll, CURDATE(), 0);
    END IF;

    -- Update borrower status
    UPDATE borrower 
    SET status = 'return' 
    WHERE rollin = roll;
END$
DELIMITER ;

-- ============================================================
-- 5️⃣ Execute procedure for each borrower
-- ============================================================
CALL calc_fine_lib6(1);
CALL calc_fine_lib6(2);
CALL calc_fine_lib6(3);

-- ============================================================
-- 6️⃣ View fine table
-- ============================================================
SELECT * FROM fine;

