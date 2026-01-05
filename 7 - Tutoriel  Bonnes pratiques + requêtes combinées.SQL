START TRANSACTION;
-- إضافة مقال جديد
INSERT INTO Article (titre, contenu, date_pub, id_utilisateur)
VALUES ('Nouveau post', 'Texte exemple', '2025-07-18', 1);

-- تحديث بريد المستخدم
UPDATE Utilisateur
SET email = 'alice.update@test.com'
WHERE id = 1;

-- حذف تعليق محدد
DELETE FROM Commentaire
WHERE id = 3;
-- تأكيد جميع العمليات
COMMIT;

-- أو في حالة الخطأ
-- ROLLBACK;

-- التأكد من إضافة المقال
SELECT * FROM Article;
