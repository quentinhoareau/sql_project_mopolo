-- Maj_Consultation_De_Donnees_BoatBooking_Hoareau_Diallo_Aittahar.sql

----------------CONSULTATION - 5 requêtes impliquant 1 table dont 1 avec un group By et une avec un Order By----------------

-- Req 1 -  Savoir toutes les informations du client qui s'appele 'Lucia'
SELECT ... 
FROM ...
WHERE ...

-- Req 2 -  Tous les bateaux qui date avant 1990
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  La liste des réservations (nom/prénom du client et bateau réservé) à partir d'aujourd'huis trié par date de début de la réservation  (Req avec Order By)
SELECT ... 
FROM ...
WHERE ...

-- Req 4 -  Le nombre total réservation par bateau depuis toujours  (Req avec Group By)
SELECT BT_IMMATRICULE, COUNT(*) AS "Nb de réservation"
FROM RESERVATION
GROUP BY BT_IMMATRICULE;

-- Req 5 -  Tous les bateaux qui consomme du 'Diesel' en carburant
SELECT *
FROM ...
WHERE ...


----------------CONSULTATION - 5 requêtes impliquant 2 tables avec jointures internes dont 1 externe + 1 group by + 1 tri----------------

-- Req 1 -  Pour tous les bateaux afficher le nom/prénom du dernier client réservé ou afficher rien si aucun client (Req avec 1 jointure extrene)
SELECT ... 
FROM ...
WHERE ...

-- Req 2 -  Donnez l'immatriculation, le nom, le type de carburant, le type de bateau qui sont de type Yachts et qui ne consomme pas de 'Desiel'.
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  Tous les bataux qui sont sur le port de TOULON trié par numéros d'emplacement de Port (Req avec 1 tri)
SELECT ... 
FROM ...
WHERE ...

-- Req 4 -  Nombres de réservation par ville de client depuis toujours  (Req avec Group By)
SELECT ... 
FROM ...
WHERE ...

-- Req 5 -  Tous les bateaux qui sont utilisable sur les port situé à Nice
SELECT ... 
FROM ...
WHERE ...


----------------CONSULTATION - 5 requêtes impliquant 3 tables (ou +) avec jointures internes dont 1 externe + 1 group by + 1 tri ----------------

-- Req 1 -  Connaitre le prix total de chaque réservation du client Smith (nom) Keira (prénom)
SELECT ...  
FROM ...
WHERE ...

-- Req 2 -  Le nom des bateaux trié par couleur de type "Hunter" réservé par des clients habitant à 'Paris' (Req avec 1 tri)
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  Tous les marques des bateaux qui sont réservés ,à partir d'aujoud'huis.
SELECT ...
FROM ...
WHERE ...

-- Req 4 -  Le nombre de bateaux par couleur dont le prix/heure du type de bateau est > 10 euros et le coefficient de la marque est > 0.6  (Req avec Group By)
SELECT ...
FROM ...
WHERE ...

-- Req 5 -  La dernière marque de bateaux réservé pour tous les clients (Req avec 1 jointure externe)
SELECT ...
FROM ...
WHERE ...


------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------



----------------UPDATE - 2 requêtes impliquant 1 table----------------

-- Req 1 - Jean veut corriger son prénom, il s'est trompé, il a enregistré Aimee à la place de son prénom
UPDATE CLIENTELE
SET CL_PRENOM = 'Jean'
WHERE CL_PRENOM = 'Aimee' and CL_NOM = 'Johnson';

-- Req 2 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...


----------------Requêtes MAJ - 2 requêtes impliquant 2 tables----------------

-- Req 1 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...

-- Req 2 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...

----------------Requêtes MAJ - 2 requêtes impliquant plus de 2 tables----------------

-- Req 1 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...

-- Req 2 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...
