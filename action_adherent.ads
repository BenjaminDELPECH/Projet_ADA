with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,Ada.Sequential_IO,declaration_adherent,gestion_pile,abr_adher;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,declaration_adherent,gestion_pile,abr_adher;

package action_Adherent is
   type T_Semaine is(Lundi,Mardi,Mercredi,Jeudi,Vendredi,Samedi,Dimanche);
    
   

Tete:gestion_pile.T_Pteurpileadherents;
   procedure Reservation_Creneau (
      Tete : in out Gestion_Pile.T_Pteurpileadherents;
      P1:in out Declaration_Adherent.T_Planning_General;
      P2:in out Declaration_Adherent.T_Planning_General
);
    
procedure Choix_Jour(P:in out Declaration_Adherent.T_Planning_General;Choix_Sem:integer;ChoixAdh:integer; Tete : in out Gestion_Pile.T_Pteurpileadherents
      );

procedure Annuler_Creneau(Tete:Gestion_Pile.T_Pteurpileadherents;Arbre_de_vie:abr_adher.T_Arbre_adh;P2:T_Planning_General);
      

end action_adherent;
