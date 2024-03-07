-----------------------Task 1-----------------------

CREATE DATABASE COURIER_SYSTEM

CREATE TABLE User_Details
(
    User_ID INT PRIMARY KEY,
    User_Name VARCHAR(255),
    User_Mail VARCHAR(255) UNIQUE,
    User_Pass VARCHAR(255),
    User_Number VARCHAR(10),
    User_Address TEXT
);

CREATE TABLE Courier_Details
(
    Courier_ID INT PRIMARY KEY,
    UserID INT,
    Sender_Name VARCHAR(255),
    Sender_Address TEXT,
    Receiver_Name VARCHAR(255),
    Receiver_Address TEXT,
    Courier_Weight DECIMAL(5,2),
    Courier_Status VARCHAR(30),
    Tracking_Number VARCHAR(20) UNIQUE,
    Delivery_Date DATE,
    Package VARCHAR(50),
    FOREIGN KEY(UserID) REFERENCES User_Details(User_ID)
);

ALTER TABLE Courier_Details ADD ServiceID INT, FOREIGN KEY (ServiceID) REFERENCES Courier_Services(Service_ID)

CREATE TABLE Courier_Services
(
    Service_ID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Service_Cost DECIMAL(8,2)
);

CREATE TABLE Employee_Details
(
    Employee_ID INT PRIMARY KEY,
    LocationID INT,
    Employee_Name VARCHAR(255),
    Employee_Mail VARCHAR(255) UNIQUE,
    Employee_Number VARCHAR(10),
    Employee_Role VARCHAR(50),
    Employee_Salary DECIMAL(10,2),
    FOREIGN KEY (LocationID) REFERENCES Locations(Location_ID)
);

CREATE TABLE Locations
(
    Location_ID INT PRIMARY KEY,
    Location_Name VARCHAR(100),
    Location_Address TEXT
);

CREATE TABLE Payment_Details
(
    Payment_ID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier_Details(Courier_ID),
    FOREIGN KEY (LocationID) REFERENCES Locations(Location_ID),
);
Alter TABLE Payment_Details ADD Payment_Status VARCHAR(50)
/*Adding Value to the created tables*/

INSERT INTO User_Details VALUES (1,'Bharathraj','bharathraj@gmail.com', 'Bharath@01','6456289455','Thiruvanamalai')
INSERT INTO User_Details VALUES (2,'Abinaya','abinaya@gmail.com', 'Abinaya@01','5723724875','Neyveli')
INSERT INTO User_Details VALUES (3,'Dharani','dharani@gmail.com', 'Dharani@01','9475966323','Neyveli')
INSERT INTO User_Details VALUES (4,'Abiksitha','abikistha2002@gmail.com', 'Abiksitha@01','6890754368','Paramakudi')
INSERT INTO User_Details VALUES (5,'Navina','navina@gmail.com', 'Navina@01','2647586970','Neyveli')
INSERT INTO User_Details VALUES (6,'Sivanathan','sivanathan@gmail.com', 'Sivanathan@01','9685746453','Trichy')
INSERT INTO User_Details VALUES (7,'Alwyn','alwynsamuel.m@gmail.com', 'Alwyn@01','7683955603','Chennai')
INSERT INTO User_Details VALUES (8,'Malavika','malavika@gmail.com', 'Malavika@01','7683348603','Chennai')

