CREATE DATABASE test;
USE test;
CREATE TABLE user
(
    id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    age INT NOT NULL,
    isadmin BIT DEFAULT b'0' NOT NULL,
    createddate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO user (name, age, isadmin) VALUES ('ADMIN', 33, TRUE );
INSERT INTO user (name, age, isadmin) VALUES ('USER1', 25, FALSE );
INSERT INTO user (name, age, isadmin) VALUES ('USER2', 25, FALSE );
INSERT INTO user (name, age, isadmin) VALUES ('USER3', 25, FALSE );
INSERT INTO user (name, age, isadmin) VALUES ('USER4', 25, FALSE );
INSERT INTO user (name, age, isadmin) VALUES ('USER5', 25, FALSE );
INSERT INTO user (name, age, isadmin) VALUES ('USER6', 25, FALSE );