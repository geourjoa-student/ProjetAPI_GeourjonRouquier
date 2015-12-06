with Ada.Text_Io;
with Ada.Float_Text_Io;



package body write is

	procedure ecrire_fichier ( l : in AdDoublet ; nomFichier : in string  ) is
		OutputFile : Ada.Text_Io.File;
		courant : AdDoublet;
	begin
		Ada.Text_Io.Create (Out_File, Ada.Text_Io.Out_File, nomFichier );
		Ada.Text_Io.Put_line (OutputFile, "%!PS");

		courant := AdDoublet;

		while courant /= null loop 
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.x);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.y);
			Ada.Text_Io.put_line("moveto");
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_2.x);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_2.y);
			Ada.Text_Io.put_line("lineto");
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_3.x);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_3.y);
			Ada.Text_Io.put_line("lineto");
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.x);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.y);
			Ada.Text_Io.put_line("lineto");
			Ada.Text_Io.Put_line("gsave");
			Ada.Text_Io.Put_line("1 setgray");
			Ada.Text_Io.Put_line("fill");
			Ada.Text_Io.Put_line("grestore");
			Ada.Text_Io.Put_line("0 setgray");
			Ada.Text_Io.Put_line("stroke");
			
			
		end loop;
			
			Ada.Text_Io.Put_line("showpage");

			Ada.Text_Io.Close(OutputFile);

			



		

	end ecrire_fichier;

end write;
