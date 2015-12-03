with listeDeDoublet; use listeDeDoublet;

with Ada.Integer_text_io;
with Ada.Text_Io;

procedure main is 
	maListeDeTest : AdDoublet;
	s1,s2,s3,s4,s5 : T_Coord;
	t1,t2,t3 : T_Triangle;

	courant : AdDoublet;
	i : integer :=0;
begin
	maListeDeTest := null;
	
	s1:=creer_coord ( 1.0, 2.0, 3.0 );
	s2:=creer_coord ( 2.0, 3.0, 4.0 );
	s3:=creer_coord ( 3.0, 4.0, 5.0 );
	s4:=creer_coord ( 4.0, 5.0, 6.0 );
	s5:=creer_coord ( 5.0, 6.0, 7.0 );


	t1:=creer_triangle ( s1, s2, s3 );
	t2:= creer_triangle ( s1, s4, s3 );
	t3:= creer_triangle ( s5, s3, s4 );

	ajouter_en_tete_de_liste ( maListeDeTest, t1);
	ajouter_en_tete_de_liste ( maListeDeTest, t2);
	ajouter_en_tete_de_liste ( maListeDeTest, t3);

	courant:=maListeDeTest;

	while not (est_vide (courant)) loop
		Ada.Text_Io.Put("Element n°" & Integer'Image (i) & ", coordonnée de son premier sommet: " & Float'Image (courant.triangle.Coord_1.x));
		courant := courant.suc;
		Ada.Text_Io.skip_line;
		i:=i+1;
		
	end loop;
	
end main;

