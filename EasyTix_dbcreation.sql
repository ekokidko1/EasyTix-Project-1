--Team EASYTIX Group Members: Emily Kokidko, Abby Sardjono & Tracey Shi
CREATE DATABASE EasyTixDB;
GO

USE EasyTixDB;
GO

-- Create the user, order, ticket, event, venue and performer tables
CREATE TABLE Userdetails(
  UserID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  PostalCode bigint NOT NULL,
  Country varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  Device varchar(50) NOT NULL);

CREATE TABLE Orderdetails(
  OrderID bigint NOT NULL PRIMARY KEY,
  Timehours bigint NOT NULL,
  Timeminutes bigint NOT NULL,
  DateDay bigint NOT NULL,
  DateMonth varchar(50) NOT NULL,
  DateYear bigint NOT NULL,
  Price bigint NOT NULL,
  Quantity bigint NOT NULL,
  PaymentType varchar(50) NOT NULL,
  TicketID bigint NOT NULL, 
  UserID bigint NOT NULL,
  TotalAmount bigint NOT NULL);

CREATE TABLE Ticket(
  TicketID bigint NOT NULL PRIMARY KEY,
  EventID bigint NOT NULL,
  PerformerID bigint NOT NULL,
  DateDay bigint NOT NULL,
  DateMonth varchar(50) NOT NULL,
  DateYear bigint NOT NULL,
  Timehours bigint NOT NULL,
  Timeminutes bigint NOT NULL,
  Row varchar(50) NOT NULL,
  SeatNumber bigint NOT NULL,
  SectionNumber bigint NOT NULL,
  VenueID bigint NOT NULL);

CREATE TABLE Eventdetails(
  EventID bigint NOT NULL PRIMARY KEY,
  Type varchar(50) NOT NULL,
  Name varchar(50) NOT NULL,
  DateDay bigint NOT NULL,
  DateMonth varchar(50) NOT NULL,
  DateYear bigint NOT NULL,
  VenueID bigint NOT NULL,
  Timehours bigint NOT NULL,
  Timeminutes bigint NOT NULL,
  Over21 varchar(50) NOT NULL,
  PerformerID bigint NOT NULL);

CREATE TABLE Venue(
  VenueID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  Zipcode bigint NOT NULL,
  Capacity bigint NOT NULL,
  Exits bigint NOT NULL);

CREATE TABLE Performer(
  PerformerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Genre varchar(50) NOT NULL,
  Age bigint);

-- Create the relationship
ALTER TABLE Orderdetails ADD CONSTRAINT FK_Orderdetails_UserID
FOREIGN KEY (UserID) REFERENCES Userdetails(UserID)
GO

ALTER TABLE Orderdetails ADD CONSTRAINT FK_Orderdetails_TicketID
FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
GO

ALTER TABLE Ticket ADD CONSTRAINT FK_Ticket_EventID
FOREIGN KEY (EventID) REFERENCES Eventdetails(EventID)
GO

ALTER TABLE Eventdetails ADD CONSTRAINT FK_Eventdetails_VenueID
FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
GO

ALTER TABLE Ticket ADD CONSTRAINT FK_Tickets_VenueID
FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
GO

ALTER TABLE Ticket ADD CONSTRAINT FK_Tickets_Performer
FOREIGN KEY (PerformerID) REFERENCES Performer(PerformerID)
GO

ALTER TABLE Eventdetails ADD CONSTRAINT FK_Eventdetails_PerformerID
FOREIGN KEY (PerformerID) REFERENCES Performer(PerformerID)
GO

-- Add users (1-10)
INSERT INTO Userdetails (UserID, FirstName, LastName, Email, PostalCode, Country, State, Device) VALUES 
(1, 'Jack', 'Williamson', 'jwillyxx@gmail.com', 18352, 'USA', 'Alabama', 'Android'),
(2, 'Mary', 'Butsko', 'mfkbutsko@hotmail.com', 97261, 'USA', 'Georgia', 'iOS'),
(3, 'Felicia', 'Kim', 'felicia.kim@gmail.com', 72717, 'USA', 'California', 'iOS'),
(4, 'Benito', 'Fredrickson', 'bigguybenito@yahoo.com.it', 67238, 'USA', 'New Jersey', 'Android'),
(5, 'Toto', 'Tito', 'totstitos@mail.tz', 82748, 'USA', 'Illinois', 'Android'),
(6, 'Peter', 'Lulemon', 'p.l.lemon@gmail.com', 38270, 'USA', 'Montana', 'iOS'),
(7, 'Julie', 'Steinsberg', 'julestein@hotmail.com', 91736, 'USA', 'Massachusetts', 'Android'),
(8, 'Joseph', 'Olawambe', 'jolawambe@wharton.edu', 93710, 'USA', 'Pennsylvania', 'iOS'),
(9, 'Logic', 'Mathers', 'marshall@hotmail.com', 18470, 'USA', 'Michigan', 'Android'),
(10, 'Pahtel', 'Ebeneezer', 'mitelpahtel@gmail.com', 93297, 'USA', 'Maryland', 'iOS');

