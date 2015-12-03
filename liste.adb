package body liste is 

	procedure creer_liste ( liste : out AdDoublet ) is
	begin
		liste := new AdDoublet;
	end creer_liste;

	procedure ajouter_en_tete_de_liste ( liste : in out AdDoublet ; element : in Doublet ) is
	begin
		element.suc:=liste;
		liste:=element
	end ajouter_en_tete_de_liste;


end liste;
