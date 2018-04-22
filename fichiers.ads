with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,Ada.Sequential_IO,declaration_adherent,gestion_pile;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,declaration_adherent,gestion_pile;

package Fichiers is 
   
   type T_Archive_Adh is array(Integer range <>)of Declaration_Adherent.T_Adherent;
   Archive_adh:T_Archive_Adh(1..100);

   type T_Archive_Planning is array(Integer range <>)of Declaration_Adherent.T_Planning_General;
   Archive_plan:T_Archive_Planning(1..100);

   type T_Tableau_Adherents is array(Integer range 1..N)of T_Adherent;
   Tab_Adh:T_Tableau_Adherents;
   tete_pile:T_Pteurpileadherents;


PACKAGE Fichier_Adherents IS NEW Ada.Sequential_IO(T_tableau_Adherents);
   use Fichier_Adherents;

PACKAGE Fichier_Planning_actuel IS NEW Ada.Sequential_IO(T_Planning_General);
   use Fichier_Planning_actuel;

PACKAGE Fichier_Adherents_archive IS NEW Ada.Sequential_IO(T_Archive_Adh);
   use Fichier_Adherents_archive;

PACKAGE Fichier_Planning_archive IS NEW Ada.Sequential_IO(T_Archive_Planning);
use Fichier_Planning_archive;

procedure Save(Adherents:T_Tableau_Adherents;Planning_actuel:T_Planning_General;Tab_Adh_archive:T_Archive_Adh;Tab_planning_archive:T_Archive_Planning);
PROCEDURE Restore(Adherents:OUT T_Tableau_Adherents;Planning_actuel:OUT T_Planning_General;Tab_Adh_archive:OUT T_Archive_Adh;Tab_planning_archive:OUT T_Archive_Planning);

procedure Archive_Planning_act(T:in out T_Archive_Planning;Planning_act:T_Planning_general);
   
      


end fichiers;