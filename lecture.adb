with donnee; use donnee; 
with Ada.Integer_text_io;
with Ada.Float_text_io;

package body lecture is 

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
				-- | BUG | --
				-- Parfois cette ligne provoque une erreur ADA.IO_EXCEPTIONS.DATA_ERROR.
				-- Cela semble lié à get qui lirait un nombre d'un type différent à celui attendue. 
				-- Ce qui est étrange c'est que cela fonctionne parfaitement bien avec certain fichiers -> cow.off
				--Une explication serait qu'il y est un caractère non imprimable dans certains fichiers mais pas dans d'autres
				Ada.Float_text_io.get(InputFile, tab(i).X);
				Ada.Float_text_io.get(InputFile, tab(i).Y);
				Ada.Float_text_io.get(InputFile, tab(i).Z);


			end loop;
		
			Ada.Text_IO.Put_line("Debut lecture polygone");	


			-- Lire les polygones et le tableau de sommet pour en deduire une liste de doublet

			for i in 1..NbPolygone loop
				
				-- Lire le nombre de sommet
				Ada.Integer_text_io.get(InputFile, NbSommetPolygone); 				
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

end lecture;
