with Ada.Text_Io,Ada.Integer_Text_Io,dates,gestion_pile,affichage,
declaration_adherent,menu_principal,abr_adher,donnee,action_adherent,jour_suiv;
use Ada.Text_Io,Ada.Integer_Text_Io,dates,gestion_pile,affichage,
declaration_adherent,menu_principal,abr_adher,donnee,action_adherent,jour_suiv;

procedure Main is 

	PteurPileA : T_PteurPileAdherents;
	choix,choix1: character;
	sortie : boolean := false;
	Arbre : abr_adher.T_Arbre_Adh;
	nomadherent,prenomadherent : declaration_adherent.mot;
	trouve : boolean;
	informations_init_adherents : declaration_adherent.T_Tabadherents(0..9);
       P1,P2:T_Planning_general;
  Jour_actuel:jour_suiv.T_Semaine:=Mercredi;
  infos_adherents : declaration_adherent.T_Adherent;
begin
	donnee.initialisation_donnees(informations_init_adherents,P1,P2);
	Ajout_Dans_Pile(informations_init_adherents,PteurPileA);
	initialisation_ABR(PteurPileA,Arbre);
	while sortie=false loop
		menu_principal.affichage_menu_principal(choix);
		case choix is
			when '1'=>
				loop
					menu_principal.affichage_partie_adherent(choix1);
					case choix1 is
						when '1'=>
							Put_Line("*** Ajouter un adherent***");
							ajout_adherent(PteurPileA,infos_adherents);
							insert_ABR(PteurPileA,Arbre);
              new_line;
              new_line;
              put("Planning de l'adherent : ");
              affichage.affichage_plan_adh_bis(infos_adherents,PteurPileA);
							Retour_Menu_Principal;
							exit;
						when '2'=>
							Put_Line("*** Chercher un adherent***");
							abr_adher.Affichage_Pile(PteurPileA,Arbre);
							gestion_pile.saisie_nom_prenom
							(nomadherent,prenomadherent);
							gestion_pile.Affichage_info_adh_pile 
							(PteurPileA,nomadherent,prenomadherent,trouve);
							-- procedure adherent_archive
              if not trouve then new_line;put("Adherent non trouve");
              end if;
							new_line;
							Retour_Menu_Principal;
							exit;
         		when '3' =>
         		Put_Line("*** Affichage des adherents en mode prefixe ***");
      				abr_adher.affich_Prefixe_ABR(Arbre);
      				Retour_Menu_Principal;
             		exit;                
            when '4'=>
            	exit;
            when others =>
            	Put_Line("Choix inconnu, recommencer");
          end case;
        end loop;

			when '2'=>
        loop
        	menu_principal.affichage_partie_reservation(choix1);
          case choix1 is
          	when '1'=>
           		Put_Line("*** Reservation des creneaux ***");
				New_Line;
				   Reservation_Creneau(PteurPileA,P1,P2);

				Retour_Menu_Principal;
				exit;
			when '2'=>
				Put_Line("*** Annulation des creneaux ***");
             	New_line;
            	-- procedure annulation des créneaux
               Annuler_Creneau(PteurPileA,Arbre,P2);
				Retour_Menu_Principal;
            	exit;
            when '3'=>
            	Put_Line("*** Affichage planning general ***");
            	New_Line;
              	-- procedure affichage general
                 affichage_global(P1,P2);            
				Retour_Menu_Principal;
                     exit;
            when '4'=>
            	Put_Line("*** Affichage planning d'un adherent ***");
            	New_Line;
              	-- procedure affichage general
                 affichage_plan_adh(PteurPileA,Arbre);            
				Retour_Menu_Principal;
            	exit;

            when '5'=>
            	Put_Line("*** Mise a jour de la date ***");
            	New_Line;
            	jour_suiv.Passer_Jour_Suivant(date_jour,Jour_actuel);
            	put ("Date passee au jour suivant, il est maintenant le : ");
            	affichage_date(date_jour);
            	new_line;
              Renouvellement_Adherent(Arbre,date_jour,PteurPileA);
            	Retour_Menu_Principal;
            	exit;
            when '6'=>
            	exit;
            when others =>
            	Put_Line("Choix inconnu, recommencer");
          end case;
        end loop;

			when '3'=>
        loop
        	menu_principal.affichage_partie_archive(choix1);
          case choix1 is
          	when '1'=>
				Put_Line("*** ARCHIVE ***");
              	--procedure Lecture;
				New_Line;
				Retour_Menu_Principal;
				exit;
			when '2'=>
				exit;
         	when others =>
            	Put_Line("Choix inconnu, recommencer");
			end case;
        end loop;

      when '4'=>
      	loop
      		menu_principal.affichage_quitter(choix1);
      		case choix1 is
            when 'O'|'o' =>
            	sortie:=true;
              exit ;
            when 'N'|'n' =>
               exit;
            when others =>
              Put_Line("Choix inconnu, recommencer");
          end case;
        end loop;
      when others =>
      	Put_Line("Choix inconnu, recommencer");
    end case;
	end loop;
   
end Main;


