SELECT *
FROM Article;
-- اختيار عنوان المقال والمحتوى فقط
SELECT titre, contenu
FROM Article;
-- عرض المقالات المنشورة ابتداءً من 1 يناير 2024
SELECT titre, date_pub
FROM Article
WHERE date_pub >= '2024-01-01';
-- عرض المقالات الخاصة بالمستخدم الذي ID ديالو = 1
SELECT titre, date_pub
FROM Article
WHERE id_utilisateur = 1;
-- ORDER BY DESC : ترتيب تنازلي (الأحدث → الأقدم)
SELECT titre, date_pub
FROM Article
ORDER BY date_pub DESC;
-- ORDER BY ASC : ترتيب تصاعدي (A → Z)
SELECT titre
FROM Article
ORDER BY titre ASC;
-- عرض آخر 5 مقالات فقط
SELECT titre, date_pub
FROM Article
ORDER BY date_pub DESC
LIMIT 5;
-- عرض آخر 3 مقالات للمستخدم رقم 1
SELECT titre, date_pub
FROM Article
WHERE id_utilisateur = 1
ORDER BY date_pub DESC
LIMIT 3;
-- البحث عن المقالات اللي فيها كلمة "SQL" فالعنوان
SELECT titre
FROM Article
WHERE titre LIKE '%SQL%';
