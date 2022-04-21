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
   FUNCTION consulterBateau(...); 

   -- Mise à jours
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

   FUNCTION consulterBateau(...)  RETURN ...
   IS 
   BEGIN 
      ...
   END consulterBateau; 
    

   PROCEDURE majBateau(...) 
   IS 
   BEGIN 
      ...
   END majBateau; 
   
   
END BATEAU_PACKAGE; 





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

CREATE OR REPLACE PACKAGE RESERVATION_PACKAGE AS 

   --Consulation
   FUNCTION prixReservation(bat_imma reservation.BT_IMMATRICULE%type, date_deb reservation.RES_DATE_DEBUT%type) RETURN number; 

END RESERVATION_PACKAGE; 
/

CREATE OR REPLACE PACKAGE BODY RESERVATION_PACKAGE AS 

   FUNCTION prixReservation(bat_imma reservation.BT_IMMATRICULE%type, date_deb reservation.RES_DATE_DEBUT%type) RETURN number
   IS 
        nbReservation number;
        prix number;
   BEGIN 
      SELECT COUNT(*) INTO nbReservation FROM RESERVATION WHERE BT_IMMATRICULE = bat_imma AND RES_DATE_DEBUT = date_deb;
      IF( nbReservation = 1 ) THEN
      SELECT 1 INTO prix FROM RESERVATION WHERE BT_IMMATRICULE = bat_imma AND RES_DATE_DEBUT = date_deb;
      ELSE
         RAISE_APPLICATION_ERROR(-20001,'Aucune réservation n''est enregistré pour ce bateau : "'||bat_imma||'", impossible de calculer le prix.');
      END IF;
      RETURN prix;
   END prixReservation; 

END RESERVATION_PACKAGE; 
/

DECLARE 
   prix number; 
BEGIN 
   prix := RESERVATION_PACKAGE.prixReservation('MAF43878',TO_DATE('2022-04-20 09:00:00','yyyy-mm-dd hh24:mi:ss')); 
   dbms_output.put_line('Prix de la réservation: ' || prix); 
END; 
/


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
-- Description : Le client 2 ne pourra pas réserver sur la périoide indiqué (req 2) car il impacte sur les dates du client 1 (req 1), une erreur sera déclanchée
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
    VALUES(1,'TOR53026',TO_DATE('2025-03-10 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2025-03-15 17:00:00','yyyy-mm-dd hh24:mi:ss'));
INSERT INTO RESERVATION(CL_ID,BT_IMMATRICULE,RES_DATE_DEBUT,RES_DATE_FIN)
   VALUES(2,'TOR53026',TO_DATE('2025-03-09 09:00:00','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2025-03-12 17:00:00','yyyy-mm-dd hh24:mi:ss'));

