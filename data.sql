/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '02-03-2020', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '11-15-2018', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '01-07-2021', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '05-12-2017', 5, true, 11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '02-08-2020', 0, false, -11), 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', '11-15-2021', 2, true, -5.7), 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle', '04-02-1993', 3, false, -12.13), 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', '06-12-2005', 1, true, -45), 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', '06-07-2005', 7, true, 20.4), 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon', '06-07-2005', 7, true, 20.4), 


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Ditto', '05-14-2022', 4, true, 22);
-- Owners table

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

-- Specie table
INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

-- UPdate species_id
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon%';


UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

-- Update owners_id

UPDATE animals
  SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
  WHERE name = 'Agumon';

UPDATE animals
  SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
  WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
  SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
  WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
  SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
  WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
  SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
  WHERE name IN ('Angemon', 'Boarmon');
-- Insert the following data for visits:
INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1),
  'May 24, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Agumon'LIMIT 1),
  'Jul 22, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Gabumon' LIMIT 1),
  'Feb 02, 2021'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1),
  'Jan 05, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1),
  'Mar 08, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1),
  'May 14, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Devimon' LIMIT 1),
  'May 04, 2021'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Charmander' LIMIT 1),
  'Feb 24, 2021'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Planton' LIMIT 1),
  'Dec 21, 2019'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Planton' LIMIT 1),
  'Aug 10, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Planton' LIMIT 1),
  'Apr 07, 2021'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Squirtle' LIMIT 1),
  'Sep 29, 2019'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1),
  'Oct 03, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1),
  'Nov 04, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
  'Jan 24, 2019'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
  'May 15, 2019'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
  'Feb 27, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1),
  'Aug 03, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1),
  'May 24, 2020'
);

INSERT INTO visits (vet_id, animal_id, date)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1),
  (SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1),
  'Jan 11, 2021'
);
