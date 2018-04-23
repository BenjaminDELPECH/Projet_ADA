with Ada.Text_Io,Ada.Integer_Text_Io,dates,gestion_pile,declaration_adherent,menu_principal,abr_adher,donnee;
use Ada.Text_Io,Ada.Integer_Text_Io,dates,gestion_pile,declaration_adherent,menu_principal,abr_adher,donnee;


procedure Main is 

	PteurPileA : T_PteurPileAdherents;
	choix,choix1: character;
	sortie : boolean := false;
	Arbre : abr_adher.T_Arbre_Adh;
	nomadherent,prenomadherent : declaration_adherent.mot;
	trouve : boolean;
	informations_init_adherents : declaration_adherent.T_Tabadherents(0..9);

begin
	donnee.initialisation_donnees(informations_init_adherents);
	Ajout_Dans_Pile(informations_init_adherents,PteurPileA);

	while sortie=false loop
		menu_principal.affichage_menu_principal(choix);
		case choix is
			when '1'=>
				loop
					menu_principal.affichage_partie_adherent(choix1);
					case choix1 is
						when '1'=>
							Put_Line("*** Ajouter un adherent***");
							ajout_adherent(PteurPileA);
							insert_ABR(PteurPileA,Arbre);
							Affichage_ABR(Arbre);
							exit;
						when '2'=>
							Put_Line("*** Chercher un adherent***");
							gestion_pile.saisie_nom_prenom(nomadherent,prenomadherent);
							gestion_pile.Affichage_info_adh_pile (PteurPileA,nomadherent,prenomadherent,trouve);
							-- procedure adherent_archive
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
							-- procedure réservation des créneaux
				Retour_Menu_Principal;
				exit;
			when '2'=>
				Put_Line("*** Annulation des creneaux ***");
             	New_line;
            	-- procedure annulation des créneaux
				Retour_Menu_Principal;
            	exit;
            when '3'=>
            	Put_Line("*** Affichage des adherents d'un creneau ***");
            	New_Line;
              	-- procedure affichage des adherents d'un créneau
				Retour_Menu_Principal;
            	exit;
            when '4'=>
            	Put_Line("*** Mise a jour de la date ***");
            	New_Line;
            	Passer_Jour_Suivant(date_jour);
            	put ("Date passée au jour suivant, il est maintenant le : ");
            	affichage_date(date_jour);
            	Retour_Menu_Principal;
            	exit;
            when '5'=>
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


