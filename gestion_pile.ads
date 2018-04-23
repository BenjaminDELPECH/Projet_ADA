With declaration_adherent, dates;

package gestion_pile is

SUBTYPE Mot14 IS String (1..14); -- saisie activite
Type T_CelluleAdherents;
Type  T_PteurPileAdherents is access T_CelluleAdherents;
Type T_CelluleAdherents is record
	Adherent : declaration_adherent.T_Adherent;
	suiv : T_PteurPileAdherents;
end record;

Procedure saisie_mot (s : out declaration_adherent.mot);
PROCEDURE Saisie_activite (acti : OUT declaration_Adherent.T_Contrat);
Procedure deja_inscrit (infos : declaration_adherent.T_Adherent ; Pteur : T_PteurPileAdherents ; inscrit : out boolean ; meme_contrat : out boolean);
Procedure modification_contrat (infos : declaration_adherent.T_Adherent ; Pteur : in out T_PteurPileAdherents);
Procedure ajout_adherent (Pteur : in out T_PteurPileAdherents);
Procedure Affichage_info_adh_pile (Pteur : T_PteurPileAdherents ; nomAdh, prenomAdh : declaration_adherent.mot; trouve : out boolean);
Procedure saisie_nom_prenom (nomAdh,prenomAdh: out declaration_adherent.mot);
end gestion_pile;
