package Sem_J_Cren is 
   
   type T_Activite is (Aqua, Fitness, Aquaetfitness);
   type T_Tabadherents is array(Integer range <>)of T_Adherents;
      
   --Creneaux generaux pour le planing general
   
    Type T_Creneau_Aqua_gen is record
      Tabinscrit:T_Tabadherents(1..N);
      Taille:Integer:=0;
      Open:Boolean;
   end record;


   Type T_Creneau_Fitness_gen is record
      Tabinscrit:T_Tabadherents(1..N);
      Taille:Integer:=0;
      Open:Boolean;
   end record;
      
   
   Type T_Creneau_gen is record
      Aqua:T_Creneau_Aqua;
      Fitness:T_Creneau_Fitness;
   end record;
   
   type T_Jour_Gen is array(Integer range 1..6)of T_Creneau_Gen;
   type T_Planning_General is array(Integer range 1..6)of T_Jour_gen;

--Creneau pour les planning persos.


   Type T_Creneau_Adh is record 
    Activite:T_Activite; --Aqua, Fitness, AquaEtFitness;
    Present:Boolean;
   end record;
    
Type T_Jour_adh is array(integer range 1..6)of T_Creneau_adh;
Type T_Planning_Adh is array(Integer range 1..6)of T_Jour_adh;
      
   
      
      

      



      
end sem_j_cren;
