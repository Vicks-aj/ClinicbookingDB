# Clinic Booking System Database

## 🏥 Project Description
A MySQL database for managing clinic appointments, doctors, patients, and medical specialties. Features include:
- **Multi-specialty doctor assignments** (M-M relationships)
- **Appointment tracking** (scheduled, completed, cancelled)
- **Data integrity** with constraints (PK, FK, UNIQUE, NOT NULL)
- **Sample data** for testing/demonstration

## 🚀 Setup Instructions
1. **Clone the repository**:
   ```bash
   git clone https://github.com/[your-username]/clinic-booking-db.git
2. **Import the SQL script into MySQL**:
   ```bash
   mysql -u [your_username] -p < clinic_booking_system.sql
   
# 📂 Schema Overview

 Table	                                          Description
______________________________________________________________

Specialties	                 Medical fields (e.g., Cardiology)
______________________________________________________________

Doctors	                     Doctor details with contact info
______________________________________________________________

DoctorSpecialty             Links doctors to specialties (M-M)
______________________________________________________________

Patients	                                      Patient records
______________________________________________________________

Appointments	                  Bookings with status tracking
______________________________________________________________

🛠️ Query Examples
1. **View all appointments**:
   ```bash
   SELECT * FROM Appointments;
2. **Find doctors with multiple specialties**:
   ```bash
   SELECT d.first_name, d.last_name, COUNT(s.specialty_id) AS specialty_count
   FROM Doctors d
   JOIN DoctorSpecialty ds ON d.doctor_id = ds.doctor_id
   JOIN Specialties s ON ds.specialty_id = s.specialty_id
   GROUP BY d.doctor_id
   HAVING specialty_count > 1;


# Steps to Push to GitHub
   1. Create a new repository on GitHub (e.g., clinic-booking-db)
   2. Initialize locally and add files:
      ```bash
     mkdir clinic-booking-db
     cd clinic-booking-db
     git init
     git add clinic_booking_system.sql README.md
     git commit -m "Initial commit: Clinic Booking System database"
     git remote add origin https://github.com/[your-username]/clinic-booking-db.git
     git push -u origin main
     
   3. Add ERD image:
      
   **Generate the ERD using dbdiagram.io**
      
   **Upload the ERD image to the repo or include it in the README.md**
