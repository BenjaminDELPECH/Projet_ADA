with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
   
package body donnee is

   procedure Initialisation_donnees ( Tab: OUT declaration_adherent.T_Tabadherents;P1:IN OUT declaration_adherent.T_Planning_general;P2:in OUT declaration_adherent.T_Planning_general  ) is
     Begin 
      tab(0).Nom:="Ermont              "; --others
      Tab(0).Prenom := "Luc                 ";
      Tab(0).Datenaissance := (22,5,1987);
      Tab(0).DateDerniereAdhesion := (27,4,2017);
      Tab(0).Nbseances := 65 ;
      Tab(0).Typecontrat := declaration_adherent.T_Contrat'val(1); --fitness
      Tab(0).Planingsemaine1(1)(3).Present:= True ;
      Tab(0).Planingsemaine1(1)(3).Activite:= Declaration_Adherent.T_Activite'Val(1) ;
                          P1(1)(3).Fitness.Tabinscrit(1):=Tab(0);
      Tab(0).Planingsemaine1(6)(2).Present := True ;
      Tab(0).Planingsemaine1(6)(2).Activite := Declaration_Adherent.T_Activite'Val(1) ;
                          P1(6)(2).Fitness.Tabinscrit(1):=Tab(0);
       --semaine 2
      Tab(0).Planingsemaine2(1)(3).Present:= True ;
      Tab(0).Planingsemaine2(1)(3).Activite:= Declaration_Adherent.T_Activite'Val(1) ;
                          P2(1)(3).Fitness.Tabinscrit(1):=Tab(0);
      Tab(0).Planingsemaine2(6)(2).Present := True ;
      Tab(0).Planingsemaine2(6)(2).Activite := Declaration_Adherent.T_Activite'Val(1) ;
                          P2(6)(2).Fitness.Tabinscrit(1):=Tab(0);


        
      
      Tab(1).Nom := "Martin              ";
      Tab(1).Prenom := "Julie               ";
      Tab(1).Datenaissance := (17,4,2000) ;
      Tab(1).DateDerniereAdhesion := (14,5,2018);
      Tab(1).Nbseances := 8 ;
      Tab(1).Typecontrat := Declaration_Adherent.T_Contrat'Val(0); --aqua
      --semaine2
      Tab(1).Planingsemaine2(1)(3).Present := True ;
      Tab(1).Planingsemaine2(1)(3).Activite := Declaration_Adherent.T_Activite'Val(1) ;
                          P2(1)(3).Aqua.Tabinscrit(1):=Tab(1);

      

      Tab(2).Nom := "Bertrand            ";
      Tab(2).Prenom := "Lucille             ";
      Tab(2).Datenaissance := (27,6,1991) ;
      Tab(2).DateDerniereAdhesion := (27,4,2017);
      Tab(2).Nbseances := 102 ;
      Tab(2).Typecontrat := declaration_adherent.T_Contrat'val(2); -- aquaetfitness
      --Semaine2
      Tab(2).Planingsemaine2(1)(3).Present := True ;
      Tab(2).Planingsemaine2(1)(3).Activite := Declaration_Adherent.T_Activite'Val(1) ;
                          P2(1)(3).Fitness.Tabinscrit(2):=Tab(2);
      Tab(2).Planingsemaine2(6)(2).Present := True ;
      Tab(2).Planingsemaine2(6)(2).Activite := Declaration_Adherent.T_Activite'Val(1) ;
                          P2(6)(2).Fitness.Tabinscrit(2):=Tab(2);

     
      Tab(3).Nom := "Liber               ";
      Tab(3).Prenom := "Anais               ";
      Tab(3).Datenaissance := (13,7,1977) ;
      Tab(3).DateDerniereAdhesion := (23,2,2018);
      Tab(3).Nbseances := 38 ;
      Tab(3).Typecontrat := declaration_adherent.T_Contrat'val(1);--fitness
      Tab(3).Planingsemaine1(1)(3).Present:= True ;
      Tab(3).Planingsemaine1(1)(3).Activite := Declaration_Adherent.T_Activite'Val(1);
                          P1(1)(3).Fitness.Tabinscrit(2):=Tab(3);
               
      Tab(4).Nom := "Arnaud              ";
      Tab(4).Prenom := "Bernard             ";
      Tab(4).Datenaissance := (28,2,1966) ;
      Tab(4).DateDerniereAdhesion := (28,4,2017);
      Tab(4).Nbseances := 105 ;
      Tab(4).Typecontrat := declaration_adherent.T_Contrat'val(1) ;--fitness
      Tab(4).Planingsemaine1(1)(3).Present:= True ;      
      Tab(4).Planingsemaine1(1)(3).Activite := declaration_adherent.T_Activite'val(1);
                          P1(1)(3).Fitness.Tabinscrit(3):=Tab(4);

      Tab(5).Nom := "Gillard             ";
      Tab(5).Prenom := "Anaelle             ";
      Tab(5).Datenaissance := (5,9,1986) ;
      Tab(5).DateDerniereAdhesion := (16,11,2017);
      Tab(5).Nbseances := 44 ;
      Tab(5).Typecontrat := declaration_adherent.T_Contrat'val(2) ;--Aquaetfitness
      Tab(5).Planingsemaine1(1)(5).Present:= True ;
      Tab(5).Planingsemaine1(1)(5).Activite := Declaration_Adherent.T_Activite'Val(1);
                          P1(1)(5).Fitness.Tabinscrit(1):=Tab(5);     
      Tab(5).Planingsemaine1(6)(2).Present := True ;
      Tab(5).Planingsemaine1(6)(2).Activite := Declaration_Adherent.T_Activite'Val(1) ;
                          P1(6)(2).Fitness.Tabinscrit(2):=Tab(5); 
      --Semaine 2
      Tab(5).Planingsemaine2(1)(5).Present:= True ;
      Tab(5).Planingsemaine2(1)(5).Activite := Declaration_Adherent.T_Activite'Val(1);
                          P2(1)(5).Fitness.Tabinscrit(1):=Tab(5);
      --Aqua
      Tab(5).Planingsemaine2(1)(3).Present:= True ;
      Tab(5).Planingsemaine2(1)(3).Activite := Declaration_Adherent.T_Activite'Val(0);
                          P2(1)(3).Aqua.Tabinscrit(2):=Tab(5); 
      
      Tab(5).Planingsemaine2(6)(2).Present:= True ;
      Tab(5).Planingsemaine2(6)(2).Activite := Declaration_Adherent.T_Activite'Val(0);
                          P2(6)(2).Aqua.Tabinscrit(3):=Tab(5);     
     

      
      Tab(6).Nom := "Bertrand            ";
      Tab(6).Prenom := "Lucille             ";
      Tab(6).Datenaissance := (27,5,1992) ;
      Tab(6).DateDerniereAdhesion := (27,4,2017);
      Tab(6).Nbseances := 85 ;
      Tab(6).Typecontrat := declaration_adherent.T_Contrat'val(2) ;--Aquaetfitness
      Tab(6).Planingsemaine1(1)(4).Present:= True ;       
      Tab(6).Planingsemaine1(1)(4).Activite:= Declaration_Adherent.T_Activite'Val(1);
                          P1(1)(4).Fitness.Tabinscrit(2):=Tab(6);
      --Semaine 2 
      --Aqua

      
      Tab(7).Nom := "Vandim              ";
      Tab(7).Prenom := "Marc                ";
      Tab(7).Datenaissance := (11,11,1982);
      Tab(7).DateDerniereAdhesion := (12,9,2017);
      Tab(7).Nbseances := 40 ;
      Tab(7).Typecontrat := declaration_adherent.T_Contrat'val(1) ;--Fitness
      Tab(7).Planingsemaine1(1)(4).Present:= True ;
      Tab(7).Planingsemaine1(1)(4).Activite:= Declaration_Adherent.T_Activite'Val(1);
                          P1(1)(4).Fitness.Tabinscrit(2):=Tab(7);
      
      Tab(7).Planingsemaine1(1)(5).Present:= True ; 
      Tab(7).Planingsemaine1(1)(5).Activite:= declaration_adherent.T_Activite'val(1);
                          P1(1)(5).Fitness.Tabinscrit(2):=Tab(7);
      
      Tab(7).Planingsemaine1(6)(2).Present:= True ;
      Tab(7).Planingsemaine1(6)(2).Activite:= Declaration_Adherent.T_Activite'Val(1);
                          P1(6)(2).Fitness.Tabinscrit(3):=Tab(7);
       --Semaine 2
      Tab(7).Planingsemaine2(1)(5).Present:= True ; 
      Tab(7).Planingsemaine2(1)(5).Activite:= declaration_adherent.T_Activite'val(1);
                          P2(1)(5).Fitness.Tabinscrit(2):=Tab(7);
      
      Tab(7).Planingsemaine2(6)(2).Present:= True ;
      Tab(7).Planingsemaine2(6)(2).Activite:= Declaration_Adherent.T_Activite'Val(1);
                          P2(6)(2).Fitness.Tabinscrit(3):=Tab(7);


      Tab(8).Nom := "Ermont              ";
      Tab(8).Prenom := "Paule               ";
      Tab(8).Datenaissance := (22,5,1987) ;
      Tab(8).DateDerniereAdhesion := (3,9,2017);
      Tab(8).Nbseances := 36 ;
      Tab(8).Typecontrat := Declaration_Adherent.T_Contrat'Val(0) ;--Aqua
      --Semaine 2
      Tab(8).Planingsemaine2(6)(2).Present:= True ;
      Tab(8).Planingsemaine2(6)(2).Activite:= Declaration_Adherent.T_Activite'Val(0);
                          P2(6)(2).Aqua.Tabinscrit(4):=Tab(8);

      
     
      Tab(9).Nom := "Julius              ";
      Tab(9).Prenom := "Sylvie              ";
      Tab(9).Datenaissance := (24,4,1965) ;
      Tab(9).DateDerniereAdhesion := (28,4,2017);
      Tab(9).Nbseances := 32 ;
      Tab(9).Typecontrat := Declaration_Adherent.T_Contrat'Val(0) ;--Aqua
        --Semaine 2
      Tab(9).Planingsemaine2(1)(3).Present:= True ;
      Tab(9).Planingsemaine2(1)(3).Activite:= Declaration_Adherent.T_Activite'Val(0);
                          P2(1)(3).Aqua.Tabinscrit(4):=Tab(9);
         
      Tab(9).Planingsemaine2(6)(2).Present:= True ;
      Tab(9).Planingsemaine2(6)(2).Activite:= Declaration_Adherent.T_Activite'Val(0);
                          P2(6)(2).Aqua.Tabinscrit(3):=Tab(9);

        
       
   end Initialisation_donnees;

   procedure Ajout_Dans_Pile (Tab : in declaration_adherent.T_Tabadherents; P : in out gestion_pile.T_Pteurpileadherents ) is
   reccup : declaration_adherent.T_Adherent; 
   begin
      for I in Tab'range loop
         Reccup := Tab(I);
         P:= New gestion_pile.T_CelluleAdherents'(Reccup, P);
      end loop;         
   end Ajout_Dans_Pile;


end Donnee;



