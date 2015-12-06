with listeDeDoublet; use listeDeDoublet;
with read; use read;
with Ada.Text_Io;


procedure testlecturefichieroff is
	maListeDeTest : AdDoublet;
	nomFichier : String := "test.off";
	i : integer;
begin
	maListeDeTest:= null;
	lectureFichier( maListeDeTest, nomFichier );

	-- Affichage du fichier .off en console;
	
	courant:=maListeDeTest;

	Put_liste ( maListeDeTest );
	
end testlecturefichieroff;