INSERT INTO Courier_Details VALUES (11, 1, 'Bharathraj', 'Thiruvanamalai', 'Abinaya', 'Neyveli', 234.7, 'Delivered', '1001', '2024-02-28', 'Gift_Card')
INSERT INTO Courier_Details VALUES (12, 1, 'Bharathraj', 'Thiruvanamalai', 'Abiksitha', 'Paramakudi', 209.8, 'Not Delivered', '1002', '2024-03-13', 'Chocolate')
INSERT INTO Courier_Details VALUES (13, 2, 'Abinaya', 'Neyveli', 'Bharathraj', 'Thiruvanamalai', 134.7, 'Delivered', '1003', '2024-02-26', 'Chocolate')
INSERT INTO Courier_Details VALUES (14, 3, 'Dharani', 'Neyveli', 'Bharathraj', 'Thiruvanamalai', 204.2, 'Not Delivered', '1004', '2024-03-14', 'T_Shirt')
INSERT INTO Courier_Details VALUES (15, 3, 'Dharani', 'Neyveli', 'Sivanathan', 'Trichy', 236.3, 'Delivered', '1005', '2024-02-20', 'Shirt')
INSERT INTO Courier_Details VALUES (16, 3, 'Dharani', 'Neyveli', 'Alwyn', 'Chennai', 344.7, 'Not Delivered', '1006', '2024-03-20', 'Chocolate')
INSERT INTO Courier_Details VALUES (17, 4, 'Abiksitha', 'Paramakudi', 'Bharathraj', 'Thiruvanamalai', 354.7, 'Delivered', '1007', '2024-03-03', 'Chocolate')
INSERT INTO Courier_Details VALUES (18, 4, 'Abiksitha', 'Paramakudi', 'Alwyn', 'Chennai', 554.7, 'Not Delivered', '1008', '2024-03-17', 'Gift_Card')
INSERT INTO Courier_Details VALUES (19, 5, 'Navina', 'Neyveli', 'Sivanathan', 'Trichy', 654.7, 'Delivered', '1009', '2024-03-05', 'Shirt')
INSERT INTO Courier_Details VALUES (20, 6, 'Sivanathan', 'Trichy', 'Abinaya', 'Neyveli', 624.4, 'Not Delivered', '1010', '2024-03-18', 'T_Shirt')
INSERT INTO Courier_Details VALUES (21, 6, 'Sivanathan', 'Trichy', 'Dharani', 'Neyveli', 646.6, 'Delivered', '1011', '2024-02-27', 'T_Shirt')
INSERT INTO Courier_Details VALUES (22, 6, 'Sivanathan', 'Trichy', 'Abiksitha', 'Paramakudi', 855.9, 'Not Delivered', '1012', '2024-03-21', 'Shirt')
INSERT INTO Courier_Details VALUES (23, 6, 'Sivanathan', 'Trichy', 'Navina', 'Neyveli', 314.5, 'Delivered', '1013', '2024-02-29', 'Smartphone')
INSERT INTO Courier_Details VALUES (24, 7, 'Alwyn', 'Chennai', 'Malavika', 'Chennai', 834.2, 'Not Delivered', '1014', '2024-03-09', 'Smartphone')
update Courier_Details SET Delivery_Date = '2024-03-08' WHERE Courier_ID = 24

INSERT INTO Courier_Services VALUES (31,'Speed Post',100.0)
INSERT INTO Courier_Services VALUES (32,'DHL',200.0)
INSERT INTO Courier_Services VALUES (33,'FedEX',250.0)
INSERT INTO Courier_Services VALUES (34,'Blue Dart',150.0)

Update Courier_Details SET ServiceID = 31 Where Courier_ID IN (24)
/*Updated the value in the Courier_Details Table by adding serive id to track the type of service used*/

SELECT * FROM Courier_Details

INSERT INTO Locations VALUES (41, 'Urban', 'Thiruvanamalai')
INSERT INTO Locations VALUES (42, 'Urban', 'Trichy')
INSERT INTO Locations VALUES (43, 'Urban', 'Chennai')
INSERT INTO Locations VALUES (44, 'Rural', 'Paramakudi')
INSERT INTO Locations VALUES (45, 'Rural', 'Neyveli')

SELECT * FROM Locations

INSERT INTO Employee_Details VALUES (51, 41, 'Malavan', 'malav@gmail.com','3242325322', 'Delivery Boy', 20000)
INSERT INTO Employee_Details VALUES (52, 42, 'Vigneshwar', 'vicky@gmail.com','5320673257', 'Delivery Boy', 22000)
INSERT INTO Employee_Details VALUES (53, 43, 'Sakthi', 'power@gmail.com','9638527410', 'Delivery Boy', 18000)
INSERT INTO Employee_Details VALUES (54, 44, 'Karthikumar', 'karthik@gmail.com','6543219870', 'Delivery Boy', 20000)
INSERT INTO Employee_Details VALUES (55, 45, 'Gokulraj', 'gkraj_dharani@gmail.com','8529637413', 'Delivery Boy', 25000)
INSERT INTO Employee_Details VALUES (56, NULL, 'Ashik', 'ashik@gmail.com','7536914289', 'Manager', 75000)
INSERT INTO Employee_Details VALUES (57, NULL, 'Dhansuh', 'dhanush@gmail.com','8463737452', 'Assistant Manager', 50000)


