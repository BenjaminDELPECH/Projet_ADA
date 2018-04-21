with Ada.Text_Io,Ada.Integer_Text_Io,dates,gestion_pile,declaration_adherent,menu_principal;
use Ada.Text_Io,Ada.Integer_Text_Io,dates,gestion_pile,declaration_adherent,menu_principal;


procedure Main is 

	PteurPileA : T_PteurPileAdherents;
	choix,choix1: character;
	sortie : boolean := false;

begin
	Put_Line("======");
	New_Line;
	Put_Line("Bienvenue dans le programme de gestion de votre club de sport");
	New_Line;
	Put_Line("=====");

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
							exit;
						when '2'=>
							Put_Line("*** Chercher un adherent***");
							-- procedure recherche adherent
						when '3' =>
         			Put_Line("*** Afficher les fiches de tous des adherents ***");
         			New_Line;
       			 -- procédure affichage
         			exit;
         		when '4' =>
         			Put_Line("*** Affichage des adherents en mode prefixe ***");
      				--affich_Prefixe_ABR (A);
              New_Line;
             	exit;                
            when '5' =>
            	Put_Line("*** Supprimer un adherent ***");
              New_Line;
              -- procédure suppression
              exit;
            when '6'=>
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
							exit;
						when '2'=>
							Put_Line("*** Annulation des creneaux ***");
              New_line;
              -- procedure annulation des créneaux
              exit;
            when '3'=>
            	Put_Line("*** Affichage des adherents d'un creneau ***");
              New_Line;
              -- procedure affichage des adherents d'un créneau
              exit;
            when '4'=>
            	Put_Line("*** Mise a jour de la date ***");
              New_Line;
              --procedure mise à jour de la date
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


