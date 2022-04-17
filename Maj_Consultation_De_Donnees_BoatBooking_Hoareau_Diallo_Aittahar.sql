-- Maj_Consultation_De_Donnees_BoatBooking_Hoareau_Diallo_Aittahar.sql

----------------CONSULTATION - 5 requêtes impliquant 1 table dont 1 avec un group By----------------

-- Req 1 -  [Description de la requete...]
SELECT ... 
FROM ...
WHERE ...

-- Req 2 -  [Description de la requete...]
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  [Description de la requete...] (Req avec Order By)
SELECT ... 
FROM ...
WHERE ...

-- Req 4 -  [Description de la requete...] (Req avec Group By)
SELECT ... 
FROM ...
WHERE ...

-- Req 5 -  [Description de la requete...] 
SELECT ... 
FROM ...
WHERE ...



----------------CONSULTATION - 5 requêtes impliquant 2 tables avec jointures internes dont 1 externe + 1 group by + 1 tri----------------

-- Req 1 -  [Description de la requete...] (Req avec 1 jointure extrene)
SELECT ... 
FROM ...
WHERE ...

-- Req 2 -  [Description de la requete...]
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  [Description de la requete...] (Req avec 1 tri)
SELECT ... 
FROM ...
WHERE ...

-- Req 4 -  [Description de la requete...]  (Req avec Group By)
SELECT ... 
FROM ...
WHERE ...

-- Req 5 -  [Description de la requete...] 
SELECT ... 
FROM ...
WHERE ...


----------------CONSULTATION - 5 requêtes impliquant 3 tables (ou +) avec jointures internes dont 1 externe + 1 group by + 1 tri ----------------

-- Req 1 -  [Description de la requete...]
SELECT ... 
FROM ...
WHERE ...

-- Req 2 -  [Description de la requete...] (Req avec Group By)
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  [Description de la requete...] 
SELECT ...
FROM ...
WHERE ...

-- Req 4 -  [Description de la requete...]  (Req avec Group By)
SELECT ...
FROM ...
WHERE ...

-- Req 5 -  [Description de la requete...]  (Req avec 1 jointure extrene)
SELECT ...
FROM ...
WHERE ...

----------------UPDATE - 2 requêtes impliquant 1 table----------------

-- Req 1 - Jean veut corriger son prénom, il s'est trompé, il a enregistré Aimee à la place de son prénom
UPDATE CLIENT
SET CL_PRENOM = 'Jean'
WHERE CL_PRENOM = 'Aimee' and CL_NOM = 'Johnson';

-- Req 2 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...



----------------Requêtes MAJ - 2 requêtes impliquant 1 table----------------

-- Req 1 - Jean veut corriger son prénom, il s'est trompé, il a enregistré Aimee à la place de son prénom
UPDATE CLIENT
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