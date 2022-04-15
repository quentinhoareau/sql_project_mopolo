-- Insertions_lignes_BoatBooking_Hoareau_Diallo_Aittahar.sql
----------------TABLE : PORT----------------
-- INSERT INTO PORT VALUES(prt_id,prt_nom,prt_addr_num,prt_addr_rue,prt_addr_cp,prt_addr_ville,prt_cap_bateau);
DELETE
FROM PORT;

INSERT INTO PORT
VALUES (1,'Port de Toulon',13,'Rue Victor Micholet','83000','Toulon',10), 
(2,'Port de Saint-Gilles',3,'Port de St Gilles','97434','Saint-Gilles ',2), 
(3,'Port de Cap-d’Ail',1,'Av. du Port','06320','Cap-d''Ail',3), 
(4,'Port Vauban',1,'Av. de Verdun','06600','Antibes',10), 
(5,'Port Lympia',1430,'Quai Amiral Infernet','06300','Nice',4), 
(6,'Port Nice Carras',385,'Prom. des Anglais','06200','Nice',3), 
(7,'Port de la Rague',1,'Port de la Rague','06210','Mandelieu-la-Napoule',3), 
(8,'Port du Beal',110,'Bd du Midi Louise Moreau','06150','Cannes',5), 
(9,'Port de Pointe Croisette',1,'Bd de la Croisette','06400','Cannes',4), 
(10,'Port de Plaisance de Pornichet',1,'Port de Plaisance','44380','Pornichet',2);

----------------TABLE : BATEAU----------------
-- INSERT INTO BATEAU VALUES (MATRICULE,NOM,COULEUR,VITESSE_MAX,LITRE CARBURANT HEURE,TYPE CARBURANT,MAX_PERSONNE,DESCRIPTION,UTILISABLE,NOTE,LONG,LARG,ANNEE,ETAT);--Marque: XXXX & Type : XXX
DELETE
FROM BATEAU;

INSERT INTO BATEAU(MATRICULE,NOM,COULEUR,VITESSE_MAX,LITRE CARBURANT HEURE,TYPE_CARBURANT,MAX_PERSONNE,DESCRIPTION,UTILISABLE,NOTE,LONG,LARG,ANNEE,ETAT)
VALUES ('MAF43878','Hunter Channel 32','blanc',80,0.8,'Diesel',5,NULL,1,NULL,9.75,3.12,1993,'Neuf'); --Marque: Hunter & Type : Moteur 
('RUF43931','Nicholson 303','rouge',110,0.8,'Diesel',5,'Le Nicholson 303 offre cinq couchettes dans deux cabines avec une salle d''eau séparée entre la cabine avant et le carré principal.',0,'Bateau en mauvaise état et besoin de réparation ',9.14,3.11,1979,'Mauvais'),--Marque: Nicholson & Type : Cabine 
('MAX20870','Wauquiez Pilot Saloon 48','blanc',130,0.9,'Diesel',8,'Un croiseur d''eau bleue parfait. Le Pilot Saloon 48 est la quintessence du savoir-faire Wauquiez en matière de conception et de construction de yachts haut de gamme.',1,NULL,14.77,4.61,2022,'Neuf'),--Marque: Wauquiez & Type : Moteur 
('TOF75670','Bruce Roberts 36','bleu',100,1,'Essence',2,'La coque en acier Bruce Roberts 36 constitue un choix solide de navire pour la croisière hauturière, l''entraînement à la Moteur ou la croisière côtière. Ceci est vendu comme un projet inachevé en raison de la mauvaise santé du propriétaire actuel. Le propriétaire est ouvert aux offres.',1,NULL,10.97,3.29,1991,'Bon'),--Marque: Bruce Roberts & Type : Moteur 
('TOF50658','Moody 31','blanc',70,0.4,'Essence',5,'Le Moody 31 est un petit croiseur familial bien construit qui a bien résisté à l''épreuve du temps. Un design moderne et actuel avec de grandes performances et un excellent logement, ils sont faciles à manipuler et amusants à naviguer.',1,NULL,9.45,3.3,1986,'Bon'),--Marque: Moody & Type : Moteur 
('RUF97643','Westerly Fulmar','rouge',112,0.6,'Essence',4,'Ce Westerly Fulmar de 1982 est une version à quille de ce croiseur familial populaire et durable, idéal pour naviguer dans les eaux de la côte Est/Kent et au-delà. Solidement construit et bien fini par Westerly Marine avec un intérieur conventionnel spacieux.',1,NULL,9.7,3.33,1982,'Neuf'),--Marque: Westerly & Type : Moteur 
('RUF39495','Westerly Berwick','bleu',100,0.55,'Essence',5,NULL,1,NULL,9.14,3.05,1976,'Neuf'),--Marque: Westerly & Type : Moteur 
('RUB74290','Nicholson 32','blanc',100,0.73,'Diesel',4,NULL,0,'Besoin de réparation au moteur',9.75,2.13,1972,'Mauvais'),--Marque: Nicholson & Type : Moteur 
('MAF68208','Hunter Delta 25','vert',60,0.45,'Diesel',5,NULL,1,NULL,7.45,2.74,1980,'Neuf'),--Marque: Hunter & Type : Moteur 
('RUF37023','Hunter Legend 26','bleu',70,0.67,'Diesel',4,NULL,1,NULL,7.92,2.74,1996,'Bon'),--Marque: Hunter & Type : courses 
('TOR53026','Nautic Saintonge NS 44','blanc',97,0.98,'Diesel',6,NULL,1,NULL,13.4,4.2,1979,'Bon'),--Marque: Nautic Saintonge & Type : Moteur 
('TOW49765','Moody S38','jaune',105,0.77,'Essence',6,'Si vous souhaitez goûter à la légendaire marque Moody et que vous Si vous aimez un yacht de luxe solide pour vous emmener, vous et votre famille, sur des croisières côtières ou longue distance, alors nous vous recommandons d''y jeter un coup d''œil',1,NULL,11.89,3.95,1996,'Neuf');--Marque: Moody & Type : Moteur
----------------TABLE : MARQUE----------------
DELETE
FROM MARQUE;

