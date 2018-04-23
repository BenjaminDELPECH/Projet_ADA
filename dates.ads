package dates is

subtype intervale_jour is integer range 1..31;
subtype intervale_mois is integer range 1..12;

	Type T_Date is record
		jour : intervale_jour;
		mois : intervale_mois;
		annee : positive;
	end record;

	date_jour:T_Date:=(25,04,2017); -- date soutenance

    Function verification_date_bisextile (d : T_Date) return boolean;
    Procedure saisie_date (d : out T_Date; fait : out boolean);
    procedure Passer_Jour_Suivant(D:in out T_Date);
    procedure affichage_date(D : T_Date);

end dates;