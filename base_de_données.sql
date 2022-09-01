CREATE DATABASE CitySport;

USE CitySport;

CREATE USER 'faneolia'@'localhost' IDENTIFIED BY 'admin';

SELECT User, Host FROM mysql.user;


CREATE TABLE client(
    clientID int NOT NULL,
    OrderNumber int NOT NULL,
    nom VARCHAR (150) NOT NULL,
    prenom VARCHAR (75) NOT NULL,
    contact int(11) NOT NULL,
    ville VARCHAR (45) NOT NULL,
    PRIMARY KEY (ClientID)
)ENGINE=Innodb DEFAULT CHARSET=utf8;

CREATE TABLE marques (
    id_marque INTEGER NOT NULL AUTO_INCREMENT,
    nom_de_la_marque VARCHAR (100),
    logo VARCHAR (100),
    PRIMARY KEY (id_marque)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

CREATE TABLE chaussures (
    id_chaussures INTEGER NOT NULL AUTO_INCREMENT,
    id_marque int NOT NULL,
    couleur VARCHAR (100),
    taille VARCHAR (100),
    prix VARCHAR (100),
    PRIMARY KEY (id_chaussures),
    FOREIGN KEY (`id_marque`) REFERENCES marques(`id_marque`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;

INSERT INTO `marques` (`id_marque`,`nom_de_la_marque`, `logo`)
VALUES
(NULL, 'NIKE', 'Nike-Logo'),
(NULL, 'PUMA', 'Puma-Logo.png'),
(NULL, 'ASICS', 'Asics-Logo.png');

INSERT INTO `chaussures` (`id_chaussures`,`id_marque`, `couleur`, `taille`, `prix`)
VALUES
(NULL, 2, 'rose', '38', '15000f'),
(NULL, 1, 'blanche', '42', '25000f'),
(NULL, 3, 'noire', '37', '55000f');