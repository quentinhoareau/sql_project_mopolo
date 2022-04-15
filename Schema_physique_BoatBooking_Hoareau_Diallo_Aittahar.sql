-- Schema_physique_BoatBooking_Hoareau_Diallo_Aittahar.sql
/*==============================================================*/
/* Table : DROP FOR REBUILD                                     */
/*==============================================================*/
ALTER TABLE
    BATEAU DROP constraint FK_BATEAU_APPARTIENT_MARQUE;

ALTER TABLE
    BATEAU DROP constraint FK_BATEAU_CORRESPON_BATEAU_T;

ALTER TABLE
    BATEAU DROP constraint FK_BATEAU_SITUER_PORT;

ALTER TABLE
    LOCATION DROP constraint FK_LOCATION_LOCATION_BATEAU;

ALTER TABLE
    LOCATION DROP constraint FK_LOCATION_LOCATION2_CLIENT;

DROP TABLE BATEAU CASCADE constraints;

DROP TABLE BATEAU_TYPE CASCADE constraints;

DROP TABLE CLIENT CASCADE constraints;

DROP TABLE LOCATION CASCADE constraints;

DROP TABLE MARQUE CASCADE constraints;

DROP TABLE PORT CASCADE constraints;

/*==============================================================*/
/* Table : BATEAU_TYPE                                          */
/*==============================================================*/
-- Non valide
CREATE TABLE BATEAU_TYPE (
    BTYPE_ID NUMBER(2) NOT NULL constraint CKC_ID_BATEAU_TYPE CHECK (BTYPE_ID >= 1),
    BTYPE_NOM VARCHAR(40) NOT NULL,
    BTYPE_PRIX_HEURE FLOAT(5) NOT NULL constraint ckc_btype_prix CHECK (BTYPE_PRIX_HEURE > 0),
    constraint PK_BATEAU_TYPE primary key (BTYPE_ID)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
-- Non valide
CREATE TABLE CLIENT (
    CL_ID NUMBER(4) NOT NULL constraint CKC_CL_ID_CLIENT CHECK (CL_ID >= 1),
    CL_NOM VARCHAR(30) NOT NULL constraint CKC_CL_NOM_CLIENT CHECK (CL_NOM = initcap (CL_NOM)),
    CL_PRENOM VARCHAR(30) NOT NULL constraint CKC_CL_PRENOM_CLIENT CHECK (CL_PRENOM = initcap (CL_PRENOM)),
    CL_ADDR_NUM NUMBER(4) NOT NULL constraint CKC_CL_ADDR_NUM_CLIENT CHECK (CL_ADDR_NUM >= 1),
    CL_ADDR_RUE VARCHAR(100) NOT NULL,
    CL_ADDR_CP VARCHAR(5) NOT NULL constraint CKC_CL_ADDR_CP_SIZE_CLIENT CHECK (length(CL_ADDR_CP) > 4),
    constraint CKC_CL_ADDR_CP_ONLY_NUMBER_CLIENT CHECK (REGEXP_LIKE(CL_ADDR_CP, '^[[:digit:]]{9}$')),
    CL_ADDR_VILLE VARCHAR(30) NOT NULL constraint CKC_CL_ADDR_VILLE_CLIENT CHECK (CL_ADDR_VILLE = initcap (CL_ADDR_VILLE)),
    CL_EMAIL VARCHAR(100) NOT NULL UNIQUE,
    CL_SECOND_EMAIL VARCHAR(100) UNIQUE,
    CL_TELEPHONE VARCHAR(10) NOT NULL UNIQUE constraint CKC_CL_TELEPHONE_LENGTH_CLIENT CHECK (length(CL_TELEPHONE) > 9),
    constraint CKC_CL_TELEPHONE_ONLY_NUMBER_CLIENT CHECK (REGEXP_LIKE(CL_TELEPHONE, '^[[:digit:]]{9}$')),
    constraint PK_CLIENT primary key (CL_ID)
);

/*==============================================================*/
/* Table : MARQUE                                               */
/*==============================================================*/
-- Non valide
CREATE TABLE MARQUE (
    MRQ_ID NUMBER(4) NOT NULL CONSTRAINT CKC_ID CHECK(MRQ_ID > 0),
    MRQ_NOM VARCHAR(50) NOT NULL,
    MRQ_FABRICANT VARCHAR(50) NOT NULL,
    MRQ_DESC VARCHAR(1000),
    MRQ_COEFF_MAJORATION FLOAT(3) NOT NULL constraint CKC_MRQ_COEFF_MAJORAT_MARQUE CHECK (
        MRQ_COEFF_MAJORATION BETWEEN 0
        AND 1
    ),
    constraint PK_MARQUE primary key (MRQ_ID)
);

/*==============================================================*/
/* Table : PORT                                                 */
/*==============================================================*/
-- Validé
CREATE TABLE PORT (
    PRT_ID VARCHAR(30) NOT NULL,
    PRT_NOM VARCHAR(30) NOT NULL,
    PRT_ADDR_NUM NUMBER(4) NOT NULL constraint CKC_PRT_ADDR_NUM_PORT CHECK (PRT_ADDR_NUM >= 1),
    PRT_ADDR_RUE VARCHAR(100) NOT NULL,
    PRT_ADDR_CP VARCHAR(5) NOT NULL,
    PRT_ADDR_VILLE VARCHAR(50) NOT NULL,
    PRT_CAP_BATEAU NUMBER(4) NOT NULL constraint CKC_PRT_CAP_BATEAU_PORT CHECK (PRT_CAP_BATEAU >= 1),
    constraint PK_PORT primary key (PRT_ID)
);

/*==============================================================*/
/* Table : BATEAU                                               */
/*==============================================================*/
-- Valide
CREATE TABLE BATEAU (
    BT_IMMATRICULE VARCHAR(8) constraint CKC_BT_IMMA CHECK (BT_IMMATRICULE = UPPER(BT_IMMATRICULE)),
    BT_NOM VARCHAR(30) NOT NULL constraint CKC_BT_NOM_BATEAU CHECK (
        BT_NOM = UPPER(SUBSTR(BT_NOM, 1, 1)) || SUBSTR(BT_NOM, 2, LENGTH(BT_NOM))
    ),
    BT_COULEUR VARCHAR(30) NOT NULL,
    BT_VITESSE_MAX FLOAT(6) NOT NULL constraint CKC_BT_VITESSE_MAX_BATEAU CHECK (
        BT_VITESSE_MAX BETWEEN 1
        AND 600
    ),
    BT_LITRE_CARBURANT_HEURE FLOAT(6) NOT NULL constraint CKC_BT_LITRE_CARBURAN_BATEAU CHECK (BT_LITRE_CARBURANT_HEURE > 0),
    BT_TYPE_CARBURANT VARCHAR(7) DEFAULT 'Diesel' NOT NULL constraint CKC_BT_TYPE_CARBURANT_BATEAU CHECK (BT_TYPE_CARBURANT IN ('Diesel', 'Essence')),
    BT_MAX_PERSONNE NUMBER(2) DEFAULT 1 NOT NULL constraint CKC_BT_MAX_PERSONNE_BATEAU CHECK (BT_MAX_PERSONNE >= 1),
    BT_DESCRIPTION VARCHAR(300),
    BT_UTILISABLE SMALLINT DEFAULT 1 NOT NULL constraint CKC_BT_UTILISABLE_BATEAU CHECK (
        BT_UTILISABLE BETWEEN 0
        AND 1
        AND BT_UTILISABLE IN (0, 1)
    ),
    BT_NOTE VARCHAR(300),
    BT_LONGUEUR FLOAT(5) constraint CKC_BT_LONGUEUR_BATEAU CHECK ((BT_LONGUEUR >= 1)),
    BT_LARGEUR FLOAT(5) constraint CKC_BT_LARGEUR_BATEAU CHECK (BT_LARGEUR >= 1),
    BT_ANNEE NUMBER(4),
    BT_ETAT VARCHAR(7) DEFAULT 'Neuf' NOT NULL constraint CKC_BT_ETAT_BATEAU CHECK (BT_ETAT IN ('Neuf', 'Bon', 'Mauvais')),
    MRQ_ID NUMBER(4) NOT NULL,
    BTYPE_ID NUMBER(2) NOT NULL,
    PRT_ID VARCHAR(30) NOT NULL,
    BT_PRT_NUM_EMPLACEMENT NUMBER(3) NOT NULL constraint CKC_BT_PRT_NUM_EMPLAC_PORT CHECK (BT_PRT_NUM_EMPLACEMENT >= 1),
    constraint UNIQUE_NUM_PORT_BT unique (PRT_ID, BT_PRT_NUM_EMPLACEMENT),
    constraint PK_BATEAU primary key (BT_IMMATRICULE),
    constraint FK_BATEAU_APPARTIENT_MARQUE foreign key (MRQ_ID) references MARQUE (MRQ_ID),
    constraint FK_BATEAU_CORRESPOND_BATEAU_TYPE foreign key (BTYPE_ID) references BATEAU_TYPE (BTYPE_ID),
    constraint FK_BATEAU_SITUER_PORT foreign key (PRT_ID) references PORT (PRT_ID)
);

/*==============================================================*/
/* Table : LOCATION                                             */
/*==============================================================*/
-- Valide
CREATE TABLE LOCATION (
    CL_ID NUMBER(4) NOT NULL,
    BT_IMMATRICULE VARCHAR(8) NOT NULL,
    LOC_DATE_DEBUT DATE NOT NULL,
    LOC_DATE_FIN DATE NOT NULL,
    LOC_NOTE VARCHAR(300),
    constraint PK_LOCATION primary key (CL_ID, BT_IMMATRICULE),
    constraint FK_LOCATION_BATEAU foreign key (BT_IMMATRICULE) references BATEAU (BT_IMMATRICULE),
    constraint FK_LOCATION_CLIENT foreign key (CL_ID) references CLIENT (CL_ID)
);