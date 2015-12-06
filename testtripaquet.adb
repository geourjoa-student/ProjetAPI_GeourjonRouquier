with listeDeDoublet; use listeDeDoublet;

with Ada.Integer_text_io;
with Ada.Text_Io;

procedure testtripaquet is

	maListeDeTest : AdDoublet;
	s1,s2,s3,s4,s5 : T_Coord;
	t1,t2,t3,t4,t5,t6 : T_Triangle;
	d1, d2, d3, d4, d5, d6 : AdDoublet;

	courant : AdDoublet;
	i : integer :=0;
begin
	maListeDeTest := null;
	
	s1:=creer_coord ( 1.0, 2.0, 3.0 );
	s2:=creer_coord ( 2.0, 3.0, 4.0 );
	s3:=creer_coord ( 3.0, 4.0, 5.0 );
	s4:=creer_coord ( 4.0, 5.0, 6.0 );
	s5:=creer_coord ( 5.0, 6.0, 7.0 );


	t1:= creer_triangle ( s1, s2, s3 );
	t2:= creer_triangle ( s1, s4, s3 );
	t3:= creer_triangle ( s5, s3, s4 );
	t4:= creer_triangle ( s5, s3, s1 );
	t5:= creer_triangle ( s2, s3, s4 );
	t6:= creer_triangle ( s1, s3, s4 );
	
	d1:= new Doublet' (t1, null );
	d2:= new Doublet' (t2, null );
	d3:= new Doublet' (t3, null );
	d4:= new Doublet' (t4, null );
	d5:= new Doublet' (t5, null );
	d6:= new Doublet' (t6, null );


	ajouter_en_tete_de_liste ( maListeDeTest, t1);
	ajouter_en_tete_de_liste ( maListeDeTest, t2);
	ajouter_en_tete_de_liste ( maListeDeTest, t3);
	ajouter_en_tete_de_liste ( maListeDeTest, t4);
	ajouter_en_tete_de_liste ( maListeDeTest, t5);
	ajouter_en_tete_de_liste ( maListeDeTest, t6);
	
	tri_paquet(maListeDeTest, 5); 
	
	Put_liste ( maListeDeTest );
	
end testtripaquet;

