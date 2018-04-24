With dates;
Package declaration_adherent is

N : constant integer := 3;
P,Plimit : constant integer := 4;

subtype mot is string(1..20);

type T_Contrat is (Aqua, Fitness, Aquaetfitness);
type T_Activite is (Aqua, Fitness);
   
 
  Type T_Creneau_Adh is record 
    Activite:T_Activite; --Aqua, Fitness, AquaEtFitness;
    Present:Boolean:=False;
   end record;

Type T_Jour_adh is array(integer range 1..6) of T_Creneau_adh;

Type T_Planning_Adh is array(Integer range 1..6) of T_Jour_adh;


Type T_Adherent is record
	Nom : mot := (others=>' ');
	Prenom : mot := (others=>' ');
	DateNaissance : dates.T_Date := (1,1,1);
	DateDerniereAdhesion : dates.T_Date := (1,1,1);
	NbSeances : integer := 0;
  Typecontrat : T_Contrat;
  PlaningSemaine1 : T_Planning_Adh; 
  PlaningSemaine2 : T_Planning_Adh;    
end record;


   type T_Tabadherents is array(integer range <>)of T_Adherent;--permet d'avoir une liste dadherents presents dans chaque creneau
  
      
   --Creneaux generaux pour le planing general
   
    Type T_Creneau_Aqua_gen is record
      Tabinscrit:T_Tabadherents(1..P);
      Taille:Integer:=0;
      Open:Boolean:= False;
   end record;




   Type T_Creneau_Fitness_gen is record
      Tabinscrit:T_Tabadherents(1..N);
      Taille:Integer:=0;
      Open:Boolean:= False;
   end record;
      
   
   Type T_Creneau_gen is record
      Aqua:T_Creneau_Aqua_gen;
      Fitness:T_Creneau_Fitness_gen;
      archive:boolean:=False;
   end record;
   
   type T_Jour_Gen is array(Integer range 1..6)of T_Creneau_Gen;
   type T_Planning_General is array(Integer range 1..6)of T_Jour_gen;
   
   
 --Planning Semaine1, Semaine 2 et actuel  
   Plan_Act: T_Planning_General;
   Plan_Suiv: T_Planning_General;
   Plan_Vide: T_Planning_General;

   









end declaration_adherent;
