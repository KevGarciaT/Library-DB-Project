
-- Retrieve the first and last names of users who have reserved a book in the 'Fiction' category
SELECT FirstName, LastName 
FROM Users 
WHERE UserID IN (
    SELECT UserID 
    FROM Reservations 
    WHERE BookID IN (
        SELECT BookID 
        FROM Books 
        WHERE CategoryID = (
            SELECT CategoryID 
            FROM BookCategories 
            WHERE CategoryName = 'Fiction'
        )
    )
);

-- Display the title and author of books that are currently on loan
SELECT Title, Author 
FROM Books 
WHERE BookID IN (
    SELECT BookID 
    FROM Loans 
    WHERE ReturnDate IS NULL
);

-- Find the titles of books that have been reserved but not loaned.
SELECT DISTINCT b.Title
FROM Books b
INNER JOIN Reservations r ON b.BookID = r.BookID
LEFT JOIN Loans l ON b.BookID = l.BookID
WHERE l.BookID IS NULL;

-- Books loaned but not reserved
SELECT DISTINCT b.Title
FROM Books b
INNER JOIN Loans l ON b.BookID = l.BookID
LEFT JOIN Reservations r ON b.BookID = r.BookID
WHERE r.BookID IS NULL;

-- Books with availability status
SELECT 
    Title,
    Author,
    AvailableCopies,
    CASE 
        WHEN AvailableCopies > 0 THEN 'Disponible'
        ELSE 'Agotado'
    END AS Estado
FROM Books;

-- Users classified by loan activity
SELECT 
    u.UserID,
    u.FirstName,
    u.LastName,
    CASE 
        WHEN EXISTS (
            SELECT 1 FROM Loans l 
            WHERE l.UserID = u.UserID 
              AND l.ReturnDate IS NULL
        ) THEN 'Activo'
        ELSE 'Sin actividad'
    END AS Estado
FROM Users u;

-- Categories with more than 3 books
SELECT 
    bc.CategoryName,
    COUNT(b.BookID) AS TotalBooks
FROM BookCategories bc
INNER JOIN Books b ON bc.CategoryID = b.CategoryID
GROUP BY bc.CategoryID, bc.CategoryName
HAVING COUNT(b.BookID) > 3;

-- Users with more than 2 reserved books
SELECT 
    u.UserID,
    u.FirstName,
    u.LastName,
    COUNT(r.ReservationID) AS TotalReservations
FROM Users u
INNER JOIN Reservations r ON u.UserID = r.UserID
GROUP BY u.UserID, u.FirstName, u.LastName
HAVING COUNT(r.ReservationID) > 2;

-- Users and the books they have loaned
SELECT 
    u.FirstName,
    u.LastName,
    b.Title
FROM Users u
INNER JOIN Loans l ON u.UserID = l.UserID
INNER JOIN Books b ON l.BookID = b.BookID;

-- Users and the books they have reserved
SELECT 
    u.FirstName,
    u.LastName,
    b.Title
FROM Users u
INNER JOIN Reservations r ON u.UserID = r.UserID
INNER JOIN Books b ON r.BookID = b.BookID;

-- All books with the name of the user who reserved them (if any)
SELECT 
    b.Title,
    u.FirstName,
    u.LastName
FROM Books b
LEFT JOIN Reservations r ON b.BookID = r.BookID
LEFT JOIN Users u ON r.UserID = u.UserID;

-- All users with the title of the book they loaned (if any)
SELECT 
    u.FirstName,
    u.LastName,
    b.Title
FROM Users u
LEFT JOIN Loans l ON u.UserID = l.UserID
LEFT JOIN Books b ON l.BookID = b.BookID;

-- Books with their reservations (including books without reservations)
SELECT 
    b.Title,
    u.FirstName,
    u.LastName
FROM Reservations r
RIGHT JOIN Books b ON r.BookID = b.BookID
LEFT JOIN Users u ON r.UserID = u.UserID;

-- Users with loaned books (including users without loans)
SELECT 
    u.FirstName,
    u.LastName,
    b.Title
FROM Loans l
RIGHT JOIN Users u ON l.UserID = u.UserID
LEFT JOIN Books b ON l.BookID = b.BookID;

-- Book titles displayed in uppercase
SELECT 
    UPPER(Title) AS Title
FROM Books;

-- Users with first and last name combined into a single full name field
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Users;

-- Number of days elapsed since each reservation was made
SELECT 
    r.ReservationID,
    b.Title,
    r.ReservationDate,
    DATEDIFF(CURDATE(), r.ReservationDate) AS DaysSinceReservation
FROM Reservations r
INNER JOIN Books b ON r.BookID = b.BookID;

-- Loans that have not been returned yet
SELECT 
    l.LoanID,
    u.FirstName,
    u.LastName,
    b.Title,
    l.LoanDate,
    DATEDIFF(CURDATE(), l.LoanDate) AS DaysOnLoan
FROM Loans l
INNER JOIN Users u ON l.UserID = u.UserID
INNER JOIN Books b ON l.BookID = b.BookID
WHERE l.ReturnDate IS NULL;

-- Total available copies grouped by category
SELECT 
    bc.CategoryName,
    SUM(b.AvailableCopies) AS TotalAvailableCopies
FROM BookCategories bc
INNER JOIN Books b ON bc.CategoryID = b.CategoryID
GROUP BY bc.CategoryID, bc.CategoryName;

-- Total number of loans per user
SELECT 
    u.UserID,
    u.FirstName,
    u.LastName,
    COUNT(l.LoanID) AS TotalLoans
FROM Users u
LEFT JOIN Loans l ON u.UserID = l.UserID
GROUP BY u.UserID, u.FirstName, u.LastName;