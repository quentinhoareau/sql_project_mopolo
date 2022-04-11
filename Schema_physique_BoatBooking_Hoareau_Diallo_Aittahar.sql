-- Schema_physique_BoatBooking_Hoareau_Diallo_Aittahar.sql
/*==============================================================*/
/* Table : DROP FOR REBUILD                                     */
/*==============================================================*/
alter table
    BATEAU drop constraint FK_BATEAU_APPARTIENT_MARQUE;

alter table
    BATEAU drop constraint FK_BATEAU_CORRESPON_BATEAU_T;

alter table
    BATEAU drop constraint FK_BATEAU_SITUER_PORT;

alter table
    LOCATION drop constraint FK_LOCATION_LOCATION_BATEAU;

alter table
    LOCATION drop constraint FK_LOCATION_LOCATION2_CLIENT;

drop table BATEAU cascade constraints;

drop table BATEAU_TYPE cascade constraints;

drop table CLIENT cascade constraints;

drop table LOCATION cascade constraints;

drop table MARQUE cascade constraints;

drop table PORT cascade constraints;

/*==============================================================*/
/* Table : BATEAU_TYPE                                          */
/*==============================================================*/
-- Non valide
create table BATEAU_TYPE (
    BTYPE_ID NUMBER(2) not null constraint CKC_ID_BATEAU_TYPE check (BTYPE_ID >= 1),
    BTYPE_NOM VARCHAR(XX),
    BTYPE_PRIX_HEURE FLOAT(5) not null,
    constraint PK_BATEAU_TYPE primary key (BTYPE_ID)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
-- Non valide
create table CLIENT (
    CL_ID NUMBER(4) not null constraint CKC_CL_ID_CLIENT check (CL_ID >= 1),
    CL_NOM VARCHAR(XX) not null,
    CL_PRENOM VARCHAR(XX) not null,
    CL_ADDR_NUM NUMBER(4) not null constraint CKC_CL_ADDR_NUM_CLIENT check (CL_ADDR_NUM >= 1),
    CL_ADDR_RUE VARCHAR(XX) not null,
    CL_ADDR_CP VARCHAR(XX) not null,
    CL_ADDR_VILLE VARCHAR(XX) not null,
    CL_EMAIL VARCHAR(XX) not null,
    CL_SECOND_EMAIL VARCHAR(XX),
    CL_TELEPHONE_ VARCHAR(XX) not null,
    constraint PK_CLIENT primary key (CL_ID)
);

/*==============================================================*/
/* Table : MARQUE                                               */
/*==============================================================*/
-- Non valide
create table MARQUE (
    MRQ_ID NUMBER(4) not null,
    MRQ_NOM VARCHAR(XX) not null,
    MRQ_FABRICANT VARCHAR(XX) not null,
    MRQ_DESC VARCHAR(XX),
    MRQ_COEFF_MAJORATION FLOAT(3) not null constraint CKC_MRQ_COEFF_MAJORAT_MARQUE check (
        MRQ_COEFF_MAJORATION between 0.1
        and 1
    ),
    constraint PK_MARQUE primary key (MRQ_ID)
);

/*==============================================================*/
/* Table : PORT                                                 */
/*==============================================================*/
-- Validé
create table PORT (
    PRT_ID VARCHAR(30) not null,
    PRT_NOM VARCHAR(30) not null,
    PRT_ADDR_NUM NUMBER(4) not null constraint CKC_PRT_ADDR_NUM_PORT check (PRT_ADDR_NUM >= 1),
    PRT_ADDR_RUE VARCHAR(100) not null,
    PRT_ADDR_CP VARCHAR(5) not null,
    PRT_ADDR_VILLE VARCHAR(50) not null,
    PRT_CAP_BATEAU NUMBER(4) not null constraint CKC_PRT_CAP_BATEAU_PORT check (PRT_CAP_BATEAU >= 1),
    constraint PK_PORT primary key (PRT_ID)
);

/*==============================================================*/
/* Table : BATEAU                                               */
/*==============================================================*/
-- Non valide
create table BATEAU (
    BT_IMMATRICULE VARCHAR(8) not null,
    BT_NOM VARCHAR(30) not null constraint CKC_BT_NOM_BATEAU check (BT_NOM = upper(BT_NOM)),
    BT_PRT_NUM_EMPLACEMENT NUMBER(3) not null constraint CKC_BT_PRT_NUM_EMPLAC_PORT check (BT_PRT_NUM_EMPLACEMENT >= 1),
    
    BT_COULEUR VARCHAR(30) not null,
    BT_VITESSE_MAX FLOAT(6) not null constraint CKC_BT_VITESSE_MAX_BATEAU check (
        BT_VITESSE_MAX between 1
        and 600
    ),
    BT_LITRE_CARBURANT_HEURE FLOAT(6) not null constraint CKC_BT_LITRE_CARBURAN_BATEAU check (
        BT_LITRE_CARBURANT_HEURE between 1
        and 600
    ),
    BT_TYPE_CARBURANT VARCHAR(7) default 'Diesel' not null constraint CKC_BT_TYPE_CARBURANT_BATEAU check (BT_TYPE_CARBURANT in ('Diesel', 'Essence')),
    BT_MAX_PERSONNE NUMBER(2) default 1 not null constraint CKC_BT_MAX_PERSONNE_BATEAU check (BT_MAX_PERSONNE >= 1),
    BT_DESCRIPTION VARCHAR(300),
    BT_UTILISABLE SMALLINT default 1 not null constraint CKC_BT_UTILISABLE_BATEAU check (
        BT_UTILISABLE between 0
        and 1
        and BT_UTILISABLE in (0, 1)
    ),
    BT_NOTE VARCHAR(300),
    BT_LONGUEUR FLOAT(5) constraint CKC_BT_LONGUEUR_BATEAU check (
        BT_LONGUEUR is null
        or (BT_LONGUEUR >= 1)
    ),
    BT_LARGEUR FLOAT(5) constraint CKC_BT_LARGEUR_BATEAU check (
        BT_LARGEUR is null
        or (BT_LARGEUR >= 1)
    ),
    BT_ANNEE DATE not null,
    BT_ETAT VARCHAR(7) default 'Neuf' not null constraint CKC_BT_ETAT_BATEAU check (BT_ETAT in ('Neuf', 'Bon', 'Mauvais')),
    MRQ_ID NUMBER(4) not null constraint CKC_MRQ_ID_BATEAU check (MRQ_ID >= 1),
    BTYPE_ID NUMBER(2) not null constraint CKC_BT_ID_BATEAU check (BT_ID >= 1),
    PRT_ID VARCHAR(30) not null,
    constraint PK_BATEAU primary key (BT_IMMATRICULE),
    constraint FK_BATEAU_APPARTIENT_MARQUE foreign key (MRQ_ID) references MARQUE (MRQ_ID),
    constraint FK_BATEAU_CORRESPOND_BATEAU_TYPE foreign key (BTYPE_ID) references BATEAU_TYPE (BTYPE_ID),
    constraint FK_BATEAU_SITUER_PORT foreign key (PRT_ID) references PORT (PRT_ID)
);

/*==============================================================*/
/* Table : LOCATION                                             */
/*==============================================================*/
-- Non valide
create table LOCATION (
    CL_ID NUMBER(4) not null constraint CKC_CL_ID_LOCATION check (CL_ID >= 1),
    BT_IMMATRICULE VARCHAR(XX) not null,
    LOC_DATE_DEBUT DATE not null,
    LOC_DATE_FIN DATE not null,
    LOC_NOTE VARCHAR(XX),
    constraint PK_LOCATION primary key (CL_ID, BT_IMMATRICULE),
    constraint FK_LOCATION_LOCATION_BATEAU foreign key (BT_IMMATRICULE) references BATEAU (BT_IMMATRICULE),
    constraint FK_LOCATION_LOCATION2_CLIENT foreign key (CL_ID) references CLIENT (CL_ID)
);