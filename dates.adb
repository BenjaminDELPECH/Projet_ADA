With ada.text_io, ada.integer_text_io;
Use ada.text_io, ada.integer_text_io;

package body dates is 
	
	Function verification_date_bisextile (d : T_Date) return boolean is
	begin
		if ((d.annee mod 4=0) and (d.annee mod 100/=0)) or (d.annee mod 400=0) then
			put("Annee bisextile"); --un peu de verbose pour faire plaisir à Annie
			new_line;
			return true;
		else return false;
		end if;
	end verification_date_bisextile;

 	Procedure saisie_date (d : out T_Date ; fait : out boolean) is
 	begin
 		new_line;
 		put ("Saisir jour : ");
 		loop
 			begin
 			get(d.jour);
 			skip_line;
 			exit;
 			exception
 				when data_error=> skip_line; put ("Erreur, recommencer"); new_line;
 				when constraint_error=> skip_line; put ("Erreur, recommencer"); new_line;
 			 	end;
 		end loop;

 		new_line;
 		put ("Saisir mois : ");
 		loop
 			begin
 			get(d.mois);
 			skip_line;
 			exit;
 			exception
 				when data_error=> skip_line; put ("Erreur, recommencer"); new_line;
 				when constraint_error=> skip_line; put ("Erreur, recommencer"); new_line;
 			end;
 		end loop;

 		new_line;
 		put("Saisir annee : ");
 		loop
 			begin
 			get(d.annee);
 			skip_line;
 			exit;
 			exception
 				when data_error=> skip_line; put ("Erreur, recommencer"); new_line;
 				when constraint_error=> skip_line; put ("Erreur, recommencer"); new_line;
 			end;
 		end loop;
 		if verification_date_bisextile(d) then
 			fait := true;
 		else
 			fait := false;
 		end if;

 		case d.mois is
 			when 4|6|9|11=>
 				if d.jour > 30 then
 					fait := false;
 				else fait := true;
 				end if;
 			when 2 => 
 				if d.jour > 29 then
 					fait := false;
 				elsif not verification_date_bisextile(d) then -- vérification si la date ne correspond pas à une année bisextile
 					if d.jour > 28 then
 						fait := false;
					else fait := true;
 					end if;
 				else
 					fait := true;
 				end if;
 			when others => fait := true;
 		end case;
end Saisie_Date;


-- Benjamin plus pratique de mettre jour suivant ici

-- procedure Passer_Jour_Suivant(D:in out T_Date) is
-- begin
--   --on passe au jour suivant
--    D.Jour:=D.Jour+1;
   
-- --on gere tout les cas ou il faut changer le mois ou l'ann�e
   
--    case D.Mois is
--       when 12 =>
--             if D.Jour >31 then D.Annee:=D.annee+1;D.mois:=1;D.jour:=1;
--          else D.Jour := D.Jour+1;
--          end if;
--       when 1|3|5|7|10 =>
--          if D.Jour >31 then D.Mois := D.Mois+1;D.Jour := 1;end if;
--       when 2 => if (Verification_Date_Bisextile(D)= TRUE) then 
--             if D.Jour = 28 then D.Mois := D.Mois +1;
--                D.Jour := 1;
--             end if;
--          elsif D.Jour = 29 then D.Mois := D.Mois +1;
--             D.Jour :=1;
--          end if;
--       when 4|6|8|9|11 => if D.Jour > 30 then D.Mois := D.Mois +1;D.Jour := 1;end if;
--       when others => null;
--    end case;
   
-- end Passer_Jour_Suivant;

procedure affichage_date(D : T_Date) is
begin
   put(D.jour,width=>0);
   put("/");
   put(D.mois,width=>0);
   put("/");
   put(D.annee,width=>0);
end affichage_date;

      
      
 
        
            
            
      
end dates;

