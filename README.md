## 🎯 À propos

**FitLife Tracker** est une application mobile Flutter complète permettant de suivre votre nutrition et votre hydratation au quotidien. L'application offre une expérience utilisateur moderne avec des animations fluides, un design dark élégant et des fonctionnalités avancées comme le scan de code-barres et l'analyse nutritionnelle.

### 🌟 Points forts

- ✨ Interface moderne avec thème sombre
- 📊 Statistiques détaillées avec graphiques interactifs
- 📱 Scanner de code-barres intégré
- 💧 Suivi d'hydratation avec bouteille animée
- 🍽️ Bibliothèque de recettes healthy
- 💾 Stockage local avec SQLite
- 🔄 Synchronisation en temps réel

---

## 🚀 Fonctionnalités

### 📱 Module Nutrition

#### 1. Gestion des repas
- ✅ **Ajout manuel** : Créez des repas personnalisés avec photo (galerie/caméra)
- ✅ **Catégories** : Petit-déjeuner, Déjeuner, Dîner, Collation
- ✅ **Suivi quotidien** : Visualisation des calories par catégorie
- ✅ **Historique** : Consultation des repas passés
- ✅ **Édition/Suppression** : Gestion complète de vos entrées

#### 2. Scanner de code-barres 📷
- 🔍 **Scan en temps réel** avec détection automatique
- 🌍 **Base de données** : Open Food Facts (2M+ produits)
- 📊 **Informations nutritionnelles** complètes
- 🎨 **Nutri-Score** : Évaluation de la qualité nutritionnelle (A-E)
- 📝 **Saisie manuelle** : Option de saisie du code-barres
- 📜 **Historique** : Accès rapide aux produits scannés
- ⚖️ **Ajustement portions** : Calcul automatique selon la quantité

#### 3. Recettes Healthy 🥗
- 📚 **Bibliothèque** : 8 recettes saines pré-configurées
- 🔎 **Recherche** : Filtrage par catégorie et mots-clés
- 📖 **Détails complets** : Ingrédients, étapes, valeurs nutritionnelles
- ❤️ **Favoris** : Sauvegarde de vos recettes préférées
- ➕ **Ajout direct** : Intégration au journal nutritionnel
- 🏷️ **Tags** : Végétarien, vegan, sans gluten, etc.

#### 4. Statistiques nutritionnelles 📊
- 📈 **Graphiques dynamiques** : Jour, semaine, mois
- 🥧 **Répartition** : Graphique circulaire par catégorie
- 📉 **Évolution** : Graphique en barres temporel
- 📐 **Métriques** : Moyenne, total, maximum
- 🎯 **Objectifs** : Suivi de vos objectifs caloriques

### 💧 Module Hydratation

#### Fonctionnalités principales
- 🍼 **Bouteille animée** : Visualisation avec effet de vagues
- ⚡ **Ajout rapide** : Boutons 100ml, 200ml, 250ml, 500ml
- ✏️ **Quantité personnalisée** : Saisie libre
- 🎯 **Objectifs** : Personnalisables (1500-3000ml)
- 📊 **Graphique hebdomadaire** : Suivi sur 7 jours
- 📈 **Statistiques** : Moyenne, maximum, jours réussis
- 🔔 **Rappels** : Notifications intelligentes (à venir)
- 💾 **Historique** : Consultation détaillée

---

## 🛠️ Technologies utilisées

### Framework & Language
- **Flutter** `^3.9.2` - Framework de développement mobile
- **Dart** `^3.9.2` - Langage de programmation

### Base de données
- **SQLite** `^2.3.3` - Base de données locale
- **sqflite** - Plugin Flutter pour SQLite
- **path** `^1.8.3` - Gestion des chemins de fichiers

### APIs & Services
- **http** `^1.1.0` - Requêtes HTTP
- **Open Food Facts API** - Base de données produits alimentaires

### UI & Graphiques
- **fl_chart** `^0.68.0` - Graphiques interactifs
- **device_preview** `^1.1.0` - Preview multi-appareils

### Fonctionnalités
- **mobile_scanner** `^5.2.3` - Scanner de code-barres
- **image_picker** `^1.0.0` - Sélection d'images
- **shared_preferences** `^2.2.2` - Stockage clé-valeur
- **uuid** `^4.0.0` - Génération d'identifiants uniques

### Development
- **build_runner** `^2.4.6` - Génération de code
- **flutter_lints** `^5.0.0` - Linting et analyse de code

---

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- **Flutter SDK** : Version 3.9.2 ou supérieure
  ```bash
  flutter --version
  ```

- **Dart SDK** : Version 3.9.2 ou supérieure

- **Android Studio** / **Xcode** (pour iOS)

- **Un émulateur** ou **un appareil physique** pour tester

---

## 💻 Installation

### 1. Cloner le repository

```bash
git clone https://github.com/votre-username/fitlife-tracker.git
cd fitlife-tracker
```

### 2. Installer les dépendances

```bash
flutter pub get
```

### 3. Configuration Android

Ajoutez les permissions dans `android/app/src/main/AndroidManifest.xml` :

```xml

    
    
    
    
        ...
    

```

### 4. Configuration iOS

Ajoutez dans `ios/Runner/Info.plist` :

```xml
NSCameraUsageDescription
Nous avons besoin d'accéder à votre caméra pour scanner les codes-barres
NSPhotoLibraryUsageDescription
Nous avons besoin d'accéder à vos photos pour ajouter des images de repas
```

### 5. Lancer l'application

```bash
# Mode debug
flutter run

# Mode release
flutter run --release
```

---

## 📁 Structure du projet

```
lib/
├── main.dart                          # Point d'entrée de l'application
├── pages/
│   ├── user/
│   │   └── dashboard_page.dart        # Tableau de bord
│   ├── workout/
│   │   └── workouts_page.dart         # Entraînements
│   ├── nutrition/
│   │   ├── nutrition_page.dart        # Page principale nutrition
│   │   ├── add_meal_page.dart         # Ajout manuel de repas
│   │   ├── meal_model.dart            # Modèle de données repas
│   │   ├── meal_service.dart          # Service SQLite repas
│   │   ├── nutrition_stats_page.dart  # Statistiques nutrition
│   │   ├── healthy_meals_page.dart    # Recettes healthy
│   │   ├── healthy_meal_model.dart    # Modèle recettes
│   │   ├── healthy_meals_service.dart # Service recettes
│   │   ├── meal_detail_page.dart      # Détails recette
│   │   ├── barcode_scanner_page.dart  # Scanner code-barres
│   │   ├── scanned_product_model.dart # Modèle produit scanné
│   │   ├── barcode_scanner_service.dart # Service scanner
│   │   ├── product_detail_page.dart   # Détails produit scanné
│   │   ├── water_tracker_page.dart    # Tracker hydratation
│   │   ├── water_intake_model.dart    # Modèle hydratation
│   │   ├── water_service.dart         # Service SQLite hydratation
│   │   ├── water_bottle_widget.dart   # Widget bouteille animée
│   │   ├── water_history_page.dart    # Historique hydratation
│   │   └── water_settings_page.dart   # Paramètres hydratation
│   ├── program/
│   │   └── programs_page.dart         # Programmes
│   ├── mental health/
│   │   └── mental_health_page.dart    # Santé mentale
│   └── supplements/
│       └── supplements_page.dart      # Suppléments
└── widgets/
    └── meal_card.dart                 # Widget carte repas

android/                               # Configuration Android
ios/                                   # Configuration iOS
assets/                                # Ressources (images, etc.)
```

---
