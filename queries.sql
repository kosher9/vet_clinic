/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu' ;
SELECT (name, escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true ;
SELECT * FROM animals WHERE name IS DISTINCT FROM 'Gabumon' ;
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3 ;

-- 

begin;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;


-- 
SELECT * FROM animals;

-- 

begin;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS null;
COMMIT;

-- 

-- 

SELECT * FROM animals;

-- 

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

-- 

-- 

ALTER TABLE animals DROP COLUMN species;

-- 

SELECT A.name, O.full_name FROM animals A
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Melody Pond';

-- 

SELECT A.name, S.name 
FROM animals A
JOIN species S
ON S.id = A.species_id
WHERE S.name = 'Pokemon';

-- 

SELECT O.full_name as owner, A.name as animal
FROM animals A
RIGHT JOIN owners O
ON O.id = A.owner_id;

-- 

SELECT S.name, COUNT(*)
FROM animals A 
JOIN species S
ON S.id = A.species_id
GROUP BY S.name;

-- 

SELECT A.name, O.full_name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Jennifer Orwell';

-- 

SELECT A.name, O.full_name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

-- 

SELECT O.full_name, COUNT(*)
FROM animals A
JOIN owners O
ON O.id = A.owner_id
GROUP BY (O.full_name)
ORDER BY COUNT(*) 
DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?

SELECT A.name FROM animals A
JOIN visits V
ON A.id = V.animal_id
JOIN vets VE
ON VE.id = V.vet_id
WHERE VE.name = 'William Tatcher'
ORDER BY V.date
DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see

SELECT  ve.name, COUNT(DISTINCT A.name) from animals a
JOIN visits v
ON v.animal_id = a.id
JOIN vets ve
ON ve.id = v.vet_id
WHERE ve.name = 'Stephanie Mendez'
GROUP BY(ve.name);

-- List all vets and their specialties, including vets with no specialties

SELECT ve.name, s.name from vets ve
JOIN specializations sp
ON ve.id = sp.vet_id
JOIN species s
ON s.id = sp.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020

SELECT a.name as animal, v.date, ve.name as vet from animals a
JOIN visits v
ON v.animal_id = a.id
JOIN vets ve
ON ve.id = v.vet_id
WHERE ve.name = 'Stephanie Mendez'
AND v.date >= 'Apr 01, 2020' AND v.date <= 'Aug 30, 2020' ;

-- What animal has the most visits to vets

SELECT a.name, COUNT(v.animal_id) as visit_number FROM animals a
JOIN visits v
ON v.animal_id = a.id
GROUP BY a.name
ORDER BY (visit_number)
DESC LIMIT 1;

-- Who was Maisy Smith's first visit

SELECT a.name as animal, v.date, ve.name as vet from animals a
JOIN visits v
ON v.animal_id = a.id
JOIN vets ve
ON ve.id = v.vet_id
WHERE ve.name = 'Maisy Smith'
ORDER BY v.date
DESC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit

SELECT a.name as animal, a.date_of_birth, a.escape_attempts, a.neutered, a.weight_kg, ve.name as vet, ve.age as vet_age, ve.date_of_graduation, v.date as visit_date from animals a
JOIN visits v
ON v.animal_id = a.id
JOIN vets ve
ON ve.id = v.vet_id;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT ve.name, COUNT(v.vet_id) FROM vets ve
JOIN visits v
ON v.vet_id = ve.id
JOIN animals a
ON a.id = v.animal_id
WHERE a.species_id IN (SELECT sp.species_id FROM specializations sp
                          JOIN vets v
                          ON v.id = sp.vet_id
                          WHERE v.name = ve.name)
GROUP BY ve.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most

SELECT ve.name, a.species_id , COUNT(a.species_id) as species_count from vets ve
JOIN visits v
ON v.vet_id = ve.id
JOIN animals a
ON a.id = v.animal_id
WHERE ve.name = 'Maisy Smith'
GROUP BY (ve.name, a.species_id)
ORDER BY species_count
DESC LIMIT 1;