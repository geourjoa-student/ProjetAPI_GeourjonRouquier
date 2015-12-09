with Ada.Text_Io;
with listeDeDoublet; use listeDeDoublet;
with read; use read;
with write; use write;

procedure main is
	maListe : Ad_L_Polygone;
	nbCoord : integer;
begin
	Ada.Text_Io.Put_line("Lecture");
	lectureFichier( maListe, "Models/cow.off", nbCoord);
	Ada.Text_Io.Put_line("Tri");
	tri_paquet( maListe, nbCoord);
	Ada.Text_Io.Put_line("Ecriture");
	ecrire_fichier(maListe, "Sortie/sortie.ps", 200.0);
	Ada.Text_Io.Put_line("Libération");
	liberer_liste_polygone(maListe);
	Ada.Text_Io.Put_line("Fin");
end main;
