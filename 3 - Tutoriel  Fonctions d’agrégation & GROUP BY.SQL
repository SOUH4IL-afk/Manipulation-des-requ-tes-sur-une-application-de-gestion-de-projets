-- COUNT(*) كتحسب عدد الصفوف فجدول Article
SELECT COUNT(*) AS total_articles
FROM Article;
-- MAX(date_pub) كترجع آخر (أكبر) تاريخ
SELECT MAX(date_pub) AS derniere_publication
FROM Article;
-- GROUP BY id_utilisateur : تجميع المقالات حسب المستخدم
SELECT id_utilisateur, COUNT(*) AS nb_articles
FROM Article
GROUP BY id_utilisateur;
-- HAVING كتفلتر النتائج بعد التجميع
-- هنا كنجيبو غير المستخدمين اللي عندهم 3 مقالات أو أكثر
SELECT id_utilisateur, COUNT(*) AS nb_articles
FROM Article
GROUP BY id_utilisateur
HAVING COUNT(*) >= 3;
-- AVG(nb_vues) كتحسب المعدل
-- خاص يكون العمود nb_vues موجود
SELECT AVG(nb_vues) AS moyenne_vues
FROM Article;
-- WHERE كتصفّي المقالات قبل التجميع
-- HAVING كتصفّي النتائج بعد التجميع
SELECT id_utilisateur, COUNT(*) AS nb_articles
FROM Article
WHERE date_pub >= '2024-01-01'
GROUP BY id_utilisateur
HAVING COUNT(*) > 1;
