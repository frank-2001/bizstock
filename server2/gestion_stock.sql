-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 nov. 2023 à 18:05
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
  `id_user` varchar(50) DEFAULT NULL,
  `jour` varchar(50) NOT NULL,
  `marchandise` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_succursale` int(11) NOT NULL,
  `date_livraison` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `state`, `id_user`, `jour`, `marchandise`, `quantite`, `id_succursale`, `date_livraison`) VALUES
(4, 1, 'eddie', 'Wed Nov 08 2023', 6, 2, 2, 'Wed Nov 08 2023'),
(5, 1, 'eddie', 'Wed Nov 08 2023', 6, 1, 2, 'Wed Nov 08 2023'),
(6, 1, 'eddie', 'Wed Nov 08 2023', 6, 2, 2, 'Wed Nov 08 2023'),
(7, 1, 'eddie', 'Wed Nov 08 2023', 7, 5, 2, 'Wed Nov 08 2023'),
(8, 1, 'beni', 'Wed Nov 08 2023', 8, 5, 4, 'Wed Nov 08 2023'),
(9, 0, 'beni', 'Wed Nov 08 2023', 9, 4, 4, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id` int(20) NOT NULL,
  `numeroNational` varchar(30) DEFAULT NULL,
  `paysEse` varchar(50) DEFAULT NULL,
  `provinceEse` varchar(50) DEFAULT NULL,
  `quartierQuartier` varchar(50) DEFAULT NULL,
  `avenueEse` varchar(50) DEFAULT NULL,
  `villeEse` varchar(50) DEFAULT NULL,
  `communeEse` varchar(50) DEFAULT NULL,
  `dateCreatEse` varchar(20) DEFAULT NULL,
  `denomination` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `numeroNational`, `paysEse`, `provinceEse`, `quartierQuartier`, `avenueEse`, `villeEse`, `communeEse`, `dateCreatEse`, `denomination`) VALUES
(14, '3443124', 'Congo', 'NK', 'Malepe', NULL, 'Beni', 'Beu', '2023-11-23', 'LALOCA'),
(15, '3443124', 'Congo', 'NK', 'Malepe', NULL, 'Beni', 'Beu', '2023-11-03', 'PALOS');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` varchar(50) NOT NULL,
  `client` varchar(100) NOT NULL,
  `moyen_paiement` varchar(100) NOT NULL,
  `user` varchar(50) NOT NULL,
  `id_succursale` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `id` int(11) NOT NULL,
  `denomination` varchar(50) NOT NULL,
  `entreprise` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `denomination`, `entreprise`) VALUES
(1, 'administrateur', NULL),
(2, 'Vendeur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mouvements`
--

