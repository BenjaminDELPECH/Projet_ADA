WITH Ada.Text_IO,ada.Sequential_IO;
USE Ada.Text_IO;



package body Fichiers is
   
--SAUVEGARDE ET RECUPERATION DES ADHERENTS
   procedure Create_Tab_Adherents(Tete:T_Pteurpileadherents;A:in out T_Tableau_Adherents)is
   tmp:T_Pteurpileadherents:=Tete;compteur:integer:=1;
   begin
      while tmp /= null loop
        A(Compteur):= Tmp.Adherent;
         Compteur := Compteur+1;
         Tmp:=Tmp.Suiv;
      end loop;
   end Create_Tab_Adherents;
   

procedure Recup_Pile_Adherents(Tete:in out T_Pteurpileadherents;A:in out T_Tableau_Adherents)is
   compteur:integer:=1;
   begin
      while A(compteur).DateNaissance.Annee /= 1 loop
         Tete:=new T_Celluleadherents'(A(Compteur),Tete);
         Compteur:=Compteur+1;
      end loop;
          
   end Recup_Pile_Adherents;
   


   --Sauvegarde adherents actuels, adherents archives, planning actuel, planning archive
   
   procedure Save(Adherents:T_Tableau_Adherents;Planning_actuel:T_Planning_General;Tab_Adh_archive:T_Archive_Adh;Tab_planning_archive:T_Archive_Planning) IS
      F1:Fichier_Adherents.File_Type;
      F2:Fichier_Planning_actuel.File_Type;
      F3:Fichier_Adherents_archive.File_Type;
      F4:Fichier_Planning_archive.File_Type;

   BEGIN
      begin
         Create_Tab_Adherents(tete_pile,Tab_adh);
         Open(F1,Out_File,"save_Adherents");--ouvrir le fichier s'il est existe
        EXCEPTION
         when others =>Create(F1,Name=>"save_Adherents");      
       end;
   begin
      Open(F2,Out_File,"save_Plan_actuel");
      EXCEPTION
         WHEN OTHERS =>Create(F2,Name=>"save_Plan_actuel");
   end;
   
   begin
        Open(F3,Out_File,"save_Adherents_archive");
         EXCEPTION
         WHEN OTHERS =>Create(F3,Name=>"save_Plan_actuel");
   end;
   
   begin
         Open(F4,Out_File,"save_Planning_archive");
         EXCEPTION
         WHEN OTHERS =>Create(F4,Name=>"save_Planning_archive");
      end;

   

   Write(F1,Adherents);
   Write(F2,Planning_actuel);
   Write(F3,Tab_Adh_archive);
    Write(F4,Tab_planning_archive);
   Close(F1);
   Close(F2);
   Close(F3);
   Close(F4);
   END Save;




   PROCEDURE Restore(Adherents:OUT T_Tableau_Adherents;Planning_actuel:out T_Planning_General;Tab_Adh_archive:OUT T_Archive_Adh;Tab_planning_archive:OUT T_Archive_Planning) IS
      F1:Fichier_Adherents.File_Type;
      F2:Fichier_Planning_actuel.File_Type;
      F3:Fichier_Adherents_archive.File_Type;
      F4:Fichier_Planning_archive.File_Type;
   BEGIN
      Open(F1,In_File,"save_editeur");
      Open(F2,In_File,"save_Plan_actuel");
      Open(F3,In_File,"save_Adherents_archive");
      Open(F4,In_File,"save_Planning_archive");

      
      Read(F1,Adherents);Read(F2,Planning_actuel);
      Read(F3,Tab_Adh_archive);Read(F4,Tab_planning_archive);
      Close(F1);
      --transformation du tableau en pile.
      Recup_Pile_Adherents(tete_pile,Tab_Adh);
   END Restore;








--procedure permettant d'archiver les plannins quand on change de semaine
  procedure Archive_Planning_act(T:in out T_Archive_Planning;Planning_act:T_Planning_general)is
   I:integer:=0;
   begin
      loop
            If T(I)(1)(1).archive = FALSE Then T(I):= Planning_act; exit;  end if;
            I:=I+1;
            
         end loop;
      
   end Archive_Planning_Act; 
   


procedure Archive_Adherent(T:in out T_Archive_adh;Adh:T_Adherent)is
   I:integer:=0;
   begin
      loop
            If T(I).DateNaissance.Annee = 1 Then T(I):= Adh; exit;  end if;
            I:=I+1;
            
         end loop;
      
end Archive_Adherent; 




  

END fichiers;

