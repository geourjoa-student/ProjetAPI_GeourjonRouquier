with Ada.Text_Io;
with Ada.Float_Text_Io;
with listeDeDoublet; use listeDeDoublet;

package body write is

	procedure ecrire_fichier ( l : in AdDoublet ; nomFichier : in string  ) is
		OutputFile : Ada.Text_Io.File_type;
		courant : AdDoublet;
	begin
		Ada.Text_Io.Create (OutputFile, Ada.Text_Io.Out_File, nomFichier );
		Ada.Text_Io.Put_line (OutputFile, "%!PS");

		courant := l ;

		while courant /= null loop 
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.x, exp=>0);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.y, exp=>0);
			Ada.Text_Io.put_line(OutputFile, "moveto");
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_2.x, exp=>0);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_2.y, exp=>0);
			Ada.Text_Io.put_line(OutputFile, "lineto");
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_3.x,exp=>0);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_3.y,exp=>0);
			Ada.Text_Io.put_line(OutputFile, "lineto");
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.x, exp=>0);
			Ada.Float_Text_Io.put(OutputFile, courant.triangle.Coord_1.y, exp=>0);
			Ada.Text_Io.put_line(OutputFile, "lineto");
			Ada.Text_Io.Put_line(OutputFile, "gsave");
			Ada.Text_Io.Put_line(OutputFile, Integer'Image(1) & "setgray");
			Ada.Text_Io.Put_line(OutputFile, "fill");
			Ada.Text_Io.Put_line(OutputFile, "grestore");
			Ada.Text_Io.Put_line(OutputFile, Integer'Image(0) & "setgray");
			Ada.Text_Io.Put_line(OutputFile, "stroke");

			courant:= courant.suc;
			
			
		end loop;
			
			Ada.Text_Io.Put_line("showpage");

			Ada.Text_Io.Close(OutputFile);

			



		

	end ecrire_fichier;

end write;
