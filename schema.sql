/* Database schema to keep the structure of entire database. */

create database vet_clinic;

CREATE TABLE animals (
    id serial PRIMARY KEY NOT NULL,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);
