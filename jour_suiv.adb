With ada.text_io, ada.integer_text_io, gestion_pile,dates,abr_adher;
Use ada.text_io, ada.integer_text_io, gestion_pile,dates,abr_adher;

package body jour_suiv is  

procedure Passer_Jour_Suivant(D:in out dates.T_Date;J:in out T_Semaine)is
begin
   D:=dates.Date_Jour;
--on passe au jour suivant
   D.Jour:=D.Jour+1;    
   
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
      J:=lundi;

      --On archive le planning actuel
      fichiers.Archive_planning_act(fichiers.Archive_plan,Declaration_Adherent.Plan_Act);
      --on fait passer le planning suiv en plannint actuel
         Declaration_Adherent.Plan_Act:=Declaration_Adherent.Plan_Suiv;
      
      --On Genere Un Nouveau Planning Suiv, qui sera vide.
         Declaration_Adherent.Plan_Suiv:=Declaration_Adherent.Plan_Vide;
      when others=>   J:=T_Semaine'Succ(J);
      end case;
   end Passer_Jour_Suivant;

Procedure modification_date_adhesion (infos : declaration_adherent.T_Adherent ; 
   PteurAdherent : in out gestion_pile.T_PteurPileAdherents) is
begin
   if PteurAdherent /= null then
      if PteurAdherent.adherent.nom=infos.nom and then 
      PteurAdherent.adherent.prenom=infos.prenom and then
      PteurAdherent.adherent.DateNaissance=infos.datenaissance then
      PteurAdherent.adherent.datederniereadhesion:=infos.datederniereadhesion;
      else modification_date_adhesion(infos,PteurAdherent.suiv);
      end if;
   end if;
end modification_date_adhesion;

Procedure Renouvellement_Adherent (Arbre_de_vie : in out abr_adher.T_Arbre_adh ; D : dates.T_Date ; 
   Pteur : in out gestion_pile.T_PteurPileAdherents) is
   infos_Adherent : declaration_adherent.T_Adherent;
   choix:character;
begin
   if Arbre_de_vie/=null then
      if Arbre_de_vie.PteurCelluleAdh.adherent.datederniereadhesion.annee+1=d.annee and then
      Arbre_de_vie.PteurCelluleAdh.adherent.datederniereadhesion.mois=d.mois and then 
      Arbre_de_vie.PteurCelluleAdh.adherent.datederniereadhesion.jour=d.jour then
      put(Arbre_de_vie.PteurCelluleAdh.adherent.nom(1));
      put(Arbre_de_vie.PteurCelluleAdh.adherent.prenom(1));
      infos_adherent.nom:=Arbre_de_vie.PteurCelluleAdh.adherent.nom;
      infos_adherent.prenom:=Arbre_de_vie.PteurCelluleAdh.adherent.prenom;
      infos_adherent.datenaissance:=Arbre_de_vie.PteurCelluleAdh.adherent.datenaissance;
      infos_adherent.datederniereadhesion:=D;
      if abr_adher.homonyme(Arbre_de_vie,infos_adherent.nom,infos_adherent.prenom) then
         put("(");
         put(Arbre_de_vie.PteurCelluleAdh.adherent.datenaissance.annee mod 100, width=>0);
         put(")");
      end if;
      put(" a besoin de renouveler son adhésion, souhaitez-vous mettre à jour son adhésion ? (o/n) ");
      get(choix);skip_line;
      loop
       case choix is
          when 'o'|'O'=>
            new_line;
            put("Renouvellement de l'adhesion, la nouvelle date de derniere adhesion est : ");
            modification_date_adhesion(infos_adherent,Pteur);
            dates.affichage_date(Arbre_de_vie.PteurCelluleAdh.adherent.datederniereadhesion);
            new_line;
            exit;
          when 'n'|'N'=>
            new_line;
            put("L'adherent est maintenant supprime");
            new_line;
            action_adherent.Supprimmer_Adherent_Pile(infos_adherent,Pteur);
            action_adherent.supprimer_adherent_arbre(infos_adherent,Arbre_de_vie);
            exit;
          when others => put("Erreur,recommencez la saisie"); new_line;
       end case;
      end loop;
      end if;
      Renouvellement_Adherent(Arbre_de_vie.fg,D,Pteur);
      Renouvellement_Adherent(Arbre_de_vie.fd,D,Pteur);
   end if;
   end Renouvellement_Adherent;


   

end Jour_Suiv;
