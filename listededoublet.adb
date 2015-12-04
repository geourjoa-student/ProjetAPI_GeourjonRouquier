with Ada.Text_io;
with Ada.Float_text_io;

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

	-- Fonctions d'affichage dans la console

	procedure Put_coord ( coord : in T_Coord) is
	begin
		Ada.Text_io.Put("( ");
		Ada.Float_text_io.put(coord.x, exp=>0);
		Ada.Text_io.Put(" , ");
		Ada.Float_text_io.put(coord.y, exp=>0);
		Ada.Text_io.Put(" , ");
		Ada.Float_text_io.put(coord.z, exp=>0);
		Ada.Text_io.Put(" )");
	end Put_coord;
	
	
	procedure Put_triangle ( triangle : in T_Triangle )is
	begin
		Ada.Text_io.Put("S1 : ");
		Put_coord(triangle.Coord_1);
		Ada.Text_io.Put(", S2 : ");
		Put_coord(triangle.Coord_2);
		Ada.Text_io.Put(", S3 : ");
		Put_coord(triangle.Coord_3);
		Ada.Text_io.Put(".");
	end Put_triangle;


	procedure Put ( liste : in AdDoublet ) is
	begin
		Ada.Text_io.Put_line("Ce doublet représente le triangle: ");
		Put_triangle(liste.all.Triangle);
		Ada.Text_io.new_line;
	end Put;




end listeDeDoublet;
