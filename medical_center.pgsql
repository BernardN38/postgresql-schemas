DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;



CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob TEXT NOT NULL
);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    treatment TEXT NOT NULL
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    disease_id INTEGER NOT NULL REFERENCES diseases
);


INSERT INTO patients (first_name, last_name, dob)
VALUES
('Bernardo', 'Narvaez', '1-11-2000'),
('Edna', 'Pina', '2-22-2000');


INSERT INTO doctors (name, specialty)
VALUES 
('williamson', 'oncology'),
('johnson', 'orthopedic');

INSERT INTO diseases (name, treatment)
VALUES
('cancer', 'chemotherapy'),
('alzhiemers', 'medication');

INSERT INTO treatments (patient_id, doctor_id, disease_id)
VALUES 
(1,1,1),
(2,1,1),
(1,2,2),
(2,2,2);