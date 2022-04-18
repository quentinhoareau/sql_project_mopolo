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
   END addCustomer; 
   
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
   END prixBateau; 
   
   
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
/* [Description...]                                   
/*==============================================================*/
--Création du trigger
...

--Utilisation du trigger
...
