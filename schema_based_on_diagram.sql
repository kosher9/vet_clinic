CREATE TABLE patients (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(40),
date_of_birth Date
);

-- 

CREATE TABLE IF NOT EXISTS medical_histories (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admited_at timestamp,
    patient_id INT,
    status VARCHAR(20)
);

ALTER TABLE medical_histories
ADD FOREIGN KEY (patient_id) REFERENCES patients(id);

-- 

CREATE TABLE IF NOT EXISTS invoices (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at decimal,
    payed_at timestamp,
    medical_history__id int UNIQUE
);

ALTER TABLE invoices
ADD FOREIGN KEY (medical_history__id) REFERENCES medical_histories(id);

-- 

CREATE TABLE IF NOT EXISTS treatments (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type varchar(15),
    name varchar(15)
);

-- 

CREATE TABLE IF NOT EXISTS invoice_items (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unique_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int
);

ALTER TABLE invoice_items
ADD FOREIGN KEY (invoice_id) references invoices(id),
ADD FOREIGN KEY (treatment_id) references treatments(id);

-- 

CREATE TABLE IF NOT EXISTS medical_hist_treatment (
    medical_histories_id int,
    treatments_id int
);

ALTER TABLE medical_hist_treatment
ADD FOREIGN KEY (medical_histories_id) references medical_histories(id),
ADD FOREIGN KEY (treatments_id) references treatments(id);
