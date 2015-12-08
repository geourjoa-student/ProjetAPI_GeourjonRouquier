with listeDeDoublet; use listeDeDoublet; 

with Ada.Integer_text_io;
with Ada.Float_text_io;

package body read is 

	-- Tableau qui contiendra les coordonnees
	type T_tab_sommet is array (integer range <>) of T_Coord;

	procedure lectureFichier ( liste : in out Ad_L_Polygone; nomFichier : in String ; NbCoord : out integer ) is 

		InputFile : Ada.Text_IO.File_Type;
		NbPolygone: integer;
		NbArrete : integer;
		NbSommetPolygone : integer;

	begin
		--Ouverture du fichier
		Ada.Text_IO.Open(File => InputFile, Mode => Ada.Text_IO.In_File, Name => nomFichier );
		
		--Saut de la première ligne (off)
		Ada.Text_IO.skip_line(InputFile);

		-- On lit la deuxième ligne : NSommet, NFace, NArete
		Ada.Integer_text_io.get(InputFile, NbCoord);
		Ada.Integer_text_io.get(InputFile, NbPolygone);
		Ada.Integer_text_io.get(InputFile, NbArrete);


		declare 
			tab : T_tab_sommet (0..NbCoord-1);
			N : integer; -- numéro de la coordonée lu

			listeDeCoordonneesLue : Ad_L_Coord;


		begin
			-- Lire et remplir notre tableau de sommet

			for i in 0..NbCoord-1 loop
				Ada.Float_text_io.get(InputFile, tab(i).X);
				Ada.Float_text_io.get(InputFile, tab(i).Y);
				Ada.Float_text_io.get(InputFile, tab(i).Z);

			end loop;


			-- Lire les polygones et le tableau de sommet pour en deduire une liste de doublet

			for i in 1..NbPolygone loop
				
				-- Lire le nombre de sommet
				Ada.Integer_text_io.get(InputFile, NbSommetPolygone); --On ne s'en sert pas ici
				
				listeDeCoordonneesLue := null;
				
				-- Lire les sommets et les mettres dans une liste
				for i in 1..NbSommetPolygone loop			
					Ada.Integer_text_io.get(InputFile, N);
					ajouter_coord_en_tete ( listeDeCoordonneesLue, tab(N));
				end loop;

				ajouter_polygone_en_tete ( liste, listeDeCoordonneesLue);

			end loop;

		end;

		Ada.Text_IO.Close(InputFile);

	end lectureFichier;

end read;
