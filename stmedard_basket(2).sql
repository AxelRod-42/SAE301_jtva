-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 jan. 2026 à 17:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `stmedard_basket`
--
CREATE DATABASE IF NOT EXISTS `stmedard_basket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stmedard_basket`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id_articles` varchar(50) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `contenu` varchar(50) DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `auteur_id` char(36) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  PRIMARY KEY (`id_articles`),
  KEY `author_id` (`auteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT DELAYED IGNORE INTO `articles` (`id_articles`, `titre`, `resume`, `contenu`, `date_publication`, `statut`, `auteur_id`, `image_url`) VALUES
('a1', 'Victoire des U18', 'Un match intense remporté par les Tigres Bleus', 'Contenu complet de l’article…', '2025-02-12 21:00:00', 'publie', 'u1', NULL),
('a2', 'Nouveau Sponsor', 'Le club accueille un nouveau partenaire', 'Contenu complet de l’article…', '2025-02-10 10:00:00', 'publie', 'u2', NULL),
('a3', 'Préparation du Tournoi', 'Les équipes se préparent activement', 'Contenu complet de l’article…', '2025-02-08 14:00:00', 'publie', 'u1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `disputes`
--

DROP TABLE IF EXISTS `disputes`;
CREATE TABLE IF NOT EXISTS `disputes` (
  `id` char(36) NOT NULL,
  `id_equipe` char(36) NOT NULL,
  `adversaire` varchar(100) NOT NULL,
  `date_match` date NOT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `resultat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

DROP TABLE IF EXISTS `evenements`;
CREATE TABLE IF NOT EXISTS `evenements` (
  `id` char(36) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `debut` varchar(255) NOT NULL,
  `fin` varchar(255) NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `team_id` char(36) DEFAULT NULL,
  `public` varchar(255) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenements`
--

INSERT DELAYED IGNORE INTO `evenements` (`id`, `titre`, `description`, `debut`, `fin`, `lieu`, `team_id`, `public`, `id_categorie`) VALUES
('ev1', 'Entraînement U18', 'Séance technique axée sur les passes', '2025-02-15 18:00:00', '2025-02-15 20:00:00', 'Gymnase A', 't1', '1', NULL),
('ev2', 'Réunion Staff', 'Préparation du tournoi régional', '2025-02-18 19:00:00', '2025-02-18 20:00:00', 'Salle de réunion', 't2', '0', NULL),
('ev3', 'Match Amical', 'Rencontre amicale contre club voisin', '2025-02-20 17:00:00', '2025-02-20 19:00:00', 'Gymnase B', 't3', '1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `id` char(36) NOT NULL,
  `nom_joueur` text DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `preference_equipe` text DEFAULT NULL,
  `email_contact` varchar(255) NOT NULL,
  `telephone_contact` text DEFAULT NULL,
  `statut` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT DELAYED IGNORE INTO `inscriptions` (`id`, `nom_joueur`, `date_naissance`, `preference_equipe`, `email_contact`, `telephone_contact`, `statut`) VALUES
('i1', 'Thomas Leroy', '2010-05-12', 'U15', 'parent1@mail.com', '0600000010', 'en_attente'),
('i2', 'Emma Dubois', '2012-09-03', 'U13', 'parent2@mail.com', '0600000020', 'accepte'),
('i3', 'Lucas Martin', '2011-11-22', 'U15', 'parent3@mail.com', '0600000030', 'refuse');

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
CREATE TABLE IF NOT EXISTS `joueurs` (
  `id` char(36) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `poste` text DEFAULT NULL,
  `annee_naissance` int(11) DEFAULT NULL,
  `equipe_id` char(36) DEFAULT NULL,
  `utilisateur_id` char(36) DEFAULT NULL,
  `url_photo` text DEFAULT NULL,
  `biographie` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `nom` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`equipe_id`),
  KEY `user_id` (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `joueurs`
--

INSERT DELAYED IGNORE INTO `joueurs` (`id`, `numero`, `poste`, `annee_naissance`, `equipe_id`, `utilisateur_id`, `url_photo`, `biographie`, `prenom`, `nom`) VALUES
('0ec2463e-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5817aec-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'U9'),
('0ec25eae-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5817aec-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'U9'),
('0eca7ff4-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b596-f2d0-11f0-8a12-cc5ef8477c38', 'u3', NULL, NULL, 'Joueur1', 'U11_1'),
('0eca9a1e-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b596-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'U11_1'),
('0ecea35b-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b7f3-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'U11_2'),
('0ecebeb0-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b7f3-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'U11_2'),
('0ed26bfb-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b8df-f2d0-11f0-8a12-cc5ef8477c38', 'u4', NULL, NULL, 'Joueur1', 'U13F'),
('0ed282df-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b8df-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'U13F'),
('0ed6468d-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b9cc-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'U13M'),
('0ed661e6-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582b9cc-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'U13M'),
('0eda4591-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582ba8c-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', '15F'),
('0eda6ae5-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582ba8c-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', '15F'),
('0edde64d-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582bb87-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', '15M'),
('0ede012a-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582bb87-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', '15M'),
('0ee1a429-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582bc2d-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'U18F'),
('0ee1c014-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e582bc2d-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'U18F'),
('0ee586d8-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832971-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', '18M1'),
('0ee5a37b-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832971-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', '18M1'),
('0ee92c46-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832acb-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', '18M2'),
('0ee946ff-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832acb-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', '18M2'),
('0eed212c-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832bbe-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'SeniorsF'),
('0eed403b-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832bbe-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'SeniorsF'),
('0ef1582a-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832c79-f2d0-11f0-8a12-cc5ef8477c38', 'u5', NULL, NULL, 'Joueur1', 'SeniorsM'),
('0ef17772-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832c79-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'SeniorsM'),
('0ef51930-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832cfa-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'LoisirsF'),
('0ef53725-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832cfa-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'LoisirsF'),
('0ef8ad01-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832dba-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur1', 'LoisirsM'),
('0ef8cc20-f2d5-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'e5832dba-f2d0-11f0-8a12-cc5ef8477c38', NULL, NULL, NULL, 'Joueur2', 'LoisirsM');

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

DROP TABLE IF EXISTS `matchs`;
CREATE TABLE IF NOT EXISTS `matchs` (
  `id` char(36) NOT NULL,
  `equipe_domicile_id` char(36) DEFAULT NULL,
  `equipe_exterieure_id` char(36) DEFAULT NULL,
  `date_match` char(36) DEFAULT NULL,
  `lieu` varchar(255) NOT NULL,
  `score_local` text DEFAULT NULL,
  `score_visiteur` text DEFAULT NULL,
  `statut` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_team_id` (`equipe_domicile_id`),
  KEY `away_team_id` (`equipe_exterieure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matchs`
--

INSERT DELAYED IGNORE INTO `matchs` (`id`, `equipe_domicile_id`, `equipe_exterieure_id`, `date_match`, `lieu`, `score_local`, `score_visiteur`, `statut`) VALUES
('m1', NULL, NULL, '2025-02-10 18:00:00', 'Gymnase A', NULL, NULL, ''),
('m2', NULL, NULL, '2025-02-12 20:30:00', 'Gymnase B', NULL, NULL, ''),
('m3', NULL, NULL, '2025-02-10 18:00:00', 'Gymnase A', NULL, NULL, 'programme'),
('m4', NULL, NULL, '2025-02-12 20:30:00', 'Gymnase B', NULL, NULL, 'programme');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` char(36) NOT NULL,
  `url` text NOT NULL,
  `type` text DEFAULT NULL CHECK (`type` in ('image','video')),
  `texte_alternatif` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `media`
--

INSERT DELAYED IGNORE INTO `media` (`id`, `url`, `type`, `texte_alternatif`) VALUES
('m1', 'https://example.com/logo_tigres.png', 'image', 'Logo des Tigres Bleus'),
('m2', 'https://example.com/photo_match.jpg', 'image', 'Photo du match U18'),
('m3', 'https://example.com/video_resume.mp4', 'video', 'Résumé du match');

-- --------------------------------------------------------

--
-- Structure de la table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` char(36) NOT NULL,
  `nom` text DEFAULT NULL,
  `site_web` text DEFAULT NULL,
  `logo_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logo_id` (`logo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sponsors`
--

INSERT DELAYED IGNORE INTO `sponsors` (`id`, `nom`, `site_web`, `logo_id`) VALUES
('s1', 'SportPlus', 'https://sportplus.com', 'm1'),
('s2', 'EnergieMax', 'https://energimax.fr', NULL),
('s3', 'BasketShop', 'https://basketshop.fr', 'm2');

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` char(36) NOT NULL,
  `categorie` text DEFAULT NULL,
  `entraineur_id` char(36) DEFAULT NULL,
  `genre` text DEFAULT NULL CHECK (`genre` in ('masculin','féminin','mixte')),
  `creneaux_entrainement` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coach_id` (`entraineur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teams`
--

INSERT DELAYED IGNORE INTO `teams` (`id`, `categorie`, `entraineur_id`, `genre`, `creneaux_entrainement`) VALUES
('e5817aec-f2d0-11f0-8a12-cc5ef8477c38', 'U9', 'u1', NULL, NULL),
('e582b596-f2d0-11f0-8a12-cc5ef8477c38', 'U11_1', 'u2', NULL, NULL),
('e582b7f3-f2d0-11f0-8a12-cc5ef8477c38', 'U11_2', 'u1', NULL, NULL),
('e582b8df-f2d0-11f0-8a12-cc5ef8477c38', 'U13F', NULL, 'féminin', NULL),
('e582b9cc-f2d0-11f0-8a12-cc5ef8477c38', 'U13M', NULL, 'masculin', NULL),
('e582ba8c-f2d0-11f0-8a12-cc5ef8477c38', '15F', NULL, 'féminin', NULL),
('e582bb87-f2d0-11f0-8a12-cc5ef8477c38', '15M', NULL, 'masculin', NULL),
('e582bc2d-f2d0-11f0-8a12-cc5ef8477c38', 'U18F', NULL, 'féminin', NULL),
('e5832971-f2d0-11f0-8a12-cc5ef8477c38', '18M1', NULL, 'masculin', NULL),
('e5832acb-f2d0-11f0-8a12-cc5ef8477c38', '18M2', NULL, 'masculin', NULL),
('e5832bbe-f2d0-11f0-8a12-cc5ef8477c38', 'SeniorsF', NULL, 'féminin', NULL),
('e5832c79-f2d0-11f0-8a12-cc5ef8477c38', 'SeniorsM', NULL, 'masculin', NULL),
('e5832cfa-f2d0-11f0-8a12-cc5ef8477c38', 'LoisirsF', NULL, 'féminin', NULL),
('e5832dba-f2d0-11f0-8a12-cc5ef8477c38', 'LoisirsM', NULL, 'masculin', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` char(36) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mot_de_passe` char(36) DEFAULT NULL,
  `role` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `nom` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT DELAYED IGNORE INTO `utilisateurs` (`id`, `mail`, `mot_de_passe`, `role`, `prenom`, `nom`, `telephone`, `actif`) VALUES
('admin1', 'admin@mail.com', 'pass', 'admin', 'Sophie', 'Leroy', '0600000000', 1),
('p1', 'parent@mail.com', 'pass', 'parent', 'Claire', 'Moreau', '0600000006', 1),
('u1', 'coach1@mail.com', 'pass', 'coach', 'Marc', 'Durand', '0600000001', NULL),
('u2', 'coach2@mail.com', 'pass', 'coach', 'Julie', 'Martin', '0600000002', NULL),
('u3', 'player1@mail.com', 'pass', 'joueur', 'Leo', 'Bernard', '0600000003', NULL),
('u4', 'player2@mail.com', 'pass', 'joueur', 'Nina', 'Petit', '0600000004', NULL),
('u5', 'joueur.test@mail.com', 'pass', 'joueur', 'Thomas', 'Roche', '0600000005', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD CONSTRAINT `joueurs_ibfk_1` FOREIGN KEY (`equipe_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `joueurs_ibfk_2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `matchs_ibfk_1` FOREIGN KEY (`equipe_domicile_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `matchs_ibfk_2` FOREIGN KEY (`equipe_exterieure_id`) REFERENCES `teams` (`id`);

--
-- Contraintes pour la table `sponsors`
--
ALTER TABLE `sponsors`
  ADD CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`logo_id`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`entraineur_id`) REFERENCES `utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
