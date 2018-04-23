with Ada.Text_Io, Ada.Integer_Text_Io;
use Ada.Text_Io, Ada.Integer_Text_Io;

package body Save is

   procedure Enregistrer_Adh (
         P               : in out T_Pteurpileadherents;
         Nv_Nom          :        Mot;
         Nv_Prenom       :        Mot;
         Datenaiss       :        T_Date;
         Datederadhesion :        T_Date;
         Nbseances       :        integer;
         Type_Contract   :        T_Activite) is
      --les planing seront vides pour les nouveaux
      Parc : T_Pteurpileadherents := P;
      Save : T_Pteurpileadherents;

   begin
      while Parc/=null loop
         if P.Adherent.Nom = Nv_Nom and then P.Adherent.Prenom = Nv_Prenom and then P.Adherent.Datenaissance = Datenaiss then
            Put ("Cet adherent existe deja dans notre club."); New_Line;
            exit;
         end if;
         Parc := Parc.Suiv;
      end loop;
      if Parc =null then
         Save.Adherent.Nom := Nv_Nom;
         Save.Adherent.Prenom := Nv_Prenom;
         Save.Adherent.DateNaissance:=Datenaiss;
         Save.Adherent.Datederniereadhesion  := Datederadhesion ;
         Save.Adherent.NbSeances := Nbseances;
         Save.Adherent.TypeContrat := Type_Contract;
--         Save.Adherent.Sem1 := 
--         Save.Adherent.Sem2 :=   
         P := new T_Celluleadherents'(Save.adherent , P);
      end if;
         
      end Enregistrer_Adh;


   end Save;

