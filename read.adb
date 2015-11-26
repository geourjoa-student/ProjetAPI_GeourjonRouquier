with triangle; 
use triangle;

with Ada.Integer_text_io;

package body read is 

	-- Tableau qui contiendra les coordonnees
	type T_tab_sommet is array (integer range <>) of T_Coord;


	InputFile : Ada.Text_IO.File_Type;

	NomFichier : string = "vache.off";

	procedure ouvrir_fichier ( Name : in string ) is
	begin

		Open(File => InputFile,
		Mode => Ada.Text_IO.In_File,
		Name => Name );)
	
	end ouvrir_fichier ;


	
	procedure lecture_coord is
		NbCoord : integer;
		NbTriangle : integer;
		NbArrete : integer;
		teteDeliste : AdDoublet;
	begin
		Ada.Text_IO.skip_line(InputFile);
		Ada.Integer_text_io.get(InputFile, NbCoord);
		Ada.Integer_text_io.get(InputFile, NbTriangle);
		Ada.Integer_text_io.get(InputFile, NbArrete);
		
				-- On est en fin de ligne (besoin de skipline ?)
		declare 
			tab : T_tab_sommet (1..NbCoord);
		begin
			-- Lire et remplir notre tableau de sommet
				
			for i in 1..NbCoord loop
				Ada.Integer_text_io.get(InputFile, tab(i).X);
				Ada.Integer_text_io.get(InputFile, tab(i).Y);
				Ada.Integer_text_io.get(InputFile, tab(i).Z);


				-- On est en fin de ligne (besoin de skipline ?)
			end loop;






			-- Lire les triangles et le tableau de sommet pour en deduire une liste de doublet
		
		
		
		end;

		
		--Retourner la liste de doublet
	
	end lecture_coord;

end read;
