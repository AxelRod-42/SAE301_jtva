-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 20 jan. 2026 à 09:56
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
