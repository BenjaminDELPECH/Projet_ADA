with Ada.Text_Io;
use Ada.Text_Io;

package body Action_Adherent is

   procedure Edit_Planning (
         P: in out T_Planning_general;
         Choixsem  : in     Integer;
         Cj        : in     Integer;
         Ch        : in     Integer;
         Choix_act      : in     Integer;
         Choix_Adh : in     Integer;
         tete       : in out       Gestion_Pile.T_Pteurpileadherents) is
      
      Tmp       : Gestion_Pile.T_Pteurpileadherents := tete;
      Verif      : Boolean                           := False;
      -- Adh        : T_Adherent;
      Act_Choose : T_Activite;

   begin
      

      for I in 1..Choix_Adh-1 loop
         Tmp:= Tmp.Suiv;
      end loop;



      
      --Verification
      if Choix_act = 1 then
         Act_Choose := Aqua;
         if P(Cj)(Ch).Aqua.Tabinscrit(Plimit).Datenaissance.Annee = 1 then
            Verif := True;
            Else put("CRENEAU PLEIN");
         end if;
         for J in P(Cj)(Ch).Aqua.Tabinscrit'range loop
            if P(Cj)(Ch).Aqua.Tabinscrit(J).Nom = tmp.Adherent.Nom
                  and P(Cj)(Ch).Aqua.Tabinscrit(J).Prenom = tmp.Adherent.Prenom
                  and  P(Cj)(Ch).Aqua.Tabinscrit(J).Datenaissance.Annee = tmp.Adherent.Datenaissance.Annee
                  and  P(Cj)(Ch).Aqua.Tabinscrit(J).Datenaissance.Mois = tmp.Adherent.Datenaissance.Mois
                  then
               Verif := False;--car personne deja dans le creneau
            put("Vous etes deja inscrit dans ce creneau");
            end if;
         end loop;
      
         --Modif planning general
           If Verif = True Then
           For K in P(Cj)(Ch).Aqua.Tabinscrit'range loop
               if P(Cj)(Ch).Aqua.Tabinscrit(K).DateNaissance.Annee = 1 then
                  
                  P(Cj)(Ch).Aqua.Tabinscrit(K) := Tmp.Adherent;
                  
                  
                   P(Cj)(Ch).Aqua.Taille :=P(Cj)(Ch).Aqua.Taille+1;
                  EXIT;
               end if;
            end loop;
      end if;
      end if;
      



