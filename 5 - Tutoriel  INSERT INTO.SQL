-- إدخال مستخدم مع تحديد الأعمدة
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES ('Alice', 'alice@test.com', '1234');
-- إدخال مقال مرتبط بمستخدم عبر id_utilisateur
INSERT INTO Article (titre, contenu, date_pub, id_utilisateur)
VALUES ('Bienvenue sur le blog', 'Ceci est le premier article.', '2025-07-18', 1);
-- Insertion multiple في استعلام واحد
INSERT INTO Utilisateur (nom, email, mot_de_passe)
VALUES 
  ('Bob', 'bob@test.com', 'passbob'),
  ('Charlie', 'charlie@test.com', 'passcharlie');
-- عرض جميع المستخدمين
SELECT * FROM Utilisateur;

-- عرض جميع المقالات
SELECT * FROM Article;
    