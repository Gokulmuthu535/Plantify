
-------------Create table-----------------------
CREATE TABLE SignUp (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    DateCreated DATETIME DEFAULT GETDATE()
);

CREATE TABLE Login (
    LoginID INT PRIMARY KEY IDENTITY(1,1), -- Use IDENTITY instead of AUTO_INCREMENT
    UserID INT NOT NULL,
    LoginTime DATETIME,
    LogoutTime DATETIME,
    FOREIGN KEY (UserID) REFERENCES SignUp(UserID) -- Define the foreign key
);


----INSERT------
insert into signup(Username,Password) values('Gokul01', 'Gokul');


-----SELECT------
SELECT * FROM SignUp

----UPDATAE------
UPDATE SignUp SET Email='gokul@gmail.com' where Username='Gokul01'

----ALTER------
Alter table Signup
Add City varchar(50)

INSERT INTO [dbo].[SignUp] (Username, Password, Email, PhoneNumber, )
VALUES
('Jack', 'Password123', 'jack.doe@example.com', '1234567890', 'New York'),
('Rose', 'SecurePass456', 'rose.smith@example.com', '0987654321', 'India'),
('Madhavan', 'Alice@789', 'madhav.brown@example.com', '1122334455', 'Africa'),
('Swetha', 'Bob&Password2024', 'swetha.johnson@example.com', '5566778899', 'China');


-----DELETE-----
delete from SignUp Where City ='China'







