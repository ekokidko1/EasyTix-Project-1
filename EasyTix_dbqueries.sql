--Multiple SELECT * queries to display all the records from each table. 
--(Suppose the database has 4 tables, you should create 4 queries for this requirement.)
SELECT *
FROM dbo.Eventdetails;

SELECT *
FROM dbo.Orderdetails;

SELECT *
FROM dbo.Performer;

SELECT *
FROM dbo.Ticket;

SELECT *
FROM dbo.Userdetails;

SELECT *
FROM dbo.Venue;
-- The queries above are show the data for each table

--A query that uses aggregate function.
SELECT COUNT(DateYear) as 'Number of Events',
	DateYear	
FROM dbo.Eventdetails
GROUP BY DateYear;
--The query above shows the number of events that took place each year

--A query that selects records from two (or multiple) tables using INNER JOIN.
SELECT e.Name,
	e.Type,
	p.Age,
	p.FirstName,
	p.LastName
FROM DBO.Performer as p
	INNER JOIN dbo.Eventdetails as e
	ON p.PerformerID = e.PerformerID;
--The query shows the performer details for the various events 

--A query that selects records from two (or multiple) tables using LEFT OUTER JOIN 
--(or RIGHT OUTER JOIN or FULL OUTER JOIN).

-- Add one more Performer to make full outer join work
INSERT INTO Performer(PerformerID, FirstName, LastName, Genre, Age) VALUES
(11, 'Taylor', 'Swift', 'country pop', 27);

SELECT e.Name,
	e.Type,
	p.Age,
	p.FirstName,
	p.LastName
FROM DBO.Performer as p
	FULL OUTER JOIN dbo.Eventdetails as e
	ON p.PerformerID = e.PerformerID;
-- If we did not put "full outer join" into the above query, we would not get all the artists and their event names, even if the artist (Taylor Swift, for example), does not have an event name in the system yet


--A query that uses subquery.
SELECT TotalAmount, 
		OrderID,
		UserID
FROM dbo.Orderdetails
WHERE TotalAmount > 
      (
		SELECT AVG(TotalAmount)
		FROM DBO.Orderdetails
	  )
ORDER BY TotalAmount DESC;

--This query identifies the users who have made orders that are pricier than the average order.