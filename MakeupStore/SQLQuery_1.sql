GO
CREATE SCHEMA MakeupStoreDb;
Go

CREATE TABLE Customer(
    CustomerId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(200) NOT NULL,
    Phone NVARCHAR(10),
    DefaultStoreId INT 

);

CREATE TABLE Orders(
    OrderId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    LocationName NVARCHAR(100) NOT NULL,
    CustomerId INT NOT NULL,
    OrderTime DATETIME2 

);

CREATE TABLE OrderHistory(
    HistoryId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    CustomerId INT


);

CREATE TABLE Locations(
    LocationId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    LocationName NVARCHAR(100),
    InventoryId INT NOT NULL,
    OrderHistoryId INT 

);

CREATE TABLE Inventory(
    InventoryId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ItemId INT NOT NULL,
    Quanity INT NOT NULL

);

CREATE TABLE InventoryItem(
    ItemId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ItemName NVARCHAR(200) NOT NULL,
    IfLimitedEdition BIT NOT NULL -- Can be either a 0 (false) or 1 (true)
 
);

CREATE TABLE StoreOrderHistory(
    HistoryId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    LocationId INT NOT NULL,
    OrderId INT NOT NULL

);

-- everything below this has not been implemented

ALTER TABLE Customer ADD
    CONSTRAINT FK_DefaultStoreId FOREIGN KEY (DefaultStoreId) REFERENCES Locations(LocationId);

ALTER TABLE Orders ADD
    ItemId INT,
    CONSTRAINT FK_OrderItemId FOREIGN KEY (ItemId) REFERENCES InventoryItem(ItemId),
    CONSTRAINT FK_CustomerId FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId);

ALTER TABLE OrderHistory ADD
    CONSTRAINT FK_OrderId FOREIGN KEY (OrderId) REFERENCES Orders(OrderId);

ALTER TABLE Locations ADD 
    CONSTRAINT FK_InventoryId FOREIGN KEY (InventoryId) REFERENCES Inventory(InventoryId),
    CONSTRAINT FK_OrderHistoryId FOREIGN KEY (OrderHistoryId) REFERENCES StoreOrderHistory(HistoryId);

ALTER TABLE Inventory ADD 
    CONSTRAINT FK_InventoryItemId FOREIGN KEY (ItemId) REFERENCES InventoryItem(ItemId);

ALTER TABLE StoreOrderHistory ADD
    CONSTRAINT FK_StoreLocationId FOREIGN KEY (LocationId) REFERENCES Locations(LocationId),
    CONSTRAINT FK_StoreOrderId FOREIGN KEY (OrderId) REFERENCES OrderHistory(HistoryId);

ALTER TABLE InventoryItem ADD 
    Price FLOAT(2) NOT NULL;

ALTER TABLE OrderHistory ADD
    Total FLOAT(2) NOT NULL;

ALTER TABLE Inventory ADD
    StoreId INT NOT NULL;

ALTER TABLE Locations ALTER COLUMN OrderHistoryId INT NULL;

ALTER TABLE Orders ALTER COLUMN CustomerId INT NULL;


ALTER TABLE Inventory ADD
    CONSTRAINT FK_InventoryStore FOREIGN KEY (StoreId) REFERENCES Locations(LocationId);


INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Basics Eye Pallet', '0', '12');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Seasonal Pallet', '1', '18');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Highlight', '0', '8');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Seasonal Highlight', '1', '14');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eyeliner', '0', '20');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Primer', '0', '12');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Setting Spray', '0', '16');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Seasonal Brush Set', '1', '30');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Buildable Pallet (Empty)', '0', '7');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow White', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Black', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Beige', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Champagne', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Brown', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Bronze', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Red', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Mauve', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Ruby', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Coral', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Pink', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Rose Quartz', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Purple', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Amethyst', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Blue', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Sapphire', '1', '5');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Green', '0', '4');
INSERT INTO InventoryItem(ItemName,IfLimitedEdition,Price) VALUES ('Eye Shadow Emerald', '1', '5');

--------

ALTER TABLE Locations
    DROP CONSTRAINT FK_InventoryId;

INSERT INTO Customer(FirstName, LastName, Email, Phone, DefaultStoreId) VALUES ('Diana', 'Juarez', 'djuarez@email.com', '915123456', '2');
INSERT INTO Customer(FirstName, LastName, Email, Phone, DefaultStoreId) VALUES ('Viviana', 'Morales', 'vmoral@email.com', '432543456', '2');
INSERT INTO Customer(FirstName, LastName, Email, Phone, DefaultStoreId) VALUES ('Ari', 'Juarez', 'arij@email.com', '915657446', '3');
INSERT INTO Customer(FirstName, LastName, Email, Phone, DefaultStoreId) VALUES ('Jennifer', 'Torres', 'jentor@email.com', '4695461234', '1');

INSERT INTO Locations (LocationName, InventoryId) VALUES ('Reston', 1);
INSERT INTO Locations (LocationName, InventoryId) VALUES ('Arlington', 2);
INSERT INTO Locations (LocationName, InventoryId) VALUES ('Tampa', 3);

SELECT * FROM Locations;

INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('1','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('2','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('3','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('4','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('5','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('6','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('7','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('8','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('9','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('10','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('11','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('12','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('13','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('14','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('15','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('16','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('17','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('18','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('19','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('20','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('21','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('22','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('23','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('24','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('25','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('26','10','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('27','5','10');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('1','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('2','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('3','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('4','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('5','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('6','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('7','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('8','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('9','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('10','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('11','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('12','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('13','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('14','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('15','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('16','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('17','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('18','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('19','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('20','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('21','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('22','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('23','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('24','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('25','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('26','10','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('27','5','11');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('1','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('2','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('3','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('4','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('5','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('6','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('7','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('8','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('9','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('10','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('11','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('12','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('13','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('14','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('15','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('16','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('17','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('18','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('19','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('20','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('21','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('22','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('23','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('24','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('25','5','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('26','10','12');
INSERT INTO Inventory (ItemId,Quanity,StoreId) VALUES ('27','5','12');









