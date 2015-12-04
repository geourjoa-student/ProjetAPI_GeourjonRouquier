with listeDeDoublet; use listeDeDoublet; 

with Ada.Integer_text_io;
with Ada.Float_text_io;

package body read is 

	-- Tableau qui contiendra les coordonnees
	type T_tab_sommet is array (integer range <>) of T_Coord;

	procedure lectureFichier ( liste : in out AdDoublet ; nomFichier : in String  ) is 

		InputFile : Ada.Text_IO.File_Type;
		NbCoord : integer;
		NbTriangle : integer;
		NbArrete : integer;
		NbSommetPolygone : integer;

	begin
		--Ouverture du fichier
		Ada.Text_IO.Open(File => InputFile, Mode => Ada.Text_IO.In_File, Name => nomFichier );
		
		--Saut de la première ligne (off)
		Ada.Text_IO.skip_line(InputFile);

		-- On lit la deuxième ligne : NSommet, NFace, NArete
		Ada.Integer_text_io.get(InputFile, NbCoord);
		Ada.Integer_text_io.get(InputFile, NbTriangle);
		Ada.Integer_text_io.get(InputFile, NbArrete);


		declare 
			tab : T_tab_sommet (0..NbCoord-1);
			N1 :  Integer;
			N2 :  Integer;
			N3 :  Integer;

			triangleLu : T_Triangle;


		begin
			-- Lire et remplir notre tableau de sommet

			for i in 0..NbCoord-1 loop
				Ada.Float_text_io.get(InputFile, tab(i).X);
				Ada.Float_text_io.get(InputFile, tab(i).Y);
				Ada.Float_text_io.get(InputFile, tab(i).Z);

			end loop;


			-- Lire les triangles et le tableau de sommet pour en deduire une liste de doublet

			for i in 1..NbTriangle loop
				Ada.Integer_text_io.get(InputFile, NbSommetPolygone); --On ne s'en sert pas ici
				Ada.Integer_text_io.get(InputFile, N1);
				Ada.Integer_text_io.get(InputFile, N2);
				Ada.Integer_text_io.get(InputFile, N3);

				triangleLu := creer_triangle (tab(N1), tab(N2), tab(N3));

				ajouter_en_tete_de_liste ( liste, triangleLu );


			end loop;


		end;

		Ada.Text_IO.Close(InputFile);

	end lectureFichier;

end read;
