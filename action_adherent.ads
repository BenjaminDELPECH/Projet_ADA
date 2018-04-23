with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,Ada.Sequential_IO,declaration_adherent,gestion_pile;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io,declaration_adherent,gestion_pile;

package action_Adherent is
   type T_Semaine is(Lundi,Mardi,Mercredi,Jeudi,Vendredi,Samedi,Dimanche);
    
   

Tete:gestion_pile.T_Pteurpileadherents;
 procedure Reservation_Creneau(Tete:gestion_pile.T_Pteurpileadherents);
    
      

end action_adherent;
