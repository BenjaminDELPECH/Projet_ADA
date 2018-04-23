with declaration_adherent,gestion_pile,dates;

package Save is

      procedure Enregistrer_Adh (
         P               : in out gestion_pile.T_PteurPileAdherents;
         Nv_Nom          :        declaration_adherent.Mot;
         Nv_Prenom       :        declaration_adherent.Mot;
         Datenaiss       :        dates.T_Date;
         Datederadhesion :        dates.T_Date;
         Nbseances       :        integer;
         Type_Contract   :        declaration_adherent.T_Contrat);

end Save;

