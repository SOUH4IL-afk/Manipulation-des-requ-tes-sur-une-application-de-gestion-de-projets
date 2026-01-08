CREATE TABLE Utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS Article;

DROP TABLE IF EXISTS Article;

CREATE TABLE Article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    contenu TEXT NOT NULL,
    date_pub DATE NOT NULL,
    nb_vues INT DEFAULT 0,
    id_utilisateur INT NOT NULL,
    CONSTRAINT fk_article_utilisateur
        FOREIGN KEY (id_utilisateur)
        REFERENCES Utilisateur(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE Commentaire (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT NOT NULL,
    date_commentaire TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_article INT NOT NULL,
    id_utilisateur INT NOT NULL,

    CONSTRAINT fk_commentaire_article
        FOREIGN KEY (id_article)
        REFERENCES Article(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_commentaire_utilisateur
        FOREIGN KEY (id_utilisateur)
        REFERENCES Utilisateur(id)
        ON DELETE CASCADE
);

SELECT titre, date_pub
FROM Article
WHERE date_pub >= '2024-01-01';

SELECT titre, date_pub
FROM Article
WHERE id_utilisateur = 1;
SELECT titre, date_pub
FROM Article
ORDER BY date_pub DESC;
 
 SELECT titre
FROM Article
ORDER BY titre ASC;

SELECT titre, date_pub
FROM Article
ORDER BY date_pub DESC
LIMIT 5; 

SELECT titre, date_pub
FROM Article
WHERE id_utilisateur = 1
ORDER BY date_pub DESC
LIMIT 3;