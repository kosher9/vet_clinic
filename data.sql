/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Agumon', 'Feb 3, 2020', 10.23, true, 0, 2, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Gabumon', 'Nov 15, 2018', 8, true, 2, 2, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Pikachu', 'Jan 7, 2021', 15.04, false, 1, 1, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id) VALUES ('Devimon', 'May 12, 2017', 11, true, 5, 2, 3);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES('Charmander', 'Feb 8, 2020', 11, false, 0, 1, 4), ('Plantmon', 'Nov 15, 2021', 5.7, true, 2, 2, 3), ('Squirtle', 'Apr 2, 1993', 12.13, true, 3, 1, 4), ('Angemon', 'Jun 12, 2005', 45, true, 1, 2, 5), ('Boarmon', 'Jun 7, 2005', 20.4, true, 7, 2, 5), ('Blossom', 'Oct 13, 1998', 17, true, 3, 1, 4);

INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

-- INSERT DATA INTO VETS TABLE

INSERT INTO vets (name, age, date_of_graduation) VALUES('William Tatcher', 45, 'Apr 23, 2000'), ('Maisy Smith', 26, 'Jan 17, 2019'), ('Stephanie Mendez', 64, 'May 4, 1981'), ('Jack Harkness', 38, 'Jun 08, 2008');

-- INSERT DATA INTO SPECIALITIES TABLE

INSERT INTO specializations (vet_id, species_id) VALUES(1, 1), (3, 2), (3, 1), (4, 2);

-- INSERT DATA INTO VISIT TABLE

INSERT INTO visits (animal_id, vet_id, date) VALUES(1, 1, 'May 24, 2020'), (1, 3, 'Jul 22, 2020'), (2, 4, 'Feb 02, 2021'), (3, 2, 'Jan 05, 2020'), (3, 2, 'Mar 08, 2020'), (3, 2, 'May 14, 2020'), (4, 3, 'May 04, 2021'), (5, 4, 'Feb 24 2021'), (6, 2, 'Dec 21, 2019'), (6, 1, 'Aug 10, 2020'), (6, 2, 'Apr 07, 2021'), (7, 3, 'Sept 29, 2019'), (8, 4, 'Oct 03, 2020'), (8, 4, 'Nov 04, 2020'), (9, 2, 'Jan 24, 2019'), (9, 2, 'May 15, 2019'), (9, 2, 'Feb 27, 2020'), (9, 2, 'Aug 03, 2020'), (10, 3, 'May 24, 2020'), (10, 1, 'Jan 11, 2021');
