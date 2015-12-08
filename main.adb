with Ada.Text_Io;
with listeDeDoublet; use listeDeDoublet;
with read; use read;
with write; use write;

procedure main is
	maListe : Ad_L_Polygone;
	nbCoord : integer;
begin
	lectureFichier( maListe, "Models/space_station.off", nbCoord);
	tri_paquet( maListe, nbCoord);
	ecrire_fichier(maListe, "Sortie/sortie.ps", 1.0);
	liberer_liste_polygone(maListe);

end main;
