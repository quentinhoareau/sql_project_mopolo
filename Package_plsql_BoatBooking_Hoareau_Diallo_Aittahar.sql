-- Package_plsql_BoatBooking_Hoareau_Diallo_Aittahar.sql
-- Tuto/docs Package PLSQL : https://www.tutorialspoint.com/plsql/plsql_packages.htm

/*==============================================================*/
/* Package 1 - Table BATEAU :  
/*
/*==============================================================*/
set serveroutput on ;
CREATE OR REPLACE PACKAGE BATEAU_PACKAGE AS 

   -- Retourne le nombre de bateau utlisable actuellement 
   FUNCTION nbBateauUtilisablePort(name_port PORT.PRT_NOM%type) RETURN number; 

   -- Mettre à jours tous les status (utilisable ou non) dees bateaux situé sur un port donnée en paramètre
   PROCEDURE updateBateauStatusParPort(name_port PORT.PRT_NOM%type, utilisable BATEAU.BT_UTILISABLE%type); 

END BATEAU_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY BATEAU_PACKAGE AS 

   -- Retourne le nombre de bateau utlisable actuellement sur un port donné
   FUNCTION nbBateauUtilisablePort(name_port PORT.PRT_NOM%type)  RETURN number
   IS 
      nbBateau number;
   BEGIN 
      SELECT COUNT(*) INTO nbBateau 
      FROM BATEAU b
      INNER JOIN PORT p ON p.PRT_ID = b.PRT_ID
      WHERE b.BT_UTILISABLE = 1
      AND p.PRT_NOM = name_port;
      RETURN nbBateau;
   END nbBateauUtilisablePort; 

   -- Mettre à jours tous les status (utilisable ou non) dees bateaux situé sur un port donnée en paramètre
   PROCEDURE updateBateauStatusParPort(name_port PORT.PRT_NOM%type, utilisable BATEAU.BT_UTILISABLE%type)
   IS 
   BEGIN 
      UPDATE BATEAU
      SET BT_UTILISABLE = utilisable
      WHERE PRT_ID = (SELECT PRT_ID FROM PORT WHERE  prt_nom = name_port );
      dbms_output.put_line('Requête update exécutée...'); 
   END updateBateauStatusParPort; 
    
END BATEAU_PACKAGE; 
/

-- Test de mon pakcage
DECLARE 
   nbBateauUtili number;
   portConcerne PORT.PRT_NOM%type;
BEGIN 
   portConcerne := 'Port Lympia';
   nbBateauUtili := BATEAU_PACKAGE.nbBateauUtilisablePort(portConcerne); 
   dbms_output.put_line('Nombre de bateau(x) sur le port : "' || portConcerne ||'" utilisable actuellement: ' || nbBateauUtili); 

   BATEAU_PACKAGE.updateBateauStatusParPort(portConcerne, 1); 
   nbBateauUtili := BATEAU_PACKAGE.nbBateauUtilisablePort(portConcerne); 
   dbms_output.put_line('Nombre de bateau(x) APRES UPDATE utilisable sur le port : ' || nbBateauUtili); 
END; 
/





/*==============================================================*/
/* Package 2 - Table PORT :  
/*
/*==============================================================*/
set serveroutput on ;
CREATE OR REPLACE PACKAGE PORT_PACKAGE AS 

   -- Retourne le nombre de place dans un port (capacité total)
   FUNCTION nbPlacePort(name_port PORT.PRT_NOM%type) RETURN number; 

   -- Mettre à jours la capacité total de place dans un port donné
   PROCEDURE updatePortCapBat(name_port PORT.PRT_NOM%type, cap number); 

