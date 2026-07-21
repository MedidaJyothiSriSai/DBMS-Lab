use gram_panchayatdb;
DROP TABLE Citizen;
CREATE TABLE Citizen(
citizen_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
gender VARCHAR(10) NOT NULL,
date_of_birth DATE NOT NULL,
aadhaar_number CHAR(12) UNIQUE NOT NULL,
mobile_number CHAR(10) UNIQUE NOT NULL,
address VARCHAR(200) NOT NULL
);
SHOW TABLES;
INSERT INTO Citizen (citizen_id,full_name,gender,date_of_birth,aadhaar_number,mobile_number,address) VALUES
(101,'jyothi','FEMALE','2007-05-12','652753052385','9182128940','NELLORE'),
(102,'phani','FEMALE','2008-05-12','652753052389','9182128960','ongole'),
(103,'akki','FEMALE','2009-05-12','562753052385','8688399828','vijayawada'),
(104,'srisai','FEMALE','2010-05-12','652753025385','8688399823','kadapa'),
(105,'mohana','MALE','2011-05-12','657253025385','6888399823','vizag'),
(106,'yashu','FEMALE','2008-05-12','652735025385','8688398923','nellore');
SELECT * FROM Citizen;
DROP TABLE Certificate_Type;
CREATE TABLE Certificate_Type (
certificate_type_id INT PRIMARY KEY,
certificate_name VARCHAR(100) UNIQUE NOT NULL,
description VARCHAR(200) NOT NULL,
processing_days INT NOT NULL,
application_fee DECIMAL(8,2) NOT NULL,
is_available BOOLEAN NOT NULL
);
INSERT INTO Certificate_Type
(certificate_type_id, certificate_name, description, processing_days, application_fee, is_available)
VALUES
(1, 'Income Certificate', 'Certifies annual income of the applicant', 6, 35.00, TRUE),

(2, 'Community Certificate', 'Certifies caste or community details', 8, 25.00, TRUE),

(3, 'Widow Certificate', 'Issued to eligible widow applicants', 5, 15.00, TRUE),

(4, 'Disability Certificate', 'Certifies disability status for government benefits', 10, 50.00, TRUE),

(5, 'Senior Citizen Certificate', 'Issued to citizens above 60 years of age', 4, 20.00, TRUE),

(6, 'Unemployment Certificate', 'Certifies unemployment status of the applicant', 7, 30.00, FALSE);
SELECT * FROM Certificate_Type;
DROP TABLE Certificate_Application;
CREATE TABLE Certificate_Application (
application_id INT PRIMARY KEY,
citizen_id INT NOT NULL,
certificate_name VARCHAR(100) NOT NULL,
application_date DATE NOT NULL,
purpose VARCHAR(200) NOT NULL,
application_status VARCHAR(30) NOT NULL,
fee_paid DECIMAL(8,2) NOT NULL,
reference_number VARCHAR(30) UNIQUE NOT NULL
);
INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_name, application_date, purpose, application_status, fee_paid, reference_number)
VALUES
(2001, 101, 'Income Certificate', '2026-07-10', 'Scholarship Application', 'Submitted', 35.00, 'REF2026001'),

(2002, 102, 'Community Certificate', '2026-07-11', 'College Admission', 'Under Review', 25.00, 'REF2026002'),

(2003, 103, 'Senior Citizen Certificate', '2026-07-12', 'Pension Benefits', 'Approved', 20.00, 'REF2026003'),

(2004, 104, 'Disability Certificate', '2026-07-13', 'Medical Assistance', 'Submitted', 50.00, 'REF2026004'),

(2005, 105, 'Widow Certificate', '2026-07-14', 'Government Welfare Scheme', 'Rejected', 15.00, 'REF2026005'),

(2006, 106, 'Unemployment Certificate', '2026-07-15', 'Job Fair Registration', 'Under Review', 30.00, 'REF2026006');
SELECT * FROM Certificate_Application;
DROP TABLE Panchayat_Office;
CREATE TABLE Panchayat_Office (
office_id INT PRIMARY KEY,
office_name VARCHAR(100) NOT NULL,
village_name VARCHAR(50) NOT NULL,
pincode VARCHAR(6) NOT NULL,
contact_number VARCHAR(15) UNIQUE,
office_email VARCHAR(100) UNIQUE,
opening_time TIME NOT NULL,
is_operational BOOLEAN NOT NULL
);

INSERT INTO Panchayat_Office
(office_id, office_name, village_name, pincode, contact_number, office_email, opening_time, is_operational)
VALUES
(1, 'Green Valley Gram Panchayat', 'Green Valley', '522001', '9876501001', 'greenvalley@gp.gov.in', '09:00:00', TRUE),

