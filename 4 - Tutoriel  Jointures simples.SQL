-- ربط جدول Article بجدول Utilisateur
-- ON كتحدد شرط الربط بين الجدولين
SELECT a.titre, a.date_pub, u.nom
FROM Article a
INNER JOIN Utilisateur u
ON a.id_utilisateur = u.id;
-- عرض مقالات المستخدم اللي سميتو Alice
SELECT a.titre, u.nom
FROM Article a
INNER JOIN Utilisateur u
ON a.id_utilisateur = u.id
WHERE u.nom = 'Alice';
-- عرض جميع المقالات
-- حتى إلا ما كانش عندهم مستخدم مرتبط
SELECT a.titre, u.nom
FROM Article a
LEFT JOIN Utilisateur u
ON a.id_utilisateur = u.id;
-- ربط Article مع Utilisateur ومع Commentaire
SELECT a.titre, u.nom, c.contenu
FROM Article a
INNER JOIN Utilisateur u
ON a.id_utilisateur = u.id
INNER JOIN Commentaire c
ON a.id = c.id_article;



-- a = Article
-- u = Utilisateur
-- c = Commentaire
