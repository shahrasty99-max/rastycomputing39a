use hospital;
create table patient(
patient_id int auto_increment primary key,
firstName varchar(50),
LastName varchar(50),
DateofBirth datetime,
Gender enum('Male','Female','others'),
Contactinfp varchar(10)
);
select * from patient;
 create table doctor(
 DoctorID int auto_increment primary key,
 FirstName varchar(50),
 LastName varchar(50),
 Specially varchar(40),
 phone varchar(10),
 Email varchar(40)
 );
 select * from doctor;
 create table medicalrecord(
record_id int primary key auto_increment,
foreign key(patient_id) references patient(patient_id),
patient_id int,
diagnosis varchar(15),
treatment varchar(50),
recorddate datetime,
notes varchar(30)
);
  select * from medicalrecord;
create table prescription(
prescription_id int primary key auto_increment,
foreign key(patient_id) references patient(patient_id),
patient_id int,
foreign key(DoctorId) references Doctor(DoctorId),
DoctorId int,
mediction varchar(50),
dosage varchar(40),
startdate date,
enddate date
);
select * from prescription;
create table billing(
biling_id int primary key auto_increment,
foreign key(patient_id) references patient(patient_id),
patient_id int,
amount decimal(10,3),
bilingdate date,
status enum('active','inactive')
);
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    DoctorId INT NOT NULL,
    appointment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_patient
        FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    CONSTRAINT fk_doctor
        FOREIGN KEY (DoctorId) REFERENCES Doctor(DoctorId),
    CONSTRAINT chk_status
        CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);
select * from appointments;
INSERT INTO Doctor (FirstName, specially, phone, email)
VALUES ('Dr. Raman Khatiwada', 'Cardiology', '9812311222', 'khatiwada@hospital.com');
 select * from doctor;
 -- Insert patient
INSERT INTO Patient (firstName, DateofBirth, Gender)
VALUES ('Ram Sharma', '1990-05-10', 'Male');
 select * from patient;
-- Insert billing record
INSERT INTO Billing (patient_id, amount, status)
VALUES (101, 5000, 'inactive');
select * from billing; 
INSERT INTO Patient (patient_id, firstName, LastName, DateofBirth, Gender, Contactinfp)
VALUES (101, 'Ram', 'Sharma', '1990-05-10', 'Male', '9812311222');

INSERT INTO MedicalRecord (patient_id, diagnosis, treatment, recorddate)
VALUES (101, 'Hypertension', 'Medication', '2026-05-07');
select * from medicalrecord;
UPDATE Appointments
SET status = 'Completed'
WHERE patient_id = 101
  AND status = 'Scheduled';
  select * from appointments;
  INSERT INTO Appointment (patient_id, DoctorId, AppointmentDate, status)
VALUES (101, 1, '2026-05-10', 'active');
select * from appointment;
UPDATE Appointment
SET status = 'Completed'
WHERE patient_id = 101
  AND status = 'Scheduled';
  SELECT * FROM Appointment WHERE patient_id = 101;
  
  UPDATE Doctor
SET email = 'ramankhatiwada@hospital.com'
WHERE DoctorId = 1;
select * from doctor;

UPDATE Prescription
SET EndDate = DATE_ADD(EndDate, INTERVAL 30 DAY)
WHERE prescription_id = 5;
select *from prescription;
INSERT INTO Appointments (patient_id, DoctorId, appointment_date, status)
VALUES (101, 1, '2026-05-10', 'Cancelled');
DELETE FROM Appointments
WHERE status = 'Cancelled';
SELECT * FROM Appointments;
ALTER TABLE Patient
ADD BloodGroup VARCHAR(5);
DESCRIBE Patient;
ALTER TABLE Patient
CHANGE Contactinfp Phone VARCHAR(15);

