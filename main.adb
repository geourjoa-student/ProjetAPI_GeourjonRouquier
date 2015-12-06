with Ada.Text_Io;
with listeDeDoublet; use listeDeDoublet;
with read; use read;
with write; use write;

procedure main is
	maListe : AdDoublet;
	nbCoord : integer;
begin
	Ada.Text_Io.Put_line ( " Test dessin vache ");
	lectureFichier( maListe, "cow.off", nbCoord);
	tri_paquet( maListe, nbCoord);
	ecrire_fichier(maListe, "cow.ps");
	liberer_liste(maListe);
	Ada.Text_Io.Put_line("Fin programme.");


	
end main;
