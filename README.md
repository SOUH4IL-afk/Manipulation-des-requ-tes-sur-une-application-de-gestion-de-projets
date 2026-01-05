# Manipulation-des-requ-tes-sur-une-application-de-gestion-de-projets
# SQL Tutorial – Résumé Complet

## 🎯 Objectif pédagogique
Apprendre les bases de SQL pour :
- Sélectionner, filtrer et trier des données
- Grouper et analyser les données
- Relier plusieurs tables
- Insérer, modifier et supprimer des enregistrements
- Écrire des requêtes sécurisées et optimisées

---

## 📚 Chapitres

### 1️⃣ SELECT, WHERE, ORDER BY
- **SELECT** : récupérer des colonnes ou toutes les données (`*`)
- **WHERE** : filtrer selon des conditions
- **ORDER BY** : trier les résultats (`ASC` ou `DESC`)
- **LIMIT** : limiter le nombre de résultats

**Exemple :**
```sql
SELECT titre, date_pub
FROM Article
WHERE id_utilisateur = 1
ORDER BY date_pub DESC
LIMIT 5;
2️⃣ Fonctions d’agrégation & GROUP BY

COUNT(), SUM(), AVG(), MIN(), MAX()

GROUP BY : regrouper selon une colonne

HAVING : filtrer après agrégation

Exemple :

-- Nombre d'articles par utilisateur (au moins 3)
SELECT id_utilisateur, COUNT(*) AS nb_articles
FROM Article
GROUP BY id_utilisateur
HAVING COUNT(*) >= 3;

3️⃣ Jointures simples (JOIN)

INNER JOIN : retourne uniquement les correspondances

LEFT JOIN / RIGHT JOIN : conserve toutes les lignes d’une table

Alias : simplifier les requêtes (a, u, c)

Exemple :

-- Afficher les articles avec le nom de l’auteur
SELECT a.titre, u.nom
FROM Article a
INNER JOIN Utilisateur u
ON a.id_utilisateur = u.id;

4️⃣ INSERT INTO

Ajouter de nouvelles lignes

Insertion complète ou partielle

Insertion multiple possible

AUTO_INCREMENT génère les IDs automatiquement

Exemple :

-- Ajouter un utilisateur
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES ('Alice', 'alice@test.com', '1234');

-- Ajouter plusieurs utilisateurs en même temps
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
  ('Bob', 'bob@test.com', 'passbob'),
  ('Charlie', 'charlie@test.com', 'passcharlie');

5️⃣ UPDATE & DELETE

UPDATE : modifier une ou plusieurs colonnes

DELETE : supprimer des lignes

WHERE obligatoire pour éviter les erreurs

Exemple :

-- Modifier l’email d’un utilisateur
UPDATE Utilisateur
SET email = 'alice.dupont@test.com'
WHERE id = 1;

-- Supprimer les articles publiés avant 2024
DELETE FROM Article
WHERE date_pub < '2024-01-01';

6️⃣ Bonnes pratiques + requêtes combinées

Transactions : START TRANSACTION, COMMIT, ROLLBACK

Sécurité : éviter les commandes destructives sans filtre

Commentaires : -- ou /* */

Combiner INSERT, UPDATE, DELETE dans un script sécurisé

Exemple :

-- Script pour gérer les données du blog
START TRANSACTION;

-- Ajouter un article
INSERT INTO Article (titre, contenu, date_pub, id_utilisateur)
VALUES ('Nouveau post', 'Texte exemple', '2025-07-18', 1);

-- Mettre à jour un utilisateur
UPDATE Utilisateur
SET email = 'alice.update@test.com'
WHERE id = 1;

-- Supprimer un commentaire
DELETE FROM Commentaire
WHERE id = 3;

COMMIT;