END PORT_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY PORT_PACKAGE AS 

   -- Retourne le nombre de place dans un port (capacité total)
   FUNCTION nbPlacePort(name_port PORT.PRT_NOM%type)  RETURN number
   IS 
      capBat number;
   BEGIN 
      SELECT PRT_CAP_BATEAU INTO capBat 
      FROM PORT
      WHERE PRT_NOM = name_port;
      RETURN capBat;
   END nbPlacePort; 

   -- Mettre à jours la capacité total de place dans un port donné
   PROCEDURE updatePortCapBat(name_port PORT.PRT_NOM%type, cap number)
   IS 
   BEGIN 
      UPDATE PORT
      SET PRT_CAP_BATEAU = cap
      WHERE PRT_ID = (SELECT PRT_ID FROM PORT WHERE  PRT_NOM = name_port );
      dbms_output.put_line('Requête update sur la table PORT exécutée...'); 
   END updatePortCapBat; 
    
END PORT_PACKAGE; 
/

-- Test de mon pakcage
DECLARE 
   cap number;
   port_name PORT.PRT_NOM%type;
BEGIN 
   port_name := 'Port Lympia';
   
   cap := PORT_PACKAGE.nbPlacePort(port_name); 
   dbms_output.put_line('Capacité total du port AVANT UPDATE : ' || cap); 
   PORT_PACKAGE.updatePortCapBat(port_name, 20); 
   cap := PORT_PACKAGE.nbPlacePort(port_name); 
   dbms_output.put_line('Capacité total du port APRES UPDATE : ' || cap); 
END; 
/





/*==============================================================*/
/* Package 3 - Table BATEAU_TYPE :  
/*
/*==============================================================*/
set serveroutput on
CREATE OR REPLACE PACKAGE BATEAU_TYPE_PACKAGE AS
-- consultation du prix par heure de location de type de bateau.
   FUNCTION prixParHeureDeLocation(nom_btype BATEAU_TYPE.BTYPE_NOM%TYPE) RETURN NUMBER;
-- Ajout d'un type de bateau
   PROCEDURE ajouterUnTypeDeBateau(nom BATEAU_TYPE.BTYPE_NOM%TYPE, prix BATEAU_TYPE.BTYPE_PRIX_HEURE%TYPE);
END BATEAU_TYPE_PACKAGE;
/
CREATE OR REPLACE PACKAGE BODY BATEAU_TYPE_PACKAGE AS
-- consultation du prix par heure de location de type de bateau.
   FUNCTION prixParHeureDeLocation(nom_btype BATEAU_TYPE.BTYPE_NOM%TYPE) RETURN NUMBER
   IS
      prixExiste number;
      prixHL BATEAU_TYPE.BTYPE_PRIX_HEURE%TYPE;
   BEGIN
      SELECT count(*) INTO prixExiste
      FROM BATEAU_TYPE BTYPE 
      WHERE BTYPE.BTYPE_NOM = nom_btype;
      IF(prixExiste = 1) THEN
      SELECT BTYPE.BTYPE_PRIX_HEURE INTO prixHL
      FROM BATEAU_TYPE BTYPE 
      WHERE BTYPE.BTYPE_NOM = nom_btype;
      ELSE
         RAISE_APPLICATION_ERROR(-20001,'Aucun type de bateau n''est enregistré pour ce nom : "'||nom_btype||'", impossible de trouver le prix.');
      END IF;
      RETURN prixHL;
   END prixParHeureDeLocation;

   -- Ajout d'un type de bateau
   PROCEDURE ajouterUnTypeDeBateau(nom BATEAU_TYPE.BTYPE_NOM%TYPE, prix BATEAU_TYPE.BTYPE_PRIX_HEURE%TYPE)
   IS
      id_btype BATEAU_TYPE.BTYPE_ID%TYPE;
      counter NUMBER;
   BEGIN
      SELECT COUNT(*) INTO counter
      FROM BATEAU_TYPE
      WHERE BTYPE_NOM = nom;
      IF(counter != 1) THEN
         SELECT MAX(BTYPE_ID) + 1 INTO id_btype
         FROM BATEAU_TYPE;
         INSERT INTO BATEAU_TYPE VALUES(id_btype, nom, prix);
      ELSE
         RAISE_APPLICATION_ERROR(-20001,'Le type de bateau: '||nom||' existe deja.');
      END IF;
   END ajouterUnTypeDeBateau;

