/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(40),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN ,
    weight_kg DECIMAL,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (owner_id) REFERENCES owners(id)
);

CREATE TABLE IF NOT EXISTS owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(20),
    age INT
) ;

CREATE TABLE IF NOT EXISTS species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    date_of_graduation DATE
);
