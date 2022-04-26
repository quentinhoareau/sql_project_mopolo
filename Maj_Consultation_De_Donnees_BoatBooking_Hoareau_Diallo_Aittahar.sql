-- Maj_Consultation_De_Donnees_BoatBooking_Hoareau_Diallo_Aittahar.sql

----------------CONSULTATION - 5 requêtes impliquant 1 table dont 1 avec un group By et une avec un Order By----------------

-- Req 1 -  Savoir toutes les informations du client qui s'appele 'Lucia'
SELECT *
FROM CLIENTELE
WHERE CL_PRENOM = 'Lucia';

-- Req 2 -  Tous les bateaux qui date avant 1990
SELECT * 
FROM Bateau
WHERE BT_ANNEE < 1990;

-- Req 3 -  Compter les bateaux par couleur (Req avec Order by)
SELECT count(*) AS "Nombre", BT_COULEUR
FROM BATEAU
GROUP BY BT_COULEUR
ORDER BY BT_COULEUR;

-- Req 4 -  Le nombre total réservation par bateau depuis toujours  (Req avec Group By)
SELECT BT_IMMATRICULE, COUNT(*) AS "Nb de réservation"
FROM RESERVATION
GROUP BY BT_IMMATRICULE;

-- Req 5 -  Tous les bateaux qui consomme du 'Diesel' en carburant
SELECT BT_IMMATRICULE, BT_TYPE_CARBURANT
FROM BATEAU
WHERE BT_TYPE_CARBURANT = 'Diesel'


----------------CONSULTATION - 5 requêtes impliquant 2 tables avec jointures internes dont 1 externe + 1 group by + 1 tri----------------

-- Req 1 -  Pour tous les bateaux afficher le nom/prénom du dernier client réservé ou afficher rien si aucun client (Req avec 1 jointure extrene)
SELECT RES.BT_IMMATRICULE, CL.CL_NOM, CL.CL_PRENOM
FROM CLIENTELE CL, RESERVATION RES
WHERE CL.CL_ID = RES.CL_ID
AND CL.CL_ID IN ( SELECT RES1.CL_ID
                FROM RESERVATION RES1
                INNER JOIN ( SELECT CL_ID, MAX(RES_DATE_DEBUT) MAXDATE
                    FROM RESERVATION
                    WHERE BT_IMMATRICULE IN (SELECT DISTINCT BT_IMMATRICULE  FROM RESERVATION)
                    GROUP BY CL_ID) RES2 
                ON RES1.CL_ID = RES2.CL_ID
                AND RES1.RES_DATE_DEBUT = RES2.MAXDATE);

-- Req 2 -  Donnez l'immatriculation, le nom, le type de carburant, le type de bateau qui sont de type Yachts et qui ne consomme pas de 'Desiel'.
SELECT bt.bt_immatricule, bt.bt_nom, bt.bt_type_carburant 
FROM bateau bt, bateau_type btp
WHERE bt.btype_id = btp.btype_id
AND btp.btype_nom = 'Yachts' 
AND bt.bt_type_carburant != 'Diesel';

-- Req 3 -  La liste des réservations (nom/prénom du client et bateau réservé)trié par date de début de la réservation  (Req avec tri)
SELECT c.CL_NOM, c.CL_PRENOM, b.BT_NOM, r.RES_DATE_DEBUT
FROM CLIENTELE c inner join RESERVATION r on r.CL_ID = c.CL_ID inner join BATEAU b on r.BT_IMMATRICULE = b.BT_IMMATRICULE
ORDER BY r.res_date_debut;

-- Req 4 -  Nombres de réservation par ville de client depuis toujours  (Req avec Group By)
SELECT cli.CL_ADDR_VILLE, COUNT(res.CL_ID) "Nb de réservation"
FROM RESERVATION res
RIGHT JOIN CLIENTELE cli ON cli.CL_ID = res.CL_ID
GROUP BY cli.CL_ADDR_VILLE;

-- Req 5 -  Tous les bateaux qui sont utilisable sur les ports situé à Nice
SELECT bat.BT_IMMATRICULE, bat.BT_NOM, prt.prt_addr_ville
FROM BATEAU bat
INNER JOIN PORT prt ON prt.PRT_ID = bat.PRT_ID
WHERE prt.prt_addr_ville = 'Nice';


----------------CONSULTATION - 5 requêtes impliquant 3 tables (ou +) avec jointures internes dont 1 externe + 1 group by + 1 tri ----------------

