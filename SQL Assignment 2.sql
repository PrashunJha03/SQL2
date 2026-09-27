CREATE DATABASE BookDB;
USE BookDB;

CREATE TABLE Books(
	name   VARCHAR(50) NOT NULL, 
    author VARCHAR(50) NOT NULL,
    price  DECIMAL(10,2) NOT NULL,
    writer VARCHAR(50) NOT NULL
    );
    
-- Add a new column published_year(YEAR).
ALTER TABLE Books
ADD published_year YEAR;

-- Modify the pricecolumn to DECIMAL(10,3).
ALTER TABLE Books
MODIFY price DECIMAL(10,3);

describe Books;

-- Rename the column writerto publisher. 
ALTER TABLE Books
RENAME COLUMN writer TO publisher;

-- Drop the published_year column.
ALTER TABLE Books
DROP COLUMN published_year;

DESCRIBE Books;

-- Drop the Books table.
DROP TABLE Books;

-- Insert at least 5 recordsinto the Bookstable.
INSERT INTO Books
VALUES
('Atomic Habits','James Clear',399 ,'Penguin Random House'),
('The Psychology of Money','Morgan Housel',359 ,'Jaico Publishing House'),
('The Alchemist','Paulo Coelho',299 ,'HarperCollins'),
('Sapiens','Yuval Noah Harari',499 ,'Vintage Books'),
('Ikigai','Hector Garcia',374 ,'Cornerstone');

SELECT * FROM Books;

ALTER TABLE Books
ADD PRIMARY KEY(name);

-- Update the price of a specific book.
UPDATE Books
SET price = 530
WHERE name = 'Ikigai';

-- Delete a book by name.
DELETE FROM Books
WHERE name = 'The Alchemist';

-- Remove all records from the Bookstable but keep the structure.
TRUNCATE TABLE Books;

-- Create a new user named dbdawith a password.
CREATE USER IF NOT EXISTS 'dbda'@'%' IDENTIFIED BY 'cdac';

-- Grant ALLprivileges on the database to dbda.
GRANT ALL PRIVILEGES ON *.* TO 'dbda'@'%';
GRANT DELETE ON BookDB.Books TO 'dbda'@'%'; 

-- Revokethe DELETEprivilege from dbda.
REVOKE DELETE ON BookDB.Books FROM 'dbda'@'%';

