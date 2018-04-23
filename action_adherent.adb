with Ada.Text_Io;
use Ada.Text_Io;

package body Action_Adherent is

   procedure Edit_Planning (
         P         : in out T_Planning_General;
         Choixsem  : in     Integer;
         Cj        : in     Integer;
         Ch        : in     Integer;
         Choix_act      : in     Integer;
         Choix_Adh : in     Integer;
         Pt        :        Gestion_Pile.T_Pteurpileadherents) is
      
      tmp2       : Gestion_Pile.T_Pteurpileadherents := Pt;
      Verif      : Boolean                           := False;
      Adh        : T_Adherent;
      Act_Choose : T_Activite;

   begin
      for I in 1..Choix_Adh-1 loop
         tmp2:= tmp2.Suiv;
      end loop;



      
      --Verification
      if Choix_act = 1 then
         Act_Choose := Aqua;
         if P(Cj)(Ch).Aqua.Tabinscrit(N).Datenaissance.Annee = 1 then
            Verif := True;
         end if;
         for I in P(Cj)(Ch).Aqua.Tabinscrit'range loop
            if P(Cj)(Ch).Aqua.Tabinscrit(N).Nom = tmp2.Adherent.Nom
                  and P(Cj)(Ch).Aqua.Tabinscrit(N).Prenom = tmp2.Adherent.Prenom
                  and  P(Cj)(Ch).Aqua.Tabinscrit(N).Datenaissance.Annee = tmp2.Adherent.Datenaissance.Annee
                  and  P(Cj)(Ch).Aqua.Tabinscrit(N).Datenaissance.Mois = tmp2.Adherent.Datenaissance.Mois
                  then
               Verif := False;--car personne deja dans le creneau
            end if;
         end loop;
      
         --Modif planning general
           If Verif = True Then 
           For I in P(Cj)(Ch).Aqua.Tabinscrit'range loop
               if P(Cj)(Ch).Aqua.Tabinscrit(I).Nom = " " then
                  P(Cj)(Ch).Aqua.Tabinscrit(I) := tmp2.Adherent;
                  P(Cj)(Ch).Aqua.Taille :=P(Cj)(Ch).Aqua.Taille+1;
               end if;
            end loop;
      end if;
      end if;
      

if Choix_act = 2 then
         Act_Choose := Fitness;
         if P(Cj)(Ch).Fitness.Tabinscrit(N).Datenaissance.Annee = 1 then
            Verif := True;
         end if;
         for I in P(Cj)(Ch).Fitness.Tabinscrit'range loop
            if P(Cj)(Ch).Fitness.Tabinscrit(N).Nom = tmp2.Adherent.Nom
                  and P(Cj)(Ch).Fitness.Tabinscrit(N).Prenom = tmp2.Adherent.Prenom
                  and  P(Cj)(Ch).Fitness.Tabinscrit(N).Datenaissance.Annee = tmp2.Adherent.Datenaissance.Annee
                  and  P(Cj)(Ch).Fitness.Tabinscrit(N).Datenaissance.Mois = tmp2.Adherent.Datenaissance.Mois
                  then
               Verif := False;--car personne deja dans le creneau
            end if;
         end loop;
      
         --Modif planning general
           If Verif =True Then 
           For I in P(Cj)(Ch).Fitness.Tabinscrit'range loop
               if P(Cj)(Ch).Fitness.Tabinscrit(I).Nom = " " then
                  P(Cj)(Ch).Fitness.Tabinscrit(I) := tmp2.Adherent;
                  P(Cj)(Ch).Fitness.Taille :=P(Cj)(Ch).Aqua.Taille+1;
               end if;
            end loop;
            end if;
      
      end if;



      
      if Verif = True then

         --modif planning adherent semaine 1
         if Choixsem = 1 then
            Tmp2.Adherent.Planingsemaine1(Cj)(Ch).Activite := Act_Choose ;
            Tmp2.Adherent.Nbseances:=Tmp2.Adherent.Nbseances+1;
            new_line;Put_line("CRENEAU BIEN RESERVE !");
          else 
            Tmp2.Adherent.Planingsemaine2(Cj)(Ch).Activite := Act_Choose;
            Tmp2.Adherent.Nbseances:=Tmp2.Adherent.Nbseances+1;
            new_line;Put_line("CRENEAU BIEN RESERVE ! ");
          end if;

     end if;



