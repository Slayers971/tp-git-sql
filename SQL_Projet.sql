CREATE DATABASE biblio

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS auteur;

CREATE TABLE auteur(
  id INT  NOT NULL,
  nom varchar(255) DEFAULT NULL,
  prenom varchar(255) DEFAULT NULL,
  nat varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO auteur (id, nom, prenom, nat) VALUES
(1, 'Marny', 'Hood', 'Singapore'),
(2, 'Robert', 'Dodson', 'Espagnol'),
(3, 'Howard', 'Brewer', 'Peru'),
(4, 'Jennifer', 'Mccormick', 'Anglais'),
(5, 'Tad', 'Jones', 'Italy'),
(6, 'Limond', 'Léonard', 'Français'),
(7, 'Yve', NULL, 'Français'),
(8,'Anstontin', 'Marie', 'Italy'),
(9, 'Jouffret','Jean', 'Français'),
(10,'Barrere','Paul', 'Français');

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

DROP TABLE IF EXISTS ouvrage;
CREATE TABLE ouvrage (
  num_ouv varchar(50) NOT NULL,
  titre varchar(50) DEFAULT NULL,
  date_par date DEFAULT NULL,
  nom_edit varchar(50) DEFAULT NULL,
  PRIMARY KEY (num_ouv)
);

--
-- Déchargement des données de la table `ouvrage`
--

INSERT INTO ouvrage(num_ouv, titre, date_par, nom_edit) VALUES
('FRQ09XXD5UW', 'scelerisque scelerisque dui. Suspendisse ac metus ', '2018-04-24', 'Lacinia Mattis Limited'),
('HTM76LJX5QZ', 'tortor. Nunc commodo auctor velit. Aliquam nisl.', '2031-12-23', 'Penatibus Et Limited'),
('NLM31RTA1HD', 'aliquet. Proin velit. Sed', '2019-09-23', 'Condimentum LLP'),
('VOT92OGY5QQ', 'Donec nibh enim, gravida sit amet, dapibus', '2020-09-01', 'Dui Augue Eu Corp.'),
('GIO58YMX3JE', 'Vivamus nibh dolor, nonummy ac, feugiat', '2020-12-31', 'Elementum Lorem Ut Corporation');


-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

DROP TABLE IF EXISTS exemplaire;
CREATE TABLE exemplaire (
  num_ex varchar(50) NOT NULL,
  num_ouv varchar(50) DEFAULT NULL,
  lec_num varchar(50) DEFAULT NULL,
  date_emp date DEFAULT NULL,
  dat_ret date DEFAULT NULL,
  PRIMARY KEY (num_ex)
) ;

--
-- Déchargement des données de la table `exemplaire`
--

INSERT INTO exemplaire (num_ex, num_ouv, lec_num, date_emp, dat_ret) VALUES
('OPJ60IXP7BP', 'LEN84JDN9BQ', 'EMF65LRM2OP', '2022-05-06', '2022-09-30'),
('ISP74GWT5GR', 'MPQ29WHL2EE', 'DWI34TST2HQ', '2022-10-09', '2023-06-22'),
('QLX54CPJ2IB', 'NLM31RTA1HD', 'XXD00PJI4TS', '2024-03-31', '2023-10-02'),
('RZU64USP6LI', 'XSL70OHS0AO', 'EXT93HOG7FU', '2023-06-12', '2022-06-30'),
('EJW58DBN5EB', 'ROQ71HOF2EF', 'RRU20DVL2AU', '2023-11-21', '2024-04-08');

-- --------------------------------------------------------
--
-- Structure de la table `lecteur`
--

DROP TABLE IF EXISTS lecteur;
CREATE TABLE lecteur(
  id INT NOT NULL,
  lec_num varchar(255) DEFAULT NULL,
  nom varchar(255) DEFAULT NULL,
  prenom varchar(255) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

--
-- Déchargement des données de la table `lecteur`
--

INSERT INTO lecteur (id, lec_num, nom, prenom, address) VALUES
(1, 'IDV73EDI2YJ', 'Amy', 'Cole', '822-5995 At St.'),
(2, 'BSI12DGP5PF', 'Nash', 'Hyde', '826-1217 Donec Rd.'),
(3, 'CSE52BJT5WQ', 'Echo', 'Kerr', 'P.O. Box 202, 745 Leo. Rd.'),
(4, 'YOO24ASS0VQ', 'Solomon', 'Welch', 'Ap #740-4221 Massa Rd.'),
(5, 'SBT80TSH2DO', 'Danielle', 'Joyce', 'Ap #107-3523 In Rd.');

-- --------------------------------------------------------

--
-- Structure de la table `ecrire`
--

DROP TABLE IF EXISTS ecrire;
CREATE TABLE ecrire (
  ecrit_id int NOT NULL,
  aut_id int DEFAULT NULL,
  num_ouv varchar(50) DEFAULT NULL,
  PRIMARY KEY (ecrit_id)
);

--
-- Déchargement des données de la table `ecrire`
--

INSERT INTO ecrire (ecrit_id, aut_id, num_ouv) VALUES
(1, 8, 'FRQ09XXD5UW'),
(2, 3, 'MPQ29WHL2EE'),
(3, 3, 'LEN84JDN9BQ'),
(4, 8, 'XSL70OHS0AO'),
(5, 5, 'GIO58YMX3JE');
-- --------------------------------------------------------
/* Question 1*/

SELECT *
FROM auteur

/* Question 2*/
SELECT COUNT(*)
FROM auteur

/* Question 3*/
SELECT nom, prenom
FROM auteur
ORDER BY nom, prenom

/* Question 4*/
SELECT nom
FROM auteur
WHERE prenom IS NULL

/* Question 5*/
SELECT DISTINCT nat
FROM auteur

/* Question 6*/
SELECT nom
FROM auteur 
WHERE nat = 'Français' AND prenom IS NOT NULL

/* Question 7*/
SELECT nom
FROM auteur
WHERE nat = 'Français' AND prenom = 'Paul'

/* Question 8*/
SELECT nom
FROM auteur
WHERE nat = 'Français' AND (prenom = 'Paul' OR prenom = 'Jean')

/* Question 9*/
SELECT nom
FROM auteur
WHERE nat='Espagnol' OR nat = 'Anglais'

/* Question 10*/
SELECT nom
FROM auteur 
WHERE nat != 'Français'

/* Question 11*/
SELECT COUNT(*)
FROM auteur
WHERE nat = 'Français'

/* Question 12*/
SELECT  COUNT(DISTINCT nat)
FROM auteur

/* Question 13*/
SELECT nat, count(nat)
from auteur
group by nat

/* Question 14*/
SELECT nom_edit, date_par
FROM ouvrage
WHERE titre = 'scelerisque scelerisque dui. Suspendisse ac metus'

/* Question 15*/
SELECT nom_edit, date_par
FROM ouvrage
WHERE titre LIKE 'scelerisque%'

/* Question 16*/
SELECT nom_edit
FROM ouvrage
WHERE date_par >= '2019-10-01'

/* Question 17*/
SELECT nom_edit, titre
FROM ouvrage
WHERE date_par BETWEEN '2020-09-01' AND '2020-12-31'

/* Question 18*/
/*Quels sont les ouvrages édités sur l'années 2018 ? */
SELECT nom_edit, titre
FROM ouvrage
WHERE YEAR(date_par) = '2018'

/* Question 19*/
/*Combien d'ouvrages de Zola sont présents ? */
SELECT COUNT(*)
FROM ouvrage
WHERE nom_edit = 'Zola'

/* Question 20*/
/*Quels sont les noms des ouvrages de Zola ? */
SELECT titre
FROM ouvrage
WHERE nom_edit = 'Zola'

/* Question 21*/




/* Question 22*/
/*Quels sont les auteurs qui ont plus de 3 ouvrages*/
SELECT nom, prenom
FROM auteur 
INNER JOIN ecrire ON auteur.id= ecrire.aut_id
INNER JOIN ouvrage ON ecrire.num_ouv= ouvrage.num_ouv
GROUP BY nom, prenom
HAVING COUNT(*) > 3

/* Question 23*/
/*Quelle est la moyenne du nombre d'ouvrages par auteur */
SELECT AVG(nbLivres) AS moyenneOuvragesParAuteur
FROM (SELECT COUNT(*) AS nbLivres 
      FROM ouvrage 
	  INNER JOIN ecrire ON ouvrage.num_ouv= ecrire.num_ouv
	  INNER JOIN auteur ON ecrire.aut_id= auteur.id
	  GROUP BY nom
      ) AS compteLivres




/* Question 24*/
/*Quels sont les ouvrages ayant plusieurs auteurs ? 
// sans requête imbriquée // avec une requête imbriquée*/
SELECT ouvrage.titre, COUNT(*) AS Nombre_Auteurs
FROM ouvrage
INNER JOIN ecrire ON ouvrage.num_ouv= ecrire.num_ouv
INNER JOIN auteur ON ecrire.aut_id= auteur.id
GROUP BY ouvrage.titre
HAVING COUNT(*) >= 1

/* Question 25*/
/*Quel est l'auteur avec le plus d'ouvrages ? 
// sans requête imbriquée // avec une requête imbriquée */
SELECT TOP 1 auteur.nom, COUNT(*) AS Nombre_Livres
FROM auteur
INNER JOIN ecrire ON auteur.id= ecrire.aut_id
INNER JOIN ouvrage ON ecrire.num_ouv= ouvrage.num_ouv
GROUP BY auteur.nom
ORDER BY COUNT(*) DESC
/*LIMIT 1*/

/* Question 26*/
/*Afficher tous les ouvrages qui sont ecrits par auteur qui commence par 'A' son nom. */
SELECT titre
FROM ouvrage
INNER JOIN ecrire ON ouvrage.num_ouv= ecrire.num_ouv
INNER JOIN auteur ON ecrire.aut_id= auteur.id
WHERE nom LIKE 'A%'

/* Question 27*/
/*Quel est l'ouvrage le plus d'exemplaire */
SELECT *
FROM ouvrage
INNER JOIN exemplaire ON ouvrage.num_ouv= exemplaire.num_ouv
GROUP BY num_ex
ORDER BY COUNT(*) DESC