SELECT * FROM Employee_Details

INSERT INTO Payment_Details VALUES (61, 11, 45, 23470.0, '2024-02-25', 'Paid')
INSERT INTO Payment_Details VALUES (62, 12, 44, 20980.0, '2024-03-10', 'Paid')
INSERT INTO Payment_Details VALUES (63, 13, 41, 26940.0, '2024-02-21', 'Paid')
INSERT INTO Payment_Details VALUES (64, 14, 41, 30630.0, NULL, 'Not Paid')
INSERT INTO Payment_Details VALUES (65, 15, 42, 35445.0, '2024-02-10', 'Paid')
INSERT INTO Payment_Details VALUES (66, 16, 43, 51705.0, '2024-03-10', 'Paid')
INSERT INTO Payment_Details VALUES (67, 17, 41, 35470.0, '2024-02-22', 'Paid')
INSERT INTO Payment_Details VALUES (68, 18, 43, 55470.0, NULL, 'Not Paid')
INSERT INTO Payment_Details VALUES (69, 19, 42, 130940.0, '2024-02-27', 'Paid')
INSERT INTO Payment_Details VALUES (70, 20, 45, 156100.0, '2024-03-10', 'Paid')
INSERT INTO Payment_Details VALUES (71, 21, 45, 161650.0, '2024-02-21', 'Paid')
INSERT INTO Payment_Details VALUES (72, 22, 44, 213975.0, NULL, 'Not Paid')
INSERT INTO Payment_Details VALUES (73, 23, 45, 78625.0, '2024-02-19', 'Paid')
INSERT INTO Payment_Details VALUES (74, 24, 43, 83420.0, NULL, 'Not Paid')

SELECT * FROM Payment_Details

-----------------------Task 2-----------------------
--1. List all customers:
SELECT * FROM User_Details

--2. List all orders for a specific customer:
SELECT * FROM Courier_Details WHERE UserID = 6

--3. List all couriers:
SELECT * FROM Courier_Details

--4. List all packages for a specific order:
SELECT Package FROM Courier_Details WHERE Courier_ID = 11

--5. List all deliveries for a specific courier:
SELECT * FROM Courier_Details WHERE Courier_ID = 14

--6. List all undelivered packages:
SELECT * FROM Courier_Details WHERE Courier_Status = 'Not Delivered'

--7. List all packages that are scheduled for delivery today:
SELECT * FROM Courier_Details WHERE Delivery_Date = CAST(GETDATE() AS date)

--8. List all packages with a specific status:
SELECT Courier_ID, Package FROM Courier_Details WHERE Courier_Status = 'Delivered'

--9. Calculate the total number of packages for each courier.
SELECT COUNT(Package) AS [Number of Packages] FROM Courier_Details WHERE Courier_ID = 11

--10. Find the average delivery time for each courier
SELECT DATEDIFF(DAY,B.Payment_Date, a.Delivery_Date) AS [Average delivery Time] FROM Courier_Details AS a JOIN Payment_Details AS B ON a.Courier_ID = b.CourierID

--11. List all packages with a specific weight range:
SELECT Courier_ID, Courier_Weight FROM Courier_Details Where Courier_Weight Between 300 AND 500

--12. Retrieve employees whose names contain 'Dhanush'
SELECT * FROM Employee_Details WHERE Employee_Name = 'Dhanush'

--13. Retrieve all courier records with payments greater than $50.
SELECT * FROM Courier_Details JOIN Payment_Details ON Courier_ID = CourierID WHERE Payment_Details.Amount > 100000


-----------------------Task 3-----------------------
--14. Find the total number of couriers handled by each employee.
select