end Edit_Planning;



   procedure Choix_Acti_Open (
         Cren     :        T_Creneau_Gen;
         Choixact : in out Integer) is

   begin
      New_Line;
      if(Cren.Aqua.Open = False  and Cren.Fitness.Open = False and Cren.Aqua.Taille < N and Cren.Fitness.Taille < N) then
         Put_Line("1 pour Reserver Aqua");
         Put_Line("2 pour Reserver Fitness");
         Put_Line("3 pour choisir un autre creneau");
         New_Line;
         New_Line;
         Get(Choixact);
         Skip_Line;


      elsif(Cren.Aqua.Open = False and Cren.Aqua.Tabinscrit(N).Datenaissance.Annee=1 and Cren.Aqua.Taille < N)then
         Put_Line("1 pour Reserver Aqua");
         Put_Line("2 pour choisir un autre creneau");
         New_Line;
         New_Line;
         Get(Choixact);
         Skip_Line;


      elsif(Cren.Fitness.Open = False and Cren.Fitness.Tabinscrit(N).Datenaissance.Annee=1 and Cren.Fitness.Taille < N) then
         Put("2 pour Reserver Fitness");
         Put_Line("3 pour choisir un autre creneau");
         New_Line;
         New_Line;
         Get(Choixact);
         Skip_Line;
      else
         Put("Pas de creneau disponible à cet horaire");
      end if;



   end Choix_Acti_Open;








   procedure Reservation_Creneau (
         Tete : Gestion_Pile.T_Pteurpileadherents) is
      Tmp,
      Tmp2         : Gestion_Pile.T_Pteurpileadherents := Tete;
      J,
      Choixact,
      Choix_Sem,
      Choixjour,
      Choixhoraire,
      Choixadh     : Integer                           := 0;
      Etape_Suiv   : Boolean                           := False;
      Adherent     : T_Adherent;
      P            : T_Planning_General;
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

         Get(Choixadh);
         Skip_Line;
      else
         NEW_line;new_line;Put("pas d'adherents");
         Etape_Suiv:=False;
      end if;

      --recuperation adherent


      J:=0;


      if Etape_Suiv = True then

         --Choix d'une semaine
         loop
            NEW_line;new_line;Put("1=> Semaine actuelle");NEW_line;
            Put("2=> Semaine suivante");new_line;
            Put("3=> Quitter");NEW_line;new_line;
            Get(Choix_Sem);            
            case Choix_Sem is
               when 1=>
                  P:=Plan_Act;
               when 2=>
                  P:=Plan_Suiv;
               when 3=>
                  exit;
               when others =>
                  Put("erreur, veillez reccomencer");
                  New_Line;
                  New_Line;
            end case;



            --Choix d'un jour

            loop
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
               Put("7 => Quitter");
               New_Line;

               Get(Choixjour);
               Skip_Line;
               if Choixjour = 7 then
                  exit;
               end if;
               --Choix d'un horaire et activite
               case Choixjour is
                  when 1..6=>

                     loop
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
                        Put_Line("7=> Retour au Choix du Jour");
                        New_Line;
                        New_Line;
                        Get(Choixhoraire);
                        Skip_Line;

                        case Choixhoraire is
                           when 1=>
                              Choix_Acti_Open(P(Choixjour)(1),Choixact);
                           when 2=>
                              Choix_Acti_Open(P(Choixjour)(1),Choixact);
                           when 3=>
                              Choix_Acti_Open(P(Choixjour)(3),Choixact);
                           when 4=>
                              Choix_Acti_Open(P(Choixjour)(4),Choixact);
                           when 5=>
                              Choix_Acti_Open(P(Choixjour)(5),Choixact);
                           when 6=>
                              Choix_Acti_Open(P(Choixjour)(6),Choixact);
                           when 7=>
                              exit;
                           when others =>
                              Put("erreur, veillez ressayer");
                        end case;

                        --Modif planning gen, et modif plan utilisateur

                        Put(Choixact);
                        case Choixact is
                           when 1=>
                              Edit_Planning(
                                 P,Choix_Sem,Choixjour,Choixhoraire,Choixact,ChoixAdh,tete);

                              null;



                           when 2=>
                              null;
                           when others =>
                              null;
                        end case;







                     end loop;



                  when others=>
                     Put("erreur , veillez reessayer");
               end case;
            end loop;





         end loop;

      end if;
   end Reservation_Creneau;


end Action_Adherent;
