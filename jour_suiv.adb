With ada.text_io, ada.integer_text_io;
Use ada.text_io, ada.integer_text_io;

package body jour_suiv is  

procedure Passer_Jour_Suivant(D:in out dates.T_Date;J:in out T_Semaine)is
  
   
begin
   D:=dates.Date_Jour;     J:=Jour_act;
--on passe au jour suivant
   D.Jour:=D.Jour+1;    
   
case J is when Dimanche => 
         J:=lundi;
      when others=>   J:=T_Semaine'Succ(J);
 end case;
   
--on gere tout les cas ou il faut changer le mois ou l'année
   
   case D.Mois is
      when 12 =>
            if D.Jour >31 then D.Annee:=D.annee+1;D.mois:=1;D.jour:=1;
         else D.Jour := D.Jour+1;
         end if;
      when 1|3|5|7|10 =>
         if D.Jour >31 then D.Mois := D.Mois+1;D.Jour := 1;end if;
      when 2 => if (Dates.Verification_Date_Bisextile(D)= TRUE) then 
            if D.Jour = 28 then D.Mois := D.Mois +1;
               D.Jour := 1;
            end if;
         elsif D.Jour = 29 then D.Mois := D.Mois +1;
            D.Jour :=1;
         end if;
      when 4|6|8|9|11 => if D.Jour > 30 then D.Mois := D.Mois +1;D.Jour := 1;end if;
      when others => null;
   end case;
   

   --on gere jour de la semaine et changement de planning
   case J is 
      when Dimanche =>
      --On archive le planning actuel
      fichiers.Archive_planning_act(fichiers.Archive_plan,Declaration_Adherent.Plan_Act);
      --on fait passer le planning suiv en plannint actuel
         Declaration_Adherent.Plan_Act:=Declaration_Adherent.Plan_Suiv;
      
      --On Genere Un Nouveau Planning Suiv, qui sera vide.
         Declaration_Adherent.Plan_Suiv:=Declaration_Adherent.Plan_Vide;
      
         
      
      
      when others=> null;
      end case;

   
   end Passer_Jour_Suivant;

   

end Jour_Suiv;