INSERT INTO MARQUE
VALUES (2,'Boston-Whaler','Boston-Whaler','Que vous soyez en train de pêcher, de naviguer ou les deux, les bateaux Boston-Whaler vous offrent des expériences et un confort de première qualité. Ils sont fabriqués avec une conception intelligente, une construction de haute qualité et une technologie d''avant-garde',0.90), 
(3,'ZODAC','ZODAC','ZODAC est un constructeur français spécialisé dans les bateaux pneumatiques. Il est l’expert et pionnier dans l’exploration de l’air et de l’eau. Les bateaux Zodiac se caractérisent par une innovation constante dans les matériaux utilisés, avec des semi-rigides solides et légers à la fois ce qui augmente la longévité de chaque unité fabriquée',0.85), 
(4,'Quicksilver','Quicksilver','Quicksilver fait partie du groupe Brunswick Corporation. Quicksilver est connu pour ses gammes de bateaux qui allient avec aisance fonctionnalité et sécurité le tout dans un style unique. Ce sont des bateaux dont la coque en V permet de fendre aisément les mers avec tout le confort nécessaire sur un bateau',0.80), 
(5,'Bayliner','Bayliner','Bayliner a été fondée en 1957 par Orin Edson, il compte actuellement plus de 400 concessionnaires dans plus de 60 pays à travers le monde. La marque Bayliner a pour caractéristique principale la variété des coques de ses bateaux et la polyvalence de chaque modèle',0.75), 
(6,'Bénéteau','Bénéteau','Les principales caractéristiques du chantier Bénéteau sont l’innovation, le design et la simplicité. C’est une marque pleine charme et de style qui vous offre un large éventail de gammes pour tous styles de navigation, que ce soit dans la plaisance ou dans les courses professionnelles',0.70);

----------------TABLE : BATEAU_TYPE----------------
DELETE
FROM BATEAU_TYPE;

INSERT INTO BATEAU_TYPE
VALUES (1, 'COQUE-OPEN', 2000), 
(2, 'CABINE', 1500), 
(3, 'SEMI-RIGIDE', 1000), 
(4, 'COURSE', 700), 
(5, 'SPORTS NAUTIQUE', 500), 
(6, 'JET-SKI', 50), 
(7, 'VOILIER', 200), 
(8, 'LUXE', 3500);

----------------TABLE : CLIENT----------------
DELETE
FROM CLIENT;

INSERT INTO CLIENT
VALUES (1, 'Thompson', 'Alice', 4, 'Cite Dupetit-Thouars', '75003', 'Paris', 'ThompsonAlice@msn.com', '0693283578'),
(2, 'Martin', 'Sophie', 44, 'Rue d\'Orsel', '75018', 'Paris', 'Sophie45@msn.com', '0146069341'),
(3, 'White', 'Iona', 43, 'Rue de Levis', '75017', 'Paris', 'WhiteIona@msn.com', '0156790296'),
(4, 'Robinson', 'Chloe', 61, 'Rue de Vouille', '75003', 'Paris', 'RobinsonChloe@msn.com', '0630496774'),
(5, 'Moore', 'Lucia', 21, 'Boulevard de Reuilly', '75012', 'Paris', 'MooreLucia@msn.com', '06058406999'),
(6, 'Walker', 'Dale', 101, ' Rue Vieille du Temple', '75008', 'Paris', 'WalkerDale@msn.com', '0142250220'),
(7, 'Davies', 'Georgina', 48, 'rue de Lille', '91200', 'Île-de-France', 'DaviesGeorgina@gmail.com', '0693211578'),
(8, 'Brown', 'Nicole', 35, 'Rue Hubert de Lisle', '56100', 'Bretagne', 'BrownNicole@gmail.com', '0229280449'),
(9, 'Smith', 'Keira', 18, 'Avenue Jules Ferry', '13001', 'MARSEILLE', 'SmithKeira@gmail.com', '0404995975'),
(10, 'Taylor', 'Haleema', 16, 'Rue de la Mare aux Carats', '93100', 'MONTREUIL', 'TaylorHaleema@msn.com', '0184012419'),
(11, 'Jones', 'Tanisha', 50, 'Boulevard Amiral Courbet', '94310', 'Orly', 'JonesTanisha@gmail.com', '0139749610'),
(12, 'Williams', 'Aliyah', 74, 'Boulevard Aristide Briand', '71200', 'Le creusot', 'WilliamsAliyah@hotmail.fr', '0338756253'),
(13, 'Wilson', 'Willie', 16, 'Rue Jean Vilar', '24100', 'BERGERAC', 'WilsonWillie@msn.com', '0574719417'),
(14, 'Johnson', 'Aimee', 78, 'Rue Cazade', '91210', 'Draveil', 'JohnsonAimee@gmail.com', '0158134536'),
(15, 'Thomas', 'Deborah', 19, 'Rue des Belges', '77100', 'Meaux', 'ThomasDeborah@gmail.com', '0172656250');