END BATEAU_TYPE_PACKAGE;
/

DECLARE 
   prix number; 
   nom_btype BATEAU_TYPE.BTYPE_NOM%TYPE;
BEGIN 
   nom_btype := 'CABINE';
   
   prix := bateau_type_package.prixParHeureDeLocation(nom_btype); 
   dbms_output.put_line('Le Prix de la location du type de bateau ' ||nom_btype|| ' est ' || prix);
   
   dbms_output.put_line('=========================================================================');
   BATEAU_TYPE_PACKAGE.ajouterUnTypeDeBateau(nom_btype, 9.5);
   dbms_output.put_line('Le type de bateau ' ||nom_btype|| '  a été bien ajouté');
END; 
/

/*==============================================================*/
/* Package 4 - Table CLIENTELE :  
/*
/*==============================================================*/
set serveroutput on ;
CREATE OR REPLACE PACKAGE CLIENTELE_PACKAGE AS 

   -- Retourne le nombre de client qui habitent dans une ville donnée
   FUNCTION nbClient(ville CLIENTELE.CL_ADDR_VILLE%type) RETURN number; 

   -- Mettre à jours le code postal d'une ville
   PROCEDURE updateVilleCP(ville CLIENTELE.CL_ADDR_VILLE%type, code CLIENTELE.CL_ADDR_CP%type); 

END CLIENTELE_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY CLIENTELE_PACKAGE AS 

   -- Retourne le nombre de client qui habitent à Paris
   FUNCTION nbClient(ville CLIENTELE.CL_ADDR_VILLE%type)  RETURN number
   IS 
      nb_cl number;
   BEGIN 
      SELECT COUNT(*) INTO nb_cl 
      FROM CLIENTELE
      WHERE CL_ADDR_VILLE = ville;
      RETURN nb_cl;
   END nbClient; 

  -- Mettre à jours le code postal d'une ville
   PROCEDURE updateVilleCP(ville CLIENTELE.CL_ADDR_VILLE%type, code CLIENTELE.CL_ADDR_CP%type)
   IS 
   BEGIN 
      UPDATE CLIENTELE
      SET CL_ADDR_CP = code
      WHERE CL_ADDR_VILLE = ville;
      dbms_output.put_line('Requête update sur la table CLIENTELE exécutée...'); 
   END updateVilleCP; 
    
END CLIENTELE_PACKAGE; 
/

-- Test de mon pakcage
DECLARE 
    code CLIENTELE.CL_ADDR_CP%type := 75000;
    nb_cl number;
    ville CLIENTELE.CL_ADDR_VILLE%type;
BEGIN 
   ville := 'Paris';
   nb_cl := CLIENTELE_PACKAGE.nbClient(ville); 
   dbms_output.put_line('Nombre de client dans la ville de "' || ville ||'"  : ' || nb_cl); 

   CLIENTELE_PACKAGE.updateVilleCP(ville, code); 
END; 
/



/*==============================================================*/
/* Package 5 - Table RESERVATION :  
/*
/*==============================================================*/
set serveroutput on
CREATE OR REPLACE PACKAGE RESERVATION_PACKAGE AS 

   --Consulation du prix de réservation pour un bateau et une date de début donnée existante
   FUNCTION prixReservation(bat_imma reservation.BT_IMMATRICULE%type, date_deb reservation.RES_DATE_DEBUT%type) RETURN number; 

   --Supprimer tous les réservation d'un client 
   PROCEDURE supprimerReservationClient(cl_id CLIENTELE.CL_ID%type); 

