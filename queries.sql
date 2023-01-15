/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT * from animals WHERE neutered IS true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

* Begin Transaction A */
BEGIN;

update animals set species = 'unspecified';

/* Verify that change was made */
SELECT * from animals;

/* Rollback changes */
ROLLBACK;

/* Verify changes */
SELECT * from animals;

/* Begin Transaction B */
BEGIN;

/* update species col for animals with names ending in mon */
update animals set species = 'digimon' where name like '%mon';

/* update species col for animals with names not ending in mon */
update animals set species = 'pokemon' where species IS null;

/* Confirm changes */
SELECT * from animals;

/* commit changes */
COMMIT;

/* Verify that change was made and persists after commit */
SELECT * from animals;

/* Delete all records in the animals table transaction C */
/* Begin Transaction C */
BEGIN;

/* delete all records */
DELETE from animals;

/* verify all records are deleted */
SELECT * from animals;

/* Rollback changes */
ROLLBACK;

/* verify all records still exist */
SELECT * from animals;

/* Begin Transaction D */
BEGIN;

/* Delete all animals born after Jan 1st, 2022. */
DELETE from animals WHERE date_of_birth > '01-01-2022';

/* create a savepoint */
SAVEPOINT dob;

/* update all animals' weights multiplied by -1 */
UPDATE animals SET weight_kg =weight_kg * -1;

/* roolback to savepoint */
ROLLBACK TO dob;


/* update all animals' weights that are negative multiplied by -1 */
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

/* commit the transaction */
COMMIT;

/* How many animals are there? */
SELECT COUNT(*) from animals;

/* How many animals have never tried to escape? */
SELECT COUNT(*) from animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */
SELECT AVG(weight_kg) from animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT neutered, count(neutered) as result FROM animals GROUP BY neutered ORDER BY result DESC LIMIT 1;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

/* List of owners and their animals, remember to include those that don't own any animal. */
SELECT name, full_name FROM animals FULL JOIN owners ON animals.owner_id = owners.id;

/* How many animals are there per species? */
SELECT COUNT(animals.name), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT owners.full_name, animals.name AS animal_name, species.name AS species_name FROM animals JOIN owners ON owners.id = animals.owner_id JOIN species ON species.id = animals.species_id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT name, escape_attempts, full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';

/* Who owns the most animals? */
SELECT full_name, COUNT(animals.owner_id) as total_animals FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.id ORDER BY total_animals DESC LIMIT 1;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
/* Who owns the most animals? */
SELECT full_name, COUNT(animals.owner_id) as total_animals FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.id ORDER BY total_animals DESC LIMIT 1;

SELECT animals.name, visits.date FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='William Tatcher' GROUP BY animals.name, visits.date ORDER BY visits.date DESC LIMIT 1;
SELECT COUNT(*) FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Stephanie Mendez';
SELECT vets.name, species.name FROM vets 
  LEFT JOIN specializations ON vets.id=specializations.vet_id 
  LEFT JOIN species ON species.id=specializations.species_id
  GROUP BY vets.name, species.name;
SELECT animals.name, visits.date FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Stephanie Mendez' AND visits.date BETWEEN '2020-04-01' AND '2020-08-30' GROUP BY animals.name, visits.date;
SELECT animals.name, COUNT(*) FROM animals JOIN visits ON animals.id=visits.animal_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT animals.name, visits.date FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Maisy Smith'GROUP BY animals.name, visits.date ORDER BY visits.date ASC LIMIT 1;
SELECT * FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  ORDER BY visits.date DESC LIMIT 1;
select COUNT(vets.name)
  from animals join visits on animals.id=visits.animal_id 
                join vets on visits.vet_id=vets.id 
                left join specializations on vets.id=specializations.vet_id
  WHERE (SELECT specializations.species_id FROM specializations 
          WHERE specializations.vet_id=visits.vet_id AND specializations.species_id=animals.species_id) IS NULL;
SELECT animals.species_id, COUNT(*) FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Maisy Smith'GROUP BY animals.species_id; --Digimon
