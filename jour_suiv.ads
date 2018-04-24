with declaration_adherent,dates,fichiers,abr_adher,
gestion_pile,dates,action_adherent;

package Jour_Suiv is
   
   type T_Semaine is(Lundi,Mardi,Mercredi,Jeudi,Vendredi,Samedi,Dimanche);

procedure Passer_Jour_Suivant(D:in out dates.T_Date;J:in out T_Semaine);
Procedure modification_date_adhesion (infos : declaration_adherent.T_Adherent ; 
   PteurAdherent : in out gestion_pile.T_PteurPileAdherents);
Procedure Renouvellement_Adherent (Arbre_de_vie : in out abr_adher.T_Arbre_adh ; D : dates.T_Date ; 
   Pteur : in out gestion_pile.T_PteurPileAdherents);



end jour_Suiv;
