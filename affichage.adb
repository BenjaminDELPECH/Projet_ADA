package body Affichage is


procedure Affichage_Semaine_gen (P:in out T_Planning_General)is
      -- jour_num:integer;
begin
   
         for I in T_semaine'range loop
            if T_Semaine(I) = Dimanche then exit;end if;
           Put(T_Semaine'image(I)); 
            New_Line;
        -- for J in P(T_Semaine'Pos(I))'range loop
        for J in P(1..6)'range loop
         Put(J);Put("=>");
         Put("Aqua=>");
        for K in P(T_Semaine'Pos(I)+1)(J).Aqua.Tabinscrit'range loop
         Put(P(T_Semaine'Pos(I)+1)(J).Aqua.Tabinscrit(K).Nom);
         end loop;
         
         Put("Fitness=>");
         for L in P(T_Semaine'Pos(I)+1)(J).Fitness.Tabinscrit'range loop
         Put(P(T_Semaine'Pos(I)+1)(J).Fitness.Tabinscrit(L).Nom);

         end loop;
         new_line;
      end loop;
       new_line;new_line;
       end loop;
end Affichage_Semaine_gen;





   procedure affichage_global(P1:in out T_planning_general;P2:in out T_planning_general)is
      Choix_Sem:Integer;
      
   begin
     
      --choix semaine
      
      
     Put_line("1=>Afficher planning semaine actuelle");new_line;new_line;
      Put_line("2=>Afficher planning semaine suivante");new_line;new_line;
   Put_line("3=>Quitter");new_line;
   Get(Choix_Sem);skip_line;new_line;
      case Choix_Sem is
         when 1=>Affichage_Semaine_Gen(P1);
          when 2=>Affichage_Semaine_Gen(P2);
         when others=> Put("erreur, veillez reessayer");
      end case;
   end Affichage_global;

-- procedure Affichage_Semaine_adh (P:in out T_Planning_Adh)is
   -- Jour_Num:Integer;
  
-- begin
   
       -- Put("test");               
               
   -- end Affichage_Semaine_adh;


procedure affichage_plan_adh (tete : in out Gestion_Pile.T_Pteurpileadherents)is
      
    tmp2,tmp:   Gestion_Pile.T_Pteurpileadherents :=tete;ChoixAdh,J:integer:=0;etape_suiv:boolean:=False;
   -- test: T_Planning_Adh;
   begin
      
     Put_Line("Veillez choisir un adherent");

      if tete /= null then
         Etape_Suiv:=True;

         while Tmp2 /= null loop
            J:=J+1;
            Put(J);
            Put("=>"); pUT(tmp2.adherent.nom);           
            tmp2:=Tmp2.suiv;
            New_Line;
          
         end loop;

         Get(Choixadh);
         Skip_Line;
      else
         NEW_line;new_line;Put("pas d'adherents");
         Etape_Suiv:=False;
      end if;

      if Etape_Suiv = True Then 
         for I in 1..Choixadh-1 loop
            tmp:=tmp.suiv;
         end loop;

      new_line;Put("**Semaine actuelle**");new_line;
      for J in T_semaine'range loop
            if T_Semaine(J) = Dimanche then exit;end if;
            Put(T_Semaine'image(J));new_line;
        For K in  Tmp.Adherent.Planingsemaine1(T_Semaine'Pos(J)+1)'range LOOP
              Put(K);Put(":");
               if Tmp.Adherent.Planingsemaine1(T_Semaine'Pos(J)+1)(K).Present = True then   
                 Put(T_Activite'Image(Tmp.Adherent.Planingsemaine1(T_Semaine'Pos(J)+1)(K).Activite));
               
               else Put("      ");
               end if;
              
                            
              end loop;
     new_line;new_line;
         end loop;
         
            new_line;Put("**Semaine suivante**");new_line;
      for J in T_semaine'range loop
            if T_Semaine(J) = Dimanche then exit;end if;
            Put(T_Semaine'image(J));new_line;
        For K in  Tmp.Adherent.Planingsemaine2(T_Semaine'Pos(J)+1)'range LOOP
              Put(K);Put(":");
               if Tmp.Adherent.Planingsemaine2(T_Semaine'Pos(J)+1)(K).Present = True then   
                 Put(T_Activite'Image(Tmp.Adherent.Planingsemaine2(T_Semaine'Pos(J)+1)(K).Activite));
                
               else Put("      ");
               end if;

                           
                          
              end loop;
     new_line;new_line;
     end loop;


      
      
      
      
      end if;

        
    
   end Affichage_plan_adh;






end Affichage;
