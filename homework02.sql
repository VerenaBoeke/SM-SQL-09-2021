/*

TODOS:

1. What order was the most expensive? Which one was the cheapest?
2. Which city had the most orders?
3. Calculate (or count) how many tracks have this MediaType: Protected AAC audio file.
4. Find out what Artist has the most albums? (hint: check ORDER BY)
5. What genre has the most tracks?
6. Which customer spent the most money so far?
7. What songs were bought with each order? (hint: here you have to do a many-to-many SQL query with three tables: Track, Invoice and InvoiceLine. You have to do two JOINS here)

And two bonus questions:

1. How much money (in total) was spent by customers who are not associated with any company (the company field is NULL)?
2. How much money (in total) was spent by customers who are associated with a company (the company field is not NULL)? (hint: use the NOT keyword)
   Compare the two numbers to see who spends more, customers that are associated with some company or the ones that are not.

*/

/* What order was the most expensive? Which one was the cheapest? */

SELECT MAX(total), * 
FROM Invoice;

SELECT MIN(total), * 
FROM Invoice;


/* Which city had the most orders? */

SELECT BillingCity, COUNT(*) AS InvoiceSum
FROM Invoice
GROUP BY BillingCity
ORDER BY InvoiceSum DESC;


/* Calculate (or count) how many tracks have this MediaType: Protected AAC audio file. */

SELECT COUNT(*) FROM Track WHERE MediaTypeID=2;

OR 

SELECT COUNT(*)
FROM Track
INNER JOIN MediaType ON  Track.MediaTypeId = MediaType.MediaTypeId
WHERE MediaType.Name='Protected AAC audio file';


/* Find out what Artist has the most albums? (hint: check ORDER BY) */

SELECT Artist.Name, COUNT(*) as numberOfAlbums
FROM Album
INNER JOIN Artist ON  Album.ArtistId = Artist.ArtistId
GROUP BY Artist.Name
ORDER BY numberOfAlbums DESC;


/* What genre has the most tracks? */

SELECT Genre.Name, COUNT(*) as numberOfTracks
FROM Track
INNER JOIN Genre ON  Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY numberOfTracks DESC;


/* Which customer spent the most money so far? */

SELECT  Customer.FirstName, Customer.LastName, SUM(total) as customerExpenditure
FROM  Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Invoice.CustomerId
ORDER BY customerExpenditure DESC;


/* What songs were bought with each order? (hint: here you have to do a many-to-many SQL query with three tables: Track, Invoice and InvoiceLine. You have to do two JOINS here) */

SELECT  InvoiceLine.InvoiceId, Track.Name
FROM InvoiceLine
LEFT JOIN Track on InvoiceLine.TrackId = Track.TrackId
LEFT JOIN Invoice on InvoiceLine.InvoiceId = Invoice.InvoiceId;
