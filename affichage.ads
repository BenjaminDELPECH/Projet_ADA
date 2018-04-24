with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,Ada.Sequential_IO,declaration_adherent,gestion_pile;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,declaration_adherent,gestion_pile;

package Affichage is 
   Type T_Semaine is(lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche);
  procedure Affichage_Semaine_gen (P:in out T_Planning_General);
 procedure affichage_plan_adh (tete : in out Gestion_Pile.T_Pteurpileadherents);
 procedure Affichage_Global(P1:in out T_Planning_General;P2:in out T_Planning_General);
 procedure Affichage_Semaine_adh (P:in out T_Planning_Adh);

end Affichage;
