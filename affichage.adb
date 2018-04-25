with ada.text_io,ada.integer_text_io,dates;
use ada.text_io,ada.integer_text_io,dates;

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
         if P(T_Semaine'Pos(I)+1)(J).Aqua.Open = False Then put("Close");end if;
         for K in P(T_Semaine'Pos(I)+1)(J).Aqua.Tabinscrit'range loop
         Put(P(T_Semaine'Pos(I)+1)(J).Aqua.Tabinscrit(K).Nom);
         end loop;
         
         Put("Fitness=>");
         if P(T_Semaine'Pos(I)+1)(J).Fitness.Open = False Then put("Close");end if;
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
   put("Saisir le chiffre correspondant à votre choix : ");
    loop
    begin
    Get(Choix_Sem);skip_line;new_line;
    exit when choix_sem=1 or choix_sem=2 or choix_sem=3;
    put("Veuillez saisir un chiffre valide");
    exception
      when data_error=>skip_line;put("Erreur, recommencez la saisie");new_line;
      when constraint_error=>skip_line;put("Erreur, recommencez la saisie"); new_line;
    end ;
    end loop;
      case Choix_Sem is
         when 1=>Affichage_Semaine_Gen(P1);
          when 2=>Affichage_Semaine_Gen(P2);
          when 3=> null;
         when others=> null;
      end case;
   end Affichage_global;

-- procedure Affichage_Semaine_adh (P:in out T_Planning_Adh)is
   -- Jour_Num:Integer;
  
-- begin
   
       -- Put("test");               
               
   -- end Affichage_Semaine_adh;


procedure affichage_plan_adh (tete : in out Gestion_Pile.T_Pteurpileadherents;
  Arbre_de_vie:abr_adher.T_Arbre_adh)is
      
    tmp2,tmp:   Gestion_Pile.T_Pteurpileadherents :=tete;
    ChoixAdh,J:integer:=0;etape_suiv:boolean:=False;
    nomAdhe,prenomAdhe:declaration_adherent.mot;
   -- test: T_Planning_Adh;
   begin
      
     Put_Line("Veillez choisir un adherent");

      if tete /= null then
         Etape_Suiv:=True;

         while Tmp2 /= null loop
            J:=J+1;
            Put(J);
            Put("=>"); 
            put(tmp2.adherent.nom(1));
            put(tmp2.adherent.prenom(1));
            nomAdhe:=tmp2.adherent.nom;
            prenomAdhe:=tmp2.adherent.prenom;
            if abr_adher.homonyme(Arbre_de_vie,nomAdhe,prenomAdhe) then
            put("(");
            put(tmp2.adherent.datenaissance.annee mod 100, width=>0);
            put(")");
            end if;
            tmp2:=Tmp2.suiv;
            New_Line;
         end loop;
         put("Saisir le numéro de l'adhérent : ");
         loop
             begin
                 Get(Choixadh);
                 Skip_Line;
                 exit when choixadh <= J and choixadh>=1;
                 new_line;
                 put("Veuillez saisir un chiffre dans l'intervalle");
                 new_line;
             exception
                 when data_error=>skip_line;put("Erreur saisie, recommencer "); new_line;
                 when constraint_error=> skip_line;put("Erreur saisie, recommencer "); new_line;
             end;
         end loop;
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

   procedure affichage_plan_adh_bis (infos : declaration_adherent.T_Adherent ; Pteur : Gestion_Pile.T_Pteurpileadherents) is
   begin
    if Pteur /= null then
      if infos.nom=Pteur.Adherent.nom and then infos.prenom=Pteur.adherent.prenom and then
      infos.datenaissance=Pteur.adherent.datenaissance then

      for J in T_semaine'range loop
            if T_Semaine(J) = Dimanche then exit;end if;
            Put(T_Semaine'image(J));new_line;
        For K in  Pteur.Adherent.Planingsemaine1(T_Semaine'Pos(J)+1)'range LOOP
              Put(K);Put(":");
               if Pteur.Adherent.Planingsemaine1(T_Semaine'Pos(J)+1)(K).Present = True then   
                 Put(T_Activite'Image(Pteur.Adherent.Planingsemaine1(T_Semaine'Pos(J)+1)(K).Activite));
               
               else Put("      ");
               end if;
              
                            
              end loop;
     new_line;new_line;
         end loop;
         
            new_line;Put("**Semaine suivante**");new_line;
      for J in T_semaine'range loop
            if T_Semaine(J) = Dimanche then exit;end if;
            Put(T_Semaine'image(J));new_line;
        For K in  Pteur.Adherent.Planingsemaine2(T_Semaine'Pos(J)+1)'range LOOP
              Put(K);Put(":");
               if Pteur.Adherent.Planingsemaine2(T_Semaine'Pos(J)+1)(K).Present = True then   
                 Put(T_Activite'Image(Pteur.Adherent.Planingsemaine2(T_Semaine'Pos(J)+1)(K).Activite));
               else Put("      ");
               end if;            
              end loop;
     new_line;new_line;
     end loop;
     else affichage_plan_adh_bis(infos,Pteur.suiv);
     end if;
    end if;        

end affichage_plan_adh_bis;

end Affichage;
