-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 15 jan. 2026 à 14:17
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

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_articles` varchar(50) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `contenu` varchar(50) DEFAULT NULL,
  `date_publication` datetime DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `auteur_id` char(36) DEFAULT NULL,
  `image_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id_articles`, `titre`, `resume`, `contenu`, `date_publication`, `statut`, `auteur_id`, `image_url`) VALUES
('a1', 'Victoire des U18', 'Un match intense remporté par les Tigres Bleus', 'Contenu complet de l’article…', '2025-02-12 21:00:00', 'publie', 'u1', NULL),
('a2', 'Nouveau Sponsor', 'Le club accueille un nouveau partenaire', 'Contenu complet de l’article…', '2025-02-10 10:00:00', 'publie', 'u2', NULL),
('a3', 'Préparation du Tournoi', 'Les équipes se préparent activement', 'Contenu complet de l’article…', NULL, 'brouillon', 'u1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `disputes`
--

CREATE TABLE `disputes` (
  `id_match` char(36) NOT NULL,
  `id_equipe` char(36) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `role` enum('domicile','exterieur') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `disputes`
--

INSERT INTO `disputes` (`id_match`, `id_equipe`, `score`, `role`) VALUES
('m1', 't1', 54, 'domicile'),
('m1', 't2', 49, 'exterieur'),
('m2', 't2', 62, 'domicile'),
('m2', 't3', 58, 'exterieur');

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `id` char(36) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `debut` varchar(255) NOT NULL,
  `fin` varchar(255) NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `team_id` char(36) DEFAULT NULL,
  `public` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenements`
--

INSERT INTO `evenements` (`id`, `titre`, `description`, `debut`, `fin`, `lieu`, `team_id`, `public`) VALUES
('ev1', 'Entraînement U18', 'Séance technique axée sur les passes', '2025-02-15 18:00:00', '2025-02-15 20:00:00', 'Gymnase A', 't1', '1'),
('ev2', 'Réunion Staff', 'Préparation du tournoi régional', '2025-02-18 19:00:00', '2025-02-18 20:00:00', 'Salle de réunion', 't2', '0'),
('ev3', 'Match Amical', 'Rencontre amicale contre club voisin', '2025-02-20 17:00:00', '2025-02-20 19:00:00', 'Gymnase B', 't3', '1');

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

