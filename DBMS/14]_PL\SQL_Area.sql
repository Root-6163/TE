"
14.Write a PL/SQL code block to calculate 
  the area of a circle for a value of radius varying from 5 to 9. 
  Store the radius and the corresponding values of calculated area in an empty table named areas, 
  consisting of two columns, radius and area.
"

-- Create database and table (if not already created)
CREATE DATABASE geometry;
USE geometry;

-- Create the table to store results
CREATE TABLE areas (
    radius INT,
    area DECIMAL(10,2)
);

-- Ensure the table is empty before inserting
TRUNCATE TABLE areas;

-- PL/SQL Block
DELIMITER //
BEGIN
    DECLARE r INT DEFAULT 5;
    DECLARE a DECIMAL(10,2);
    
    -- Loop from radius 5 to 9
    WHILE r <= 9 DO
        SET a = 3.14159 * r * r;  -- area = πr²
        INSERT INTO areas VALUES (r, a);
        SET r = r + 1;
    END WHILE;
END //
DELIMITER ;

-- Display the result
SELECT * FROM areas;
