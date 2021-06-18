--liquibase formatted sql

--changeset postgres:load_countries context:data splitStatements:false rollbackSplitStatements:false
--comment: Load countries


INSERT INTO
    countries (name)
SELECT
    t.*
FROM
    (
        VALUES
            ('Philippines'),
            ('India'),
            ('Indonesia'),
            ('Myanmar')
    ) AS t
;



--rollback TRUNCATE TABLE countries CASCADE;