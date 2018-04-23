WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters,
   Donnee;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters,
   Donnee;
   
package body Donnee is

   

   procedure Sauvegarde ( Tab: IN OUT T_Tabadherents ) is
   Begin
      Declare
         Tab : Tabadherents (0..9);
      Begin 
      Tab(0).Nom := "Ermont";-----------------------------------others
      Tab(0).Prenom := "Luc";
      Tab(0).Datenaissance := (22,5,1987);
      Tab(0).DateDerniereAdhesion := (27,4,2017);
      Tab(0).Nbseances := 65 ;
      Tab(0).Typecontrat := Fitness ;
      Tab(0).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(3).Present:= True ;      
      Tab(0).Planingsemaine1.T_Planing_Adh(5).T_jour_Adh(2).activite := True ;
      
      Tab(1).Nom := "Martin";
      Tab(1).Prenom := "Julie";
      Tab(1).Datenaissance := (17,4,2000) ;
      Tab(1).DateDerniereAdhesion := (14,5,2018);
      Tab(1).Nbseances := 8 ;
      Tab(1).Typecontrat := Aqua ;

      Tab(2).Nom := "Bertrand";
      Tab(2).Prenom := "Lucille";
      Tab(2).Datenaissance := (27,6,1991) ;
      Tab(2).DateDerniereAdhesion := (27,4,2017);
      Tab(2).Nbseances := 102 ;
      Tab(2).Typecontrat := AquaetFitness ;

     
      Tab(3).Nom := "Liber";
      Tab(3).Prenom := "Anais";
      Tab(3).Datenaissance := (13,7,1977) ;
      Tab(3).DateDerniereAdhesion := (23,2,2018);
      Tab(3).Nbseances := 38 ;
      Tab(3).Typecontrat := Fitness ;
      Tab(3).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(3).Present:= True ;      
               
      Tab(4).Nom := "Arnaud";
      Tab(4).Prenom := "Bernard";
      Tab(4).Datenaissance := (28,2,1966) ;
      Tab(4).DateDerniereAdhesion := (28,4,2017);
      Tab(4).Nbseances := 105 ;
      Tab(4).Typecontrat := Fitness ;
      Tab(4).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(3).Present:= True ;      
      
      Tab(5).Nom := "Gillard";
      Tab(5).Prenom := "Anaelle";
      Tab(5).Datenaissance := (5,9,1986) ;
      Tab(5).DateDerniereAdhesion := (16,11,2017);
      Tab(5).Nbseances := 44 ;
      Tab(5).Typecontrat := AquaetFitness ;
      Tab(5).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(5).Present:= True ;      
      Tab(5).Planingsemaine1.T_Planing_Adh(5).T_jour_Adh(2).activite := True ;
               
      Tab(6).Nom := "Bertrand";
      Tab(6).Prenom := "Lucille";
      Tab(6).Datenaissance := (27,5,1992) ;
      Tab(6).DateDerniereAdhesion := (27,4,2017);
      Tab(6).Nbseances := 85 ;
      Tab(6).Typecontrat := AquaetFitness ;
      Tab(6).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(4).Present:= True ;       
      
      Tab(7).Nom := "Vandim";
      Tab(7).Prenom := "Marc";
      Tab(7).Datenaissance := (11,11,1982);
      Tab(7).DateDerniereAdhesion := (12,9,2017);
      Tab(7).Nbseances := 40 ;
      Tab(7).Typecontrat := Fitness ;
      Tab(7).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(4).Present:= True ;       
      Tab(7).Planingsemaine1.T_Planing_Adh(1).T_Jour_Adh(5).Present:= True ; 
      Tab(7).Planingsemaine1.T_Planing_Adh(5).T_Jour_Adh(2).Present:= True ;                
      
      Tab(8).Nom := "Ermont";
      Tab(8).Prenom := "Paule";
      Tab(8).Datenaissance := (22,5,1987) ;
      Tab(8).DateDerniereAdhesion := (3,9,2017);
      Tab(8).Nbseances := 36 ;
      Tab(8).Typecontrat := Aqua ;
    
     
      Tab(9).Nom := "Julius";
      Tab(9).Prenom := "Sylvie";
      Tab(9).Datenaissance := (24,4,1965) ;
      Tab(9).DateDerniereAdhesion := (28,4,2017);
      Tab(9).Nbseances := 32 ;
      Tab(9).Typecontrat := Aqua ;
     
      end;     
   end Sauvegarde;

   procedure Ajout_Dans_Pile (Tab : in T_Tabadherent; P : in out T_Pteurpileadherents ) is
   reccup : T_Adherent; 
   begin
      for I in 0..9 loop
         Reccup := Tab(I).T_Adherent;
         P:= New T_CelluleAdherents'(Reccup, P);
         P := P.suiv;
      end loop;         
   end Ajout_Dans_Pile;


end Donnee;



