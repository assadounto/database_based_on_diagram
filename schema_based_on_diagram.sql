CREATE TABLE patients(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth INTEGER NOT NULL
    PRIMARY KEY(id);
);

CREATE TABLE medical_histories(
    id INTEGER NOT NULL,
    admitted_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    patient_id INTEGER NOT NULL,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY(id);    
);

CREATE TABLE invoices(
    id INTEGER NOT NULL,
    total_amount DECIMAL(8, 2) NOT NULL,
    generated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    payed_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    medical_history_id INTEGER NOT NULL,
    PRIMARY KEY(id);
);

CREATE TABLE treatments(
    id INTEGER NOT NULL,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id);
);

CREATE TABLE treatments_medical_histories(
    treatment_id INTEGER NOT NULL,
    medical_history_id INTEGER NOT NULL;
);

CREATE TABLE invioce_items(
    id INTEGER NOT NULL,
    unit_price DECIMAL(8, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    total_price DECIMAL(8, 2) NOT NULL,
    invoice_id INTEGER NOT NULL,
    treatment_id INTEGER NOT NULL,
    PRIMARY KEY(id);
);

ALTER TABLE
    invioce_items ADD CONSTRAINT invioce_items_invoice_id_foreign FOREIGN KEY(invoice_id) REFERENCES invoices(id);
ALTER TABLE
    invoices ADD CONSTRAINT invoices_medical_history_id_foreign FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE
    medical_histories ADD CONSTRAINT medical_histories_patient_id_foreign FOREIGN KEY(patient_id) REFERENCES patients(id);
ALTER TABLE
    invioce_items ADD CONSTRAINT invioce_items_treatment_foreign FOREIGN KEY(treatment_id) REFERENCES treatments(id);

ALTER Table
    treatments_medical_histories ADD CONSTRAINT treatments_treatment_id_foreign FOREIGN KEY(treatment_id) REFERENCES treatments(id);
    
ALTER Table
    treatments_medical_histories ADD CONSTRAINT medical_histories_medical_history_id_foreign FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);


CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON treatments_medical_histories(treatment_id);
CREATE INDEX ON treatments_medical_histories(medical_history_id);
CREATE INDEX ON invioce_items(invoice_id);
CREATE INDEX ON invioce_items(treatment_id);
