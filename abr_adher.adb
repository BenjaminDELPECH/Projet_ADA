with Ada.Text_Io,Ada.Integer_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io;

package body abr_adher is

   function Nom_Prenom_Sup (PteurPile : gestion_pile.T_PteurPileAdherents ; 
      Noeud_Arbre : T_Arbre_adh) return boolean is
   begin
      -- True si le nom de la pile est > au nom de l'ABR
         if PteurPile.adherent.nom > Noeud_Arbre.PteurCelluleAdh.adherent.Nom
          or
               (PteurPile.adherent.nom = 
                  Noeud_Arbre.PteurCelluleAdh.adherent.Nom 
                  AND PteurPile.adherent.prenom > 
                  Noeud_Arbre.PteurCelluleAdh.adherent.Prenom) then
         return True;
         else return False;
       end if;
   end Nom_Prenom_Sup;

   Procedure Meme_nom_prenom (A : T_Arbre_adh ; 
      infos : declaration_adherent.T_Adherent) is
   begin
      if A /= null then if A.PteurCelluleAdh.adherent.nom=infos.nom and then
       A.PteurCelluleAdh.adherent.prenom=infos.prenom then
            put(A.PteurCelluleAdh.adherent.datenaissance.annee mod 100);
            else Meme_nom_prenom(A.fd,infos);
            Meme_nom_prenom(A.fg,infos);
         end if;
   end if;
end Meme_nom_prenom;


   Procedure insert_ABR (Pteur : IN gestion_pile.T_PteurPileAdherents ; 
      A : IN OUT T_Arbre_adh) is
   begin
      if A=null then
         A:= new T_Noeud'(Pteur, null, null);
      elsif not Nom_Prenom_Sup(Pteur,A) then
         Insert_Abr(Pteur, A.Fg);
      else
         Insert_Abr(Pteur, A.Fd);
      end if;
   end Insert_Abr;

   Procedure affich_Prefixe_ABR (A : T_Arbre_adh) is
      begin
         if A/=null then
            Put(A.PteurCelluleAdh.Adherent.Nom(1)); 
            put(A.PteurCelluleAdh.Adherent.prenom(1));
            Put(" - ");
            -- Meme_nom_prenom(A,info_adherent);
            affich_Prefixe_ABR (A.Fg);
            affich_Prefixe_ABR (A.Fd);
         end if;
   end affich_Prefixe_ABR;

end ABR_adher;
