WITH declaration_adherent,gestion_pile;

package donnee is

   Procedure Initialisation_donnees ( tab: OUT declaration_adherent.T_Tabadherents;P1:IN OUT declaration_adherent.T_Planning_general;P2:in OUT declaration_adherent.T_Planning_general);
   Procedure Ajout_Dans_Pile (Tab : in declaration_adherent.T_Tabadherents; P : in out gestion_pile.T_PteurPileAdherents ); 
   
end Donnee;