-- Add Order Details (1-20). 
INSERT INTO Orderdetails (OrderID, Timehours, Timeminutes, DateDay, DateMonth, 
DateYear, Price, Quantity, PaymentType, TicketID, UserID, TotalAmount) VALUES
(1, 8, 24, 3, 'August', 2011, 78, 1, 'Visa', 1, 2, 78),
(2, 19, 43, 29, 'August', 2011, 53, 2, 'Mastercard', 2, 8, 106),
(3, 12, 17, 18, 'November', 2011, 75, 3, 'Mastercard', 3, 9, 234),
(4, 16, 33, 9, 'January', 2012, 87, 4, 'Visa', 4, 2, 348),
(5, 13, 21, 29, 'June', 2012, 54, 2, 'Discover', 5, 1, 108),
(6, 11, 48, 31, 'March', 2013, 28, 5, 'Discover', 6, 3, 140),
(7, 9, 28, 26, 'September', 2013, 37, 2, 'Visa', 7, 7, 74),
(8, 10, 56, 18, 'February', 2014, 62, 3, 'Mastercard', 8, 5, 186),
(9, 14, 19, 27, 'April', 2014, 73, 1, 'Discover', 9, 4, 73),
(10, 15, 47, 9, 'July', 2014, 43, 2, 'Visa', 10, 6, 86),
(11, 17, 29, 31, 'October', 2015, 89, 1, 'Mastercard', 11, 10, 89),
(12, 22, 36, 23, 'November', 2015, 93, 3, 'Discover', 12, 3, 279),
(13, 15, 26, 1, 'December', 2015, 25, 4, 'Visa', 13, 6, 100),
(14, 19, 43, 27, 'December', 2015, 63, 2, 'Mastercard', 14, 5, 126),
(15, 10, 28, 18, 'January', 2016, 90, 3, 'Discover', 15, 1, 270),
(16, 8, 39, 30, 'April', 2016, 28, 4, 'Discover', 16, 4, 112),
(17, 14, 46, 26, 'June', 2016, 56, 3, 'Visa', 17, 10, 168),
(18, 19, 29, 16, 'August', 2016, 49, 5, 'Mastercard', 18, 8, 245),
(19, 11, 58, 30, 'October', 2016, 81, 2, 'Visa', 19, 7, 162),
(20, 17, 36, 28, 'January', 2017, 37, 6, 'Mastercard', 20, 9, 222);

-- Add Ticket Details (1-20). 
INSERT INTO Ticket (TicketID, EventID, PerformerID, DateDay, DateMonth, DateYear, Timehours, Timeminutes,
Row, SeatNumber, SectionNumber, VenueID) VALUES
(1, 1, 1, 20, 'December', 2011, 19, 30, 'H', 5, 3, 1),
(2, 1, 1, 20, 'December', 2011, 19, 30, 'C', 7, 5, 2),
(3, 2, 2, 15, 'July', 2012, 17, 15, 'I', 8, 2, 3),
(4, 2, 2, 15, 'July', 2012, 17, 15, 'G', 19, 4, 4),
(5, 3, 3, 29, 'October', 2013, 20, 30, 'K', 20, 2, 5),
(6, 3, 3, 29, 'October', 2013, 20, 30, 'P', 16, 1, 6),
(7, 4, 4, 18, 'June', 2014, 18, 45, 'S', 1, 3, 7),
(8, 4, 4, 18, 'June', 2014, 18, 45, 'H', 10, 4, 8),
(9, 5, 5, 30, 'May', 2015, 17, 15, 'A', 8, 1, 9),
(10, 5, 5, 30, 'May', 2015, 17, 15, 'J', 25, 4, 10),
(11, 6, 6, 5, 'January', 2016, 10, 30, 'C', 4, 3, 1),
(12, 6, 6, 5, 'January', 2016, 10, 30, 'H', 29, 4, 2),
(13, 7, 7, 18, 'May', 2016, 19, 45, 'D', 8, 2, 3),
(14, 7, 7, 18, 'May', 2016, 19, 45, 'S', 13, 4, 4),
(15, 8, 8, 28, 'September', 2016, 15, 45, 'E', 8, 3, 5),
(16, 8, 8, 28, 'September', 2016, 15, 45, 'T', 10, 4, 6),
(17, 9, 9, 20, 'December', 2016, 19, 30, 'A', 17, 2, 7),
(18, 9, 9, 20, 'December', 2016, 19, 30, 'V', 25, 1, 8),
(19, 10, 10, 8, 'April', 2017, 18, 15, 'U', 16, 4, 8),
(20, 10, 10, 8, 'April', 2017, 18, 15, 'O', 29, 1, 10);

