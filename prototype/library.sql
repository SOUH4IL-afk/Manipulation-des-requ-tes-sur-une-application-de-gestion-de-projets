-- =====================
-- TABLE RAYON
-- =====================
CREATE TABLE rayon (
    rayon_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- =====================
-- TABLE AUTEUR
-- =====================
CREATE TABLE auteur (
    auteur_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL
);

-- =====================
-- TABLE LECTEUR
-- =====================
CREATE TABLE lecteur (
    lecteur_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tel VARCHAR(15) NOT NULL UNIQUE,
    cin VARCHAR(8) NOT NULL UNIQUE
);

-- =====================
-- TABLE OUVRAGE
-- =====================
CREATE TABLE ouvrage (
    ouvrage_id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    annee_publication YEAR NOT NULL,
    rayon_id INT NOT NULL,
    FOREIGN KEY (rayon_id) REFERENCES rayon(rayon_id)
);

-- =====================
-- TABLE ASSOCIATION OUVRAGE / AUTEUR
-- =====================
CREATE TABLE ouvrage_auteur (
    ouvrage_id INT,
    auteur_id INT,
    PRIMARY KEY (ouvrage_id, auteur_id),
    FOREIGN KEY (ouvrage_id) REFERENCES ouvrage(ouvrage_id),
    FOREIGN KEY (auteur_id) REFERENCES auteur(auteur_id)
);

-- =====================
-- TABLE EMPRUNT
-- =====================
CREATE TABLE emprunt (
    emprunt_id INT AUTO_INCREMENT PRIMARY KEY,
    date_emprunt DATE NOT NULL DEFAULT CURRENT_DATE,
    date_retour_prevue DATE NOT NULL,
    date_retour_effective DATE NULL,
    lecteur_id INT NOT NULL,
    ouvrage_id INT NOT NULL,
    FOREIGN KEY (lecteur_id) REFERENCES lecteur(lecteur_id),
    FOREIGN KEY (ouvrage_id) REFERENCES ouvrage(ouvrage_id)
);

-- =====================
-- TABLE PERSONNEL
-- =====================
CREATE TABLE personnel (
    personnel_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tel VARCHAR(15) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    chef_id INT NULL,
    FOREIGN KEY (chef_id) REFERENCES personnel(personnel_id)
);
-- =====================
--     SELECT
-- =====================
-- 1️ جميع Rayons
SELECT * FROM rayon;

-- 2️ جميع Auteurs
SELECT nom, prenom FROM auteur;

-- 3️ جميع Ouvrages (titre + année)
SELECT titre, annee_publication FROM ouvrage;

-- 4️ جميع Lecteurs (nom, prénom, email)
SELECT nom, prenom, email FROM lecteur;

-- 5️ Ouvrages publiés après 1950
SELECT titre, annee_publication FROM ouvrage
WHERE annee_publication > 1950;

-- 6️ Lecteurs dont le nom commence par "M"
SELECT nom, prenom FROM lecteur
WHERE nom LIKE 'M%';

-- 7️ Ouvrages triés par année décroissante
SELECT titre, annee_publication FROM ouvrage
ORDER BY annee_publication DESC;

-- 8️ Emprunts dont la date de retour effective est NULL
SELECT * FROM emprunt
WHERE date_retour_effective IS NULL;

-- 9️ Liste des ouvrages avec le nom de leur rayon
SELECT o.titre, r.nom AS rayon
FROM ouvrage o
JOIN rayon r ON o.rayon_id = r.rayon_id;

-- 10 Titres des ouvrages avec le nom et prénom de leurs auteurs
SELECT o.titre, a.nom, a.prenom
FROM ouvrage o
JOIN ouvrage_auteur oa ON o.ouvrage_id = oa.ouvrage_id
JOIN auteur a ON oa.auteur_id = a.auteur_id;

-- 11 Lecteurs ayant effectué au moins un emprunt
SELECT DISTINCT l.nom, l.prenom
FROM lecteur l
JOIN emprunt e ON l.lecteur_id = e.lecteur_id;

-- 12 Nombre d’ouvrages par rayon
SELECT r.nom AS rayon, COUNT(o.ouvrage_id) AS nb_ouvrages
FROM rayon r
LEFT JOIN ouvrage o ON r.rayon_id = o.rayon_id
GROUP BY r.nom;
-- =====================
--    UPDATE
-- =====================
--1️ Modifier l’email d’un lecteur par son ID
UPDATE lecteur
SET email = 'nouvel.email@example.com'
WHERE lecteur_id = 1;

-- 2️ Mettre à jour le téléphone d’un lecteur par son CIN
UPDATE lecteur
SET tel = '0600111222'
WHERE cin = 'AA123456';

-- 3️ Modifier le rayon d’un ouvrage
UPDATE ouvrage
SET rayon_id = 2
WHERE ouvrage_id = 1;

-- 4️ Mettre à jour la date de retour effective d’un emprunt
UPDATE emprunt
SET date_retour_effective = '2026-01-12'
WHERE emprunt_id = 1;

-- 5️ Modifier le chef d’un membre du personnel
UPDATE personnel
SET chef_id = 1
WHERE personnel_id = 2;
-- =====================
--    DELETE
-- =====================
--  Supprimer un emprunt par son ID
DELETE FROM emprunt
WHERE emprunt_id = 2;

--  Supprimer un lecteur n’ayant jamais emprunté
DELETE FROM lecteur
WHERE lecteur_id NOT IN (SELECT DISTINCT lecteur_id FROM emprunt);

--  Supprimer un ouvrage jamais emprunté
DELETE FROM ouvrage
WHERE ouvrage_id NOT IN (SELECT DISTINCT ouvrage_id FROM emprunt);
--  Supprimer un auteur n’ayant écrit aucun ouvrage
DELETE FROM auteur
WHERE auteur_id NOT IN (SELECT DISTINCT auteur_id FROM ouvrage_auteur); 