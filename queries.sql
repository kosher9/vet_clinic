/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu' ;
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true ;
SELECT * FROM animals WHERE name IS DISTINCT FROM 'Gabumon' ;
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3 ;

SELECT COUNT (*) as number_of_animals FROM animals;
SELECT COUNT (*) as number_no_escape FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) as average_weight FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-01-01' GROUP BY species;
