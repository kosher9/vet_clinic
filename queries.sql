/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu' ;
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true ;
SELECT * FROM animals WHERE name IS DISTINCT FROM 'Gabumon' ;
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3 ;

begin;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

SELECT * FROM animals;

begin;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS null;
COMMIT;

SELECT * FROM animals;

begin;
DELETE FROM animals;
rollback;

SELECT * FROM animals;

begin;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_save;

UPDATE animals
SET weight_kg = weight_kg * (-1);

rollback to my_save;

UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;

commit;

SELECT * FROM animals;

SELECT COUNT (*) as number_of_animals FROM animals;
SELECT COUNT (*) as number_no_escape FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) as average_weight FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-01-01' GROUP BY species;

ALTER TABLE animals DROP COLUMN species;

SELECT A.name, O.full_name FROM animals A
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Melody Pond';

SELECT A.name, S.name 
FROM animals A
JOIN species S
ON S.id = A.species_id
WHERE S.name = 'Pokemon';

SELECT O.full_name as owner, A.name as animal
FROM animals A
RIGHT JOIN owners O
ON O.id = A.owner_id;

SELECT S.name, COUNT(*)
FROM animals A 
JOIN species S
ON S.id = A.species_id
GROUP BY S.name;

SELECT A.name, O.full_name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Jennifer Orwell';

SELECT A.name, O.full_name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

SELECT O.full_name, COUNT(*)
FROM animals A
JOIN owners O
ON O.id = A.owner_id
GROUP BY (O.full_name)
ORDER BY COUNT(*) 
DESC LIMIT 1;
