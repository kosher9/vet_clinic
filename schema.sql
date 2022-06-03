/* Database schema to keep the structure of entire database. */

-- CREATE ANIMALS TABLE

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(40),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN ,
    weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

-- CREATE OWNERS TABLE

CREATE TABLE IF NOT EXISTS owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(20),
    age INT
) ;

-- CREATE SPECIES TABLE

CREATE TABLE IF NOT EXISTS species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(10)
);

-- CREATE VETS TABLE

CREATE TABLE IF NOT EXISTS vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    date_of_graduation DATE
);

-- CREATE SPECIALIZATIONS TABLE

CREATE TABLE IF NOT EXISTS specializations();

ALTER TABLE specializations
ADD COLUMN vet_id INT,
ADD FOREIGN KEY (vet_id) REFERENCES vets(id),
ADD COLUMN species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id);

-- CREATE VISITS TABLE

CREATE TABLE IF NOT EXISTS visits(
    date DATE,
    animal_id INT,
    vet_id INT
);

ALTER TABLE visits
ADD FOREIGN KEY (animal_id) REFERENCES animals(id),
ADD FOREIGN KEY (vet_id) REFERENCES vets(id);
