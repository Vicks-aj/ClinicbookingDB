-- Clinic Booking System Database
-- Description: Manages patient appointments, doctors, and medical specialties.

-- Create the database
CREATE DATABASE ClinicBookingDB;
USE ClinicBookingDB;

-- *************** TABLES *************** --

-- Specialties table (e.g., Cardiology, Neurology)
CREATE TABLE Specialties (
    specialty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Junction table for M-M relationship between Doctors and Specialties
CREATE TABLE DoctorSpecialty (
    doctor_id INT,
    specialty_id INT,
    PRIMARY KEY (doctor_id, specialty_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id) ON DELETE CASCADE
);

-- Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Appointments table (1-M relationship with Patients and Doctors)
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_datetime DATETIME NOT NULL,
    status ENUM('scheduled', 'completed', 'cancelled') 
        NOT NULL DEFAULT 'scheduled',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);


-- *************** SAMPLE DATA *************** --
-- Specialties
INSERT INTO Specialties (name, description) VALUES
('Cardiology', 'Heart and cardiovascular system care'),
('Dermatology', 'Skin, hair, and nail disorders'),
('Pediatrics', 'Medical care for infants and children');

-- Doctors
INSERT INTO Doctors (first_name, last_name, phone, email) VALUES
('Emily', 'Smith', '+1-555-0101', 'emily.smith@clinic.com'),
('James', 'Brown', '+1-555-0202', 'james.brown@clinic.com'),
('Sarah', 'Lee', '+1-555-0303', NULL);

-- Doctor-Specialty Links
INSERT INTO DoctorSpecialty (doctor_id, specialty_id) VALUES
(1, 1), -- Emily Smith → Cardiology
(2, 2), -- James Brown → Dermatology
(3, 3), -- Sarah Lee → Pediatrics
(3, 1); -- Sarah Lee ALSO → Cardiology

-- Patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone) VALUES
('John', 'Doe', '1990-05-15', 'Male', '+1-555-1001'),
('Maria', 'Garcia', '1985-12-22', 'Female', '+1-555-1002'),
('Alex', 'Chen', '2005-03-08', 'Other', '+1-555-1003');

-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_datetime, status, notes) VALUES
(1, 1, '2023-11-01 09:00:00', 'scheduled', 'Annual heart checkup'),
(2, 2, '2023-11-01 14:30:00', 'completed', 'Acne treatment follow-up'),
(3, 3, '2023-11-02 11:15:00', 'cancelled', 'Patient requested reschedule');