if Choix_act = 2 then
         Act_Choose := Fitness;
         if P(Cj)(Ch).Fitness.Tabinscrit(N).Datenaissance.Annee = 1 then
            Verif := True;
         Else put("CRENEAU PLEIN");
         end if;
         for L in P(Cj)(Ch).Fitness.Tabinscrit'range loop
            if P(Cj)(Ch).Fitness.Tabinscrit(L).Nom = tmp.Adherent.Nom
                  and P(Cj)(Ch).Fitness.Tabinscrit(L).Prenom = tmp.Adherent.Prenom
                  and  P(Cj)(Ch).Fitness.Tabinscrit(L).Datenaissance.Annee = tmp.Adherent.Datenaissance.Annee
                  and  P(Cj)(Ch).Fitness.Tabinscrit(L).Datenaissance.Mois = tmp.Adherent.Datenaissance.Mois
                  then
               Verif := False;--car personne deja dans le creneau
                  put("Vous etes deja inscrit dans ce creneau");
            end if;
         end loop;
      
         --Modif planning general
           If Verif = True Then
           For M in P(Cj)(Ch).Fitness.Tabinscrit'range loop
               if P(Cj)(Ch).Fitness.Tabinscrit(M).DateNaissance.Annee = 1 then
                  
                  P(Cj)(Ch).Fitness.Tabinscrit(M) := Tmp.Adherent;
                  
                  
                   P(Cj)(Ch).Fitness.Taille :=P(Cj)(Ch).Aqua.Taille+1;
                  EXIT;
               end if;
            end loop;
      end if;
      end if;




      
      if Verif = True then

         --modif planning adherent semaine 1
        
        If Choixsem = 1 Then 
           if Choix_act = 1 then
            Tmp.Adherent.Planingsemaine1(Cj)(Ch).Activite := Aqua ;
            Tmp.Adherent.Planingsemaine1(Cj)(Ch).Present:= True;
            Tmp.Adherent.Nbseances:=Tmp.Adherent.Nbseances+1;
            new_line;Put_line("CRENEAU BIEN RESERVE !");
          else 
            Tmp.Adherent.Planingsemaine1(Cj)(Ch).Activite := Fitness ;
            Tmp.Adherent.Planingsemaine1(Cj)(Ch).Present:= True;
            Tmp.Adherent.Nbseances:=Tmp.Adherent.Nbseances+1;
            new_line;Put_line("CRENEAU BIEN RESERVE !");
            end if;
         elsif Choixsem = 2 then
            if Choix_act = 1 then
            Tmp.Adherent.Planingsemaine2(Cj)(Ch).Activite := Aqua ;
            Tmp.Adherent.Planingsemaine2(Cj)(Ch).Present:= True;
            Tmp.Adherent.Nbseances:=Tmp.Adherent.Nbseances+1;
            new_line;Put_line("CRENEAU BIEN RESERVE !");
          else 
            Tmp.Adherent.Planingsemaine2(Cj)(Ch).Activite := Fitness ;
            Tmp.Adherent.Planingsemaine2(Cj)(Ch).Present:= True;
            Tmp.Adherent.Nbseances:=Tmp.Adherent.Nbseances+1;
            new_line;Put_line("CRENEAU BIEN RESERVE !");
            end if;

     end if;

end if;

end Edit_Planning;



   procedure Choix_Acti_Open (
      Cren     :        T_Creneau_Gen;
      
      
      Choixact : in out Integer;
        Choix_Adh:in integer;
        tete       : in out       Gestion_Pile.T_Pteurpileadherents)is
tmp2:Gestion_Pile.T_Pteurpileadherents:=tete;
   begin
      for I in 1..Choix_Adh-1 loop
         Tmp2:=Tmp2.Suiv;
      end loop;
      
      New_Line;
      
loop
      if(tmp2.Adherent.Typecontrat=Aquaetfitness and
         Cren.Aqua.Open = False  and Cren.Fitness.Open = False and Cren.Aqua.Taille < N and Cren.Fitness.Taille < N) then
         Put_Line("1 pour Reserver Aqua");
         Put_Line("2 pour Reserver Fitness");
         
         New_Line;
         New_Line;
         loop
            begin
               Get(Choixact);
               Skip_Line;
               exit when choixact=1 or choixact=2;
               new_line;
               put("Saisissez un chiffre proposé "); 
               new_line;
               exception
                     when data_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;
                     when constraint_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;  
                  end;
         end loop;


      elsif(tmp2.Adherent.Typecontrat=Aqua and 
         Cren.Aqua.Open = False and 
         Cren.Aqua.Tabinscrit(N).Datenaissance.Annee=1 
         and Cren.Aqua.Taille < N)then
         Put_Line("1 pour Reserver Aqua");
        
         New_Line;
         New_Line;
         loop
         begin
         Get(Choixact);skip_line;
         exit when choixact=1;
         new_line;
         put("Saisir un chiffre proposé");
         new_line;
            exception
                     when data_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;
                     when constraint_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;  
                  end;
         end loop;


      elsif(tmp2.Adherent.Typecontrat=Fitness and
         Cren.Fitness.Open = False and Cren.Fitness.Tabinscrit(N).Datenaissance.Annee=1 and Cren.Fitness.Taille < N) then
         Put_line("2 pour Reserver Fitness");
        
         New_Line;
         New_Line;
         loop
         begin
         Get(Choixact);skip_line;
         exit when choixact=2;
         new_line;
         put("Saisir un chiffre proposé");
         new_line;
            exception
                     when data_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;
                     when constraint_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;  
                  end;
         end loop;

      else
         Put("Pas de creneau disponible à cet horaire");
      end if;
      

      --on verifie que l'adherent ne tente pas une folie
         
         if Tmp2.Adherent.Typecontrat=Fitness and Choixact = 1 then 
            Put_line("Ce choix ne respecte pas votre contrat, veillez ressayer");NEW_line;
         Elsif Tmp2.Adherent.Typecontrat=Aqua and Choixact = 2 then 
            Put_line("Ce choix ne respecte pas votre contrat, veillez ressayer");new_line;
        else
            
             exit;
        end if;

         
