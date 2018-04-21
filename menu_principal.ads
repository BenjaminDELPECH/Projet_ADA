Package menu_principal is

function saisie_choix return character;
procedure Affichage_Menu_principal (char : out character);
procedure affichage_partie_adherent (char : out character);
procedure affichage_partie_reservation (char : out character);
procedure affichage_partie_archive (char : out character);
procedure affichage_quitter (char : out character);


end menu_principal;