(2, 'Sunrise Gram Panchayat', 'Sunrise Colony', '522002', '9876501002', 'sunrise@gp.gov.in', '09:30:00', TRUE),

(3, 'River View Gram Panchayat', 'River View', '522003', '9876501003', 'riverview@gp.gov.in', '10:00:00', TRUE),

(4, 'Hill Top Gram Panchayat', 'Hill Top', '522004', '9876501004', 'hilltop@gp.gov.in', '09:15:00', TRUE),

(5, 'Lotus Gram Panchayat', 'Lotus Nagar', '522005', '9876501005', 'lotus@gp.gov.in', '10:30:00', FALSE),

(6, 'Silver Oak Gram Panchayat', 'Silver Oak', '522006', '9876501006', 'silveroak@gp.gov.in', '08:45:00', TRUE);

SELECT * FROM Panchayat_Office;
INSERT INTO Citizen
(citizen_id, full_name, gender, date_of_birth, aadhaar_number, mobile_number, address)
VALUES
(107, 'Rohit Varma', 'Male', '2001-11-15', '789012345678', '9876501007',  'Anandapuram');
SELECT * FROM Citizen;
INSERT INTO Certificate_Type
(certificate_type_id, certificate_name, description, processing_days, application_fee, is_available)
VALUES
(7, 'EWS Certificate', 'Certifies annual income of an applicant', 6, 35.00, TRUE);
SELECT * FROM Certificate_Type;
UPDATE Certificate_Application
SET application_status = 'Under Review'
WHERE application_id = 2001;
UPDATE Certificate_Application
SET application_status = 'Approved'
WHERE application_id = 2002;
SELECT * FROM Certificate_Application;
UPDATE Certificate_Type
SET processing_days = 12
WHERE certificate_name = 'Disability Certificate';
SELECT * FROM Certificate_Type;
UPDATE Certificate_Type
SET is_available = TRUE
WHERE certificate_name = 'Unemployment Certificate';
SELECT * FROM Certificate_Type;
DELETE FROM Citizen
WHERE citizen_id = 107;
SELECT * FROM Citizen;
ALTER TABLE Certificate_Application
ADD issued_date DATE;

DESCRIBE Certificate_Application;

SELECT application_id, certificate_name, issued_date
FROM Certificate_Application;
ALTER TABLE Certificate_Application
MODIFY purpose VARCHAR(300);

DESCRIBE Certificate_Application;

SELECT application_id, purpose
FROM Certificate_Application;
ALTER TABLE Panchayat_Office
ADD closing_time TIME;

DESCRIBE Panchayat_Office;

SELECT office_id, office_name, opening_time, closing_time
FROM Panchayat_Office;
USE gram_panchayatdb;

-- Create Temporary_Request table
CREATE TABLE Temporary_Request (
request_id INT PRIMARY KEY,
request_name VARCHAR(100) NOT NULL,
request_date DATE NOT NULL
);

-- Insert sample records
INSERT INTO Temporary_Request
(request_id, request_name, request_date)
VALUES
(1,'Residence Certificate','2026-07-20'),
(2,'Income Certificate','2026-07-21'),
(3,'Birth Certificate','2026-07-22');

-- Display records
SELECT * FROM Temporary_Request;

-- Remove all records
TRUNCATE TABLE Temporary_Request;

-- Verify table is empty
SELECT * FROM Temporary_Request;

-- Delete table completely
DROP TABLE Temporary_Request;

-- Verify table is deleted
SHOW TABLES;
INSERT INTO Citizen
(citizen_id, full_name, gender, date_of_birth, aadhaar_number, mobile_number, address)
VALUES
(101,'Test Citizen','Male','1998-01-01','987654321111','9999999991','Test Address');
INSERT INTO Citizen
(citizen_id, full_name, gender, date_of_birth, aadhaar_number, mobile_number, address)
VALUES
(108,'Rahul Kumar','Male','1997-06-15','987654321112','9876500011','Hyderabad');
INSERT INTO Certificate_Type
(certificate_type_id,
certificate_name,
description,
processing_days,
application_fee,
is_available)
VALUES
(8,
NULL,
'Testing NOT NULL',
5,
40.00,
TRUE);
INSERT INTO Certificate_Application
(application_id,
citizen_id,
certificate_name,
application_date,
purpose,
application_status,
fee_paid,
reference_number)
VALUES
(2001,
101,
'Income Certificate',
'2026-07-20',
'Scholarship',
'Submitted',
40.00,
'REF1001');
SELECT * FROM Citizen;

SELECT * FROM Certificate_Type;

SELECT * FROM Certificate_Application;

SELECT * FROM Panchayat_Office;
