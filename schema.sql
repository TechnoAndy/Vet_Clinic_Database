/* Database schema to keep the structure of entire database. */

/* Create database */
create database vet_clinic;

/* Create animals table */
CREATE TABLE animals (
    id serial PRIMARY KEY NOT NULL,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

/* Alter animals table */
ALTER TABLE animals ADD COLUMN species varchar(250);

/* Create owners table */
CREATE TABLE owners (id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL, full_name varchar(250), age int);

/* Create species table */
CREATE TABLE species (id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL, name varchar(250));

/* Alter animals table */
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id int;
ALTER TABLE animals ADD CONSTRAINT fk_name FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id int;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

/* Create vets table */
CREATE TABLE vets(
    id BIGSERIAL NOT NULL,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

/* Create specializations table */
CREATE TABLE specializations(
    vet_id INT,
    species_id INT,
    PRIMARY KEY(vet_id, species_id),
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(species_id) REFERENCES species(id)
);

/* Create visits table */
CREATE TABLE visits(
    vet_id INT,
    animal_id INT,
    date DATE,
    PRIMARY KEY(vet_id, animal_id, date),
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(animal_id) REFERENCES animals(id)
);

-- prpject requirements;
SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vets_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

-- Use EXPLAIN ANALYZE on the previous queries to check what is happening. Take screenshots of them -
-- before improve
EXPLAIN ANALYSE SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT COUNT(*) FROM visits where animals_id = 4;

-- after improve
CREATE INDEX visits_animals_id ON visits(animals_id);
EXPLAIN ANALYSE SELECT COUNT(*) FROM visits WHERE animals_id = 4;

-- SELECT * FROM visits where vet_id = 2; Before improve
SELECT * FROM visits WHERE vets_id = 2;
explain analyse SELECT COUNT(*) FROM visits where animals_id = 2;

-- Querie : SELECT * FROM visits where vet_id = 2; After improve
CREATE INDEX visits_vets_id ON visits(vets_id);
EXPLAIN ANALYSE SELECT * FROM visits WHERE animals_id = 2;

-- Querie :SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Before 
EXPLAIN ANALYSE SELECT * FROM owners WHERE email ='owner_18327@mail.com';
SELECT FROM owners WHERE email='owner_18327@mail.com';

-- after
CREATE INDEX owners_email ON owners(email);
EXPLAIN ANALYSE SELECT * FROM owners WHERE email ='owner_18327@mail.com';
