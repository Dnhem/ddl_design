DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  startdate DATE NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  birthdate DATE NOT NULL
);

CREATE TABLE appointments
(
  id SERIAL PRIMARY KEY,
  doctors_id INT REFERENCES doctors (id),
  patient_id INT REFERENCES patients (id),
  appt_date DATE NOT NULL,
  diagnosis VARCHAR(40)
);

INSERT INTO doctors 
  (first_name, last_name, startdate)
VALUES 
  ('Barbara', 'Oakley', '2002-10-12'),
  ('Patel', 'Priyat', '2012-09-03'),
  ('Peter', 'Parker', '1999-03-08');

INSERT INTO patients
  (first_name, last_name, birthdate)
VALUES
  ('Daniel', 'Roberts', '1989-12-04'),
  ('Trisha', 'Adams', '2002-03-25'),
  ('Luke', 'Skywalker', '1980-11-08'),
  ('Han', 'Solo', '1980-07-04'),
  ('Chew', 'Bacca', '1980-04-16');

INSERT INTO appointments
  (doctors_id, patient_id, appt_date, diagnosis)
VALUES
  (1, 2, '2022-02-01', 'Covid-19'),
  (1, 3, '2022-01-19', 'Flu');