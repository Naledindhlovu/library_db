-- Create the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Nationality ENUM('British', 'American', 'Other') NOT NULL
);
-- Create the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    Description TEXT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
 
 -- Insert data into the Authors table 
INSERT INTO Authors (FirstName, LastName, Nationality) VALUES
('J.K.', 'Rowling', 'British'),
('Ernest', 'Hemingway', 'American'),
('Leo', 'Tolstoy', 'Other'),
('Agatha', 'Christie', 'British'),
('F. Scott', 'Fitzgerald', 'American');
 
-- Insert data into the Books table
INSERT INTO Books (Title, AuthorID, Description) VALUES
('Harry Potter and the Chamber of Secrets', 1, 'The second book in the Harry Potter series.'),
('The Old Man and the Sea', 2, 'A novel about an aging fisherman who struggles with a giant marlin far out in the Gulf Stream.'),
('For Whom the Bell Tolls', 3, 'A novel set during the Spanish Civil War.'),
('War and Peace', 3, 'A historical novel that chronicles the history of the French invasion of Russia.'),
('Anna Karenina', 4, 'A novel about the tragic life of its heroine, Anna.'),
('Murder on the Orient Express', 4, 'A detective novel featuring Hercule Poirot.'),
('The Murder of Roger Ackroyd', 5, 'A detective novel featuring Hercule Poirot.'),
('The Great Gatsby', 5, 'A novel about the American dream and the Roaring Twenties.'),
('Tender Is the Night', 4, 'A novel about the rise and fall of Dick Diver, a charming and talented doctor.');

-- Count how many books there are in total
SELECT COUNT(*) AS TotalBooks
FROM Books;

-- Find out which author has the most books
SELECT Authors.FirstName, Authors.LastName, COUNT(Books.BookID) AS NumberOfBooks
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID
GROUP BY Authors.FirstName, Authors.LastName
ORDER BY NumberOfBooks DESC
LIMIT 1;

-- Find out how many books there are according to nationality
SELECT Authors.Nationality, COUNT(Books.BookID) AS NumberOfBooks
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID
GROUP BY Authors.Nationality;
