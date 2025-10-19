/* Creating a Database*/

CREATE DATABASE Library_Management;
USE Library_Management;

/*Creating table*/

CREATE TABLE Books(
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author VARCHAR(255) NOT NULL,
isbn VARCHAR(13) UNIQUE,
category VARCHAR(255) NOT NULL,
publication YEAR,
copies_availabel INT DEFAULT 1,
total_copies INT DEFAULT 1,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*Members Table*/

DROP TABLE Members;

CREATE TABLE Members(
Member_id INT PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR(100) NOT NULL,
Last_Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Contact VARCHAR(15),
Membership_Date DATE DEFAULT(CURRENT_DATE),
Status ENUM("Activate","Inactivate","Suspended")
);

ALTER TABLE Members
MODIFY Column Status ENUM ("Activate","Inactivate","Suspended") DEFAULT "Activate";

SELECT * FROM Members;

/*Borrowing table*/

CREATE TABLE Borrowing(
Borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
Member_id INT,
Book_id INT,
Borrow_Date DATE DEFAULT (CURRENT_DATE),
Due_Date DATE,
Return_Date DATE NULL,
Fine_Amount DECIMAL(5,2) DEFAULT 0.00,
STATUS ENUM("Borrow","Returned","Overdue"),
FOREIGN KEY (Member_id) REFERENCES Members(Member_id),
FOREIGN KEY (Book_id) REFERENCES Books(Book_id)
);

/*Insert Books Data*/

INSERT INTO Books(title, author, isbn, category, publication, copies_availabel, total_copies)
VALUES
("Mrutunjay", "Shivaji Sawant", 1234567890111, "Historical-Fiction", 1967, 3, 3),
("Chhava", "Shivaji Sawant", 1234567890112, "Historical-Fiction", 1978, 5, 5),
("Batatyachi Chal", "P.L.Deshpande", 1234567890113, "Humor-Satire", 1961, 7, 7),
("Wings Of Fire", "A.P.J.Abdul Kalam", 1234567890114, "Autobiography", 1999, 5, 5),
("Five Point Someone", "Chetan Bhagat", 1234567890115, "Campus Fiction/Humor", 2004, 4, 4),
("48 Laws of Power", "Robert Green", 1234567890116, "Strategy/Self-Help", 1998, 8, 8),
("Psychology of Money", "Morgan Housel", 1234567890117, "Personal/Finance,Behavior", 2020, 3, 3),
("The God Of Small Things", "Arundhati Roy", 1234567890118, "Literary Fiction", 1997, 8, 8),
("Midnight's Children", "Salman Rushdie", 1234567890119, "Historical-Fiction", 1981, 9, 9);

/*Inserting Members*/

INSERT INTO Members(First_Name, Last_Name, Email, Contact)
VALUES
("John", "Atkinson", 'johnatkinson10@gmail.com', 7587785410),
("Ravi", "Dubey", 'ravidubey25@gamil.com', 12454512541),
("Krrish", "Vertise", 'krrishvertise487@gmail.com', 4587962301),
("Addy", "Haule", 'hauleaddy101@gamil.com', 6145631287),
("Sandy", "Holland", 'sandyholland369@gamil.com', 3698521470),
("Ishan", "Ronak", 'ishanronak47@gamil.com', 2154878956);

/*Inserting Sample Borrowings*/

INSERT INTO Borrowing(Member_id, Borrow_Date, Due_Date, Status)
VALUES
(1, '2024-06-01', '2024-06-15', "Borrow"),
(2, '2024-06-05', '2024-06-19', "Borrow"),
(3, '2024-05-20', '2024-06-03', "Overdue"),
(1, '2024-05-15', '2024-05-29', "Returned"),
(4, '2024-06-10', '2024-06-24', "Borrow");

UPDATE borrowing
SET return_date = '2024-05-28',
    status = 'returned'
WHERE borrowing_id = 4;

/*Table Related Queries*/

SELECT book_id, title, author, category, copies_availabel, Total_copies
FROM Books
ORDER BY Title;

/*Searching book by Author*/

SELECT * FROM Books
WHERE author LIKE '%shivaji%' ;

/*SEearching Books by category*/

SELECT book_id, title, author, Publication
FROM Books
WHERE Category = "Historical-fiction"
ORDER BY "Publication_year" DESC;

/*(2) */

SELECT * FROM Members
WHERE email = 'sandyholland369@gamil.com';

/*(3) Borrowings */

SELECT b.Borrowing_id,
	   CONCAT(m.First_Name, '' , m.Last_Name) As Member_Name,
       bk.Title, bk.Author,
       b.Borrow_Date, b.Due_Date, b.Status
	From Borrowing b
    Join Members m ON b.Member_id = m.Member_id
    Join Books bk ON b.Book_id = bk.Book_id
    WHERE b.Status IN ("Borrow","Overdue")
    ORDER BY b.Due_Date;     


       
       
       
       
       
       
       





















