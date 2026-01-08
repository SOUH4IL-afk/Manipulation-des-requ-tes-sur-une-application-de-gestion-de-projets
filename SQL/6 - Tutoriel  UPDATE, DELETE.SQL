-- تعديل اسم وبريد مستخدم محدد
UPDATE Utilisateur
SET nom = 'Alice Dupont',
    email = 'alice.dupont@test.com'
WHERE id = 1;
-- تعديل عناوين جميع مقالات المستخدم رقم 1
UPDATE Article
SET titre = 'Article mis à jour'
WHERE id_utilisateur = 1;
-- حذف تعليق معيّن
DELETE FROM Commentaire
WHERE id = 2;
-- حذف المقالات القديمة (قبل 2024)
DELETE FROM Article
WHERE date_pub < '2024-01-01'
LIMIT 100;

-- التأكد من التعديلات
SELECT * FROM Utilisateur;

-- التأكد من الحذف
SELECT * FROM Article;
