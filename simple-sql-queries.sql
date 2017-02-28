/*****PEOPLE*****/
/*Create a table called Person that records a person's Name, Age, Height, City, FavoriteColor, and Id. Id should be an auto-incrementing id/primary key.*/
CREATE TABLE IF NOT EXISTS Person (
    Name TEXT,
    Age INTEGER,
    Height INTEGER,
    City TEXT,
    FavoriteColor TEXT,
    Id INTEGER PRIMARY KEY AUTOINCREMENT
);


/*Add 5 different people into the Person database. Remember to not include the Id because it should auto-increment.*/
INSERT INTO Person
    (Name, Age, Height, City, FavoriteColor)
VALUES ('Aquas', 44, 69, 'Salt Lake City, UT, USA', 'red'),
     ('Smuzz', 24, 61, 'Birmingham, UK', 'purple'),
     ('BrandNewPants', 32, 67, 'Izmir, Turkey', 'blue'),
     ('BaconTender', 18, 71, 'Bethlehem, PA, USA', 'orange'),
     ('Fratley', 27, 73, 'Dublin, Ireland', 'yellow');

/*List the people in the Person table by Height from tallest to shortest (descending)*/
SELECT * FROM Person ORDER BY Height DESC;

/*List the people in the Person table by Height from shortest to tallest (ascending)*/
SELECT * FROM Person ORDER BY Height;

/*List all the people in the Person table by oldest first*/
SELECT * FROM Person ORDER BY Age DESC;

/*List all the people in the Person table older than age 20.*/
SELECT * FROM Person WHERE Age > 20;

/*List all the people in the Person table that are exactly 18.*/
SELECT * FROM Person WHERE Age = 18;

/*List all Person that are less than 20 and older than 30*/
SELECT * FROM Person WHERE Age < 20 OR Age > 30;

/*List all Person that are not 27 (Use not equals)*/
SELECT * FROM Person WHERE Age != 27;

/*List all Person where their favorite color is not red*/
SELECT * FROM Person WHERE FavoriteColor != 'red';

/*List all Person where their favorite color is not red or blue*/
SELECT * FROM Person WHERE FavoriteColor NOT IN ('red', 'blue');

/*List all Person where their favorite color is orange or green*/
SELECT * FROM Person WHERE FavoriteColor = 'orange' OR FavoriteColor = 'green';

/*List all Person where their favorite color is orange, green or blue (use IN)*/
SELECT * FROM Person WHERE FavoriteColor IN ('orange', 'green', 'blue');

/*List all Person where their favorite color is yellow or purple*/
SELECT * FROM Person WHERE FavoriteColor IN ('yellow', 'purple');



/*****ORDERS*****/
/*Create a table called Orders that records the productName, productPrice, Quantity, and personId*/
CREATE TABLE IF NOT EXISTS Orders (
    productName TEXT,
    productPrice FLOAT,
    Quantity INTEGER,
    personId INTEGER
);

/*Add 5 Orders to Order table*/
INSERT INTO Orders
    (productName, productPrice, Quantity, personId)
VALUES ('Naps', 0.01, 1, 1),
     ('Horsies', 100000, 2, 4),
     ('French Lessons', 60, 50, 3),
     ('DeDramafier', 1000.32, 2, 1),
     ('Magic Pills', 43.99, 5, 1);

/*Calculate the total number of products Ordered*/
SELECT SUM(Quantity) FROM Orders;

/*Calculate the total Order Price*/
SELECT SUM(productPrice*Quantity) FROM Orders;


/*Calculate the total Order Price By personId (If you only made orders for 1 person, go add more for the other people)*/
SELECT personId, SUM(productPrice*Quantity) FROM Orders GROUP BY personId;


/*****ARTISTS*****/
/*Add 3 new Artists to the Artist table*/
INSERT INTO Artist
    (Name)
    VALUES ('The Mission'), ('Slayer'), ('Loreena McKennitt')


/*Select the top 10 artists in reverse alphabetical order*/
SELECT * FROM Artist ORDER BY Name desc LIMIT 10;

/*Select the top 5 artists in alphabetical order*/
SELECT * FROM Artist ORDER BY Name LIMIT 5;

/*Select all artists that start with the word Black*/
SELECT * FROM Artist WHERE Name LIKE "Black%";

/*Select all artists that contain the word Black*/
SELECT * FROM Artist WHERE Name LIKE "%Black%";

/*****EMPLOYEES*****/
/*Add 2 new Employees to the Employee table*/
INSERT INTO Employee
    (LastName, FirstName, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Email)
    VALUES ('Guy', 'Some', 1, 2000-1-1, 2017-1-1, '123 Four Ln.', 'Calgary', 'Alberta', 'Canada', 'TK-128', '+1(234)567-8909','some_fantastic_fella@genericmart.com'),
           ('Hija', 'Nuestro', 3, 2001-2-2, 2017-9-11, '1 Avenida Guapita', 'Delicias', 'Chihuahua', 'Mexico', 'XI32RD33', '+1(44)2342-5463', 'princessa@mylittlepony.net');

/*List all Employee first and last names only that live in Calgary*/
SELECT FirstName, LastName FROM Employee WHERE City = "Calgary";

/*Find the first and last name for the youngest employee*/
SELECT FirstName, LastName FROM Employee ORDER BY BirthDate DESC LIMIT 1;

/*Find the first and last name for the oldest employee*/
SELECT FirstName, LastName FROM Employee ORDER BY BirthDate LIMIT 1;

/*Find everyone that reports to Nancy Edwards (Use the ReportsTo column)*/
SELECT * FROM Employee WHERE ReportsTo = 2;

/*Count how many people live in Lethbridge*/
SELECT COUNT(*) FROM Employee WHERE City = 'Lethbridge';


/*****INVOICE*****/
/*Count how many orders were made from the USA*/
SELECT COUNT(*) FROM Invoice WHERE BillingCountry = 'USA';

/*Find the largest order total amount*/
SELECT MAX(Total) FROM Invoice;


/*Find the smallest order total amount*/
SELECT MIN(Total) FROM Invoice;

/*Find all orders bigger than $5*/
SELECT * FROM Invoice WHERE Total > 5;

/*Count how many orders were smaller than $5*/
SELECT * FROM Invoice WHERE Total < 5;

/*Count how many orders were in CA, TX, or AZ (use IN)*/
SELECT COUNT(*) FROM Invoice WHERE BillingState IN ('CA', 'TX', 'AZ')

/*Get the average total of the orders*/
SELECT AVG(Total) FROM Invoice;

/*Get the total sum of the orders*/
SELECT SUM(Total) FROM Invoice;