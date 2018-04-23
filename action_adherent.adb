with ada.text_io;
use ada.text_io;

package body Action_Adherent is
   
   procedure Edit_Planning(P:in out T_Planning_General;Cj:in Integer;Ch:in Integer;
         Ca:in Integer;Choix_Adh:in integer;pt:Gestion_Pile.T_Pteurpileadherents)is
      tmp2:Gestion_Pile.T_Pteurpileadherents:=pt;
      verif:boolean:=false;Adh:T_Adherent;
   
   begin
      For i in 1..Choix_Adh loop
           tmp2 :=tmp2.suiv;  
            end loop;
           Adh:=tmp2.Adherent;
      --Verification 
      If Ca = 1 Then 
         if P(Cj)(Ch).Aqua.Tabinscrit(N).Nom = " " then Verif := True;end if;
         for I in P(Cj)(Ch).Aqua.Tabinscrit'range loop
            if P(Cj)(Ch).Aqua.Tabinscrit(N).Nom = Adh.Nom 
                  and P(Cj)(Ch).Aqua.Tabinscrit(N).Prenom = Adh.Prenom
                  and  P(Cj)(Ch).Aqua.Tabinscrit(N).DateNaissance.Annee = Adh.DateNaissance.Annee
                  and  P(Cj)(Ch).Aqua.Tabinscrit(N).Datenaissance.Mois = Adh.Datenaissance.Mois
                  then verif := False;--car personne deja dans le creneau
         end if;
         end loop;
     
     --Creneau pas rempli et adherent pas déjà dans le creneau dont on l'insere
         if Verif = True then
            
            for I in P(Cj)(Ch).Aqua.Tabinscrit'range loop
               if P(Cj)(Ch).Aqua.Tabinscrit(I).Nom = " " then
                  P(Cj)(Ch).Aqua.Tabinscrit(I) := Adh;
                  P(Cj)(Ch).Aqua.Taille :=P(Cj)(Ch).Aqua.Taille+1;
               end if;
            end loop;
        
        
        
        end if;
                  

     
     
     
     
      end if;

end Edit_Planning;



   procedure Choix_Acti_Open(Cren:T_Creneau_gen;choixAct:in out integer)is
   
   begin
      new_line;
         if(Cren.Aqua.Open = False  and Cren.Fitness.Open = False and Cren.Aqua.Taille < N and Cren.Fitness.Taille < N) then 
             Put_line("1 pour Reserver Aqua");
             Put_Line("2 pour Reserver Fitness");
             Put_line("3 pour choisir un autre creneau");new_line;new_line;
             Get(choixAct);skip_line;
          
                        
               elsif(Cren.Aqua.Open = False and Cren.Aqua.Tabinscrit(N).DateNaissance.Annee=1 and Cren.Aqua.Taille < N)then 
             Put_line("1 pour Reserver Aqua");
             Put_line("2 pour choisir un autre creneau");new_line;new_line;
            Get(Choixact);Skip_Line;
          
                              
                 elsif(Cren.Fitness.Open = False and Cren.Fitness.Tabinscrit(N).DateNaissance.Annee=1 and Cren.Fitness.Taille < N) then 
         Put("2 pour Reserver Fitness");
         Put_line("3 pour choisir un autre creneau");new_line;new_line;
                        Get(choixAct);skip_line;
                  else Put("Pas de creneau disponible à cet horaire");
                  end if;
            
      

   end Choix_Acti_Open;








   procedure Reservation_Creneau(Tete:gestion_pile.T_Pteurpileadherents;P:in out declaration_adherent.T_Planning_General)is
      Tmp,tmp2:Gestion_Pile.T_Pteurpileadherents:=Tete;J,choixAct,choixJour,choixHoraire,ChoixAdh:Integer:=0;
      etape_suiv:boolean:=FALSE;Adherent:T_Adherent;
      begin
         
         --Choix d'un adherent
         Put_line("Veillez choisir un adherent");
        
         if Tmp /= null then 
            Etape_Suiv:=True;

        while tmp /= null loop
            J:=J+1;
            Put(J);Put("=>");Put(tmp.Adherent.Nom);new_line;
            tmp:=tmp.suiv;
            end loop;
            
Get(ChoixAdh);skip_line;
         else Put("pas d'adherents");Etape_Suiv:=True;
         end if;
      
         --recuperation adherent
         

J:=0;
      
       
         
         --Choix d'un jour
         if Etape_Suiv = True then 
            
            loop
               J:=0;
         for I in T_Semaine'range loop
           If T_Semaine(I) = Dimanche then exit;end if;
           J:=J+1;
            new_line;new_line;Put(J);Put("=>");Put(T_Semaine'Image(I));New_Line;
           
               end loop;
                new_line;new_line;Put("7 => Quitter");New_Line;
              
             Get(choixJour);skip_line;
        If choixJour = 7 Then exit;end if;
 --Choix d'un horaire et activite
               case Choixjour is 
                  when 1..6=>
         
         loop new_line;new_line;
               Put_line("1 => 9H-10H");new_line;new_line;
               Put_line("2=> 10H-11H");new_line;new_line;
               Put_line("3=> 12H30-13H30");new_line;new_line;
               Put_line("4=> 17H30-18H30");new_line;new_line;
               Put_line("5=> 18H30-19H30");new_line;new_line;
                  Put_Line("6=> 19H30-20H30");new_line;new_line;
                 Put_line("7=> Retour au Choix du Jour");new_line;new_line;
               Get(Choixhoraire);Skip_Line;
               
               case Choixhoraire is 
                  when 1=>  Choix_Acti_Open(P(Choixjour)(1),choixAct);
                     when 2=>  Choix_Acti_Open(P(Choixjour)(1),Choixact);
                     when 3=>  Choix_Acti_Open(P(Choixjour)(3),Choixact);
                     when 4=>  Choix_Acti_Open(P(Choixjour)(4),Choixact);
                     when 5=>  Choix_Acti_Open(P(Choixjour)(5),Choixact);
                     when 6=>  Choix_Acti_Open(P(Choixjour)(6),choixAct);                  
                  when 7=>  EXIT;           
             when others => put("erreur, veillez ressayer");
               end case;
           
                  --Modif planning gen, et modif plan utilisateur
                  
         Put(choixAct);
         case choixAct is
              when 1=> --changement planning gen
                              
             null;
                              
         
         
         when 2=>NULL;
         when others => null;
       end case;

           
           
           
           
           
           
           end loop;
 


when others=> put("erreur , veillez reessayer");            
        end case;
end loop;
            

                      
               
      
          
         
end if;
      end Reservation_Creneau;  
      

end action_adherent;