ALTER TABLE Billing
MODIFY Amount DECIMAL(10,2) NOT NULL DEFAULT 0;
DESCRIBE Billing;
SELECT 
    CONCAT(p.firstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    a.AppointmentDate
FROM Appointment a
INNER JOIN Patient p ON a.patient_id = p.patient_id
INNER JOIN Doctor d ON a.DoctorId = d.DoctorID;
DESCRIBE Appointment;
SELECT 
    CONCAT(p.firstName, ' ', p.LastName) AS PatientName,
    b.Amount AS BillingAmount
FROM Patient p
LEFT JOIN Billing b ON p.patient_id = b.patient_id;
SELECT 
    pr.record_id,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    CONCAT(p.firstName, ' ', p.LastName) AS PatientName,
    pr.diagnosis,
    pr.treatment,
    pr.recorddate,
    pr.notes
FROM medicalrecord pr
INNER JOIN Patient p ON pr.patient_id = p.patient_id
INNER JOIN Doctor d ON pr.patient_id = p.patient_id;
SELECT 
    CONCAT(firstName, ' ', LastName) AS PatientName,
    DateofBirth
FROM Patient
WHERE DateofBirth BETWEEN '1980-01-01' AND '2000-12-31';
SELECT 
    CONCAT(FirstName, ' ', LastName) AS DoctorName,
    Specially
FROM Doctor
WHERE Specially IN ('Cardiology', 'Neurology');
desc medicalrecord;

select * from billing;

select patient_id , sum(amount) as total_amount from billing group by patient_id;

INSERT INTO Billing (biling_id, patient_id, amount, bilingdate, status)
VALUES 
(2, 102, 3000, '2026-05-10', 'active'),
(3, 103, 4500, '2026-05-11', 'inactive'),
(4, 104, 2500, '2026-05-12', 'active'),
(5, 105, 6000, '2026-05-13', 'inactive'),
(6, 106, 5200, '2026-05-14', 'active');
 
SELECT 
    p.patient_id,
    CONCAT(p.firstName, ' ', p.lastName) AS patient_name,
    SUM(b.amount) AS total_amount
FROM Billing b
JOIN Patient p ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.firstName, p.lastName;

select count(*) as total_appointment_per_doctor
 from appointment
 left join doctor on doctor.DoctorId=appointment.DoctorId
 group by FirstName
 having total_appointment_per_doctor >3;
select * from billing;
SELECT 
    AVG(Amount) AS Average_Billing_Amount
FROM 
    Billing;
    SELECT 
    MAX(Amount) AS Maximum_Billing_Amount, 
    MIN(Amount) AS Minimum_Billing_Amount
FROM 
    Billing;
    SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    COUNT(p.Prescription_iD) AS PrescriptionCount
FROM 
    Doctor d
JOIN 
    Prescription p ON d.DoctorID = p.DoctorID
GROUP BY 
    d.DoctorID, d.FirstName, d.LastName
HAVING 
    COUNT(p.Prescription_iD) > 2;
    SELECT 
    Diagnosis,
    COUNT(record_iD) AS RecordCount
FROM 
    MedicalRecord
GROUP BY 
    Diagnosis;
    SELECT 
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientFullName,
    m.Diagnosis
FROM 
    Patient p
JOIN 
    MedicalRecord m ON p.Patient_id = m.Patient_id;
    
    SELECT 
    a.appointment_id,
    a.AppointmentDate,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName
FROM 
    Appointment a
JOIN 
    Patient p ON a.Patient_id = p.Patient_id
JOIN 
    Doctor d ON a.DoctorID = d.DoctorID;
    SELECT 
    mediction,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName
FROM 
    Prescription pr
JOIN 
    Patient p ON pr.Patient_id = p.Patient_id
JOIN 
    Doctor d ON pr.DoctorID = d.DoctorID;
    
    SELECT 
    p.Patient_id,
    p.FirstName,
    p.LastName,
    b.biling_id,
    b.Amount,
    b.bilingdate,
    b.Status
FROM 
    Patient p
LEFT JOIN 
    Billing b ON p.Patient_id = b.Patient_id; 

SELECT 
    d.DoctorID,
    CONCAT(d.FirstName, ' ', d.LastName) AS DoctorName,
    d.Specially,
    a.appointment_id,
    a.AppointmentDate,
    a.Status
FROM 
    Doctor d
LEFT JOIN 
    Appointment a ON d.DoctorID = a.DoctorID;
SELECT 
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientFullName,
    SUM(b.Amount) AS TotalAmountBilled
FROM 
    Patient p
JOIN 
    Billing b ON p.Patient_id = b.Patient_id
GROUP BY 
    p.Patient_id, p.FirstName, p.LastName;
    SELECT 
    a.AppointmentDate,
    a.Reason,
    a.Status,
    p.Gender,
    p.phone 
FROM 
    Appointment a
JOIN 
    Patient p ON a.Patient_id = p.Patient_id;
    
    SELECT 
    *
FROM 
    Appointment
WHERE 
    Status = 'Scheduled' 
    AND AppointmentDate > '2026-01-01';
    SELECT 
    *
FROM 
    Patient
WHERE 
    FirstName LIKE 'A%';
    SELECT 
    *
FROM 
    Billing
WHERE 
    Amount BETWEEN 500 AND 2000;
    
    SELECT 
    *
FROM 
    Prescription
WHERE 
    mediction IN ('Paracetamol', 'Ibuprofen', 'Amoxicillin');
    
    SELECT 
    *
FROM 
    MedicalRecord
WHERE 
    Treatment LIKE '%Surgery%' 
    OR Notes IS NOT NULL;
    select * from medicalrecord;
SELECT patient_id FROM Patient;
INSERT INTO Patient (patient_id, FirstName, LastName, DateofBirth, Gender)
VALUES
(106, 'John', 'Smith', '1990-01-01', 'Male'),
(102, 'Mary', 'Jones', '1991-02-02', 'Female'),
(103, 'David', 'Lee', '1992-03-03', 'Male'),
(104, 'Sara', 'Khan', '1993-04-04', 'Female'),
(105, 'Alex', 'Brown', '1994-05-05', 'Male');
select * from patient;
INSERT INTO MedicalRecord (record_id, patient_id, diagnosis, treatment, recorddate, notes)
VALUES
(1, 101, 'Hypertension', 'Medication', '2026-05-18', 'Follow-up required'),
(2, 102, 'Diabetes', 'Insulin', '2026-05-18', 'Monthly checkup'),
(6, 103, 'Asthma', 'Inhaler', '2026-05-18', 'Needs monitoring'),
(4, 104, 'Flu', 'Antiviral', '2026-05-18', 'Rest advised'),
(5, 105, 'Migraine', 'Painkillers', '2026-05-18', 'Review in 2 weeks');

ALTER TABLE Doctor
MODIFY Phone VARCHAR(20);






    
    

 















