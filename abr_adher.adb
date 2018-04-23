with Ada.Text_Io,Ada.Integer_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io;

package body abr_adher is 

   -- function Nom_Prenom_Sup (Pteur: gestion_pile.T_PteurPileAdherents ; A.adh:declaration_adherent.T_Adherent) return boolean is
   -- begin
      -- True si le nom de la pile est > au nom de l'ABR
      -- if A/= null then
         -- if Pteur.Adherent.Nom > A.Adh.Nom or
               -- (Pteur.Adherent.Nom = A.Adh.Nom 
                  -- AND Pteur.Adherent.Prenom > A.Adh.Prenom) then
         -- return True;
         -- else return False;
       -- end if;
      -- else return false;
      -- end if;
   -- end Nom_Prenom_Sup;

   -- Procedure Meme_nom_prenom (A : T_Arbre_adh ; infos : declaration_adherent.T_Adherent) is
   -- begin
      -- if Pteur /= null then if A.adh.nom=infos.nom and then A.adh.prenom=infos.prenom then
            -- put(A.adh.datesnaissance.annee(3));put(A.adh.datenaissance.annee(4)); -- Attention plantage
            -- else deja_inscrit(infos,Pteur.suiv);
         -- end if;
   -- end if;
-- end Meme_nom_prenom;


   -- Procedure insert_ABR (Pteur : IN gestion_pile.T_PteurPileAdherents ; A : IN OUT T_Arbre_adh) is
   -- begin
   --    if A=null then
   --       A:= new T_Noeud'(Pteur.adherent, null, null);
   --    elsif not Nom_Prenom_Sup(Pteur,A) then
   --       Inser_Abr(Pteur, A.Fg);
   --    else
   --       Insert_Abr(Pteur, A.Fd);
   --    end if;
   -- end Insert_Abr;

   Procedure affich_Prefixe_ABR (A : IN T_Arbre_adh) is
      begin
         if A/=null then
            Put(A.Adh.Nom(1)); put(A.Adh.prenom(1));
            Put(" - ");
            -- Meme_nom_prenom(A,info_adherent);
            affich_Prefixe_ABR (A.Fg);
            affich_Prefixe_ABR (A.Fd);
         end if;
   end affich_Prefixe_ABR;

end ABR_adher;
