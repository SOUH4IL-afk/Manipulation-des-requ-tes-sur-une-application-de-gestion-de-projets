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
