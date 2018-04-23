with ada.text_io;
use ada.text_io;

package body action_Adherent is
   
   procedure Reservation_Creneau(Tete:gestion_pile.T_Pteurpileadherents;P:in out declaration_adherent.T_Planning_General)is
      tmp:gestion_pile.T_Pteurpileadherents:=Tete;J:integer:=0;
      begin
         
         --Choix d'un adherent
         Put_line("Veillez choisir un adherent");
        
        while tmp /= null loop
            J:=J+1;
            Put("J=>");Put("test");new_line;
         end loop;
      
J:=0;
      
       
         
         
         --Choix d'un jour
         for I in T_Semaine'range loop
           J:=J+1;
   Put(J);Put(T_Semaine'image(I));new_line;
end loop;
        
         --Choix d'un horaire
         
         --Choix d'une activité selon certaines conditions
         
      end Reservation_Creneau;  
      

end action_adherent;
