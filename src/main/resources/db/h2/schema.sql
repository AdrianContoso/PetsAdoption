CREATE TABLE IF NOT EXISTS vets (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS specialties (
  id   INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS vet_specialties (
  vet_id       INTEGER NOT NULL,
  specialty_id INTEGER NOT NULL
);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_vets FOREIGN KEY (vet_id) REFERENCES vets (id);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_specialties FOREIGN KEY (specialty_id) REFERENCES specialties (id);

CREATE TABLE IF NOT EXISTS types (
  id   INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS owners (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR_IGNORECASE(30),
  address    VARCHAR(255),
  city      VARCHAR(80),
  telephone  VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS pets (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name      VARCHAR(30),
  birth_date DATE,
  type_id     INTEGER NOT NULL,
  owner_id    INTEGER NOT NULL
);
ALTER TABLE pets ADD CONSTRAINT fk_pets_owners FOREIGN KEY (owner_id) REFERENCES owners (id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_types FOREIGN KEY (type_id) REFERENCES types (id);

CREATE TABLE IF NOT EXISTS visits (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  pet_id      INTEGER NOT NULL,
  visit_date  DATE,
  description VARCHAR(255)
);
ALTER TABLE visits ADD CONSTRAINT fk_visits_pets FOREIGN KEY (pet_id) REFERENCES pets (id);

CREATE TABLE IF NOT EXISTS adoptable_pets (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  species     VARCHAR(30),
  gender      VARCHAR(30),
  age         INTEGER,
  description VARCHAR(255),
  adopted     BOOLEAN DEFAULT FALSE
);