END RESERVATION_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY RESERVATION_PACKAGE AS 

    --Consulation du prix de réservation pour un bateau et une date de début donnée existante
   FUNCTION prixReservation(bat_imma reservation.BT_IMMATRICULE%type, date_deb reservation.RES_DATE_DEBUT%type) RETURN number
   IS 
        nbReservation number;
        prix number;
   BEGIN 
      SELECT COUNT(*) INTO nbReservation FROM RESERVATION WHERE BT_IMMATRICULE = bat_imma AND RES_DATE_DEBUT = date_deb;
      IF( nbReservation = 1 ) THEN
      SELECT 
         BTPE.BTYPE_PRIX_HEURE * (24 * (to_date(to_char(RES.RES_DATE_FIN, 'YYYY-MM-DD hh24:mi'), 'YYYY-MM-DD hh24:mi') - to_date(to_char(RES.RES_DATE_DEBUT, 'YYYY-MM-DD hh24:mi'), 'YYYY-MM-DD hh24:mi') )) * MQ.MRQ_COEFF_MAJORATION 
         INTO prix
      FROM RESERVATION RES
      INNER JOIN BATEAU BT ON BT.BT_IMMATRICULE = RES.BT_IMMATRICULE
      INNER JOIN MARQUE MQ ON BT.MRQ_ID = MQ.MRQ_ID
      INNER JOIN CLIENTELE CL ON RES.CL_ID = CL.CL_ID
      INNER JOIN BATEAU_TYPE BTPE ON BT.BTYPE_ID = BTPE.BTYPE_ID
      WHERE BT.BT_IMMATRICULE = bat_imma
      AND RES.RES_DATE_DEBUT = date_deb;
      
      ELSE
         RAISE_APPLICATION_ERROR(-20001,'Aucune réservation n''est enregistré pour ce bateau : "'||bat_imma||'", impossible de calculer le prix.');
      END IF;
      RETURN prix;
   END prixReservation; 

   --Supprimer tous les réservation d'un client 
   PROCEDURE supprimerReservationClient(cl_id CLIENTELE.CL_ID%type)  IS 
   BEGIN 
      DELETE FROM RESERVATION 
      WHERE RESERVATION.CL_ID = cl_id; 
   END supprimerReservationClient;  



END RESERVATION_PACKAGE; 
/
-- Test de mon pakcage
DECLARE 
   prix number; 
   imma reservation.BT_IMMATRICULE%type;
   date_debut reservation.RES_DATE_DEBUT%type;
BEGIN 
   imma:= 'MAF43878';
   date_debut:= TO_DATE('2022-04-20 09:00:00','yyyy-mm-dd hh24:mi:ss');
   
   prix := RESERVATION_PACKAGE.prixReservation(imma,date_debut); 
   dbms_output.put_line('Prix de la réservation: ' || prix); 
   RESERVATION_PACKAGE.supprimerReservationClient(5);
END; 
/


/*==============================================================*/
/* Package 6 - Table MARQUE :
/*
/*==============================================================*/
set serveroutput on
CREATE OR REPLACE PACKAGE MARQUE_PACKAGE AS
-- Verifier qu'une marque de bateau existe.
   PROCEDURE verifExistMarque(nom_marque MARQUE.MRQ_NOM%TYPE);
END MARQUE_PACKAGE;
/
CREATE OR REPLACE PACKAGE BODY MARQUE_PACKAGE AS
-- Verifier qu'une marque de bateau existe.
   PROCEDURE verifExistMarque(nom_marque MARQUE.MRQ_NOM%TYPE)
   IS
      existe number;
   BEGIN
      SELECT COUNT(*) INTO existe
      FROM MARQUE MRQ 
      WHERE MRQ.MRQ_NOM = nom_marque;
      IF(existe != 1) THEN
         RAISE_APPLICATION_ERROR(-20001,'Aucune marque n''est enregistré pour ce nom : "'||nom_marque);
      END IF;
   END verifExistMarque;
END MARQUE_PACKAGE;
/

DECLARE 
   nom_marque MARQUE.MRQ_NOM%TYPE;
BEGIN 
   nom_marque := 'Hunter';
   
   MARQUE_PACKAGE.verifExistMarque(nom_marque); 
   dbms_output.put_line('La marque de bateau ' ||nom_marque||' existe');
END; 
/


