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
   
📂 Schema Overview

Table	Description

Specialties	Medical fields (e.g., Cardiology)

Doctors	Doctor details with contact info

DoctorSpecialty	Links doctors to specialties (M-M)

Patients	Patient records

Appointments	Bookings with status tracking

