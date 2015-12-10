with Ada.Text_Io;
with Ada.Float_Text_Io;
with donnee; use donnee;

package body ecriture is

	procedure ecrire_fichier ( l : in Ad_L_Polygone; nomFichier : in string  ; coeffMultiplicateur : in float) is
		OutputFile : Ada.Text_Io.File_type;
		courant : Ad_L_Polygone;
		premiere_coord, coord_courante : Ad_L_Coord;
		x1,x,y1,y : float;
	begin
		Ada.Text_Io.Create (OutputFile, Ada.Text_Io.Out_File, nomFichier );
		Ada.Text_Io.Put_line (OutputFile, "%!PS");

		courant := l ;

		while courant /= null loop 
			premiere_coord:= courant.Coord;
			coord_courante:=premiere_coord.suc;

			
			x1:=(590.0/2.0)+coeffMultiplicateur*premiere_coord.Coord.x;
			y1:=(840.0/2.0)+coeffMultiplicateur*premiere_coord.Coord.y;
			
			Ada.Float_Text_Io.put(OutputFile, x1, exp=>0);
			Ada.Text_Io.Put(OutputFile, " ");
			Ada.Float_Text_Io.put(OutputFile, y1, exp=>0);
			Ada.Text_Io.put_line(OutputFile, " moveto");


			while coord_courante /= null loop
				x:=(590.0/2.0)+coeffMultiplicateur*coord_courante.Coord.x;
				y:=(840.0/2.0)+coeffMultiplicateur*coord_courante.Coord.y;
			
				Ada.Float_Text_Io.put(OutputFile, x, exp=>0);
				Ada.Text_Io.Put(OutputFile, " ");
				Ada.Float_Text_Io.put(OutputFile, y, exp=>0);
				Ada.Text_Io.put_line(OutputFile, " lineto");

				coord_courante:=coord_courante.suc;

			end loop;

			
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

end ecriture;
