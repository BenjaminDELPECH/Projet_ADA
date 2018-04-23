with gestion_pile, declaration_adherent;
use gestion_pile,declaration_adherent;

package abr_adher is 
   type T_Noeud;
   type T_Arbre_adh is access T_Noeud;
   type T_Noeud is record
      PteurCelluleAdh:gestion_pile.T_PteurPileAdherents;
      Fg,Fd:T_Arbre_adh;
   end record;
   
  function Nom_Prenom_Sup (PteurPile : gestion_pile.T_PteurPileAdherents ; 
      Noeud_Arbre : T_Arbre_adh) return boolean;

	Procedure insert_ABR (PteurAdherant : gestion_pile.T_PteurPileAdherents ; 
      Arbre_de_vie : IN OUT T_Arbre_adh);

Procedure initialisation_ABR (Pteur:gestion_pile.T_PteurPileAdherents ; 
	A : out T_Arbre_adh);

   Procedure affich_Prefixe_ABR (A : IN T_Arbre_adh);
   Procedure Affichage_ABR ( A : T_Arbre_adh);
      
end abr_adher;
