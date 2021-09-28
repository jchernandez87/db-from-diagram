CREATE DATABASE clinic_db;

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  admitted_at TIMESTAMP, 
  patient_id INT, 
  status VARCHAR(50)
);

CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  name VARCHAR(50), 
  date_of_birth DATE
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  total_amount DECIMAL, generated_at TIMESTAMP, 
  payed_at TIMESTAMP, 
  medical_history_id INT
);