package body listeDeDoublet is

	-- Définitions liées au doublet

	function creer_coord ( x : in float; y : in float; z : in float ) return  T_Coord  is
		coord : T_Coord; 		-- PAs sur de la façon dont il faut déclarer (idem pour créer triangle)
	begin

		coord.X:=x;
		coord.Y:=y;
		coord.Z:=z;

		return coord;
	end creer_coord;

	function creer_triangle ( s1  : in T_Coord ; s2 : in T_Coord; s3 : in T_Coord ) return T_Triangle  is
		triangle : T_Triangle;
	begin
		triangle.Coord_1:=s1;
		triangle.Coord_2:=s2;
		triangle.Coord_3:=s3;

		return triangle;
	end creer_triangle;

	-- Définitions liées au liste

	procedure ajouter_en_tete_de_liste ( liste : in out AdDoublet ; valeur : in T_Triangle ) is
	begin
		liste := new Doublet' ( valeur, liste);	

	end ajouter_en_tete_de_liste;


	function est_vide ( liste : in AdDoublet ) return boolean is
	begin
		return (liste = null);
	end est_vide;


end listeDeDoublet;
