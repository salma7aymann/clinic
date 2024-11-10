CREATE DATABASE Clinic11
ON PRIMARY 
(Name='clinic',Filename='D:\Clinic11.mdf')
LOG ON
(Name='clinic_log',Filename='D:\Clinic11.log.ldf')
Create Table Patient
(patient_id int primary key,
patient_name nvarchar (10),
patient_Date Datetime ,
patient_Medicalhistory Datetime)
---------------------------------------
Create Table Doctor
(doctor_id int primary key,
doctor_name nvarchar(20),
doctor_specialization nvarchar(20),
doctor_schedule nvarchar(30),
doctor_consultationfree decimal(6,2))
--------------------------------------
Create Table Appointment
(app_id int primary key,
app_time datetime ,
app_roomnumber int,
app_date datetime ,
patient_id int,
doctor_id int,
Foreign key (patient_id) references  Patient (patient_id),
Foreign key (doctor_id) references Doctor (doctor_id))
-----------------------------------------
Create Table Bill
(bill_id int primary key,
bill_TotalAmount decimal(10,0),
bill_Payment nvarchar(10),
patient_id int,
doctor_id int,
app_id int,
Foreign key (patient_id) references Patient (patient_id),
Foreign key (doctor_id) references Doctor (doctor_id),
Foreign key (app_id) references Appointment (app_id)) 
---------------------------------------------------------
CREATE TABLE Laboratory 
(test_id int primary key,
test_name nvarchar(10),
patient_id int,
test_result nvarchar(50),
test_report nvarchar(50),
Foreign key (patient_id) references Patient (patient_id)) 
-----------------------------------------
INSERT INTO Patient
Values
(20,'h','14:00',15-11-2024),
(21,'s','16:00',18-11-2024),
(22,'z','19:00',19-11-2024),
(23,'x','21:00',20-11-2024),
(24,'y','20:00',25-11-2024)
Select *from Patient
------------------------------------
INSERT INTO Doctor(doctor_id,doctor_name,doctor_specialization,doctor_schedule,doctor_consultationfree)
Values 
(1,'Dr.John Doe','General Practitioner','Sunday',5.0),
(2,'Dr.Jane Smith','Cardiologist','Monday',4.2),
(3,'Dr.David Lee','Pediatrician','Saturday',3.3),
(4,'Dr.Emily Chen','Dermatologist','Tuesday',2.5),
(5,'Dr.Michael Kim','Orthopedist','Friday',6.2)
Select *from Doctor
--------------------------
INSERT INTO Appointment(app_id,app_date,app_roomnumber,app_time,patient_id)
VALUES
(1,'2024-11-15',1,'14:00:00',20),
(2,'2024-11-16',2,'16:00:00',21),
(3,'2024-11-17',3,'19:00:00',22),
(4,'2024-11-18',4,'20:00:00',23),
(5,'2024-11-19',5,'21:00:00',24)
SELECT *FROM Appointment
-----------------------------------
INSERT INTO Bill (bill_id, bill_TotalAmount, bill_Payment, patient_id, doctor_id, app_id)
VALUES
(1, 200.00, 'Paid', 20, 1, 1),
(2, 150.00, 'Pending',21, 2, 12),
(3, 300.00, 'Paid', 22, 3, 3),
(4, 100.00, 'Cancelled', 23, 4, 4),
(5, 250.00, 'Paid', 24, 5, 5)
SELECT *FROM Bill
-------------------------------------
INSERT INTO Laboratory (test_id, test_name, patient_id, test_result, test_report) VALUES
(111, 'Blood Test', 20, 'Normal', 'Report1.pdf'),
(222, 'Urine Test', 21, 'Abnormal', 'Report2.pdf'),
(333, 'X-Ray', 22, 'Normal', 'Report3.pdf'),
(444, 'MRI', 23, 'Pending', 'Report4.pdf'),
(555, 'Urine Test', 24, 'Pending', 'Report4.pdf')
SELECT*FROM Laboratory
------
---
