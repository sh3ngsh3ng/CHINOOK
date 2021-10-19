-- 1) Display all Sales Support Agents with their first name and last name
SELECT FirstName, LastName from Employee
WHERE Title = "Sales Support Agent";

-- 2) Display all employees hired between 2002 and 2003, and display their first name and last name
SELECT FirstName, LastName, HireDate from Employee
WHERE YEAR(HIREDATE) BETWEEN 2002 AND 2003;

-- 3) Display all artists that have the word 'Metal' in their name
SELECT * from Artist
WHERE NAME LIKE "%metal%";


-- 4) Display all employees who are in sales (sales manager, sales rep etc.)
SELECT * from Employee
WHERE Title LIKE "%sales%";



-- 5) Display the titles of all tracks which has the genre "easy listening"
SELECT Track.Name, Genre.Name from Track
JOIN Genre
    ON Track.GenreId = Genre.GenreId
WHERE Genre.Name LIKE "%easy listening%";

-- 6) Display all the tracks from all albums along with the genre of each track
SELECT Track.Name, Genre.Name from Track
JOIN Album
    ON Track.AlbumId = Album.AlbumId
JOIN Genre
    ON Track.GenreId = Genre.GenreId
limit 10;


-- 7) Using the Invoice table, show the average payment made for each country
SELECT BillingCountry, AVG(TOTAL) from Invoice
GROUP BY BillingCountry;

-- 8) Using the Invoice table, show the average payment made for each country, but only for countries that paid more than $5.50 in average
SELECT BillingCountry, AVG(TOTAL) from Invoice
GROUP BY BillingCountry
HAVING AVG(TOTAL) > 5.5;

-- 9) Using the Invoice table, show the average payment made for each customer, but only for customer reside in Germany and only if that customer has paid more than 10in total
SELECT CustomerId, BillingCountry, AVG(Total) from Invoice
WHERE BillingCountry = "Germany"
GROUP BY CustomerId
HAVING SUM(Total) > 10;


-- 10) Display the average length of Jazz song (that is, the genre of the song is Jazz) for each album
SELECT Track.Name, Track.AlbumId, SUM(Track.Milliseconds) FROM Track
JOIN Album
    ON Track.AlbumId = Album.AlbumId
JOIN Genre
    ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Jazz"
GROUP BY Album.AlbumId;






