"
7 Cursors: 
  (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor) 
  Write a PL/SQL block of code using parameterized Cursor, that will merge the data available in the newly created table Cust_New with the data available in the table Cust_Old.
  If the data in the first table already exist in the second table then that data should be skipped.
"
CREATE DATABASE class;
USE class;

CREATE TABLE Cust_Old (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(30)
);

CREATE TABLE Cust_New (
    cust_id INT,
    cust_name VARCHAR(30)
);

INSERT INTO Cust_Old VALUES 
(1, 'Himanshu'),
(2, 'Ram'),
(3, 'Soham'),
(5, 'Mohan'),
(6, 'Om'),
(9, 'Yash'),
(11, 'Mayur');

INSERT INTO Cust_New VALUES 
(2, 'Ram'),
(4, 'Amit'),
(7, 'Sakshi'),
(9, 'Yash'),
(12, 'Rohan');

DELIMITER $$

CREATE PROCEDURE merge_customer_data(IN min_id INT)
BEGIN
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(30);
    DECLARE done BOOLEAN DEFAULT FALSE;

    DECLARE cur_merge CURSOR FOR
        SELECT cust_id, cust_name FROM Cust_New WHERE cust_id > min_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_merge;

    read_loop: LOOP
        FETCH cur_merge INTO v_id, v_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF NOT EXISTS (SELECT * FROM Cust_Old WHERE cust_id = v_id) THEN
            INSERT INTO Cust_Old VALUES (v_id, v_name);
        END IF;
    END LOOP;

    CLOSE cur_merge;
END$$

DELIMITER ;

CALL merge_customer_data(0);

SELECT * FROM Cust_Old;
SELECT * FROM Cust_New;
