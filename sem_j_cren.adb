with Ada.Text_Io,Ada.Integer_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io;

package body sem_j_cren is 
   
   Procedure Initial_Creneaux (Plan_act : IN OUT T_Planning_General) is
   
   Begin
      For I in T_Plan_act'rang loop
         if I = 1 then
            Plan_Act(3).T_Creneau_Gen.Aqua.Open := True;
            Plan_Act(4).T_Creneau_Gen.Aqua.Open := True;
            Plan_Act(5).T_Creneau_Gen.Aqua.Open := True;
            Plan_Act(3).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(5).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(6).T_Creneau_Gen.Fitness.Open := True;        
         elsif I = 2 then
            Plan_Act(5).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(6).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(3).T_Creneau_Gen.Aqua.Open := True;            
            Plan_Act(5).T_Creneau_Gen.Aqua.Open := True;
            Plan_Act(6).T_Creneau_Gen.Aqua.Open := True;            
         elsif I = 3 then
            Plan_Act(3).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(5).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(6).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(5).T_Creneau_Gen.Aqua.Open := True;
            Plan_Act(6).T_Creneau_Gen.Aqua.Open := True;                       
         elsif I = 4 then
            Plan_Act(3).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(5).T_Creneau_Gen.Aqua.Open := True;    
         elsif I = 5 then
            Plan_Act(1).T_Creneau_Gen.Fitness.Open := True; 
            Plan_Act(2).T_Creneau_Gen.Fitness.Open := True;
            Plan_Act(1).T_Creneau_Gen.Aqua.Open := True;             
            Plan_Act(2).T_Creneau_Gen.Aqua.Open := True;             
         end if;
      End Loop;   
   end Initial_Creneaux;
      
end sem_j_cren;
