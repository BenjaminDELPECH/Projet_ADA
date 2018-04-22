with declaration_adherent,dates,fichiers;

package Jour_Suiv is
   
   type T_Semaine is(Lundi,Mardi,Mercredi,Jeudi,Vendredi,Samedi,Dimanche);
   Jour_act:T_Semaine:=Mercredi;

procedure Passer_Jour_Suivant(D:in out dates.T_Date;J:in out T_Semaine);



end jour_Suiv;
