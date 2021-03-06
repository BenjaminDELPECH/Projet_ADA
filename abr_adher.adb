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

   Procedure insert_ABR (PteurAdherant : gestion_pile.T_PteurPileAdherents ; 
      Arbre_de_vie : IN OUT T_Arbre_adh) is
   begin
      if Arbre_de_vie=null then
         Arbre_de_vie:= new T_Noeud'(PteurAdherant, null, null);
      elsif not Nom_Prenom_Sup(PteurAdherant,Arbre_de_vie) then --valeur nom +
      -- prenom inférieur à la valeur du noeud
         Insert_Abr(PteurAdherant, Arbre_de_vie.Fg);
      else
         Insert_Abr(PteurAdherant, Arbre_de_vie.Fd);
      end if;
   end Insert_Abr;

Procedure initialisation_ABR (Pteur:gestion_pile.T_PteurPileAdherents ; 
   A : out T_Arbre_adh) is
   begin
   if pteur /= null then 
      insert_ABR(Pteur,A);
      initialisation_ABR(Pteur.suiv,A);
   end if;
end initialisation_ABR;

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

   Procedure Affichage_ABR ( A : T_Arbre_adh) is
   begin
      if A/=null then
         Affichage_ABR(A.Fg);
         put(A.PteurCelluleAdh.Adherent.Nom);
         put(A.PteurCelluleAdh.Adherent.prenom);
         new_line;
         Affichage_ABR(A.Fd);
      end if;
   end Affichage_ABR;

function homonyme (Arrrrr : T_Arbre_adh ; 
   nomAdherent,prenomAdherent : declaration_adherent.mot) return boolean is
nb : integer;

function nb_meme_nom (Arrr : T_Arbre_adh ; 
   nomAdherent,prenomAdherent : declaration_adherent.mot) return integer is
begin
   if Arrr=null then return 0;
   elsif Arrr.PteurCelluleAdh.adherent.nom=nomAdherent and then Arrr.PteurCelluleAdh.adherent.prenom=prenomAdherent then 
      return (1+nb_meme_nom(Arrr.fg,nomAdherent,prenomAdherent)+nb_meme_nom(Arrr.fd,nomAdherent,prenomAdherent));
   else return (nb_meme_nom(Arrr.fg,nomAdherent,prenomAdherent)+nb_meme_nom(Arrr.fd,nomAdherent,prenomAdherent));
   end if;
end nb_meme_nom;

begin
   nb:=nb_meme_nom(Arrrrr,nomAdherent,prenomAdherent);
   if nb >1 then return true;
   else return false;
   end if;
end homonyme;


Procedure Affichage_Pile (Pteur : gestion_pile.T_PteurPileAdherents ; Arbre_de_vie : T_Arbre_adh) is
nomAdhe,prenomAdhe:declaration_adherent.mot;
begin
   if pteur /= null then
      put ("=> ");
      put(Pteur.adherent.nom);
      put(Pteur.adherent.prenom);
      put(Pteur.adherent.nom(1));
      put(Pteur.adherent.prenom(1));
      nomAdhe :=Pteur.adherent.nom;
      prenomAdhe:=Pteur.adherent.prenom;
      if homonyme(Arbre_de_vie,nomAdhe,prenomAdhe) then
      put("(");
      put(Pteur.adherent.datenaissance.annee mod 100, width=>0);
      put(")");
      end if;
      new_line;
      Affichage_Pile(pteur.suiv,Arbre_de_vie);
   end if;
end Affichage_Pile;

end ABR_adher;