end loop;


   end Choix_Acti_Open;














procedure Choix_Jour(P:in out Declaration_Adherent.T_Planning_General;Choix_Sem:integer;ChoixAdh:integer; Tete : in out Gestion_Pile.T_Pteurpileadherents
      )is
   J,Choixjour,Choixhoraire,Choixact:Integer:=0;
   Tmp3       : Gestion_Pile.T_Pteurpileadherents := tete;

begin
for I in 1..ChoixAdh-1 loop
         Tmp3:= Tmp3.Suiv;
      end loop;



 --Choix d'un jour

             
               J:=0;
               for I in T_Semaine'range loop
                  if T_Semaine(I) = Dimanche then
                     exit;
                  end if;
                  J:=J+1;
                  New_Line;
                  New_Line;
                  Put(J);
                  Put("=>");
                  Put(T_Semaine'Image(I));
                  New_Line;

               end loop;
               New_Line;
               New_Line;
              
               put("Saisir le numéro du jour : ");
               loop
                  begin
                  Get(Choixjour);
                  Skip_Line;
                  exit when choixjour=1 or choixjour=2 or choixjour=3
                  or choixjour=4 or choixjour=5 or Choixhoraire=6;
                  new_line;
                  put("Veuillez sélectionner le numéro d'un jour valide ");
                  new_line;
                  exception
                     when data_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;
                     when constraint_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;  
                  end;                
               end loop;


                     
                     
                     
        loop           
                     
                              --Choix d'un horaire et activite
               case Choixjour is
                  when 1..6=>

                    
                        New_Line;
                        New_Line;
                        Put_Line("1 => 9H-10H");
                        New_Line;
                        New_Line;
                        Put_Line("2=> 10H-11H");
                        New_Line;
                        New_Line;
                        Put_Line("3=> 12H30-13H30");
                        New_Line;
                        New_Line;
                        Put_Line("4=> 17H30-18H30");
                        New_Line;
                        New_Line;
                        Put_Line("5=> 18H30-19H30");
                        New_Line;
                        New_Line;
                        Put_Line("6=> 19H30-20H30");
                        New_Line;
                        
                        
                        New_Line;
                     loop
                        begin
                           Get(Choixhoraire);
                           Skip_Line;
                           exit when Choixhoraire=1 or Choixhoraire=2 or Choixhoraire=3
                           or Choixhoraire=4 or Choixhoraire=5 or Choixhoraire=6;
                           new_line;
                           put("Sélectionnez un chiffre valable pour le créneau"); new_line;
                           exception
                              when data_error=>skip_line;put("Erreur, veuillez recommencer la saisie "); new_line;
                              when constraint_error=>skip_line;put("Erreur, veuillez recommencer la saisie "); new_line;
                        end;
                     end loop;

            if ((Choix_Sem =1 and Tmp3.Adherent.Planingsemaine1(Choixjour)(Choixhoraire).Present = False) or
                (Choix_Sem =2 and Tmp3.Adherent.Planingsemaine2(Choixjour)(Choixhoraire).Present = False))Then 


                        case Choixhoraire is
                           when 1=>
                              Choix_Acti_Open(P(Choixjour)(1),Choixact,ChoixAdh,tete);
                           when 2=>
                              Choix_Acti_Open(P(Choixjour)(2),Choixact,ChoixAdh,tete);
                           when 3=>
                              Choix_Acti_Open(P(Choixjour)(3),Choixact,ChoixAdh,tete);
                           when 4=>
                              Choix_Acti_Open(P(Choixjour)(4),Choixact,ChoixAdh,tete);
                           when 5=>
                              Choix_Acti_Open(P(Choixjour)(5),Choixact,ChoixAdh,tete);
                           when 6=>
                              Choix_Acti_Open(P(Choixjour)(6),Choixact,ChoixAdh,tete);
                           
                           when others =>
                              Put("erreur, veillez ressayer");
                        end case;

                        --Modif planning gen, et modif plan utilisateur

                        Put(Choixact);
                        Put(Choixact);
                        case Choixact is
                           when 1=>
                                Edit_Planning(
                                 P,Choix_Sem,Choixjour,Choixhoraire,Choixact,ChoixAdh,Tete);
                              
                           when 2=>
                              Edit_Planning(
                               P,Choix_Sem,Choixjour,Choixhoraire,Choixact,ChoixAdh,Tete);

                           when others =>
                              null;
                        end case;
               exit; 
               else put("vous avez deja reserve a ce creneau, veillez en choisir un autre");
               end if; 

               when others => null;
      end case;
      end loop;



end Choix_Jour;


   procedure Reservation_Creneau (
      Tete : in out Gestion_Pile.T_Pteurpileadherents;
      P1:in out Declaration_Adherent.T_Planning_General;
      P2:in out Declaration_Adherent.T_Planning_General
) is
      Tmp: Gestion_Pile.T_Pteurpileadherents := Tete;
      J,
      Choixact,
      Choix_Sem,
      Choixjour,
      Choixhoraire,
      Choixadh     : Integer                           := 0;
      Etape_Suiv   : Boolean                           := False;
      N:Integer:=Declaration_Adherent.N;
      P:Integer:=Declaration_Adherent.P;
      -- Adherent     : T_Adherent;
                
   begin

      --Choix d'un adherent
      Put_Line("Veillez choisir un adherent");

      if Tmp /= null then
         Etape_Suiv:=True;

         while Tmp /= null loop
            J:=J+1;
            Put(J);
            Put("=>");
            Put(Tmp.Adherent.Nom);
            New_Line;
            Tmp:=Tmp.Suiv;
         end loop;

         new_line;
         put ("Entrer le numéro de l'adhérent : ");
         loop
            begin
               Get(Choixadh);
               Skip_Line; 
               exit when Choixadh>=1 and Choixadh<=J;
               new_line;
               put("Veuillez saisir un chiffre dans l'intervale");
               new_line;
               exception
                  when data_error=>skip_line;put("Erreur saisie, veuillez reccomencer");new_line;
                  when constraint_error=>skip_line;put("Erreur saisie, veuillez reccomencer");new_line;
            end;
         end loop;

      else
         NEW_line;new_line;Put("pas d'adherents");
         Etape_Suiv:=False;
      end if;

      --recuperation adherent


      J:=0;


      if Etape_Suiv = True then

         --Choix d'une semaine
                      
     loop
            Put("1=> Semaine actuelle");NEW_line;
            Put("2=> Semaine suivante");new_line;
            Put("3=> Quitter");NEW_line;new_line;
            
         loop
         begin
         Get(Choix_Sem);skip_line;
         exit when choix_sem=1 or choix_sem=2 or choix_sem=3;
         new_line;
         put("Saisir un chiffre proposé");
         new_line;
            exception
                     when data_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;
                     when constraint_error=>skip_line;
                     put("Erreur, veuillez recommencer la saisie "); new_line;  
                  end;
         end loop;           
            case Choix_Sem is 
               when 1=>
                  Choix_Jour(P1,Choix_Sem,ChoixAdh,tete);exit;
               when 2=>
                  Choix_Jour(P2,Choix_Sem,ChoixAdh,tete);exit;
               when 3 => exit;
               when Others=> put_line("Erreur, veuillez recommencer la saisie");new_line;
            end case;
         end loop;

end if;

           
    
   end Reservation_Creneau;


end Action_Adherent;
