with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;

package body Save is

   procedure Enregistrer_Adh (
         P               : in out gestion_pile.T_PteurPileAdherents;
         Nv_Nom          :        declaration_adherent.Mot;
         Nv_Prenom       :        declaration_adherent.Mot;
         Datenaiss       :        dates.T_Date;
         Datederadhesion :        dates.T_Date;
         Nbseances       :        integer;
         Type_Contract   :        declaration_adherent.T_Contrat) is
      --les planing seront vides pour les nouveaux
      Parc : gestion_pile.T_Pteurpileadherents := P;
      Save : gestion_pile.T_Pteurpileadherents;

   begin
      while Parc/=null loop
         if P.Adherent.Nom = Nv_Nom and then P.Adherent.Prenom = Nv_Prenom 
         and then P.Adherent.Datenaissance = Datenaiss then
            Put ("Cet adherent existe deja dans notre club."); New_Line;
            exit;
         end if;
         Parc := Parc.Suiv;
      end loop;
      if Parc=null then
         Save.Adherent.Nom := Nv_Nom;
         Save.Adherent.Prenom := Nv_Prenom;
         Save.Adherent.DateNaissance:=Datenaiss;
         Save.Adherent.Datederniereadhesion  := Datederadhesion ;
         Save.Adherent.NbSeances := Nbseances;
         Save.Adherent.TypeContrat := Type_Contract;
--         Save.Adherent.Sem1 := 
--         Save.Adherent.Sem2 :=   
         P := new gestion_pile.T_Celluleadherents'(Save.adherent , P);
      end if;
         
      end Enregistrer_Adh;


   end Save;

