-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-05-03 19:35:55 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE faction (
    faction_name CHAR(12 CHAR) NOT NULL
);

ALTER TABLE faction ADD CONSTRAINT faction_pk PRIMARY KEY ( faction_name );

CREATE TABLE game_expansion (
    expansion_name CHAR(30 CHAR) NOT NULL
);

ALTER TABLE game_expansion ADD CONSTRAINT game_expansion_pk PRIMARY KEY ( expansion_name );

CREATE TABLE matches (
    match_id          INTEGER NOT NULL,
    match_date        DATE NOT NULL,
    victory_status    NUMBER(1) NOT NULL,
    expansion_name    CHAR(30 CHAR) NOT NULL,
    player1_name      CHAR(12 CHAR) NOT NULL,
    player2_name      CHAR(12 CHAR) NOT NULL,
    player1_faction   CHAR(12 CHAR) NOT NULL,
    player2_faction   CHAR(12 CHAR) NOT NULL
);

ALTER TABLE match ADD CONSTRAINT match_pk PRIMARY KEY ( match_id );

CREATE TABLE player (
    player_name CHAR(12 CHAR) NOT NULL
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( player_name );

ALTER TABLE match
    ADD CONSTRAINT match_faction_fk FOREIGN KEY ( player1_faction )
        REFERENCES faction ( faction_name );

ALTER TABLE match
    ADD CONSTRAINT match_faction_fkv1 FOREIGN KEY ( player2_faction )
        REFERENCES faction ( faction_name );

ALTER TABLE match
    ADD CONSTRAINT match_game_expansion_fk FOREIGN KEY ( expansion_name )
        REFERENCES game_expansion ( expansion_name );

ALTER TABLE match
    ADD CONSTRAINT match_player_fk FOREIGN KEY ( player1_name )
        REFERENCES player ( player_name );

ALTER TABLE match
    ADD CONSTRAINT match_player_fkv1 FOREIGN KEY ( player2_name )
        REFERENCES player ( player_name );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
