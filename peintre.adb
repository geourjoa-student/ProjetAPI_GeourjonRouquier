with Ada.Text_Io;
with donnee; use donnee;
with lecture; use lecture;
with ecriture; use ecriture;
with Ada.Command_Line; use Ada.Command_Line;

procedure peintre is
	maListe : Ad_L_Polygone;
	nbCoord : integer;
begin
	if Argument_count = 2 then

		lectureFichier( maListe, Argument(1), nbCoord);
		tri_paquet( maListe, nbCoord);
		ecrire_fichier(maListe, Argument(2), 200.0);
		liberer_liste_polygone(maListe);

		Ada.Text_Io.Put_line("Conversion terminée.");
	else
		Ada.Text_Io.Put_line("Format de commande incorrect.");
		Ada.Text_Io.Put_line("Format attendu : " & Command_Name & " fichierAConvertir.off fichierConvertit.ps ");

	end if;
end peintre;


