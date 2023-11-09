-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 31 oct. 2023 à 13:43
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `user` varchar(50) NOT NULL,
  `jour` varchar(50) NOT NULL,
  `marchandise` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `state`, `user`, `jour`, `marchandise`, `quantite`) VALUES
(1, 1, 'Chris', '0000-00-00', 'Bierre', 5),
(2, 1, 'Chris', '0000-00-00', 'Tomate', 5),
(3, 1, 'Chris', 'Tue Oct 31 2023', 'Table', 5),
(4, 1, 'Chris', 'Tue Oct 31 2023', 'Bierre', 1),
(5, 1, 'Chris', 'Tue Oct 31 2023', 'Bierre', 2);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` varchar(50) NOT NULL,
  `client` varchar(100) NOT NULL,
  `moyen_paiement` varchar(100) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `client`, `moyen_paiement`, `user`) VALUES
('Chris-0', 'Jonathan ', 'Comptant', 'Chris'),
('Chris-11', 'Jimmy', 'Comptant', 'Chris'),
('Chris-2', 'Kombi', 'Comptant', 'Chris'),
('Chris-3', 'Jiga', 'Comptant', 'Chris');

-- --------------------------------------------------------

--
-- Structure de la table `marchandises`
--

CREATE TABLE `marchandises` (
  `libele` varchar(100) NOT NULL,
  `stock` double NOT NULL,
  `prix` double NOT NULL,
  `jour` varchar(50) NOT NULL,
  `user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `marchandises`
--

INSERT INTO `marchandises` (`libele`, `stock`, `prix`, `jour`, `user`) VALUES
('Bierre', 39, 500, 'Sat Oct 28 2023', 'admin'),
('Table', 48, 500, 'Sun Oct 29 2023', 'Cool'),
('Tomate', 29, 500, 'Sat Oct 28 2023', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `mouvements`
--

CREATE TABLE `mouvements` (
  `id` int(11) NOT NULL,
  `marchandise` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `quantite` double NOT NULL,
  `prix` double NOT NULL,
  `jour` varchar(50) NOT NULL,
  `commande` varchar(50) DEFAULT NULL,
  `facture` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mouvements`
--

INSERT INTO `mouvements` (`id`, `marchandise`, `user`, `quantite`, `prix`, `jour`, `commande`, `facture`) VALUES
(27, 'Bierre', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-0'),
(28, 'Table', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-0'),
(29, 'Tomate', 'Chris', 5, 2500, 'Tue Oct 31 2023', NULL, 'Chris-2'),
(30, 'Bierre', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-3'),
(31, 'Bierre', 'Chris', 4, 2000, 'Tue Oct 31 2023', NULL, 'Chris-4'),
(32, 'Bierre', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-5'),
(33, 'Bierre', 'Chris', 4, 2000, 'Tue Oct 31 2023', NULL, 'Chris-6'),
(34, 'Bierre', 'Chris', 4, 2000, 'Tue Oct 31 2023', NULL, 'Chris-6'),
(35, 'Bierre', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-8'),
(36, 'Bierre', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-9'),
(37, 'Bierre', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-9'),
(38, 'Table', 'Chris', 1, 500, 'Tue Oct 31 2023', NULL, 'Chris-11'),
(39, 'Tomate', 'Chris', 15, 7500, 'Tue Oct 31 2023', NULL, 'Chris-11');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `privilege` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`username`, `password`, `privilege`) VALUES
('admin', 'admin', 0),
('Chris', '12345', 1),
('Cool', 'Cool', 0),
('frank', 'frank', 0),
('Lover', '12345', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_user` (`user`),
  ADD KEY `cmd_mse` (`marchandise`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facture_user` (`user`);

--
-- Index pour la table `marchandises`
--
ALTER TABLE `marchandises`
  ADD PRIMARY KEY (`libele`),
  ADD KEY `mar_user` (`user`);

--
-- Index pour la table `mouvements`
--
ALTER TABLE `mouvements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marchandise` (`marchandise`),
  ADD KEY `user` (`user`),
  ADD KEY `fact` (`facture`),
  ADD KEY `mv_commande` (`commande`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `mouvements`
--
ALTER TABLE `mouvements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `cmd_mse` FOREIGN KEY (`marchandise`) REFERENCES `marchandises` (`libele`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_user` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_user` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- Contraintes pour la table `marchandises`
--
ALTER TABLE `marchandises`
  ADD CONSTRAINT `mar_user` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `mouvements`
--
ALTER TABLE `mouvements`
  ADD CONSTRAINT `marchandise` FOREIGN KEY (`marchandise`) REFERENCES `marchandises` (`libele`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
