
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
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
('Alice', 'alice@test.com', '1234'),
('Bob', 'bob@test.com', 'passbob'),
('Charlie', 'charlie@test.com', 'passcharlie');

INSERT INTO Article (titre, contenu, date_pub, nb_vues, id_utilisateur)
VALUES
('Article A', 'Contenu A', '2025-01-01', 10, 1),
('Article B', 'Contenu B', '2025-02-01', 20, 1),
('Article C', 'Contenu C', '2023-12-15', 5, 2),
('Article D', 'Contenu D', '2025-07-01', 15, 2),
('Article E', 'Contenu E', '2025-06-10', 8, 3),
('Article F', 'Contenu F', '2025-06-15', 12, 1);

INSERT INTO Commentaire (contenu, id_article, id_utilisateur)
VALUES
('Super article!', 1, 2),
('J\'aime bien!', 1, 3) ,
('Merci pour le contenu', 2, 3),
('Article très intéressant', 4, 1);
