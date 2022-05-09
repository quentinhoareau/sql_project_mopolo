-- Insertions_lignes_BoatBooking_Hoareau_Diallo_Aittahar.sql
----------------TABLE : PORT----------------
-- INSERT INTO PORT VALUES(prt_id,prt_nom,prt_addr_num,prt_addr_rue,prt_addr_cp,prt_addr_ville,prt_cap_bateau);
DELETE FROM PORT;
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (1,'Port de Toulon',13,'Rue Victor Micholet','83000','Toulon',10);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (2,'Port de Saint-Gilles',3,'Port de St Gilles','97434','Saint-Gilles ',2);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (3,'Port de Cap-d’Ail',1,'Av. du Port','06320','Cap-d''Ail',3);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (4,'Port Vauban',1,'Av. de Verdun','06600','Antibes',2);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (5,'Port Lympia',1430,'Quai Amiral Infernet','06300','Nice',4);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (6,'Port Nice Carras',385,'Prom. des Anglais','06200','Nice',3);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (7,'Port de la Rague',1,'Port de la Rague','06210','Mandelieu-la-Napoule',4);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (8,'Port du Beal',110,'Bd du Midi Louise Moreau','06150','Cannes',5);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (9,'Port de Pointe Croisette',1,'Bd de la Croisette','06400','Cannes',4);
INSERT INTO PORT(PRT_ID,PRT_NOM,PRT_ADDR_NUM,PRT_ADDR_RUE,PRT_ADDR_CP,PRT_ADDR_VILLE,PRT_CAP_BATEAU)
   VALUES (10,'Port de Plaisance de Pornichet',1,'Port de Plaisance','44380','Pornichet',2);



----------------TABLE : MARQUE----------------
DELETE FROM MARQUE;

INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES (1,'Boston-Whaler','Boston-Whaler','Que vous soyez en train de pêcher, de naviguer ou les deux, les bateaux Boston-Whaler vous offrent des expériences et un confort de première qualité. Ils sont fabriqués avec une conception intelligente, une construction de haute qualité et une technologie d''avant-garde',1.16);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION) 
VALUES(2, 'Rhéa', 'Rhéa', 'Le chantier Rhéa Marine a été Créé en 1996 à La Rochelle. Cette marque se spécialise dans la fabrication de bateaux de plaisance à moteur. ', 1.22);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(3,'ZODAC','ZODAC','ZODAC est un constructeur français spécialisé dans les bateaux pneumatiques. Il est l’expert et pionnier dans l’exploration de l’air et de l’eau. Les bateaux Zodiac se caractérisent par une innovation constante dans les matériaux utilisés, avec des semi-rigides solides et légers à la fois ce qui augmente la longévité de chaque unité fabriquée',1.14);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(4,'Quicksilver','Quicksilver','Quicksilver fait partie du groupe Brunswick Corporation. Quicksilver est connu pour ses gammes de bateaux qui allient avec aisance fonctionnalité et sécurité le tout dans un style unique. Ce sont des bateaux dont la coque en V permet de fendre aisément les mers avec tout le confort nécessaire sur un bateau',1.06);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(5,'Bayliner','Bayliner','Bayliner a été fondée en 1957 par Orin Edson, il compte actuellement plus de 400 concessionnaires dans plus de 60 pays à travers le monde. La marque Bayliner a pour caractéristique principale la variété des coques de ses bateaux et la polyvalence de chaque modèle',1.06);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(6,'Bénéteau','Bénéteau','Les principales caractéristiques du chantier Bénéteau sont l’innovation, le design et la simplicité. C’est une marque pleine charme et de style qui vous offre un large éventail de gammes pour tous styles de navigation, que ce soit dans la plaisance ou dans les courses professionnelles',1.33);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(7, 'Nautic Saintonge', 'Nautic Saintonge', 'Le voilier NS 44 est un monocoque habitable de croisière, construit par le chantier Nautic Saintonge. Ce voilier, réalisé par l''architecte naval Georges Auzépy-Brenneur, mesure 13.37 m de long. La production a démarré en 1976 et s''est terminée en 1983. 33 exemplaires du bateau ont été produits', 1.11);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(8, 'Hunter', 'Hunter', 'Le voilier Hunter 40 est un monocoque habitable de croisière, construit par le chantier Hunter Marine. Ce voilier Quille fixe, gréé en Sloop fractionné, réalisé par l''architecte naval Hunter Design, mesure 12.57 m de long avec un tirant d''eau maximum de 2.03 m. La production a démarré en 2013',1.04);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(9, 'Westerly', 'Westerly', 'Le voilier Westerly Corsair 36 est un monocoque habitable de croisière, construit par le chantier Westerly Marine. Ce voilier Quille fixe, gréé en Sloop en tête, réalisé par l''architecte naval Dubois Naval Architects, mesure 10.87 m de long. La production a démarré en 1983 et s''est terminée en 1986', 1.07);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(10, 'Nicholson', 'Nicholson', 'Le voilier Nicholson 32 est un monocoque habitable de croisière, construit par le chantier Halatic en Royaume-Uni. Ce voilier Quille fixe, gréé en Sloop en tête, réalisé par l''architecte naval Peter Nicholson avec un tirant d''eau maximum de 1.68 m. La production a démarré en 1962 et s''est terminée en 1981', 1.08);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(11, 'Moody', 'Moody', 'L''intérieur, lumineux et chaleureux, est simple, fonctionnel, à l''instar du plan de pont, qui permet un confort de manœuvre, une circulation aisée et un accès à la mer facilité par une plage de bain de belle dimension. La gamme DS (Deck Saloon), comprend 3 modèles: Moody 45 DS, Moody 41 DS et Moody 54 DS', 1.04);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(12, 'Pricess', 'Princess', 'es Yachts du constructeur britannique sont des modèles construits au détails près. Princess Yacht vous offre des bateaux de luxe et de classe supérieur. Le design et les détails sont les caractéristiques principales de chaque bateau ainsi que le confort à l’intérieur comme sur chaque pont des bateaux.', 1.07);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(13, 'Alubat', 'Alubat', 'Le constructeur Alubat est un expert des voiliers et dériveurs en aluminium de voyages.  Il assure sécurité, fiabilité doublé à l’écologie. Vous découvrirez de belles unités dans les gammes comme Ovni, Cigale et Ovnicat pour les passionnés de la voile.', 1.13);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(14, 'Grand-banks', 'Grand-banks', 'Grand-Banks est un constructeur de bateaux de croisière depuis près de 70 ans. Les Bateaux Grand-Banks sont de superbes yachts aux designs classiques et modernes avec un confort et d’excellentes performances sur les mers et océans.', 1.07);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(15,'Sea-Ray', 'Sea-Ray', 'Les bateaux Sea-Ray sont construits par un processus artisanal méticuleux. Le design inspiré est un avantage considérable avec des performances inégalées. Des revendeurs de bateaux Sea-Ray sont présents dans plus de 80 pays.', 1.099);
INSERT INTO MARQUE(MRQ_ID,MRQ_NOM,MRQ_FABRICANT,MRQ_DESC,MRQ_COEFF_MAJORATION)
VALUES(16, 'Brue Roberts', 'Bruce Roberts', 'Bateau des chantiers Bruce Roberts en acier, bateau de grand voyage très robuste,Plus de 100 exemples de ce modèle peuvent être trouvés en croisière dans différentes parties du monde. Spécialement conçu pour la construction en acier Multi Chine uniquement. De nombreux Spray 38 sont décrits dans le livre de Bruce Spray. Le bateau de croisière ultime. Gréement aurique, un bateau qui a fait ses preuves partout dans le monde.', 1.046);


----------------TABLE : BATEAU_TYPE----------------
DELETE FROM BATEAU_TYPE;

INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES (1, 'Coque-open', 8.9);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(2, 'Cabine', 10.9);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(3, 'Semi-rigide', 5.9);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(4, 'Course', 5.9);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(5, 'Sports Nautique', 9.8);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(6, 'Jet-ski', 6.9);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(7, 'Voilier', 5.5);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(8, 'Luxe', 6.6);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(9, 'Gonflables', 7.7);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(10, 'Runqbouts', 8.8);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(11, 'Hautes Performances', 12);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(12, 'Dinghies', 12);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(13, 'Day-Cruisers', 7.1);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(14, 'Peche Sportive', 9.05);
INSERT INTO BATEAU_TYPE(BTYPE_ID,BTYPE_NOM,BTYPE_PRIX_HEURE)
VALUES(15, 'Yachts', 10.54);


----------------TABLE : BATEAU----------------
DELETE FROM BATEAU;

INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('MAF43878','Hunter Channel 32','blanc',80,0.8,'Diesel',5,1,9.75,3.12,1993,'Neuf',8,12,1,1); --Marque: Hunter & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_DESCRIPTION,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUF43931','Nicholson 303','rouge',110,0.8,'Diesel',5,'Le Nicholson 303 offre cinq couchettes dans deux cabines avec une salle d''eau séparée entre la cabine avant et le carré principal.',0,'Bateau en mauvaise état et besoin de réparation ',9.14,3.11,1979,'Mauvais',10,2,2,2);--Marque: Nicholson & Type : Cabine 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_DESCRIPTION,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('MAX20870','Westerly Pilot Saloon 48','blanc',130,0.9,'Diesel',8,'Un croiseur d''eau bleue parfait. Le Pilot Saloon 48 est la quintessence du savoir-faire Wauquiez en matière de conception et de construction de yachts haut de gamme.',1,NULL,14.77,4.61,2022,'Neuf',9,15,3,3);--Marque: Westerly & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_DESCRIPTION,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('TOF75670','Bruce Roberts 36','bleu',100,1,'Essence',2,'La coque en acier Bruce Roberts 36 constitue un choix solide de navire pour la croisière hauturière, l''entraînement à la Moteur ou la croisière côtière. Ceci est vendu comme un projet inachevé en raison de la mauvaise santé du propriétaire actuel. Le propriétaire est ouvert aux offres.',1,NULL,10.97,3.29,1991,'Bon',16,15,1,4);--Marque: Bruce Roberts & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_DESCRIPTION,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('TOF50658','Moody 31','blanc',70,0.4,'Essence',5,'Le Moody 31 est un petit croiseur familial bien construit qui a bien résisté à l''épreuve du temps. Un design moderne et actuel avec de grandes performances et un excellent logement, ils sont faciles à manipuler et amusants à naviguer.',1,NULL,9.45,3.3,1986,'Bon',11,8,1,5);--Marque: Moody & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_DESCRIPTION,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUF97643','Westerly Fulmar','rouge',112,0.6,'Essence',4,'Ce Westerly Fulmar de 1982 est une version à quille de ce croiseur familial populaire et durable, idéal pour naviguer dans les eaux de la côte Est/Kent et au-delà. Solidement construit et bien fini par Westerly Marine avec un intérieur conventionnel spacieux.',1,NULL,9.7,3.33,1982,'Neuf',9,1,4,6);--Marque: Westerly & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUF39495','Westerly Berwick','bleu',100,0.55,'Essence',5,1,9.14,3.05,1976,'Neuf',9,12,4,7);--Marque: Westerly & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUB74290','Nicholson 32','blanc',100,0.73,'Diesel',4,0,'Besoin de réparation au moteur',9.75,2.13,1972,'Mauvais',10,9,5,8);--Marque: Nicholson & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('MAF68208','Hunter Delta 25','vert',60,0.45,'Diesel',5,1,7.45,2.74,1980,'Neuf',8,15,5,9);--Marque: Hunter & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUF37023','Hunter Legend 26','bleu',70,0.67,'Diesel',4,1,7.92,2.74,1996,'Bon',8,14,5,10);--Marque: Hunter & Type : courses 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('TOR53026','Nautic Saintonge NS 44','blanc',97,0.98,'Diesel',6,1,13.4,4.2,1979,'Bon',7,15,6,11);--Marque: Nautic Saintonge & Type : Moteur 
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_DESCRIPTION,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('TOW49765','Moody S38','jaune',105,0.77,'Essence',6,'Si vous souhaitez goûter à la légendaire marque Moody et que vous Si vous aimez un yacht de luxe solide pour vous emmener, vous et votre famille, sur des croisières côtières ou longue distance, alors nous vous recommandons d''y jeter un coup d''œil',1,NULL,11.89,3.95,1996,'Neuf',11,8,10,12);--Marque: Moody & Type : Moteur



----------------TABLE : CLIENTELE----------------
DELETE FROM CLIENTELE;

INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (1, 'Thompson', 'Alice', 4, 'Cite Dupetit-Thouars', '75003', 'Paris', 'ThompsonAlice@msn.com', '0693283578');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (2, 'Martin', 'Sophie', 44, 'Rue d''Orsel', '75018', 'Paris', 'Sophie45@msn.com', '0146069341');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (3, 'White', 'Iona', 43, 'Rue de Levis', '75017', 'Paris', 'WhiteIona@msn.com', '0156790296');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (4, 'Robinson', 'Chloe', 61, 'Rue de Vouille', '75003', 'Paris', 'RobinsonChloe@msn.com', '0630496774');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (5, 'Moore', 'Lucia', 21, 'Boulevard de Reuilly', '75012', 'Paris', 'MooreLucia@msn.com', '0605840699');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (6, 'Walker', 'Dale', 101, ' Rue Vieille du Temple', '75008', 'Paris', 'WalkerDale@msn.com', '0142250220');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (7, 'Davies', 'Georgina', 48, 'rue de Lille', '91200', 'Île-de-France', 'DaviesGeorgina@gmail.com', '0693211578');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (8, 'Brown', 'Nicole', 35, 'Rue Hubert de Lisle', '56100', 'Bretagne', 'BrownNicole@gmail.com', '0229280449');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (9, 'Smith', 'Keira', 18, 'Avenue Jules Ferry', '13001', 'MARSEILLE', 'SmithKeira@gmail.com', '0404995975');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (10, 'Taylor', 'Haleema', 16, 'Rue de la Mare aux Carats', '13001', 'MARSEILLE', 'TaylorHaleema@msn.com', '0184012419');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (11, 'Jones', 'Tanisha', 50, 'Boulevard Amiral Courbet', '94310', 'Orly', 'JonesTanisha@gmail.com', '0139749610');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (12, 'Williams', 'Aliyah', 74, 'Boulevard Aristide Briand', '71200', 'Le creusot', 'WilliamsAliyah@hotmail.fr', '0338756253');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (13, 'Wilson', 'Willie', 16, 'Rue Jean Vilar', '24100', 'BERGERAC', 'WilsonWillie@msn.com', '0574719417');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (14, 'Johnson', 'Aimee', 78, 'Rue Cazade', '91210', 'Draveil', 'JohnsonAimee@gmail.com', '0158134536');
INSERT INTO CLIENTELE(CL_ID,CL_NOM,CL_PRENOM,CL_ADDR_NUM,CL_ADDR_RUE,CL_ADDR_CP,CL_ADDR_VILLE,CL_EMAIL,CL_TELEPHONE)
VALUES (15, 'Thomas', 'Deborah', 19, 'Rue des Belges', '77100', 'Meaux', 'ThomasDeborah@gmail.com', '0172656250');


----------------TABLE : RESERVATION----------------
DELETE FROM RESERVATION;
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(1,'MAF43878',TO_DATE('2022-04-20 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-04-22 10:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(2,'RUF43931',TO_DATE('2021-12-29 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-01-10 10:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(2,'MAF68208',TO_DATE('2022-03-20 11:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-03-25 11:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(3,'MAX20870',TO_DATE('2022-04-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-04-11 14:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(4,'TOF50658',TO_DATE('2022-02-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-03-10 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(7,'RUF97643',TO_DATE('2022-04-01 11:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-04-04 05:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(9,'TOR53026',TO_DATE('2023-02-15 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2023-02-18 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(9,'RUF37023',TO_DATE('2022-06-07 07:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-06-10 07:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(10,'MAF68208',TO_DATE('2022-11-20 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-11-22 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(11,'RUF37023',TO_DATE('2021-04-28 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2021-04-30 17:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(3,'RUF39495',TO_DATE('2022-06-09 10:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-06-20 10:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(8,'RUB74290',TO_DATE('2022-12-15 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-12-19 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(9,'MAF68208',TO_DATE('2022-10-31 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-11-03 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(15,'RUF39495',TO_DATE('2022-08-20 05:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-09-20 05:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(15,'TOR53026',TO_DATE('2022-03-22 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-04-22 10:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(13,'RUF37023',TO_DATE('2022-04-20 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-04-22 10:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(13,'RUF39495',TO_DATE('2022-09-16 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-09-18 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(13,'RUB74290',TO_DATE('2022-08-03 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-08-10 20:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(12,'TOR53026',TO_DATE('2024-01-03 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2024-01-03 22:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(12,'MAF68208',TO_DATE('2022-03-20 20:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2022-03-24 08:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(10,'RUF39495',TO_DATE('2023-04-02 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2023-04-22 09:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(1,'TOR53026',TO_DATE('2023-03-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2023-03-15 17:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(5,'RUB74290',TO_DATE('2015-03-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2015-03-18 20:00:00','yyyy-mm-dd hh24:mi:ss'));