-- Add Event Details (1-10) **Event date = ticket date
INSERT INTO Eventdetails (EventID, Type, Name, DateDay, DateMonth, DateYear, VenueID, 
Timehours, Timeminutes, Over21, PerformerID) VALUES
(1, 'Concert', '2018 North American Stadium Tour', 20, 12, 2011, 1, 2, 39, 'No', 1),
(2, 'Concert', 'Beautiful Trauma World Tour', 15, 7, 2012, 2, 2, 15, 'No', 2),
(3, 'Concert', '24K Magic World Tour', 29, 10, 2013, 3, 2, 55, 'No', 3),
(4, 'Concert', 'Joanne World Tour', 18, 6, 2014, 4, 2, 17, 'No', 4),
(5, 'Concert', 'Witness The Tour', 30, 5, 2015, 5, 2, 45, 'No', 5),
(6, 'Concert', 'Evolve Tour', 5, 1, 2016, 6, 2, 33, 'No', 6),
(7, 'Concert', 'El Dorado World Tour', 18, 5, 2016, 7, 2, 23, 'No', 7),
(8, 'Concert', 'The Thrill of It All Tour', 28, 9, 2016, 8, 2, 41, 'No', 8),
(9, 'Concert', 'One More Light World Tour', 20, 12, 2016, 9, 2, 51, 'No', 9),
(10, 'Concert', 'The Mania Tour', 8, 4, 2017, 10, 2, 38, 'No', 10);

-- Add Venue Details (1-10)
INSERT INTO Venue(VenueID, Name, City, State, Zipcode, Capacity, Exits) VALUES
(1, 'Gillette Stadium', 'Foxborough', 'MA', 02035, 66829,  23),
(2, 'Madison Square Garden', 'New York', 'NY', 10001, 20789, 13),
(3, 'American Airlines Center', 'Dallas', 'TX', 75219, 20000, 10),
(4, 'Mohegan Sun Arena', 'Uncasville', 'CT', 06382, 10000, 7),
(5, 'Staples Center', 'Los Angeles', 'CA', 90015, 21000, 11),
(6, 'Prudential Center', 'Newark', 'NJ', 07102, 18711, 8),
(7, 'United Center', 'Chicago', 'IL', 60612, 23500, 15),
(8, 'Nationwide Arena', 'Columbus', 'OH', 43215, 18500, 8),
(9, 'Hollywood Bowl', 'Los Angeles', 'CA', 90068, 17500, 6),
(10, 'TD Garden', 'Boston', 'MA', 02114, 19580, 9);

-- Add Performer Details (1-10)
INSERT INTO Performer(PerformerID, FirstName, LastName, Genre, Age) VALUES
(1, 'Ed', 'Sheeran', 'folk pop', 26),
(2, 'P!nk', 'Null', 'pop rock', 38),
(3, 'Bruno', 'Mars', 'r&b', 32),
(4, 'Lady', 'Gaga', 'electropop', 31),
(5, 'Katy', 'Perry', 'pop', 32),
(6, 'Imagine Dragons', 'Null', 'alternative rock', Null),
(7, 'Shakira', 'Null', 'Latin pop', 40),
(8, 'Sam', 'Smith', 'soul', 25),
(9, 'Linkin Park', 'Null', 'alternative rock', Null),
(10, 'Fall Out Boy', 'Null', 'pop punk', Null);