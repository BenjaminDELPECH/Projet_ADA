WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;
-- il faut ajouter les .ads utils ????????????????????????????????????????????????????????????????????????
-- y'as plein d'ads vide (:3)...?????????????????????????????????????????????????????????????????????????????????

Package body menu_principal is

function saisie_choix return character is
c : character;
begin
   get(c);
   Skip_Line;
   return c;
end saisie_choix;

Procedure Retour_Menu_Principal is
begin
   new_line;
   put ("Appuyez sur entrer pour retourner au menu principal");
   new_line;
   skip_line;
end Retour_Menu_Principal;

procedure Affichage_Menu_principal (char : out character) is

begin
      New_Line(2);
      Put_Line("************************");
      new_line;
      Put_Line("     MENU PRINCIPAL");
      new_line;
      Put_Line("************************");
      new_line;
      New_Line;
      put_line(" Que souhaitez vous faire ?");
      new_line;
      Put_Line("   1 : Gerer les adherents");
      Put_Line("   2 : Gerer les reservations");
      Put_Line("   3 : Sauvegarde");
      Put_Line("   4 : Quitter");
      New_Line(2);
      char:=saisie_choix;
end Affichage_Menu_principal;

procedure affichage_partie_adherent (char : out character) is
begin
   new_line;
   new_line;
   Put_Line("************************");
   New_Line;
   Put_Line("     PARTIE ADHERENT");
   New_Line;
   Put_Line("************************");
   New_Line(2);
   Put_Line(" Que souhaitez vous faire ?");
   New_Line;
   Put_Line("   1 : Ajouter un adherent");
   Put_Line("   2 : Chercher un adherent");
   Put_Line("   3 : Affichage les adherents en mode prefixe");  
   Put_Line("   4 : Supprimemr un adherent");
   Put_Line("   5 : QUITTER");
   New_Line;
   char:=saisie_choix;
   New_Line;
   New_Line;
end affichage_partie_adherent;

procedure affichage_partie_reservation (char : out character) is
begin
   new_line;
   new_line;
   Put_Line("************************");
   New_Line;
   Put_Line("   PARTIE RESERVATION");
   New_Line;
   Put_Line("************************");
   New_Line(2);
   Put_Line(" Que souhaitez vous faire ?");
   New_Line;
   Put_Line("   1 : Reserver un creneau pour un adherent");
   Put_Line("   2 : Annuler un creneau d'un adherent");
   Put_Line("   3 : Afficher planning general");
   Put_Line("   4 : Afficher planning d'un adherent");
   Put_Line("   5 : Mettre à jour la date");
   Put_Line("   6 : QUITTER");
   New_Line;
   char:=saisie_choix;
   new_line;
   new_line;
end affichage_partie_reservation;


procedure affichage_partie_archive (char : out character) is
begin
   new_line;
   new_line;
   Put_Line("************************");
   New_Line;
   Put_Line("    PARTIE ARCHIVE ");
   New_Line;
   Put_Line("************************");
   New_Line;
   New_Line;
   Put_Line(" Que voulez vous faire ?");
   New_Line;
   Put_Line("   1 : Visualisation de la sauvegarde");
   Put_Line("   2 : QUITTER");
   char:=saisie_choix;
   new_line;
   new_line;
end affichage_partie_archive;

procedure affichage_quitter (char : out character) is
begin
   Put_Line("Etes-vous sur de vouloir quitter le menu ? Oui(O) / Non(N) :");
   char:=saisie_choix;
end affichage_quitter;


end menu_principal;