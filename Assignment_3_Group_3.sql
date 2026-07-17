#create database Assignment_group3
#use Assignment_group3
#source Assignment_3_Group_3

create table Staff(
Staff_id varchar(10) Primary Key,
Staff_name varchar(20),
Role varchar(20),
Phone varchar(15),
Salary int(10),
Commision_rate decimal(3,2),
Workshift varchar(50)
);

create table inventory(
Item_id varchar(10) Primary Key,
Item_name varchar(30),
Item_category varchar(20),
Stock_quantiity int(10),
Reorder_level int(10),
Unit_of_measure varchar(10)
);

create table Equipment(
Equip_id varchar(10) Primary key,
Equip_name varchar(20),
Equip_type varchar(20),
Purchase_date date,
Equip_status varchar(20)
);

create table Species(
Species_id varchar(10) Primary Key,
Species_name varchar(50),
Description varchar(100)
);

create table Pond(
Pond_id varchar(10) Primary Key,
Staff_id varchar(10),
Location varchar(50),
Size decimal(10,2),
Curr_condition varchar(30),
Temperature decimal(5,2),
PH_level decimal(3,1),
Diss_oxygen decimal(5,2),
CONSTRAINT Pond_Staff_id_fk FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

create table Customer(
Customer_id varchar(10) Primary Key,
Staff_id varchar(10),
Customer_name varchar(20),
Customer_phone varchar(15),
Customer_address varchar(50),
CONSTRAINT Customer_Staff_id_fk FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

create table Supplier(
Supplier_id varchar(6) Primary Key,
Staff_id varchar(10),
Supplier_name varchar(20),
Supplier_phone varchar(10),
Supplier_address varchar(60),
Supplier_email varchar(30),
Supplier_type varchar(10),
CONSTRAINT Supplier_Staff_id_fk FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

create table Supply_detail(
Supplier_id varchar(10),
Item_id varchar(10),
CONSTRAINT Supply_detail_pk Primary Key (Supplier_id,Item_id),
CONSTRAINT Supply_detail_Supplier_id_fk FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id),
CONSTRAINT Supply_detail_Item_id_fk FOREIGN KEY (Item_id) REFERENCES Inventory(Item_id)
);

create table Supplier_Item(
Supplier_id varchar(10),
Item_id varchar(10),
Last_price decimal(10,2),
Lead_time int(3),
CONSTRAINT Supplier_Item_pk Primary Key (Supplier_id,Item_id),
CONSTRAINT Supplier_Item_Supplier_id_fk FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id),
CONSTRAINT Supplier_Item_Item_id_fk FOREIGN KEY (Item_id) REFERENCES Inventory(Item_id)
);

create table Usage1(
Usage_id varchar(10) Primary Key,
Item_id varchar(10),
Staff_id varchar(10),
Usage_date date,
Quantity_used int(20),
Purpose varchar(100),
CONSTRAINT Usage1_Item_id_fk FOREIGN KEY (Item_id) REFERENCES Inventory(Item_id),
CONSTRAINT Usage1_Staff_id_fk FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

create table Batch(
Batch_id varchar(10) Primary Key,
Pond_id varchar(10),
Species_id varchar(10),
Start_date date,
Exp_harvest_date date,
Batch_status varchar(20),
CONSTRAINT Batch_Pond_id_fk FOREIGN KEY (Pond_id) REFERENCES Pond(Pond_id),
CONSTRAINT Batch_Species_id_fk FOREIGN KEY (Species_id) REFERENCES Species(Species_id)
);

create table Feeding(
Feeding_id varchar(10) Primary Key,
Batch_id varchar(10),
Staff_id varchar(10),
Feed_type varchar(30),
Feed_quantity decimal(10,2),
Feed_time time,
Feed_date date,
Feed_cost decimal(10,2),
CONSTRAINT Feeding_batch_id_fk FOREIGN KEY (Batch_id) REFERENCES Batch(Batch_id),
CONSTRAINT Feeding_Staff_id_fk FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

create table Farm_Activity(
Activity_id varchar(10) Primary Key,
Pond_id varchar(10),
Activity_type varchar(30),
Activity_date date,
Description text,
CONSTRAINT Farm_Activity_Pond_id_fk FOREIGN KEY (Pond_id) REFERENCES Pond(Pond_id)
);

create table Resource_Consumption(
Consumption_id varchar(10) Primary Key,
Pond_id varchar(10),
Record_date date,
Water_usage decimal(10,2),
Eletricity_usage decimal(10,2),
Resource_cost decimal(10,2),
CONSTRAINT Resource_Consumption_Pond_id_fk FOREIGN KEY (Pond_id) REFERENCES Pond(Pond_id)
);

create table Equipment_Usage(
Usage_id varchar(10) Primary Key,
Activity_id varchar(10),
Equip_id varchar(10),
Usage_duration decimal(10,2),
CONSTRAINT Equipment_Usage_Activity_id_fk FOREIGN KEY (Activity_id) REFERENCES Farm_Activity(Activity_id),
CONSTRAINT Equipment_Usage_Equip_id_fk FOREIGN KEY (Equip_id) REFERENCES Equipment(Equip_id)
);

create table Health_Treatment(
Treatment_id varchar(10) Primary Key,
Batch_id varchar(10),
Treatment_type varchar(100),
Mortality_rate decimal(5,2),
Notes text,
CONSTRAINT Health_Treatment_batch_id_fk FOREIGN KEY (Batch_id) REFERENCES Batch(Batch_id)
);

create table Maintenance(
Maintenance_id varchar(10) Primary Key,
Pond_id varchar(10),
Maintenance_date date,
Maintenance_type varchar(50),
CONSTRAINT Maintenance_Pond_id_fk FOREIGN KEY (Pond_id) REFERENCES Pond(Pond_id)
);

create table Record(
Record_id varchar(10) Primary key,
Batch_id varchar(10),
Size decimal(10,2),
Weight decimal(6,2),
Age int(10),
Health_condition varchar(50),
CONSTRAINT Record_batch_id_fk FOREIGN KEY (Batch_id) REFERENCES Batch(Batch_id)
);

create table Sale(
Sale_id varchar(10) Primary Key,
Staff_id varchar(10),
Customer_id varchar(10),
Sales_region varchar(50),
Sale_quantity int(5),
price decimal(10,2),
CONSTRAINT Sale_Staff_id_fk FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id),
CONSTRAINT Sale_Customer_id_fk FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

create table Transaction_detail(
Transaction_id varchar(10) Primary Key,
Sale_id varchar(10),
Transaction_date date,
Payment_record blob,
CONSTRAINT Transaction_detail_Sale_id_fk FOREIGN KEY (Sale_id) REFERENCES Sale(Sale_id)
);

create table Purchase(
Purchase_id varchar(10) Primary Key,
Supplier_id varchar(10),
Purchase_date date,
Status varchar(15),
CONSTRAINT Purchase_Supplier_id_fk FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id)
);

create table Purchase_detail(
Detail_id varchar(10),
Purchase_id varchar(10),
Item_id varchar(10),
Expiry_date date,
Batch_number int(100),
Quantity int(200),
Unit_price decimal(10,2),
CONSTRAINT Purchase_detail_pk PRIMARY KEY (Detail_id, Purchase_id,Item_id),
CONSTRAINT Purchase_detail_Purcahse_id_fk FOREIGN KEY (Purchase_id) REFERENCES Purchase(Purchase_id),
CONSTRAINT Purchase_detail_Item_id_fk FOREIGN KEY (Item_id) REFERENCES Inventory(Item_id)
);

create table Payment(
Paymemt_id varchar(10) Primary Key,
Purchase_id varchar(10),
Payment_method varchar(15),
Payment_terms varchar(15),
Payment_date date,
CONSTRAINT Payment_Purchase_id_fk FOREIGN KEY (Purchase_id) REFERENCES Purchase(Purchase_id)
);

INSERT INTO Staff (Staff_id, Staff_name, Role, Phone, Salary, Commision_rate, Workshift) VALUES 
('OS001', 'Alex Lim', 'Operational Manager', '0123456789', 5000, 0, '0900-1800'),
('OS002', 'John Doe', 'Operational Staff', '0129876543', 2500, 0, '0900-1500'),
('MS003', 'Siti Farah', 'Marketing Manager', '0112233445', 8000, 0.05, '0900-1800'),
('MS004', 'Agnes Tan', 'Marketing Staff', ' 0122567849', 5000, 0.03, '0900-1500');

INSERT INTO inventory (Item_id, Item_name, Item_category, Stock_quantiity, Reorder_level, Unit_of_measure) VALUES 
('I101', 'Premium Fish Pellets', 'Feed', 500, 100, 'kg'),
('I102', 'Water Purifier A1', 'Chemical', 5, 10, 'Liters'),
('I103', 'Oxygen Pump Filter', 'Equipment', 20, 5, 'Units'),
('I104', 'Tilapia Fingerlings', 'Live Stock', 400, 500, 'pcs');

INSERT INTO Supplier (Supplier_id, Staff_id, Supplier_name, Supplier_phone, Supplier_address, Supplier_email, Supplier_type) VALUES 
('SU501', 'MS003', 'AquaFeed Solutions', '0388881234', '12 Industrial Way, Selangor', 'info@aquafeed.com', 'Wholesale'),
('SU502', 'MS004', 'Global Fish Tech', '0377775678', '45 Tech Park, Penang', 'sales@gftech.my', 'Retail'),
('SU503', 'MS003', 'Bio-Water Corp', '0366669012', 'Sector 7, Johor Bahru', 'support@biowater.com', 'Wholesale'),
('SU504', 'MS004', 'Marine Agro Supply', '0355511223', 'Melaka Industrial Zone', 'contact@marineagro.com', 'Wholesale');

INSERT INTO Supplier_Item (Supplier_id, Item_id, Last_price, Lead_time) VALUES 
('SU501', 'I101', 4.50, 3),
('SU502', 'I103', 120.00, 7),
('SU503', 'I102', 25.50, 5),
('SU504', 'I104', 0.80, 10),
('SU501', 'I104', 0.75, 8);

INSERT INTO Supply_detail (Supplier_id, Item_id) VALUES 
('SU501', 'I101'),
('SU502', 'I103'),
('SU503', 'I102'),
('SU504', 'I104');

INSERT INTO Usage1 (Usage_id, Item_id, Staff_id, Usage_date, Quantity_used, Purpose) VALUES 
('U1001', 'I101', 'OS001', '2024-05-01', 20, 'Daily feeding for Pond 1'),
('U1002', 'I102', 'OS001', '2024-05-02', 2, 'Pond water treatment'),
('U1003', 'I103', 'OS002', '2024-05-03', 1, 'Routine filter replacement'),
('U1004', 'I101', 'OS002', '2024-05-04', 25, 'Feeding adjustment trial'),
('U1005', 'I104', 'OS002', '2024-05-05', 300, 'Stock transfer to pond');

INSERT INTO Purchase (Purchase_id, Supplier_id, Purchase_date, Status) VALUES 
('PUR2001', 'SU501', '2024-04-20', 'Completed'),
('PUR2002', 'SU502', '2024-04-25', 'Pending'),
('PUR2003', 'SU503', '2024-04-28', 'Cancelled'),
('PUR2004', 'SU504', '2024-05-01', 'Completed'),
('PUR2005', 'SU501', '2024-05-03', 'Pending');

INSERT INTO Purchase_detail (Detail_id, Purchase_id, Item_id, Expiry_date, Batch_number, Quantity, Unit_price) VALUES 
('D1', 'PUR2001', 'I101', '2025-04-20', 9901, 100, 4.20),
('D2', 'PUR2002', 'I103', NULL, 9902, 5, 115.00),
('D3', 'PUR2001', 'I102', '2026-01-01', 9903, 10, 24.00),
('D4', 'PUR2004', 'I104', '2025-12-31', 9904, 500, 0.78),
('D5', 'PUR2005', 'I101', '2025-09-01', 9905, 150, 4.10);

INSERT INTO Payment (Paymemt_id, Purchase_id, Payment_method, Payment_terms, Payment_date) VALUES 
('PAY3001', 'PUR2001', 'Bank Transfer', 'Net 30', '2024-04-21'),
('PAY3002', 'PUR2002', 'Credit Card', 'Instant', '2024-04-26'),
('PAY3003', 'PUR2003', 'Cash', 'On Delivery', NULL),
('PAY3004', 'PUR2004', 'Bank Transfer', 'Net 15', '2024-05-02'),
('PAY3005', 'PUR2005', 'Credit Card', 'Instant', NULL);

INSERT INTO Species (Species_id, Species_name, Description) VALUES 
('SP1', 'Red Tilapia', 'Fast growing, hardy freshwater fish'),
('SP2', 'African Catfish', 'High density tolerance, air-breathing'),
('SP3', 'Giant Freshwater Prawn', 'High market value, sensitive to water quality'),
('SP4', 'Silver Catfish', 'Fast growth species'),
('SP5', 'Common Carp', 'Hardy and easy to farm');

INSERT INTO Pond (Pond_id, Staff_id, Location, Size, Curr_condition, Temperature, PH_level, Diss_oxygen) VALUES 
('P1', 'OS001', 'North Wing - Pond A', 500, 'Excellent', 27.5, 7.2, 5.5),
('P2', 'OS002', 'North Wing - Pond B', 450, 'Good', 28.0, 7.0, 5.2),
('P3', 'OS002', 'South Wing - Hatchery', 100, 'Maintenance', 26.5, 6.8, 6.0),
('P4', 'OS001', 'East Wing - Pond C', 600, 'Good', 27.8, 7.1, 5.8);

INSERT INTO Batch (Batch_id, Pond_id, Species_id, Start_date, Exp_harvest_date, Batch_status) VALUES 
('B1', 'P1', 'SP1', '2026-01-15', '2026-06-15', 'Growing'),
('B2', 'P2', 'SP2', '2026-02-01', '2026-08-01', 'Growing'),
('B3', 'P1', 'SP1', '2025-10-01', '2026-03-15', 'Harvested'),
('B4', 'P3', 'SP3', '2026-03-01', '2026-09-01', 'Growing'),
('B5', 'P4', 'SP4', '2026-02-15', '2026-07-15', 'Growing');

INSERT INTO Record (Record_id, Batch_id, Size, Weight, Age, Health_condition) VALUES 
('R5001', 'B1', 12.5, 0.45, 90, 'Healthy'),
('R5002', 'B2', 15.0, 0.80, 120, 'Healthy'),
('R5003', 'B3', 18.0, 1.10, 150, 'Excellent'),
('R5004', 'B4', 10.5, 0.35, 80, 'Healthy');

INSERT INTO Health_Treatment (Treatment_id, Batch_id, Treatment_type, Mortality_rate, Notes) VALUES 
('T901', 'B1', 'Parasite Control', 1.5, 'Salt bath applied'),
('T902', 'B2', 'General Checkup', 0.2, 'Routine inspection'),
('T903', 'B4', 'Fungal Treatment', 0.8, 'Antifungal treatment applied');

INSERT INTO Feeding (Feeding_id, Batch_id, Staff_id, Feed_type, Feed_quantity, Feed_time, Feed_date, Feed_cost) VALUES 
('F8001', 'B1', 'OS001', 'Starter Pellets', 5, '10:00:00', '2026-04-20', 25),
('F8002', 'B1', 'OS002', 'Starter Pellets', 5, '17:00:00', '2026-04-20', 25),
('F8003', 'B2', 'OS001', 'Growth Feed', 6, '10:00:00', '2026-04-21', 30),
('F8004', 'B4', 'OS002', 'Protein Feed', 7, '18:00:00', '2026-04-22', 35);

INSERT INTO Farm_Activity (Activity_id, Pond_id, Activity_type, Activity_date, Description) VALUES 
('A401', 'P1', 'Water Change', '2026-04-21', 'Changed 20% water'),
('A402', 'P2', 'Sorting', '2026-04-22', 'Fish grading'),
('A403', 'P3', 'Aeration Check', '2026-04-23', 'Oxygen system check');

INSERT INTO Maintenance (Maintenance_id, Pond_id, Maintenance_date, Maintenance_type) VALUES 
('M301', 'P3', '2026-04-10', 'Liner Repair'),
('M302', 'P1', '2026-04-15', 'Filter Cleaning'),
('M303', 'P2', '2026-04-18', 'Pump Inspection');

INSERT INTO Resource_Consumption (Consumption_id, Pond_id, Record_date, Water_usage, Eletricity_usage, Resource_cost) VALUES 
('C601', 'P1', '2026-04-25', 1500, 120.5, 450),
('C602', 'P2', '2026-04-26', 1400, 110.0, 420),
('C603', 'P3', '2026-04-27', 900, 80.0, 300);

INSERT INTO Equipment (Equip_id, Equip_name, Equip_type, Purchase_date, Equip_status) VALUES 
('E701', 'Water Pump X1', 'Mechanical', '2025-01-10', 'Active'),
('E702', 'Digital PH Meter', 'Electronic', '2025-11-20', 'Active'),
('E703', 'Oxygen Generator Z2', 'Mechanical', '2025-06-15', 'Active');

INSERT INTO Equipment_Usage (Usage_id, Activity_id, Equip_id, Usage_duration) VALUES 
('U201', 'A401', 'E701', 2.5),
('U202', 'A403', 'E703', 3.0);

INSERT INTO Customer (Customer_id, Staff_id, Customer_name, Customer_phone, Customer_address) VALUES
('C601', 'OS001', 'Fresh Seafood Market', '019-2223344', 'No. 12, Selangor'),
('C602', 'OS001', 'Grill Restaurant', '017-5556677', 'Putrajaya'),
('C603', 'OS002', 'Seafood Export Hub', '018-9988776', 'Port Klang');

INSERT INTO Sale (Sale_id, Staff_id, Customer_id, Sales_region, Sale_quantity, price) VALUES
('S7001', 'OS001', 'C601', 'Klang Valley', 200, 3500),
('S7002', 'OS001', 'C602', 'Central', 50, 1200),
('S7003', 'OS002', 'C603', 'Seremban', 300, 5000);

INSERT INTO Transaction_detail (Transaction_id, Sale_id, Transaction_date, Payment_record) VALUES
('T1', 'S7001', '2026-04-26', 'Paid'),
('T2', 'S7003', '2026-04-27', 'Paid'),
('T3', 'S7002', '2026-04-28', 'Pending');

#pond status
SELECT 
    p.Pond_id,
    p.Location,
    p.Size,
    p.Curr_condition,
    p.Temperature,
    p.PH_level,
    st.Staff_name,
    st.Role
FROM Pond p
INNER JOIN Staff st ON p.Staff_id = st.Staff_id
ORDER BY p.Pond_id ASC;

#Growing status
SELECT 
    b.Batch_id,
    s.Species_name,
    b.Pond_id,
    b.Start_date,
    b.Exp_harvest_date,
    COUNT(r.Record_id) AS Number_of_Measurements,
    ROUND(AVG(r.Size), 2) AS Average_Size_cm,
    ROUND(AVG(r.Weight), 2) AS Average_Weight_kg,
    b.Batch_status
FROM Batch b
INNER JOIN Species s ON b.Species_id = s.Species_id
LEFT JOIN Record r ON b.Batch_id = r.Batch_id
WHERE b.Batch_status = 'Growing'
GROUP BY b.Batch_id, s.Species_name, b.Pond_id
ORDER BY b.Exp_harvest_date ASC;

#supplier oder status
SELECT 
    s.Supplier_id,
    s.Supplier_name,
    s.Supplier_type,
    COUNT(p.Purchase_id) AS Total_Orders,
    SUM(CASE WHEN p.Status = 'Completed' THEN 1 ELSE 0 END) 
        AS Completed_Orders,
    SUM(CASE WHEN p.Status = 'Pending' THEN 1 ELSE 0 END) 
        AS Pending_Orders
FROM Supplier s
LEFT JOIN Purchase p ON s.Supplier_id = p.Supplier_id
GROUP BY s.Supplier_id, s.Supplier_name, s.Supplier_type
HAVING COUNT(p.Purchase_id) > 0
ORDER BY Completed_Orders DESC;

#Low Stock Alert and Supplier Matching
SELECT 
    i.Item_id,
    i.Item_name,
    i.Item_category,
    i.Stock_quantiity AS Current_Stock,
    i.Reorder_level,
    sup.Supplier_name,
    si.Last_price,
    si.Lead_time AS Delivery_Days
FROM inventory i
LEFT JOIN Supplier_Item si ON i.Item_id = si.Item_id
LEFT JOIN Supplier sup ON si.Supplier_id = sup.Supplier_id
WHERE i.Stock_quantiity <= i.Reorder_level
ORDER BY i.Stock_quantiity ASC;

#Staff Performance and Commission Calculation
SELECT 
    st.Staff_id,
    st.Staff_name,
    st.Role,
    COUNT(sl.Sale_id) AS Number_Of_Sales,
    SUM(sl.Sale_quantity) AS Total_Fish_Sold,
    SUM(sl.price) AS Total_Revenue,
    (SUM(sl.price) * st.Commision_rate) AS Estimated_Commission
FROM Staff st
INNER JOIN Sale sl ON st.Staff_id = sl.Staff_id
GROUP BY st.Staff_id, st.Staff_name, st.Role, st.Commision_rate
ORDER BY Total_Revenue DESC;

#Customer Purchase History
SELECT 
    c.Customer_id,
    c.Customer_name,
    c.Customer_phone,
    COUNT(s.Sale_id) AS Total_Transactions,
    SUM(s.Sale_quantity) AS Total_Quantity_Bought,
    SUM(s.price) AS Total_Amount_Spent
FROM Customer c
INNER JOIN Sale s ON c.Customer_id = s.Customer_id
GROUP BY c.Customer_id, c.Customer_name, c.Customer_phone
ORDER BY Total_Amount_Spent DESC;