--15. Calculate the total revenue generated by each location
SELECT 

--16. Find the total number of couriers delivered to each location.


--17. Find the courier with the highest average delivery time:


--18. Find Locations with Total Payments Less Than a Certain Amount


--19. Calculate Total Payments per Location


--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):


--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'):


--22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')



-----------------------Task 4-----------------------
--23. Retrieve Payments with Courier Information
SELECT Payment_ID, Amount, Payment_Status FROM Payment_Details LEFT JOIN Courier_Details ON Payment_Details.CourierID = Courier_Details.Courier_ID

--24. Retrieve Payments with Location Information
SELECT Payment_ID, Amount, Payment_Status FROM Payment_Details LEFT JOIN Locations ON Locations.Location_ID = Payment_Details.LocationID

--25. Retrieve Payments with Courier and Location Information
SELECT * FROM Payment_Details JOIN Courier_Details ON Payment_Details.CourierID = Courier_Details.Courier_ID JOIN Locations ON Locations.Location_ID = Payment_Details.LocationID

--26. List all payments with courier details
SELECT * FROM Payment_Details RIGHT JOIN Courier_Details ON Payment_Details.CourierID = Courier_Details.Courier_ID

--27. Total payments received for each courier
SELECT SUM(Amount) AS [Total Payment] FROM Payment_Details JOIN Courier_Details ON Payment_Details.CourierID = Courier_Details.Courier_ID

--28. List payments made on a specific date
SELECT a.Payment_ID, a.Payment_Status, b.Amount, b.Payment_Date FROM Payment_Details AS a JOIN Payment_Details AS b ON a.Payment_ID = b.Payment_ID

---29. Get Courier Information for Each Payment
SELECT * FROM Courier_Details JOIN Payment_Details ON Courier_Details.Courier_ID = Payment_Details.CourierID

--30. Get Payment Details with Location
SELECT * FROM Payment_Details JOIN Locations ON Payment_Details.LocationID = Locations.Location_ID

--31. Calculating Total Payments for Each Courier
SELECT Payment_ID, Payment_Date, Amount, Payment_Status FROM Payment_Details JOIN Courier_Details ON Payment_Details.CourierID = Courier_Details.Courier_ID 

--32. List Payments Within a Date Range
SELECT a.Payment_ID, a.Payment_Status, b.Amount, b.Payment_Date FROM Payment_Details AS a JOIN Payment_Details AS b ON a.Payment_ID = b.Payment_ID WHERE a.Payment_Date BETWEEN '2024-02-01' AND '2024-03-01' ORDER BY a.Payment_Date

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side
SELECT USER_ID, USER_NAME FROM User_Details JOIN Courier_Details ON User_Details.User_ID = Courier_Details.UserID WHERE User_ID IS NULL

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT * FROM Courier_Details JOIN Courier_Services ON Courier_Services.Service_ID = Courier_Details.ServiceID WHERE Courier_ID IS NULL

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
SELECT Employee_ID, Employee_Name, Amount FROM Employee_Details JOIN Locations ON Locations.Location_ID = Employee_Details.LocationID JOIN Payment_Details ON Locations.Location_ID = Payment_Details.LocationID WHERE Employee_ID IS NOT NULL

--36. List all users and all courier services, showing all possible combinations.
SELECT User_Name, ServiceName FROM User_Details CROSS JOIN Courier_Services ORDER BY User_ID

--37. List all employees and all locations, showing all possible combinations:
SELECT Employee_Name, Location_Address FROM Employee_Details CROSS JOIN Locations ORDER BY Employee_ID

--38. Retrieve a list of couriers and their corresponding sender information (if available)
SELECT Courier_ID, Package, User_Name, User_Mail, User_Number, User_Address FROM User_Details JOIN Courier_Details ON User_Details.User_Name = Courier_Details.Sender_Name

--39. Retrieve a list of couriers and their corresponding receiver information (if available):
SELECT Courier_ID, Package, User_Name, User_Mail, User_Number, User_Address FROM User_Details JOIN Courier_Details ON User_Details.User_Name = Courier_Details.Receiver_Name

