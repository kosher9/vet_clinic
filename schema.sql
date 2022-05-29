/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INTEGER NOT NULL DEFAULT 0,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL(5,2) NOT NULL DEFAULT 0.00
);