CREATE TABLE `mouvements` (
  `id` int(11) NOT NULL,
  `id_marchandise` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `quantite` double NOT NULL,
  `prix` double NOT NULL,
  `jour` varchar(50) NOT NULL,
  `facture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stock_entreprise`
--

CREATE TABLE `stock_entreprise` (
  `id` int(11) NOT NULL,
  `libele` varchar(100) NOT NULL,
  `stock` double NOT NULL,
  `prix` double NOT NULL,
  `jour` varchar(50) NOT NULL,
  `id_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stock_entreprise`
--

INSERT INTO `stock_entreprise` (`id`, `libele`, `stock`, `prix`, `jour`, `id_entreprise`) VALUES
(6, 'Lait', 5, 700, 'Wed Nov 08 2023', 14),
(7, 'Tomate', 0, 300, 'Wed Nov 08 2023', 14),
(8, 'Pain', 95, 1000, 'Wed Nov 08 2023', 15),
(9, 'Jus', 200, 500, 'Wed Nov 08 2023', 15);

-- --------------------------------------------------------

--
-- Structure de la table `stock_succursale`
--

CREATE TABLE `stock_succursale` (
  `id` int(11) NOT NULL,
  `id_mse` int(11) NOT NULL,
  `quantite` double NOT NULL,
  `id_succursale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stock_succursale`
--

INSERT INTO `stock_succursale` (`id`, `id_mse`, `quantite`, `id_succursale`) VALUES
(3, 6, 3, 2),
(4, 7, 5, 2),
(5, 8, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `succursale`
--

CREATE TABLE `succursale` (
  `id` int(20) NOT NULL,
  `nomSuccur` varchar(50) DEFAULT NULL,
  `villeSuccur` varchar(20) DEFAULT NULL,
  `communeSuccur` varchar(20) DEFAULT NULL,
  `quartierSuccur` varchar(20) DEFAULT NULL,
  `avenueSuccur` varchar(20) DEFAULT NULL,
  `numeroSuccur` varchar(20) DEFAULT NULL,
  `idEntreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `succursale`
--

INSERT INTO `succursale` (`id`, `nomSuccur`, `villeSuccur`, `communeSuccur`, `quartierSuccur`, `avenueSuccur`, `numeroSuccur`, `idEntreprise`) VALUES
(2, 'LLC-Beni', 'Beni', 'Mulekera', 'Matonge', 'Shuv', NULL, 14),
(3, 'LLC-Gome', 'Goma', 'Goma', 'Himbi', 'dhgfhj ', NULL, 14),
(4, 'Palos Beni', 'Beni', 'Mulekera', 'Matonge', 'Mobesu', NULL, 15),
(5, 'Goma', 'Goma', 'Goma', 'Himbi', 'sff', NULL, 15);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `entreprise` int(11) DEFAULT NULL,
  `telephone` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `dnaissance` varchar(20) NOT NULL,
  `id_succursale` int(11) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `postnom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `fonction` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`username`, `password`, `entreprise`, `telephone`, `mail`, `genre`, `dnaissance`, `id_succursale`, `nom`, `postnom`, `prenom`, `fonction`) VALUES
('ben', 'ben', 15, '934949', 'frhd@jfj.cim', 'masculin', '2023-12-02', NULL, 'Nom', 'Postnom', 'Prenom', 1),
('beni', 'beni', 15, '912490149', 'dkfk@gkg.com', 'Masculin', '2023-11-05', 4, 'Kasereka', 'kk', 'dkskd', 2),
('eddie', 'eddie', 14, '912490149', 'dkfk@gkg.com', 'Masculin', '2023-11-02', 2, 'eddie', 'second', 'prenom', 2),
('frank', 'frank', 14, '912490149', 'dkfk@gkg.com', 'masculin', '2023-11-01', NULL, 'first', 'second', 'prenom', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_commande` (`id_user`),
  ADD KEY `succursale_commande` (`id_succursale`),
  ADD KEY `marchandise_commande` (`marchandise`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facture_user` (`user`),
  ADD KEY `succursale_facture` (`id_succursale`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entreprise_fonction` (`entreprise`);

--
-- Index pour la table `mouvements`
--
ALTER TABLE `mouvements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `stockSucc_mouv` (`id_marchandise`);

--
-- Index pour la table `stock_entreprise`
--
ALTER TABLE `stock_entreprise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entreprise_marchandise` (`id_entreprise`);

--
-- Index pour la table `stock_succursale`
--
ALTER TABLE `stock_succursale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `succursale_stockSucc` (`id_succursale`),
  ADD KEY `stockEse` (`id_mse`);

--
-- Index pour la table `succursale`
--
ALTER TABLE `succursale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEntreprise` (`idEntreprise`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD KEY `entreprise_user` (`entreprise`),
  ADD KEY `succursale_user` (`id_succursale`),
  ADD KEY `fonction_user` (`fonction`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `fonction`
--
ALTER TABLE `fonction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mouvements`
--
ALTER TABLE `mouvements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `stock_entreprise`
--
ALTER TABLE `stock_entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `stock_succursale`
--
ALTER TABLE `stock_succursale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `succursale`
--
ALTER TABLE `succursale`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `marchandise_commande` FOREIGN KEY (`marchandise`) REFERENCES `stock_entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `succursale_commande` FOREIGN KEY (`id_succursale`) REFERENCES `succursale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_commande` FOREIGN KEY (`id_user`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_user` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `succursale_facture` FOREIGN KEY (`id_succursale`) REFERENCES `succursale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD CONSTRAINT `entreprise_fonction` FOREIGN KEY (`entreprise`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mouvements`
--
ALTER TABLE `mouvements`
  ADD CONSTRAINT `stockSucc_mouv` FOREIGN KEY (`id_marchandise`) REFERENCES `stock_succursale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stock_entreprise`
--
ALTER TABLE `stock_entreprise`
  ADD CONSTRAINT `entreprise_stockEntre` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stock_succursale`
--
ALTER TABLE `stock_succursale`
  ADD CONSTRAINT `stockEse` FOREIGN KEY (`id_mse`) REFERENCES `stock_entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `succursale_stockSucc` FOREIGN KEY (`id_succursale`) REFERENCES `succursale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `succursale`
--
ALTER TABLE `succursale`
  ADD CONSTRAINT `entreprise_succursale` FOREIGN KEY (`idEntreprise`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `entreprise_user` FOREIGN KEY (`entreprise`) REFERENCES `entreprise` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fonction_user` FOREIGN KEY (`fonction`) REFERENCES `fonction` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `succursale_user` FOREIGN KEY (`id_succursale`) REFERENCES `succursale` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
