with Ada.Text_Io;
with listeDeDoublet; use listeDeDoublet;
with read; use read;
with write; use write;

procedure main is
	maListe : AdDoublet;
	nbCoord : integer;
begin
	lectureFichier( maListe, "cow.off", nbCoord);
	tri_paquet( maListe, nbCoord);
	ecrire_fichier(maListe, "sortie.ps", 400.0);
	liberer_liste(maListe);
	
end main;
