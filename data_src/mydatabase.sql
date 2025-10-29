-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : mariadb:3306
-- Généré le : mer. 29 oct. 2025 à 13:39
-- Version du serveur : 12.0.2-MariaDB-ubu2404
-- Version de PHP : 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydatabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `crm`
--

CREATE TABLE `crm` (
  `client_id` int(2) DEFAULT NULL,
  `nom` varchar(9) DEFAULT NULL,
  `email` varchar(18) DEFAULT NULL,
  `date_inscription` varchar(10) DEFAULT NULL,
  `revenu_annuel` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `crm`
--

INSERT INTO `crm` (`client_id`, `nom`, `email`, `date_inscription`, `revenu_annuel`) VALUES
(1, 'Client_1', 'client1@gmail.com', '06/03/2022', ''),
(2, 'Client_2', 'client2@gmail.com', '15/03/2022', '35000'),
(3, 'Client_3', 'client3@gmail.com', '08/01/2023', '35000'),
(4, 'Client_4', 'client4@gmail.com', '28/04/2022', '28000€'),
(5, 'Client_5', 'client5@gmail.com', '25/09/2022', '42 000 €'),
(6, 'Client_6', 'client6@gmail.com', '26/03/2023', '52000'),
(7, 'Client_7', 'client7@gmail.com', '29/10/2022', '52000'),
(8, 'Client_8', 'client8@gmail.com', '22/08/2022', '52000'),
(9, 'Client_9', 'client9@gmail.com', '30/08/2022', '28000€'),
(10, 'Client_10', 'client10@gmail.com', '21/04/2023', '28000€'),
(11, 'Client_11', 'client11@gmail.com', '17/08/2023', '42 000 €'),
(12, 'Client_12', 'client12@gmail.com', '20/05/2022', '35000'),
(13, 'Client_13', 'client13@gmail.com', '16/03/2023', ''),
(14, 'Client_14', 'client14@gmail.com', '02/02/2023', '35000'),
(15, 'Client_15', 'client15@gmail.com', '08/11/2023', '52000'),
(1, 'Client_1', 'client1@gmail.com', '06/03/2022', ''),
(2, 'Client_2', 'client2@gmail.com', '15/03/2022', '35000'),
(3, 'Client_3', 'client3@gmail.com', '08/01/2023', '35000'),
(4, 'Client_4', 'client4@gmail.com', '28/04/2022', '28000€'),
(5, 'Client_5', 'client5@gmail.com', '25/09/2022', '42 000 €'),
(6, 'Client_6', 'client6@gmail.com', '26/03/2023', '52000'),
(7, 'Client_7', 'client7@gmail.com', '29/10/2022', '52000'),
(8, 'Client_8', 'client8@gmail.com', '22/08/2022', '52000'),
(9, 'Client_9', 'client9@gmail.com', '30/08/2022', '28000€'),
(10, 'Client_10', 'client10@gmail.com', '21/04/2023', '28000€'),
(11, 'Client_11', 'client11@gmail.com', '17/08/2023', '42 000 €'),
(12, 'Client_12', 'client12@gmail.com', '20/05/2022', '35000'),
(13, 'Client_13', 'client13@gmail.com', '16/03/2023', ''),
(14, 'Client_14', 'client14@gmail.com', '02/02/2023', '35000'),
(15, 'Client_15', 'client15@gmail.com', '08/11/2023', '52000');

-- --------------------------------------------------------

--
-- Structure de la table `ecommerce`
--

CREATE TABLE `ecommerce` (
  `customerID` int(2) DEFAULT NULL,
  `full_name` varchar(9) DEFAULT NULL,
  `purchase_date` varchar(10) DEFAULT NULL,
  `total_spent` varchar(7) DEFAULT NULL,
  `newsletter_optin` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `ecommerce`
--

INSERT INTO `ecommerce` (`customerID`, `full_name`, `purchase_date`, `total_spent`, `newsletter_optin`) VALUES
(13, 'Client_11', '08-10-2023', '436.86€', 'Yes'),
(10, 'Client_8', '24-02-2023', '238.32€', ''),
(18, 'Client_18', '12-01-2023', '92.62€', ''),
(21, 'Client_9', '07-01-2023', '394.42€', 'No'),
(9, 'Client_17', '22-03-2023', '184.17€', 'Yes'),
(17, 'Client_12', '05-06-2023', '364.92€', 'No'),
(12, 'Client_16', '16-12-2023', '169.02€', ''),
(22, 'Client_14', '02-08-2023', '329.87€', 'No'),
(16, 'Client_6', '05-07-2023', '230.15€', 'No'),
(14, 'Client_24', '11-11-2023', '497.69€', ''),
(6, 'Client_21', '11-12-2023', '287.13€', 'Yes'),
(24, 'Client_23', '10-12-2023', '136.66€', ''),
(5, 'Client_19', '20-12-2023', '64.91€', ''),
(7, 'Client_13', '16-07-2023', '265.94€', 'No'),
(8, 'Client_22', '01-11-2023', '176.28€', 'No');

-- --------------------------------------------------------

--
-- Structure de la table `erp`
--

CREATE TABLE `erp` (
  `id_client` int(2) DEFAULT NULL,
  `nom_client` varchar(9) DEFAULT NULL,
  `ville` varchar(9) DEFAULT NULL,
  `chiffre_affaires` decimal(6,2) DEFAULT NULL,
  `date_creation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `erp`
--

INSERT INTO `erp` (`id_client`, `nom_client`, `ville`, `chiffre_affaires`, `date_creation`) VALUES
(17, 'Client_4', 'Paris', 9547.21, '2023-10-13'),
(15, 'Client_3', 'Marseille', 3022.80, '2021-10-24'),
(5, 'Client_11', 'Paris', 2484.10, '2022-03-20'),
(6, 'Client_18', 'Paris', 7221.65, '2022-06-26'),
(11, 'Client_14', 'Marseille', 6062.34, '2023-09-22'),
(20, 'Client_15', 'Marseille', 2568.62, '2023-08-05'),
(3, 'Client_12', '', 9509.23, '2022-11-30'),
(16, 'Client_5', 'Toulouse', 3714.65, '2022-12-27'),
(8, 'Client_17', 'Toulouse', 2333.85, '2023-05-13'),
(10, 'Client_10', 'Toulouse', 8242.09, '2022-02-22'),
(4, 'Client_6', 'Paris', 2166.76, '2021-07-07'),
(7, 'Client_7', 'Toulouse', 5926.00, '2022-04-07'),
(19, 'Client_20', '', 5426.38, '2021-08-16'),
(1, 'Client_9', 'Toulouse', 1620.85, '2021-10-26'),
(18, 'Client_8', 'Lyon', 9382.10, '2024-01-08');

-- --------------------------------------------------------

--
-- Structure de la table `final_customers`
--

CREATE TABLE `final_customers` (
  `id` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `signup_date` text DEFAULT NULL,
  `annual_income` text DEFAULT NULL,
  `purchase_amount` text DEFAULT NULL,
  `total_spent` text DEFAULT NULL,
  `newsletter_optin` text DEFAULT NULL,
  `city` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `final_customers`
--

INSERT INTO `final_customers` (`id`, `name`, `email`, `signup_date`, `annual_income`, `purchase_amount`, `total_spent`, `newsletter_optin`, `city`) VALUES
('4517237b-065a-4db5-bb62-87ea18f1675b', 'Client_1', 'client1@gmail.com', '06/03/2022', NULL, '0', '0', '0', 'Toulouse'),
('db877896-bcfc-4712-be8b-8e2898633029', 'Client_10', 'client10@gmail.com', '21/04/2023', '28000€', '238.32€', '238.32€', '0', 'Toulouse'),
('2fa1e869-9ea7-43bb-a897-647383561a43', 'Client_11', 'client11@gmail.com', '17/08/2023', '42 000 €', '0', '0', '0', 'Marseille'),
('5cf89277-147f-4f7e-b027-0b6917880c9a', 'Client_12', 'client12@gmail.com', '20/05/2022', '35000', '169.02€', '169.02€', '0', 'Unknown'),
('2e7f69d6-89b0-41ca-81df-38a8d39c5388', 'Client_13', 'client13@gmail.com', '16/03/2023', NULL, '436.86€', '436.86€', 'Yes', 'Unknown'),
('b519b443-3db9-4d6c-a563-0875def7378f', 'Client_14', 'client14@gmail.com', '02/02/2023', '35000', '497.69€', '497.69€', '0', 'Unknown'),
('135668f1-d091-4102-80cf-afe8570728c4', 'Client_15', 'client15@gmail.com', '08/11/2023', '52000', '0', '0', '0', 'Marseille'),
('5e05805d-a868-44cd-a210-1888fc6fd081', 'Client_2', 'client2@gmail.com', '15/03/2022', '35000', '0', '0', '0', 'Unknown'),
('a3a5017a-4176-4036-b46c-c27dd9089c41', 'Client_3', 'client3@gmail.com', '08/01/2023', '35000', '0', '0', '0', 'Unknown'),
('e0a36427-c8ce-4911-bfbc-aa4fcd509636', 'Client_4', 'client4@gmail.com', '28/04/2022', '28000€', '0', '0', '0', 'Paris'),
('7b407087-718c-48e7-bf29-2bcd1574dd41', 'Client_5', 'client5@gmail.com', '25/09/2022', '42 000 €', '64.91€', '64.91€', '0', 'Paris'),
('cc29e640-1a59-40eb-bfb6-adb1c1fc679a', 'Client_6', 'client6@gmail.com', '26/03/2023', '52000', '287.13€', '287.13€', 'Yes', 'Paris'),
('cddaf0a4-cc60-4b84-924f-fedaf53f71e2', 'Client_7', 'client7@gmail.com', '29/10/2022', '52000', '265.94€', '265.94€', 'No', 'Toulouse'),
('7fe0605d-3eda-4ea9-8b2e-dceea98e88e7', 'Client_8', 'client8@gmail.com', '22/08/2022', '52000', '176.28€', '176.28€', 'No', 'Toulouse'),
('6c07f0a3-b913-4c11-9459-7f9b38bc5338', 'Client_9', 'client9@gmail.com', '30/08/2022', '28000€', '184.17€', '184.17€', 'Yes', 'Unknown');

-- --------------------------------------------------------

--
-- Structure de la table `unified`
--

CREATE TABLE `unified` (
  `client_id` int(2) DEFAULT NULL,
  `nom` varchar(9) DEFAULT NULL,
  `email` varchar(18) DEFAULT NULL,
  `date_inscription` varchar(10) DEFAULT NULL,
  `revenu_annuel` varchar(8) DEFAULT NULL,
  `customerID` int(2) DEFAULT NULL,
  `full_name` varchar(9) DEFAULT NULL,
  `purchase_date` varchar(10) DEFAULT NULL,
  `total_spent` varchar(7) DEFAULT NULL,
  `newsletter_optin` varchar(3) DEFAULT NULL,
  `id_client` int(2) DEFAULT NULL,
  `nom_client` varchar(9) DEFAULT NULL,
  `ville` varchar(9) DEFAULT NULL,
  `chiffre_affaires` decimal(6,2) DEFAULT NULL,
  `date_creation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `unified`
--

INSERT INTO `unified` (`client_id`, `nom`, `email`, `date_inscription`, `revenu_annuel`, `customerID`, `full_name`, `purchase_date`, `total_spent`, `newsletter_optin`, `id_client`, `nom_client`, `ville`, `chiffre_affaires`, `date_creation`) VALUES
(15, 'Client_15', 'client15@gmail.com', '08/11/2023', '52000', NULL, NULL, NULL, NULL, NULL, 15, 'Client_3', 'Marseille', 3022.80, '2021-10-24'),
(15, 'Client_15', 'client15@gmail.com', '08/11/2023', '52000', NULL, NULL, NULL, NULL, NULL, 15, 'Client_3', 'Marseille', 3022.80, '2021-10-24'),
(5, 'Client_5', 'client5@gmail.com', '25/09/2022', '42 000 €', 5, 'Client_19', '20-12-2023', '64.91€', '', 5, 'Client_11', 'Paris', 2484.10, '2022-03-20'),
(5, 'Client_5', 'client5@gmail.com', '25/09/2022', '42 000 €', 5, 'Client_19', '20-12-2023', '64.91€', '', 5, 'Client_11', 'Paris', 2484.10, '2022-03-20'),
(6, 'Client_6', 'client6@gmail.com', '26/03/2023', '52000', 6, 'Client_21', '11-12-2023', '287.13€', 'Yes', 6, 'Client_18', 'Paris', 7221.65, '2022-06-26'),
(6, 'Client_6', 'client6@gmail.com', '26/03/2023', '52000', 6, 'Client_21', '11-12-2023', '287.13€', 'Yes', 6, 'Client_18', 'Paris', 7221.65, '2022-06-26'),
(11, 'Client_11', 'client11@gmail.com', '17/08/2023', '42 000 €', NULL, NULL, NULL, NULL, NULL, 11, 'Client_14', 'Marseille', 6062.34, '2023-09-22'),
(11, 'Client_11', 'client11@gmail.com', '17/08/2023', '42 000 €', NULL, NULL, NULL, NULL, NULL, 11, 'Client_14', 'Marseille', 6062.34, '2023-09-22'),
(3, 'Client_3', 'client3@gmail.com', '08/01/2023', '35000', NULL, NULL, NULL, NULL, NULL, 3, 'Client_12', '', 9509.23, '2022-11-30'),
(3, 'Client_3', 'client3@gmail.com', '08/01/2023', '35000', NULL, NULL, NULL, NULL, NULL, 3, 'Client_12', '', 9509.23, '2022-11-30'),
(8, 'Client_8', 'client8@gmail.com', '22/08/2022', '52000', 8, 'Client_22', '01-11-2023', '176.28€', 'No', 8, 'Client_17', 'Toulouse', 2333.85, '2023-05-13'),
(8, 'Client_8', 'client8@gmail.com', '22/08/2022', '52000', 8, 'Client_22', '01-11-2023', '176.28€', 'No', 8, 'Client_17', 'Toulouse', 2333.85, '2023-05-13'),
(10, 'Client_10', 'client10@gmail.com', '21/04/2023', '28000€', 10, 'Client_8', '24-02-2023', '238.32€', '', 10, 'Client_10', 'Toulouse', 8242.09, '2022-02-22'),
(10, 'Client_10', 'client10@gmail.com', '21/04/2023', '28000€', 10, 'Client_8', '24-02-2023', '238.32€', '', 10, 'Client_10', 'Toulouse', 8242.09, '2022-02-22'),
(4, 'Client_4', 'client4@gmail.com', '28/04/2022', '28000€', NULL, NULL, NULL, NULL, NULL, 4, 'Client_6', 'Paris', 2166.76, '2021-07-07'),
(4, 'Client_4', 'client4@gmail.com', '28/04/2022', '28000€', NULL, NULL, NULL, NULL, NULL, 4, 'Client_6', 'Paris', 2166.76, '2021-07-07'),
(7, 'Client_7', 'client7@gmail.com', '29/10/2022', '52000', 7, 'Client_13', '16-07-2023', '265.94€', 'No', 7, 'Client_7', 'Toulouse', 5926.00, '2022-04-07'),
(7, 'Client_7', 'client7@gmail.com', '29/10/2022', '52000', 7, 'Client_13', '16-07-2023', '265.94€', 'No', 7, 'Client_7', 'Toulouse', 5926.00, '2022-04-07'),
(1, 'Client_1', 'client1@gmail.com', '06/03/2022', '', NULL, NULL, NULL, NULL, NULL, 1, 'Client_9', 'Toulouse', 1620.85, '2021-10-26'),
(1, 'Client_1', 'client1@gmail.com', '06/03/2022', '', NULL, NULL, NULL, NULL, NULL, 1, 'Client_9', 'Toulouse', 1620.85, '2021-10-26'),
(13, 'Client_13', 'client13@gmail.com', '16/03/2023', '', 13, 'Client_11', '08-10-2023', '436.86€', 'Yes', NULL, NULL, NULL, NULL, NULL),
(13, 'Client_13', 'client13@gmail.com', '16/03/2023', '', 13, 'Client_11', '08-10-2023', '436.86€', 'Yes', NULL, NULL, NULL, NULL, NULL),
(9, 'Client_9', 'client9@gmail.com', '30/08/2022', '28000€', 9, 'Client_17', '22-03-2023', '184.17€', 'Yes', NULL, NULL, NULL, NULL, NULL),
(9, 'Client_9', 'client9@gmail.com', '30/08/2022', '28000€', 9, 'Client_17', '22-03-2023', '184.17€', 'Yes', NULL, NULL, NULL, NULL, NULL),
(12, 'Client_12', 'client12@gmail.com', '20/05/2022', '35000', 12, 'Client_16', '16-12-2023', '169.02€', '', NULL, NULL, NULL, NULL, NULL),
(12, 'Client_12', 'client12@gmail.com', '20/05/2022', '35000', 12, 'Client_16', '16-12-2023', '169.02€', '', NULL, NULL, NULL, NULL, NULL),
(14, 'Client_14', 'client14@gmail.com', '02/02/2023', '35000', 14, 'Client_24', '11-11-2023', '497.69€', '', NULL, NULL, NULL, NULL, NULL),
(14, 'Client_14', 'client14@gmail.com', '02/02/2023', '35000', 14, 'Client_24', '11-11-2023', '497.69€', '', NULL, NULL, NULL, NULL, NULL),
(2, 'Client_2', 'client2@gmail.com', '15/03/2022', '35000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Client_2', 'client2@gmail.com', '15/03/2022', '35000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
