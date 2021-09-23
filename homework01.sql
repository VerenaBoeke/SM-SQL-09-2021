/*

TODOS:

1. Write an SQL command that will print Name from the table Artist (for all the database entries).
2. Print all data from the table Invoice where BillingCountry is Germany.
3. Count how many albums are in the database. Look into the SQL for help. Hint: look for Min&Max, and Count, Avg, Sum.
4. How many customers are from France?
5. What is the sum of all invoices (their totals) in the database?
5. How much is the average of all the invoice totals? 

*/

SELECT Name FROM Artist;

SELECT * FROM Invoice WHERE BillingCountry = 'Germany';

SELECT COUNT(*) FROM Album;

SELECT COUNT(*) FROM Customer WHERE Country='France';

SELECT SUM(total) FROM Invoice;

SELECT AVG(total) FROM Invoice;
