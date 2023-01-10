
create schema CS4347_2;
USE cs4347_2;

#alter table Vendor MODIFY  column AccNum int;

CREATE TABLE Vendor
(
    VendorID varchar(50) PRIMARY KEY,
    VName varchar(50),
    AccNum int,
    CredRating int,
    PurchaseURL varchar (30)
);


CREATE TABLE Product
(
    ProductID varchar(50) PRIMARY KEY,
    Weight int,
    Size varchar(10),
    ProductType varchar (20),
    Style char (10),
    ListPrice int
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO Vendor (VendorID, VName, AccNum, CredRating, PurchaseURL)
VALUES ('101', 'Agent P', 10101010, 750, 'www.purchase.com');
INSERT INTO Vendor (VendorID, VName, AccNum, CredRating, PurchaseURL)
VALUES ('121', 'Amazone', 20202020, 970, 'www.amazone.com');
INSERT INTO Vendor (VendorID, VName, AccNum, CredRating, PurchaseURL)
VALUES ('133', 'Holiday', 30303030, 1000, 'www.thanksgiving.com');
INSERT INTO Vendor (VendorID, VName, AccNum, CredRating, PurchaseURL)
VALUES ('131', 'CUP', 1111111, 750, 'www.cupcupcup.com');
 
INSERT INTO Product (ProductID, Weight, Size, ProductType, Style, ListPrice)
VALUES ('A1230', 300, 'XL', 'Display', 'OLED', 350);
INSERT INTO Product (ProductID, Weight, Size, ProductType, Style, ListPrice)
VALUES ('B412', 12, 'AAA', 'Battery', 'ion', 15);
INSERT INTO Product (ProductID, Weight, Size, ProductType, Style, ListPrice)
VALUES ('C621', 1, '8core', 'CPU', 'Intel', 400);

CREATE TABLE Parts
(
    PartsID varchar(50) PRIMARY KEY,
    Price int,
    Partname varchar(20),
    weight int,
    VendorID varchar (10),
    ProductID varchar (20),
    foreign key (VendorID) REFERENCES VENDOR(VendorID),
    foreign key (ProductID) REFERENCES PRODUCT(ProductID)
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO Parts (PartsID, Price, Partname, weight, VendorID, ProductID)
VALUES ('P1', 5, 'hammer', 20, '101', 'A1230');
INSERT INTO Parts (PartsID, Price, Partname, weight, VendorID, ProductID)
VALUES ('P2', 3,'Cup', 2, '121', 'B412');
INSERT INTO Parts (PartsID, Price, Partname, weight, VendorID, ProductID)
VALUES ('P3', 6,'Cup' , 5, '133', 'C621');
INSERT INTO Parts (PartsID, Price, Partname, weight, VendorID, ProductID)
VALUES ('P4', 6,'hammer' , 1, '133', 'C621');

CREATE TABLE Department
(
    DepartmentID varchar(20) PRIMARY KEY,
    DName varchar (20)
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO Department(DepartmentID, DName)
VALUES ('D4326', 'Electronics');
INSERT INTO Department(DepartmentID, DName)
VALUES ('D1234', 'Supply');
INSERT INTO Department(DepartmentID, DName)
VALUES('CS4347', 'UTDCS');
INSERT INTO Department(DepartmentID, DName)
VALUES('M123', 'Marketing');

CREATE TABLE JobPosition
(
    JobID varchar(20) PRIMARY KEY,
    JobDescription varchar (300),
    PostDate date, 
    DeptID varchar (20),
    FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DepartmentID)

);


# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO JobPosition(JobID, JobDescription, PostDate, DeptID)
VALUES ('J4610', 'Software Engineer', current_date(), 'D4326');
INSERT INTO JobPosition(JobID, JobDescription, PostDate, DeptID)
VALUES ('J1230', 'Supply Agent', '2022-10-15', 'D4326');
INSERT INTO JobPosition(JobID, JobDescription, Postdate, DeptID)
VALUES ('11111', 'Question 1', current_date(), 'CS4347');
INSERT INTO JobPosition(JobID, JobDescription, Postdate, DeptID)
VALUES ('22222', 'Marketing', '2011-01-01', 'M123');
INSERT INTO JobPosition(JobID, JobDescription, Postdate, DeptID)
VALUES ('12345', 'intern', '2011-03-14', 'M123');

CREATE TABLE Site
(
    SiteID varchar(20) PRIMARY KEY,
    Address varchar (100),
    Location varchar (100)
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO Site(SiteID, Address, Location)
VALUES ('S121', 'www.purchase.com', 'Texas');
INSERT INTO Site(SiteID, Address, Location)
VALUES ('S131', 'www.amazone.com', 'California');
INSERT INTO Site(SiteID, Address, Location)
VALUES ('S141', 'www.thanksgiving.com', 'Ohio');

CREATE TABLE People
(
	PersonID varchar(20) PRIMARY KEY,
    FirstName varchar(20),
    LastName varchar(20),
    Age int CHECK (Age < 65),
    Gender varchar(10),
    Line1 varchar(20),
    Line2 varchar(20),
    City varchar(20),
    State varchar(20),
	Zip int,
    email varchar(40)
);


# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO People (PersonID, FirstName, LastName, Age, Gender, Line1, Line2, City, State, Zip, email)
Values ('H111', 'Taek', 'Kim', 23, 'Male', '3825 Mapleshade Ln', 'APT 3005', 'Plano', 'TX', 75075, 'hxk151830@utallas.edu');
INSERT INTO People (PersonID, FirstName, LastName, Age, Gender, Line1, Line2, City, State, Zip, email)
Values ('H222', 'Ethen', 'Geon', 22, 'Male', '440 Coit rd', 'APT 3335', 'Richardson', 'TX', 75075, 'gxk151830@utallas.edu');
INSERT INTO People (PersonID, FirstName, LastName, Age, Gender, Line1, Line2, City, State, Zip, email)
Values ('H333', 'Jon', 'Doe', 32, 'Male', '4422 Independence rd', 'Suit 220', 'LA', 'CA', 15417, 'jondoe@gmail.com');
INSERT INTO People (PersonID, FirstName, LastName, Age, Gender, Line1, Line2, City, State, Zip, email)
Values ('H444', 'Amy', 'Doe', 22, 'Feale', '4145 Custer rd', null, 'Las Vegas', 'NV', 92465, 'amy@utallas.edu');
INSERT INTO People (PersonID, FirstName, LastName, Age, Gender, Line1, Line2, City, State, Zip, email)
Values ('H555', 'Hellen', 'Cole', 25, 'Female', '234 avc rd', 'APT 4333', 'Plano', 'TX', 75007, 'hellencole@utdallas.edu');

CREATE TABLE PersonPhone
(
	PersonID varchar(20),
    PhoneNumber int,
    PRIMARY KEY (PersonID,PhoneNumber),
    FOREIGN KEY (PersonID) REFERENCES People(PersonID)
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO PersonPhone (PersonID, PhoneNumber)
Values ('H111', 2146667777);
INSERT INTO PersonPhone (PersonID, PhoneNumber)
Values ('H222', 1111111111);
INSERT INTO PersonPhone (PersonID, PhoneNumber)
Values ('H333', 1234567890);
INSERT INTO PersonPhone (PersonID, PhoneNumber)
Values ('H444', 1231231234);

CREATE TABLE Application
(
	ApplicationID varchar(20) PRIMARY KEY
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO Application(ApplicationID)
VAlUES ('A100123456');
INSERT INTO Application(ApplicationID)
VAlUES ('A100456789');
INSERT INTO Application(ApplicationID)
VAlUES ('A100789123');
INSERT INTO Application(ApplicationID)
VAlUES ('A100234579');


CREATE TABLE Customer
(
	PersonID varchar(20) PRIMARY KEY,
    PrefSalesPerson varchar(20),
	FOREIGN KEY (PersonID) REFERENCES People(PersonID)
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO Customer(PersonID, PrefSalesPerson)
VALUES ('H111', 'Ethen');


CREATE TABLE Employee
(
	EmployID varchar(20) PRIMARY KEY,
    ERank int,
    Title varchar(20),
    ApplicationID varchar(20),
    SuperID varchar(20),
    SiteID varchar(20),
    DepartmentID varchar(20),
    FOREIGN KEY (ApplicationID) REFERENCES Application(ApplicationID),
    FOREIGN KEY (SiteID) REFERENCES Site(SiteID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
# - # - ###  DATA INSERT  ### - # - # - #

INSERT INTO Employee (EmployID, ERank, Title, ApplicationID, SuperID, SiteID, DepartmentID)
Values ('H222', 2, 'Software Engineer', 'A100123456', 'H222', 'S121', 'D4326');
INSERT INTO Employee (EmployID, ERank, Title, ApplicationID, SuperID, SiteID, DepartmentID)
Values ('H333', 1, 'Software Manager', 'A100456789', null, 'S121', 'D4326');

CREATE TABLE DepartmentHistory
(
	EmployID varchar(20),
    PastDepartment varchar(20),
    StartTime date,
	EndTime date,
    PRIMARY KEY (EmployID, PastDepartment),
    FOREIGN KEY (EmployID) REFERENCES Employee(EmployID)
);

# - # - ###  DATA INSERT  ### - # - # - #
INSERT INTO DepartmentHistory (EmployID, PastDepartment, StartTime, EndTime)
VALUES ('H222', 'Marketing', '2010-11-19', '2015-11-01');


CREATE TABLE Pay
(
	EmployID varchar(20),
    TransactionID varchar(20) PRIMARY KEY,
    Amount int,
    FOREIGN KEY (EmployID) REFERENCES Employee(EmployID)
);

# - # - ###  DATA INSERT  ### - # - # - #

INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H222', 'T001', 60000);
INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H222', 'T002', 70000);
INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H222', 'T003', 90000);
INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H222', 'T004', 100000);

INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H333', 'T005', 30000);
INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H333', 'T006', 70000);
INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H333', 'T007', 80000);
INSERT INTO Pay(EmployID, TransactionID, Amount)
VALUES ('H333', 'T008', 100000);


CREATE TABLE PotentialEmployee
(
	PersonID varchar(20),
    ApplicationID varchar(20) ,
    PRIMARY KEY (PersonID,ApplicationID),
    FOREIGN KEY (PersonID) REFERENCES People(PersonID),
    FOREIGN KEY (ApplicationID) REFERENCES Application(ApplicationID)
);

# - # - ###  DATA INSERT  ### - # - # - #

INSERT INTO PotentialEmployee(PersonID, ApplicationID)
VALUES ('H444', 'A100789123');
INSERT INTO PotentialEmployee(PersonID, ApplicationID)
VALUES ('H555', 'A100234579');

CREATE TABLE PURCHASEATSITE
(
	CustomerID varchar(20),
    ProductID varchar(20),
    EmployID varchar(20),
    SiteID varchar(20),
    SaleTime date,
	PRIMARY KEY (CustomerID,ProductID, EmployID, SiteID, SaleTime),
    FOREIGN KEY (CustomerID) REFERENCES Customer(PersonID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (SiteID) REFERENCES Site(SiteID)
);

# - # - ###  DATA INSERT  ### - # - # - #

INSERT INTO PURCHASEATSITE (CustomerID,ProductID, EmployID, SiteID, SaleTime)
VALUES ('H111', 'A1230', 'H222', 'S121', current_date());
INSERT INTO PURCHASEATSITE (CustomerID,ProductID, EmployID, SiteID, SaleTime)
VALUES ('H111', 'A1230', 'H222','S131', current_date());
INSERT INTO PURCHASEATSITE (CustomerID,ProductID, EmployID, SiteID, SaleTime)
VALUES ('H111', 'A1230', 'H333','S131', '2020-11-11');
INSERT INTO PURCHASEATSITE (CustomerID,ProductID, EmployID, SiteID, SaleTime)
VALUES ('H111', 'B412', 'H333','S131', '2020-12-11');

CREATE TABLE Interviews
(
	ApplicationID varchar(20) REFERENCES Application(ApplicationID),
    JobID varchar(20) REFERENCES JobPosition (JobID),
    NumInterview int,
    Grade int,
    InterviewTime varchar(20),
    InterviewDate date,
    Candidate varchar(40),
    Interviewer varchar(40),
    Pass boolean,
    PRIMARY KEY (ApplicationID,NumInterview, JobID),
	#FOREIGN KEY (ApplicationID) REFERENCES Application(ApplicationID),
    #Foreign (JobID) REFERENCES JobPosition (JobID),
    CHECK (Grade >= 60 AND Pass = True)
);

INSERT INTO Interviews(ApplicationID, JobID, NumInterview, Grade, InterviewTime, InterviewDate, Candidate, Interviewer, Pass)
VALUES ('A100789123', 'J1230', 2, 70, '10:00', '2020-11-11', 'Amy', 'Geon', True);
INSERT INTO Interviews(ApplicationID, JobID, NumInterview, Grade, InterviewTime, InterviewDate, Candidate, Interviewer, Pass)
VALUES ('A100234579', '12345', 5, 90, '23:00', '2022-11-19', 'Hellen Cole', 'Geon', True);
INSERT INTO Interviews(ApplicationID, JobID, NumInterview, Grade, InterviewTime, InterviewDate, Candidate, Interviewer, Pass)
VALUES ('A100123456', '12345', 5, 90, '23:00', '2022-11-19', 'Hellen Cole', 'Geon', True);
INSERT INTO Interviews(ApplicationID, JobID, NumInterview, Grade, InterviewTime, InterviewDate, Candidate, Interviewer, Pass)
VALUES ('A100234579', '11111', 5, 90, '23:00', '2022-11-19', 'Hellen Cole', 'Geon', True);
# - # - ###  DATA INSERT  ### - # - # - #

#################  PART 3 ###################

#DROP VIEW View1;
CREATE VIEW View1 AS
SELECT E.EmployID, H.FirstName as Name, round(AVG(P.Amount), 0) as AvgSalery_in_$
FROM Employee as E, Pay as P, People as H
WHERE (P.EmployID = E.EmployID) AND (E.EmployID = H.PersonID)
GROUP BY EmployID;

#DROP VIEW View2;
CREATE VIEW View2 AS
SELECT J.JobID, J.JobDescription as Job_Position, I.Candidate as Interviewee, I.NumInterview as Interview_Rounds
FROM Jobposition as J, Interviews as I
WHERE J.JobID = I.JobID and I.Pass = True
GROUP BY JobID;
 

#DROP VIEW View3;
CREATE VIEW View3 AS
SELECT ProductType, COUNT(*)
FROM (Product NATURAL JOIN PURCHASEATSITE) 
GROUP BY ProductType;

#DROP VIEW View4;
CREATE VIEW View4 AS
SELECT SUM(PARTS.PRICE), PRODUCT.PRODUCTID
FROM PARTS,PRODUCT
WHERE PRODUCT.PRODUCTID =PARTS.PRODUCTID
GROUP BY PRODUCT.PRODUCTID;

######query#########
#1
Select ApplicationID as ID, Candidate as Interviewer
FROM Interviews
WHERE Candidate = 'Hellen Cole' and JobID = '11111';

#2
SELECT JobID, JobDescription, PostDate
FROM jobposition as j, Department as d
WHERE d.Dname = 'Marketing' and j.DeptID = d.DepartmentID and (EXTRACT(Year from PostDate)) = '2011' and (EXTRACT(Month from PostDate)) = '1';

#3
SELECT e1.EmployID, p.FirstName, p.LastName, e1.SuperID as superevisor
From Employee as e1, People as p
WHERE p.PersonID = e1.EmployID and NOT EXISTS (Select * From Employee as e2 Where e2.SuperID = e1.EmployID);

#4
SELECT SiteID, Location 
FROM Site as s
WHERE NOT EXISTS (Select * from purchaseatsite as p Where s.SiteID = p.SiteID and (EXTRACT(Year from p.SaleTime)) = '2011' and (EXTRACT(Month from p.SaleTime)) = '3');

#5
SELECT j.jobID, j.jobDescription 
from jobPosition as j, Interviews as i
Where j.JobID = i.JobID and (EXTRACT(Month from j.PostDate) - EXTRACT(Month from i.InterviewDate)) > 1 and (EXTRACT(Year from j.PostDate) - EXTRACT(Year from i.InterviewDate)) >= 0;

#6
SELECT distinct(pur.EmployID), p.FirstName, p.LastName
FROM purchaseatsite pur, Employee e, People p, Product prod
WHERE pur.EmployID = e.EmployID AND e.employID= p.PersonID and prod.ListPrice > 200;

#7
SELECT DepartmentId, DName 
From department as d
WHERE NOT EXISTS(Select d.DepartmentID From  JobPosition as j where d.departmentID = j.deptID and EXTRACT(Month from j.PostDate) = '1' and EXTRACT(Year from j.PostDate) = '2011' ) AND NOT EXISTS(Select d.DepartmentID From  JobPosition as j where d.departmentID = j.deptID and EXTRACT(Month from j.PostDate) = '2' and EXTRACT(Year from j.PostDate) = '2011' ); 

#8
SELECT distinct(p.PersonID), p.FirstName, p.LastName, e.DepartmentID
FROM People as P, Employee as e, Department as D, jobposition as JP, Interviews as I
Where P.PersonID = E.EmployID and E.ApplicationID = I.ApplicationID and I.JobID ='12345'; 

#9
select count(*), EmployID 
from purchaseatsite as p 
group by EmployID order by count(*) desc
limit 1;

#10 
SELECT ProductType from PRODUCT
HAVING max(ListPrice);

#11 
SELECT firstName, LastName, peo.PersonID FROM People as peo, PotentialEmployee pot
WHERE peo.PersonID = pot.PersonID;

#12
SELECT distinct(FirstName), LastName, email 
FROM People, employee, application, interviews
WHERE people.PersonID = Employee.EmployID and interviews.applicationID = employee.applicationID;

#13 
SELECT distinct(PEOPLE.FirstName), People.LastName, People.email, PersonPhone.PhoneNumber
FROM PEOPLE, PersonPhone, potentialemployee, application
WHERE potentialemployee.ApplicationID = application.ApplicationID AND PersonPhone.PersonID = People.PersonID
GROUP BY FirstName; 

#14 
SELECT FirstName, LastName, PersonID, avg(pay.amount) as avg
FROM People,Pay
GROUP BY pay.amount
ORDER BY avg desc
LIMIT 1; 

#15
SELECT V.VendorID,V.VName 
FROM VENDOR V,parts as p,product
WHERE p.PartName = 'CUP' AND p.WEIGHT<4
HAVING MIN(PRODUCT.ListPrice);