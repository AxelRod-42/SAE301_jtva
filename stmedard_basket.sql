-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 jan. 2026 à 17:26
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
('1', 'Victoire des U18', 'Un match intense remporté par les Tigres Bleus', 'Contenu complet de l’article…', '2025-02-12 21:00:00', 'publie', 'u1', 'articles/arbitrage1.jpg'),
('2', 'Nouveau Sponsor', 'Le club accueille un nouveau partenaire', 'Contenu complet de l’article…', '2025-02-10 10:00:00', 'publie', 'u2', 'articles/U18Fqualif.jpg'),
('3', 'Préparation du Tournoi', 'Les équipes se préparent activement', 'Contenu complet de l’article…', '2025-02-08 14:00:00', 'publie', 'u1', 'articles/image_club.jpg'),
('4', 'Retour sur le Stage d’Hiver', 'Une semaine d’entraînement intensif pour préparer la seconde partie de saison', 'Le club a organisé un stage d’hiver regroupant plu', '2025-02-06 09:00:00', 'publie', 'u2', 'articles/stage_hiver.jpg'),
('5', 'Résultats du Week-End', 'Un week-end riche en émotions pour toutes les catégories', 'Les différentes équipes du club étaient engagées e', '2025-02-05 18:30:00', 'publie', 'u1', 'articles/resultats_weekend.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `disputes`
--

CREATE TABLE `disputes` (
  `id` char(36) NOT NULL,
  `id_equipe` char(36) NOT NULL,
  `adversaire` varchar(100) NOT NULL,
  `date_match` date NOT NULL,
  `lieu` varchar(100) DEFAULT NULL,
  `resultat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `id` char(36) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `url_image` varchar(255) DEFAULT NULL,
  `debut` varchar(255) NOT NULL,
  `fin` varchar(255) NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `team_id` char(36) DEFAULT NULL,
  `public` varchar(255) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenements`
--

INSERT INTO `evenements` (`id`, `titre`, `description`, `url_image`, `debut`, `fin`, `lieu`, `team_id`, `public`, `id_categorie`) VALUES
('', 'Planning 1', NULL, 'calendrier/basket1.jpg', '', '', '', NULL, '', NULL),
('1', 'Soirée Tartiflette\r\n', 'Soirée de réunion entre amis & famille', 'evenements/fete_31_janvier.jpg', '2025-02-15 18:00:00', '2025-02-15 20:00:00', 'Gymnase A', 't1', '1', NULL),
('2', 'Réunion Staff', 'Préparation du tournoi régional', 'evenements/sponsor3.jpg', '2025-02-18 19:00:00', '2025-02-18 20:00:00', 'Salle de réunion', 't2', '0', NULL),
('3', 'Match Amical', 'Rencontre amicale contre club voisin', 'evenements/page-sponsor.png', '2025-02-20 17:00:00', '2025-02-20 19:00:00', 'Gymnase B', 't3', '1', NULL),
('4', 'Planning 1', NULL, 'calendrier/basket1.jpg', '', '', '', NULL, '', NULL),
('5', 'Planning 2', NULL, 'calendrier/basket2.jpg', '', '', '', NULL, '', NULL),
('6', 'Planning 3', NULL, 'calendrier/basket3.jpg', '', '', '', NULL, '', NULL),
('7', 'Planning 4', NULL, 'calendrier/basket4.jpg', '', '', '', NULL, '', NULL),
('8', 'Planning 5', NULL, 'calendrier/basket5.jpg', '', '', '', NULL, '', NULL),
('9', 'Planning 6', NULL, 'calendrier/basket6.jpg', '', '', '', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

CREATE TABLE `inscriptions` (
  `id` char(36) NOT NULL,
  `nom_joueur` text DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email_contact` varchar(255) NOT NULL,
  `telephone_contact` text DEFAULT NULL,
  `genre` enum('homme','femme','autre') NOT NULL,
  `message` text NOT NULL,
  `date_envoi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT INTO `inscriptions` (`id`, `nom_joueur`, `prenom`, `email_contact`, `telephone_contact`, `genre`, `message`, `date_envoi`) VALUES
('1a21c26b-f7af-11f0-82e5-088fc304bed2', 'Balde', 'Alejandro', 'viscabarca@hotmail.com', '0785695475', 'homme', 'Je souhaiterai acheter vos maillots', '2026-01-22 16:26:04'),
('i1', 'Leroy', 'Thomas', 'parent1@mail.com', '0600000010', 'homme', '', '2026-01-17 19:13:30'),
('i2', 'Dubois', 'Emma', 'parent2@mail.com', '0600000020', 'homme', '', '2026-01-17 19:13:30'),
('i3', 'Martin', 'Lucas', 'parent3@mail.com', '0600000030', 'homme', '', '2026-01-17 19:13:30');

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
('m1', 'gymnase/salle_de_basket_interieur.jpg', 'image', 'Logo des Tigres Bleus'),
('m2', 'gymnase/halle_de_sport.jpg', 'image', 'Photo du match U18'),
('m3', 'https://example.com/video_resume.mp4', 'video', 'Résumé du match'),
('m4', 'gymnase/salle_de_basket_interieur.jpg', 'image', 'Salle de basket intérieur'),
('m5', 'gymnase/salle_de_basket_interieur.jpg', 'image', 'Halle de sport');

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
  `categorie` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `entraineur_id` char(36) DEFAULT NULL,
  `genre` text DEFAULT NULL CHECK (`genre` in ('masculin','féminin','mixte')),
  `creneaux_entrainement` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teams`
--

INSERT INTO `teams` (`id`, `categorie`, `image`, `entraineur_id`, `genre`, `creneaux_entrainement`) VALUES
('e5817aec-f2d0-11f0-8a12-cc5ef8477c38', 'U9', 'equipes/U9.jpg', 'u1', NULL, NULL),
('e582b596-f2d0-11f0-8a12-cc5ef8477c38', 'U11_1', 'equipes/U11-1.jpg', 'u2', NULL, NULL),
('e582b7f3-f2d0-11f0-8a12-cc5ef8477c38', 'U11_2', 'equipes/U11-2.jpg', 'u1', NULL, NULL),
('e582b8df-f2d0-11f0-8a12-cc5ef8477c38', 'U13F', 'equipes/U13F.jpg', NULL, 'féminin', NULL),
('e582b9cc-f2d0-11f0-8a12-cc5ef8477c38', 'U13M', 'equipes/U13M.jpg', NULL, 'masculin', NULL),
('e582ba8c-f2d0-11f0-8a12-cc5ef8477c38', '15F', 'equipes/U15F.jpg', NULL, 'féminin', NULL),
('e582bb87-f2d0-11f0-8a12-cc5ef8477c38', '15M', 'equipes/U15M.jpg', NULL, 'masculin', NULL),
('e582bc2d-f2d0-11f0-8a12-cc5ef8477c38', 'U18F', 'equipes/U18F.jpg', NULL, 'féminin', NULL),
('e5832971-f2d0-11f0-8a12-cc5ef8477c38', '18M1', 'equipes/U18M_1.jpg', NULL, 'masculin', NULL),
('e5832acb-f2d0-11f0-8a12-cc5ef8477c38', '18M2', 'equipes/U18M_2010.jpg', NULL, 'masculin', NULL),
('e5832bbe-f2d0-11f0-8a12-cc5ef8477c38', 'SeniorsF', 'equipes/Seniors-F.jpg', NULL, 'féminin', NULL),
('e5832c79-f2d0-11f0-8a12-cc5ef8477c38', 'SeniorsM', 'equipes/Seniors-M.jpg', NULL, 'masculin', NULL),
('e5832cfa-f2d0-11f0-8a12-cc5ef8477c38', 'LoisirsF', 'equipes/Loisirs-F.jpg', NULL, 'féminin', NULL),
('e5832dba-f2d0-11f0-8a12-cc5ef8477c38', 'LoisirsM', 'equipes/Loisirs-M.jpg', NULL, 'masculin', NULL);

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
('admin1', 'admin@mail.com', 'pass', 'admin', 'Sophie', 'Leroy', '0600000000', 1),
('p1', 'parent@mail.com', 'pass', 'parent', 'Claire', 'Moreau', '0600000006', 1),
('u1', 'coach1@mail.com', 'pass', 'coach', 'Marc', 'Durand', '0600000001', NULL),
('u2', 'coach2@mail.com', 'pass', 'coach', 'Julie', 'Martin', '0600000002', NULL),
('u3', 'player1@mail.com', 'pass', 'joueur', 'Leo', 'Bernard', '0600000003', NULL),
('u4', 'player2@mail.com', 'pass', 'joueur', 'Nina', 'Petit', '0600000004', NULL),
('u5', 'joueur.test@mail.com', 'pass', 'joueur', 'Thomas', 'Roche', '0600000005', 1);

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
  ADD PRIMARY KEY (`id`);

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
