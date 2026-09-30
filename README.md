# 🌐Mettre en place une solution informatique pour l’entreprise  — SAÉ 203

Ce projet a été réalisé dans le cadre de la SAÉ 203 (Mettre en place une solution informatique pour l'entreprise). Il consiste à déployer de manière entièrement conteneurisée, automatisée et sécurisée une infrastructure web d'entreprise comprenant un site vitrine/portfolio, un CMS WordPress intégrant des fonctionnalités applicatives avancées connectées à une base MariaDB, ainsi qu'un conteneur d'étude en cybersécurité.

## 🏗️ Architecture Technique (Conteneurs Docker)

L'ensemble des services est isolé au sein d'un réseau virtuel Docker nommé `rsxsae23` et s'exécute sur les composants suivants :

- **sitewordpress (Port 80)** : Serveur d'application WordPress gérant le site principal, le catalogue de devis standard et le formulaire de contact sur-mesure.

- **portfolio (Port 82)** : Image personnalisée construite à partir d'un Dockerfile contenant mon portfolio d'activité et mes réalisations de BUT.

- **mariabase (Port 3306)** : Système de Gestion de Base de Données (SGBD) MariaDB où sont stockées de façon persistante les tables WordPress ainsi que nos tables métiers (`wp_commandes` et `wp_contact`).

- **phpmyadminbase (Port 9000)** : Interface web d'administration de la base de données.

- **kaliDos (Conteneur d'Audit / Sécurité)** : Environnement basé sur Kali Linux configuré pour l'étude des vulnérabilités aux attaques par Déni de Service (DoS).

---

## 📂 Structure du Répertoire Projet

- `sae203/portefolio/` : Codes sources du site vitrine et son Dockerfile personnalisé.

- `sae203/badowordpress/` : Volume de persistance pour les fichiers de la base MariaDB.

- `sae203/htmlwordpress/` : Volume de persistance pour le code source et les médias WordPress.

- `sae203/kaliDos/` : Environnement d'étude lié aux problématiques de cybersécurité (DoS).

- `sae203/scriptps1.sh` : Script d'automatisation du déploiement général Shell.

---

## 🚀 Guide de Déploiement Automatique

### Prérequis

L'hôte de destination doit disposer d'un environnement Linux exécutant le moteur Docker.

### Procédure d'instanciation

Pour déployer toute l'infrastructure (téléchargement des images officielles, build du portfolio, création du réseau virtuel, montage des volumes et configurations des permissions), exécutez les commandes suivantes dans le terminal :

```bash
cd ~/projet_wordpress/
chmod +x scriptps1.sh
./scriptps1.sh