/*==============================================================*/
/* Trigger 1 :   
/* Empêcher de mettre un bateau sur un port dont la capacité est plein. 
/* Exemple : Le port de Toulon peut avoir 10 bateau maximum sur son port. 
/* Si une requête INSERT ou UPDATE est exécuté sur cette table alors on vérifie si la capacité peut accueillir un autre bateau, 
/* si n'est pas le cas générer une exception customisé.                               
/*==============================================================*/
--Création du trigger
CREATE OR REPLACE TRIGGER TRIGGER_BATEAU_PORT
  BEFORE INSERT OR UPDATE ON BATEAU
  FOR EACH ROW
  DECLARE
      nb_total number(4);
      nb_bat number(4);
  BEGIN
      nb_total := 0;
      nb_bat := 0;

      SELECT PRT_CAP_BATEAU INTO nb_total
      FROM PORT
      WHERE PRT_ID = :new.PRT_ID;

      SELECT COUNT(*) INTO nb_bat
      FROM BATEAU
      WHERE PRT_ID = :new.PRT_ID;

      IF (nb_bat >= nb_total)
          THEN RAISE_APPLICATION_ERROR(-20000,'Impossible d''ajouter un bateau, le port est complet');
      END IF;
  END TRIGGER_BATEAU_PORT;
 /

-- Tester le trigger :
-- Description : On ne pourra pas ajouter les 2 bateaux dans le Port Lympia car il possède déjà 3 bateaux sur 4 places disponibles, seulement le NicholsonOne pourra être enregistré.
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUB71118','NicholsonOne','blanc',100,0.73,'Diesel',4,1,NULL,9.75,2.13,1972,'Bon',10,9,5,12);
INSERT INTO BATEAU(BT_IMMATRICULE,BT_NOM,BT_COULEUR,BT_VITESSE_MAX,BT_LITRE_CARBURANT_HEURE,BT_TYPE_CARBURANT,BT_MAX_PERSONNE,BT_UTILISABLE,BT_NOTE,BT_LONGUEUR,BT_LARGEUR,BT_ANNEE,BT_ETAT,MRQ_ID,BTYPE_ID,PRT_ID,BT_PRT_NUM_EMPLACEMENT)
   VALUES ('RUB74008','NicholsonTwo','jaune',100,0.73,'Diesel',4,0,'Besoin de réparation au moteur',9.75,2.13,1972,'Mauvais',10,9,5,13);




/*==============================================================*/
/* Trigger 2 :
/* Un même bateau ne peut être loué sur un même créneau horaire                   
/*==============================================================*/
--Création du trigger
CREATE OR REPLACE TRIGGER RESERVATION_CHECK
    BEFORE INSERT OR UPDATE ON RESERVATION
    FOR EACH ROW
    DECLARE
        nbResByDates number(2);
    BEGIN
        SELECT COUNT(*) INTO nbResByDates FROM RESERVATION
        WHERE (( RES_DATE_DEBUT BETWEEN :NEW.RES_DATE_DEBUT AND :NEW.RES_DATE_FIN)
        OR ( RES_DATE_FIN BETWEEN :NEW.RES_DATE_DEBUT AND :NEW.RES_DATE_FIN))
        AND BT_IMMATRICULE = :NEW.BT_IMMATRICULE;
       
       IF nbResByDates >= 1 THEN 
            RAISE_APPLICATION_ERROR(-20001,'Impossible de réserver sur ce crénaux pour le BATEAU : "'||:NEW.BT_IMMATRICULE||'" car une autre réservation est déjà programmée sur les mêmes dates.');
       END IF;
       
    END;
/

-- Tester le trigger :
-- Description : Le client 2 ne pourra pas réserver sur la périoide indiqué (req 2) car il impacte sur les dates du client 1 (req 1), une erreur sera déclanchée
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(1,'TOR53026',TO_DATE('2025-03-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2025-03-15 17:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
   VALUES(2,'TOR53026',TO_DATE('2025-03-09 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2025-03-12 17:00:00','yyyy-mm-dd hh24:mi:ss'));

