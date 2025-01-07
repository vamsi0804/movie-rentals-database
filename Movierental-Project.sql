CREATE DATABASE MovieRentalDB;
USE MovieRentalDB;

-- Create Movies table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    Genre VARCHAR(100),
    ReleaseYear INT,
    Rating DECIMAL(3,1)
);

-- Insert data into Movies table
INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, Rating)
VALUES
(1, 'The Matrix', 'Sci-Fi', 1999, 8.7),
(2, 'Inception', 'Sci-Fi', 2010, 8.8),
(3, 'Titanic', 'Romance', 1997, 7.8),
(4, 'The Dark Knight', 'Action', 2008, 9.0),
(5, 'Interstellar', 'Sci-Fi', 2014, 8.6),
(6, 'The Notebook', 'Romance', 2004, 7.4);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Age INT,
    City VARCHAR(100)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, Age, City)
VALUES
(1, 'John', 'Doe', 25, 'New York'),
(2, 'Jane', 'Smith', 32, 'Los Angeles'),
(3, 'Mike', 'Johnson', 28, 'Chicago'),
(4, 'Sarah', 'Connor', 22, 'Houston');

-- Create Rentals table
CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY,
    CustomerID INT,
    MovieID INT,
    RentalDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Insert data into Rentals table
INSERT INTO Rentals (RentalID, CustomerID, MovieID, RentalDate, ReturnDate)
VALUES
(1, 1, 1, '2024-12-01', '2024-12-05'),
(2, 2, 2, '2024-12-02', '2024-12-06'),
(3, 3, 3, '2024-12-03', '2024-12-10'),
(4, 1, 4, '2024-12-04', '2024-12-07'),
(5, 4, 5, '2024-12-05', '2024-12-09');

-- Queries for Practice

-- 1. List all movies in the database
SELECT * FROM Movies;

-- 2. Find all customers who live in New York
SELECT * FROM Customers WHERE City = 'New York';

-- 3. Find all Sci-Fi movies released after 2000
SELECT * FROM Movies WHERE Genre = 'Sci-Fi' AND ReleaseYear > 2000;

-- 4. Retrieve customers aged above 25
SELECT * FROM Customers WHERE Age > 25;

-- 5. List all movies ordered by their ratings in descending order
SELECT * FROM Movies ORDER BY Rating DESC;

-- 6. Retrieve customers sorted alphabetically by their last names
SELECT * FROM Customers ORDER BY LastName;

-- 7. Find the average rating of all movies
SELECT AVG(Rating) AS AverageRating FROM Movies;

-- 8. Count how many customers are in the database
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- 9. List all rentals with customer names and movie titles
SELECT Rentals.RentalID, Customers.FirstName, Customers.LastName, Movies.Title, Rentals.RentalDate, Rentals.ReturnDate
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
JOIN Movies ON Rentals.MovieID = Movies.MovieID;

-- 10. Find which movies were rented by "John Doe"
SELECT Movies.Title
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
JOIN Movies ON Rentals.MovieID = Movies.MovieID
WHERE Customers.FirstName = 'John' AND Customers.LastName = 'Doe';

-- 11. Identify all movies rented in December 2024
SELECT Movies.Title
FROM Rentals
JOIN Movies ON Rentals.MovieID = Movies.MovieID
WHERE MONTH(Rentals.RentalDate) = 12 AND YEAR(Rentals.RentalDate) = 2024;

-- 12. Find customers who rented a movie rated above 8.5
SELECT DISTINCT Customers.FirstName, Customers.LastName
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
JOIN Movies ON Rentals.MovieID = Movies.MovieID
WHERE Movies.Rating > 8.5;

-- 13. Group movies by genre and calculate the average rating for each genre
SELECT Genre, AVG(Rating) AS AverageRating
FROM Movies
GROUP BY Genre;

-- 14. Find the total number of rentals per customer
SELECT Customers.FirstName, Customers.LastName, COUNT(Rentals.RentalID) AS TotalRentals
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

-- 15. Retrieve the title of the highest-rated movie
SELECT Title
FROM Movies
WHERE Rating = (SELECT MAX(Rating) FROM Movies);

-- 16. Find the name of the customer who rented the movie "Interstellar"
SELECT Customers.FirstName, Customers.LastName
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
JOIN Movies ON Rentals.MovieID = Movies.MovieID
WHERE Movies.Title = 'Interstellar';
