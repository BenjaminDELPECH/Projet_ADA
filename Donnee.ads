WITH declaration_adherent.ads;
USE declaration_adherent.ads;

package Donnee is

   Procedure Sauvegarde ( tab: IN OUT T_Tabadherents );
   Procedure Ajout_Dans_Pile (Tab : in T_Tabadherent; P : in out T_PteurPileAdherents ); 
   
end Donnee;
