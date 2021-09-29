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

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  unit_price DECIMAL, quantity INT, 
  total_price DECIMAL, 
  invoice_id INT, 
  treatment_id INT
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  type VARCHAR(50), 
  name VARCHAR(50)
);

CREATE TABLE histories_treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  medical_histories_id INT, 
  treatments_id INT, 
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id) ON DELETE RESTRICT ON UPDATE CASCADE, 
  FOREIGN KEY (treatments_id) REFERENCES treatments (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE medical_histories ADD CONSTRAINT medical_histories_fk FOREIGN KEY (id) REFERENCES patients(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE invoices ADD CONSTRAINT invoices_fk FOREIGN KEY (id) REFERENCES medical_histories(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE invoice_items ADD CONSTRAINT invoice_items_fk FOREIGN KEY (id) REFERENCES invoices(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE invoice_items ADD CONSTRAINT invoice_items_fk_1 FOREIGN KEY (id) REFERENCES treatments(id) ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE INDEX my_patients_id ON medical_histories (patient_id ASC);
CREATE INDEX my_invoices_id ON invoices (medical_history_id ASC);
CREATE INDEX my_invoice_items_id ON invoice_items (invoice_id ASC);
CREATE INDEX my_invoice_treatment_id ON invoice_items (treatment_id ASC);
CREATE INDEX my_medical_histories_id ON histories_treatments (medical_histories_id ASC);
CREATE INDEX my_treatments_id ON histories_treatments (treatments_id ASC);
