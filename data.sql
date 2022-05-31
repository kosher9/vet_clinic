/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Agumon', 'Feb 3, 2020', 10.23, true, 0, 2, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Gabumon', 'Nov 15, 2018', 8, true, 2, 2, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Pikachu', 'Jan 7, 2021', 15.04, false, 1, 1, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Devimon', 'May 12, 2017', 11, true, 5, 2, 3);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES('Charmander', 'Feb 8, 2020', 11, false, 0, 1, 4), ('Plantmon', 'Nov 15, 2021', 5.7, true, 2, 2, 3), ('Squirtle', 'Apr 2, 1993', 12.13, true, 3, 1, 4), ('Angemon', 'Jun 12, 2005', 45, true, 1, 2, 5), ('Boarmon', 'Jun 7, 2005', 20.4, true, 7, 2, 5), ('Blossom', 'Oct 13, 1998', 17, true, 3, 1, 4);

INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
