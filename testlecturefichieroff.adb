with listeDeDoublet; use listeDeDoublet;
with read; use read;
with Ada.Text_Io;


procedure testlecturefichieroff is
	maListeDeTest : AdDoublet;
	nomFichier : String := "test.off";
	courant : AdDoublet;
	i : integer;
begin
	maListeDeTest:= null;
	lectureFichier( maListeDeTest, nomFichier );

	-- Affichage du fichier .off en console;
	
	courant:=maListeDeTest;

	while not (est_vide (courant)) loop
		Ada.Text_Io.Put("Element n°" & Integer'Image (i));
		Put(courant);
		courant := courant.suc;
		Ada.Text_Io.new_line;
		i:=i+1;
		
	end loop;
	
end testlecturefichieroff;

