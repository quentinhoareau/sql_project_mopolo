-- Package_plsql_BoatBooking_Hoareau_Diallo_Aittahar.sql
-- Tuto/docs Package PLSQL : https://www.tutorialspoint.com/plsql/plsql_packages.htm

/*==============================================================*/
/* Package 1 - Table BATEAU :  
/*
/*==============================================================*/
set serveroutput on ;
CREATE OR REPLACE PACKAGE BATEAU_PACKAGE AS 
  
   -- Insertion
   -- PROCEDURE ajouterBateau(...); 

   --Consulation
   FUNCTION nbBateauUtilisable RETURN number; 
END BATEAU_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY BATEAU_PACKAGE AS 
   -- PROCEDURE ajouterBateau(...)
   -- IS 
   -- BEGIN 
   --    ...
   -- END ajouterBateau; 


   FUNCTION nbBateauUtilisable  RETURN number
   IS 
      nbBateau number;
   BEGIN 
      SELECT COUNT(*) INTO nbBateau  FROM BATEAU WHERE BT_UTILISABLE = 1;
      RETURN nbBateau;
   END nbBateauUtilisable; 
    
END BATEAU_PACKAGE; 
/

-- Test de mon pakcage
DECLARE 
   nbBateauUtili number;
BEGIN 
   nbBateauUtili := BATEAU_PACKAGE.nbBateauUtilisable(); 
   dbms_output.put_line('Nombre de bateau(x) utilisable actuellement: ' || nbBateauUtili); 
END; 
/





/*==============================================================*/
/* Package 2 - Table PORT :  
/*
/*==============================================================*/
set serveroutput on
...




/*==============================================================*/
/* Package 3 - Table BATEAU_TYPE :  
/*
/*==============================================================*/
set serveroutput on
...


/*==============================================================*/
/* Package 4 - Table CLIENTELE :  
/*
/*==============================================================*/
set serveroutput on
...


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
...


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