--40. Retrieve a list of couriers along with the courier service details (if available):
SELECT Courier_ID, Package, ServiceName, Service_Cost AS [Cost per Gram] , Courier_Weight, Service_Cost*Courier_Weight AS [Total Amount] From Courier_Details JOIN Courier_Services ON Courier_Details.ServiceID = Courier_Services.Service_ID

--41. Retrieve a list of employees and the number of couriers assigned to each employee:
SELECT Employee_Name, Count(Courier_ID) FROM Employee_Details JOIN Locations ON Emloyee_Details.LocationID = Locations.Location_ID JOIN Courier_Details ON Courier_Details.Receiver_Address = Locations.Location_name

--42. Retrieve a list of locations and the total payment amount received at each location:
SELECT Location_Address , SUM(Amount) FROM Locations JOIN Payment_Details ON Payment_Details.LocationID = Locations.Location_ID

--43. Retrieve all couriers sent by the same sender (based on SenderName).
SELECT a.Courier_ID, a.Courier_Weight, a.Delivery_Date, b.Package FROM Courier_Details AS a JOIN Courier_Details AS b ON a.Courier_ID = b.Courier_ID

--44. List all employees who share the same role.
SELECT DISTINCT a.Employee_Name FROM Employee_Details a JOIN Employee_Details b ON a.Employee_Role = b.Employee_Role WHERE a.Employee_ID <> b.Employee_ID

--45. Retrieve all payments made for couriers sent from the same location.
SELECT DISTINCT a.Payment_ID, CourierID FROM Payment_Details a JOIN Payment_Details b ON a.LocationID = b.LocationID WHERE a.Payment_ID <> b.Payment_ID 

--46. Retrieve all couriers sent from the same location (based on SenderAddress).
SELECT  a.* from Courier_Details a JOIN Courier_Details b ON CAST(a.Sender_Address AS VARCHAR) = CAST(b.Sender_Address AS VARCHAR) WHERE a.Courier_ID <> b.Courier_ID 

--47. List employees and the number of couriers they have delivered:
SELECT Employee_Name, Count(Courier_ID) FROM Employee_Details JOIN Locations ON Emloyee_Details.LocationID = Locations.Location_ID JOIN Courier_Details ON Courier_Details.Receiver_Address = Locations.Location_name

--48. Find couriers that were paid an amount greater than the cost of their respective courier services
SELECT e.Employee_ID, e.Employee_Name, COUNT(c.Courier_ID) AS TotalCouriersDelivered FROM Employee_Details e LEFT JOIN Courier_Details c ON e.Employee_ID = c.Employee_ID GROUP BY e.Employee_ID, e.Employee_Name;


-----------------------Scope-----------------------
--49. Find couriers that have a weight greater than the average weight of all couriers
SELECT * FROM Courier_Details WHERE Courier_Weight > (SELECT AVG(Courier_Weight) FROM Courier_Details)

--50. Find the names of all employees who have a salary greater than the average salary:
SELECT Employee_Name from Employee_Details WHERE Employee_Salary > (SELECT AVG(Employee_Salary) FROM Employee_Details)

--51. Find the total cost of all courier services where the cost is less than the maximum cost
SELECT ServiceName from Courier_Services WHERE Service_Cost < (SELECT MAX(Service_Cost) from Courier_Services)

--52. Find all couriers that have been paid for
Select * From Payment_Details WHERE Payment_Status = 'Paid'

--53. Find the locations where the maximum payment amount was made
SELECT l.* FROM Locations l JOIN ( SELECT LocationID, MAX(Amount) AS MaxPayment FROM Payment_Details GROUP BY LocationID) p ON l.Location_ID = p.LocationID WHERE p.MaxPayment = (SELECT MAX(Amount) FROM Payment_Details)

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
SELECT * FROM Courier_Details WHERE Courier_Weight > (SELECT MAX(c2.Courier_Weight) FROM Courier_Details c1 JOIN Courier_Details c2 ON c1.Sender_Name = c2.Sender_Name WHERE c1.Sender_Name = 'Sivanathan')
