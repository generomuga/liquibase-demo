--liquibase formatted sql

--changeset postgres:create_table_persons context:schema splitStatements:false rollbackSplitStatements:false
--comment: Create table persons



CREATE TABLE persons (
  id SERIAL PRIMARY KEY,
  first_name varchar,
  last_name varchar,
  gender int,
  dose_id int,
  country_id int,
  created_at timestamp
);

CREATE TABLE vaccines (
  id SERIAL PRIMARY KEY,
  name varchar,
  description varchar,
  country_id int,
  created_at timestamp
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name varchar,
  created_at timestamp
);

CREATE TABLE doses (
  id SERIAL PRIMARY KEY,
  person_id int,
  vaccine_id int,
  dose int,
  created_at timestamp
);

ALTER TABLE persons ADD FOREIGN KEY (country_id) REFERENCES countries (id);

ALTER TABLE persons ADD FOREIGN KEY (dose_id) REFERENCES doses (id);

ALTER TABLE vaccines ADD FOREIGN KEY (country_id) REFERENCES countries (id);

ALTER TABLE doses ADD FOREIGN KEY (person_id) REFERENCES persons (id);

ALTER TABLE doses ADD FOREIGN KEY (vaccine_id) REFERENCES vaccines (id);



--rollback DROP TABLE persons CASCADE;
--rollback DROP TABLE vaccines CASCADE;
--rollback DROP TABLE countries CASCADE;
--rollback DROP TABLE doses CASCADE;