-- Package_plsql_BoatBooking_Hoareau_Diallo_Aittahar.sql
-- Tuto/docs Package PLSQL : https://www.tutorialspoint.com/plsql/plsql_packages.htm

/*==============================================================*/
/* Package 1 - Table BATEAU :  
/*
/*==============================================================*/

CREATE OR REPLACE PACKAGE BATEAU_PACKAGE AS 
  
   -- Insertion
   PROCEDURE ajouterBateau(...); 
   
   -- Supression 
   PROCEDURE supprimerBateau(...); 

   --Consulation
   FUNCTION prixBateau(...); 

   --Mise à jours
   PROCEDURE majBateau(...); 
  
END BATEAU_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY BATEAU_PACKAGE AS 
   PROCEDURE ajouterBateau(...) 
   IS 
   BEGIN 
      ...
   END ajouterBateau; 
   
   PROCEDURE supprimerBateau(...) 
   IS 
   BEGIN 
      ...
   END supprimerBateau; 

   FUNCTION prixBateau(...) 
   IS 
   BEGIN 
      ...
   END prixBateau; 

   PROCEDURE majBateau(...) 
   IS 
   BEGIN 
      ...
   END majBateau; 
   
   
END BATEAU_PACKAGE; 
/




/*==============================================================*/
/* Package 2 - Table PORT :  
/*
/*==============================================================*/

...




/*==============================================================*/
/* Package 3 - Table BATEAU_TYPE :  
/*
/*==============================================================*/

...


/*==============================================================*/
/* Package 4 - Table CLIENTELE :  
/*
/*==============================================================*/

...


/*==============================================================*/
/* Package 5 - Table RESERVATION :  
/*
/*==============================================================*/

...


/*==============================================================*/
/* Package 6 - Table MARQUE :  
/*
/*==============================================================*/

...


/*==============================================================*/
/* Trigger 1 :   
/* [Description...]                                
/*==============================================================*/
--Création du trigger
...

--Utilisation du trigger
...




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
-- Description : Le client 2 ne pourra paz réserver sur la périoide indiqué (req 2) car il impacte sur les dates du client 1 (req 1), une erreur sera déclanchée
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(1,'TOR53026',TO_DATE('2025-03-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2025-03-15 17:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
   VALUES(2,'TOR53026',TO_DATE('2025-03-09 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2025-03-12 17:00:00','yyyy-mm-dd hh24:mi:ss'));