-- Req 1 -  Connaitre le prix total de chaque réservation du client Smith (nom) Keira (prénom)
SELECT ...  
FROM ...
WHERE ...

-- Req 2 -  Le nom des bateaux trié par couleur de type "Hunter" réservé par des clients habitant à 'Paris' (Req avec 1 tri)
SELECT ... 
FROM ...
WHERE ...

-- Req 3 -  Toutes les marques des bateaux qui sont utilisables et qui se trouvent dans le port de Toulon
SELECT m.MRQ_NOM, b.BT_NOM
FROM MARQUE m 
INNER JOIN BATEAU b on m.MRQ_ID = b.MRQ_ID 
INNER JOIN PORT p on p.PRT_ID = b.PRT_ID
WHERE p.PRT_ADDR_VILLE = 'Toulon' AND b.BT_UTILISABLE = 1;

-- Req 4 -  Le nombre de bateaux par couleur dont le prix/heure du type de bateau est > 10 euros et le coefficient de la marque est > 1.07  (Req avec Group By)
SELECT COUNT(b.BT_IMMATRICULE), b.BT_COULEUR
FROM BATEAU_TYPE bt inner join BATEAU b on bt.BTYPE_ID = b.BTYPE_ID inner join MARQUE m on b.MRQ_ID = m.MRQ_ID
WHERE bt.BTYPE_PRIX_HEURE > 10 AND  m.MRQ_COEFF_MAJORATION > 1.07 
GROUP BY b.BT_COULEUR
ORDER BY COUNT(b.BT_IMMATRICULE) ASC;

-- Req 5 -  La dernière marque de bateaux réservé ou pas pour tous les clients (Req avec 1 jointure externe)
SELECT c.CL_ID, c.CL_NOM, c.CL_PRENOM,r.BT_IMMATRICULE "Dernier imma. bateau loué", mrq.mrq_nom "Dernière marque louée"
FROM CLIENTELE c
LEFT JOIN RESERVATION r ON c.CL_ID = r.CL_ID
INNER JOIN BATEAU bat ON bat.BT_IMMATRICULE = r.BT_IMMATRICULE
INNER JOIN MARQUE mrq ON mrq.MRQ_ID = bat.MRQ_ID
WHERE r.BT_IMMATRICULE = (
    SELECT BT_IMMATRICULE 
    FROM RESERVATION r2
    WHERE r2.RES_DATE_DEBUT = (
        SELECT MAX(r3.RES_DATE_DEBUT) FROM RESERVATION r3 WHERE r3.CL_ID = c.CL_ID
    )
    AND  r2.CL_ID = c.CL_ID
) OR r.BT_IMMATRICULE IS NULL 
ORDER BY c.CL_ID;



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

-- Req 1 - On souhaite mettre tous les bateaux situé au port 'Port Nice Carras' non utilisable car ce port est en réparation.
UPDATE BATEAU
SET BT_UTILISABLE = 0
WHERE PRT_ID = (SELECT PRT_ID FROM PORT WHERE  prt_nom = 'Port Nice Carras' );

-- Req 2 - [Description de la requete...]
UPDATE ...
SET ...
WHERE ...

----------------Requêtes MAJ - 2 requêtes impliquant plus de 2 tables----------------

-- Req 1 - Supprimer tous les réservations des bateaux situé sur le port de Toulon 
DELETE
FROM RESERVATION
WHERE BT_IMMATRICULE IN (
    SELECT bat.BT_IMMATRICULE 
    FROM BATEAU bat
    INNER JOIN PORT prt ON prt.PRT_ID = bat.PRT_ID
    WHERE prt.prt_addr_ville = 'Toulon'
);

-- Req 2 - Mettre à jour tous comme 'utilisable' et supprimé les notes des bateaux de type CABINE qui se trouve dans le Port de Saint-Gilles
UPDATE BATEAU
SET BT_UTILISABLE = 1, BT_NOTE = NULL
WHERE BT_IMMATRICULE IN (
    SELECT b.BT_IMMATRICULE
    FROM BATEAU b
    INNER JOIN PORT p ON p.PRT_ID = b.PRT_ID 
    INNER JOIN BATEAU_TYPE bt ON bt.BTYPE_ID = b.BTYPE_ID 
    WHERE p.PRT_NOM = 'Port de Saint-Gilles'
    AND bt.BTYPE_NOM = 'CABINE'
);