CREATE TABLE `inscriptions` (
  `id` char(36) NOT NULL,
  `nom_joueur` text DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `preference_equipe` text DEFAULT NULL,
  `email_contact` varchar(255) NOT NULL,
  `telephone_contact` text DEFAULT NULL,
  `statut` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT INTO `inscriptions` (`id`, `nom_joueur`, `date_naissance`, `preference_equipe`, `email_contact`, `telephone_contact`, `statut`) VALUES
('i1', 'Thomas Leroy', '2010-05-12', 'U15', 'parent1@mail.com', '0600000010', 'en_attente'),
('i2', 'Emma Dubois', '2012-09-03', 'U13', 'parent2@mail.com', '0600000020', 'accepte'),
('i3', 'Lucas Martin', '2011-11-22', 'U15', 'parent3@mail.com', '0600000030', 'refuse');

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE `joueurs` (
  `id` char(36) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `poste` text DEFAULT NULL,
  `annee_naissance` int(11) DEFAULT NULL,
  `equipe_id` char(36) DEFAULT NULL,
  `utilisateur_id` char(36) DEFAULT NULL,
  `url_photo` text DEFAULT NULL,
  `biographie` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `nom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `numero`, `poste`, `annee_naissance`, `equipe_id`, `utilisateur_id`, `url_photo`, `biographie`, `prenom`, `nom`) VALUES
('j1', 10, 'Ailier', 2007, 't1', 'u3', NULL, NULL, NULL, NULL),
('j2', 7, 'Pivot', 2006, 't2', 'u4', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

CREATE TABLE `matchs` (
  `id` char(36) NOT NULL,
  `equipe_domicile_id` char(36) DEFAULT NULL,
  `equipe_exterieure_id` char(36) DEFAULT NULL,
  `date_match` char(36) DEFAULT NULL,
  `lieu` varchar(255) NOT NULL,
  `score_local` text DEFAULT NULL,
  `score_visiteur` text DEFAULT NULL,
  `statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matchs`
--

INSERT INTO `matchs` (`id`, `equipe_domicile_id`, `equipe_exterieure_id`, `date_match`, `lieu`, `score_local`, `score_visiteur`, `statut`) VALUES
('m1', NULL, NULL, '2025-02-10 18:00:00', 'Gymnase A', NULL, NULL, ''),
('m2', NULL, NULL, '2025-02-12 20:30:00', 'Gymnase B', NULL, NULL, ''),
('m3', NULL, NULL, '2025-02-10 18:00:00', 'Gymnase A', NULL, NULL, 'programme'),
('m4', NULL, NULL, '2025-02-12 20:30:00', 'Gymnase B', NULL, NULL, 'programme');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` char(36) NOT NULL,
  `url` text NOT NULL,
  `type` text DEFAULT NULL CHECK (`type` in ('image','video')),
  `texte_alternatif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `url`, `type`, `texte_alternatif`) VALUES
('m1', 'https://example.com/logo_tigres.png', 'image', 'Logo des Tigres Bleus'),
('m2', 'https://example.com/photo_match.jpg', 'image', 'Photo du match U18'),
('m3', 'https://example.com/video_resume.mp4', 'video', 'Résumé du match');

-- --------------------------------------------------------

--
-- Structure de la table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` char(36) NOT NULL,
  `nom` text DEFAULT NULL,
  `site_web` text DEFAULT NULL,
  `logo_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sponsors`
--

INSERT INTO `sponsors` (`id`, `nom`, `site_web`, `logo_id`) VALUES
('s1', 'SportPlus', 'https://sportplus.com', 'm1'),
('s2', 'EnergieMax', 'https://energimax.fr', NULL),
('s3', 'BasketShop', 'https://basketshop.fr', 'm2');

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

CREATE TABLE `teams` (
  `id` char(36) NOT NULL,
  `nom` text DEFAULT NULL,
  `categorie` text DEFAULT NULL,
  `entraineur_id` char(36) DEFAULT NULL,
  `genre` text DEFAULT NULL CHECK (`genre` in ('masculin','féminin','mixte')),
  `creneaux_entrainement` text DEFAULT NULL,
  `coach_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teams`
--

INSERT INTO `teams` (`id`, `nom`, `categorie`, `entraineur_id`, `genre`, `creneaux_entrainement`, `coach_id`) VALUES
('t1', 'Tigres Bleus', 'U18', 'u1', NULL, NULL, NULL),
('t2', 'Panthères Noires', 'Senior', 'u2', NULL, NULL, NULL),
('t3', 'Lynx Jaunes', 'U15', 'u1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` char(36) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mot_de_passe` char(36) DEFAULT NULL,
  `role` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `nom` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `actif` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `mail`, `mot_de_passe`, `role`, `prenom`, `nom`, `telephone`, `actif`) VALUES
('u1', 'coach1@mail.com', 'pass', 'coach', 'Marc', 'Durand', '0600000001', NULL),
('u2', 'coach2@mail.com', 'pass', 'coach', 'Julie', 'Martin', '0600000002', NULL),
('u3', 'player1@mail.com', 'pass', 'joueur', 'Leo', 'Bernard', '0600000003', NULL),
('u4', 'player2@mail.com', 'pass', 'joueur', 'Nina', 'Petit', '0600000004', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_articles`),
  ADD KEY `author_id` (`auteur_id`);

--
-- Index pour la table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id_match`,`id_equipe`),
  ADD KEY `id_equipe` (`id_equipe`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Index pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`equipe_id`),
  ADD KEY `user_id` (`utilisateur_id`);

--
-- Index pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_team_id` (`equipe_domicile_id`),
  ADD KEY `away_team_id` (`equipe_exterieure_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logo_id` (`logo_id`);

--
-- Index pour la table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coach_id` (`entraineur_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`mail`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `matchs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disputes_ibfk_2` FOREIGN KEY (`id_equipe`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD CONSTRAINT `evenements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

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
