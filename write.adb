with Ada.Text_Io;
with Ada.Float_Text_Io;
with listeDeDoublet; use listeDeDoublet;

package body write is

	procedure ecrire_fichier ( l : in AdDoublet ; nomFichier : in string  ; coeffMultiplicateur : in float) is
		OutputFile : Ada.Text_Io.File_type;
		courant : AdDoublet;
		x1,x2,x3,y1,y2,y3 : float;
	begin
		Ada.Text_Io.Create (OutputFile, Ada.Text_Io.Out_File, nomFichier );
		Ada.Text_Io.Put_line (OutputFile, "%!PS");

		courant := l ;

		while courant /= null loop 
			x1:=(590.0/2.0)+coeffMultiplicateur*courant.triangle.Coord_1.x;
			x2:=(590.0/2.0)+coeffMultiplicateur*courant.triangle.Coord_2.x;
			x3:=(590.0/2.0)+coeffMultiplicateur*courant.triangle.Coord_3.x;
			y1:=(840.0/2.0)+coeffMultiplicateur*courant.triangle.Coord_1.y;
			y2:=(840.0/2.0)+coeffMultiplicateur*courant.triangle.Coord_2.y;
			y3:=(840.0/2.0)+coeffMultiplicateur*courant.triangle.Coord_3.y;


			Ada.Float_Text_Io.put(OutputFile, x1, exp=>0);
			Ada.Text_Io.Put(OutputFile, " ");
			Ada.Float_Text_Io.put(OutputFile, y1, exp=>0);
			Ada.Text_Io.put_line(OutputFile, " moveto");
			
			Ada.Float_Text_Io.put(OutputFile, x2, exp=>0);
			Ada.Text_Io.Put(OutputFile, " ");
			Ada.Float_Text_Io.put(OutputFile, y2, exp=>0);
			Ada.Text_Io.put_line(OutputFile, " lineto");
			
			Ada.Float_Text_Io.put(OutputFile, x3,exp=>0);
			Ada.Text_Io.Put(OutputFile , " ");
			Ada.Float_Text_Io.put(OutputFile, y3,exp=>0);
			Ada.Text_Io.put_line(OutputFile, " lineto");
			
			Ada.Float_Text_Io.put(OutputFile, x1, exp=>0);
			Ada.Text_Io.Put(OutputFile, " ");
			Ada.Float_Text_Io.put(OutputFile, y1, exp=>0);
			Ada.Text_Io.put_line(OutputFile, " lineto");
	
			Ada.Text_Io.Put_line(OutputFile, "gsave");
			Ada.Text_Io.Put_line(OutputFile, Integer'Image(1) & " setgray");
			Ada.Text_Io.Put_line(OutputFile, "fill");
			Ada.Text_Io.Put_line(OutputFile, "grestore");
			Ada.Text_Io.Put_line(OutputFile, Integer'Image(0) & " setgray");
			Ada.Text_Io.Put_line(OutputFile, "stroke");

			courant:= courant.suc;
			
			
		end loop;
			

			Ada.Text_Io.Put_line(OutputFile, "showpage");

			Ada.Text_Io.Close(OutputFile);

			



		

	end ecrire_fichier;

end write;
