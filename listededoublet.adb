with Ada.Text_io;
with Ada.Float_text_io;
with Ada.Unchecked_Deallocation;

package body listeDeDoublet is

	
	-- Fonctions d'affichage dans la console

	procedure Put_coord ( coord : in T_Coord) is
	begin
		Ada.Text_io.Put("( ");
		Ada.Float_text_io.put(coord.x, exp=>0);
		Ada.Text_io.Put(" , ");
		Ada.Float_text_io.put(coord.y, exp=>0);
		Ada.Text_io.Put(" , ");
		Ada.Float_text_io.put(coord.z, exp=>0);
		Ada.Text_io.Put(" )");
	end Put_coord;


	procedure Put_L_Coord( liste : in Ad_L_Coord )is
		courant : Ad_L_Coord;
		i : integer := 1;
	begin
		courant := liste;
		while courant /= null loop
			Ada.Text_io.Put("S" & Integer'Image(i) & ": ");
			Put_coord(courant.Coord);
			courant:=courant.suc;
			i:=i+1;
		end loop;
		Ada.Text_io.Put(".");
	end Put_L_Coord;


	procedure Put_L_Polygone ( liste : in Ad_L_Polygone) is
	begin
		Ada.Text_io.Put_line("Ce polygone possède les coordonnées : ");
		Put_L_Coord(liste.Coord);
		Ada.Text_io.new_line;
		Ada.Text_io.Put("La clé de ce polygone est : " & Float'Image (cle (liste.Coord)));
		Ada.Text_io.new_line;
	end Put_L_Polygone;

	procedure Put (liste : in Ad_L_Polygone) is
		courant  : Ad_L_Polygone;
		i : integer :=0;
	begin

		courant:=liste;

		while courant /= null  loop
			Ada.Text_Io.Put_line("Element n°" & Integer'Image (i) & ":");
			Put_L_Polygone(courant);
			courant := courant.suc;
			Ada.Text_Io.new_line;
			i:=i+1;

		end loop;

	end Put;

	
	
	
	
	-- Définitions liées aux coordonnées et liste de coordonnées




	function minFloat ( a : in float ; b : in float ) return float is
	begin
		if (a < b) then
			return a;
		else 
			return b;
		end if;
	end minFloat;

	function maxFloat ( a : in float ; b : in float ) return float is
	begin
		if (a > b) then
			return a;
		else 
			return b;
		end if;
	end maxFloat;


	-- La fonction ne protège pas quand liste est vide
	function mincZ ( liste : in Ad_L_Coord ) return float is	
		min : float;
		courant : Ad_L_Coord;
	begin
		courant := liste;

		min := courant.Coord.z;

	--	Put_L_Coord(liste);

		while  courant /= null loop
			min:=minFloat(min,courant.Coord.z);
			courant:=courant.suc;
		end loop;

		return min;

	end mincZ;

	function maxcZ ( liste : in Ad_L_Coord) return float is	
		max : float;
		courant : Ad_L_Coord;
	begin
		courant:=liste;
		max := courant.Coord.z;

		while courant /= null loop
			max:=maxFloat(max,courant.Coord.z);
			courant:=courant.suc;
		end loop;

		return max;


	end maxcZ;


	function cle ( liste : in Ad_L_Coord ) return float is	
	begin
		return mincZ(liste);
	end cle;

	function creer_coord ( x : in float; y : in float; z : in float ) return  T_Coord  is
		coord : T_Coord; 			
	begin
		coord.X:=x;
		coord.Y:=y;
		coord.Z:=z;

		return coord;
	end creer_coord;

	-- Définitions liées au liste


	-- TODO Y a t'il possibililité de faire une surcharge de fonction
	procedure ajouter_polygone_en_tete( liste : in out Ad_L_Polygone ; valeur : in Ad_L_Coord ) is
	begin
		liste := new L_Polygone' ( valeur, liste);	
	end ajouter_polygone_en_tete;

	procedure ajouter_coord_en_tete( liste : in out Ad_L_Coord ; valeur : in T_Coord ) is
	begin
		liste := new L_Coord' ( valeur, liste);	
	end ajouter_coord_en_tete;


	--Procédure lié à la désallocation de la mémoire du programme	
	procedure free_polygone is new Ada.Unchecked_Deallocation ( L_Polygone, Ad_L_Polygone);

	procedure free_coord is new Ada.Unchecked_Deallocation ( L_Coord, Ad_L_Coord);

	procedure liberer_liste_coord ( l : in out Ad_L_Coord ) is
		courant : Ad_L_Coord;
	begin
		while l /= null loop
			courant := l;
			l:=l.Suc;
			free_coord(courant);
		end loop;
	end liberer_liste_coord;

	procedure liberer_liste_polygone ( l : in out Ad_L_Polygone) is
		courant : Ad_L_Polygone;
	begin
		while l /= null loop
			courant:=l;
			l:=l.suc;
			liberer_liste_coord(courant.Coord);
			free_polygone(courant);
		end loop;

	end liberer_liste_polygone;


	function est_vide ( liste : in Ad_L_Polygone ) return boolean is
	begin
		return (liste = null);
	end est_vide;

	-- tableau lié au tri par paquet	
	type T_tab_liste is array (integer range <>) of Ad_L_Polygone;

	-- La liste ne doit pas être vide
	procedure info_liste ( l: in Ad_L_Polygone ; minZ : out float; maxZ : out float) is
		courant : Ad_L_Polygone;	
	begin
		courant := l;
		minZ:=cle(courant.Coord);
		maxZ:=maxcZ(courant.Coord);
		courant:=courant.suc;
		while courant /= null loop
			if minZ > cle(courant.Coord) then
				minZ := cle(courant.Coord);
			end if;
			if maxZ < maxcZ(courant.Coord) then
				maxZ := maxcZ (courant.Coord);
			end if;
			courant:=courant.suc;
		end loop;
	end info_liste;


	function hash ( n, a, b, c: in float) return integer is
	begin
		return  Integer ( n * (c-a)/(b-a));
	end hash;

	-- Résultat dans l1
	procedure concat ( l1 : in out Ad_L_Polygone; l2 : in out Ad_L_Polygone) is
		courant : Ad_L_Polygone;
	begin
		if l2 /= null then
			if l1 = null then
				l1:=l2;
			else
				courant := l1;

				while courant.suc /= null loop
					courant := courant.suc;
				end loop;

				courant.suc:=l2;

			end if;
		end if;

	end concat;

	procedure tri_paquet ( l : in out Ad_L_Polygone ; NbCoord : in integer) is
	begin
		if l /= null then
			Ada.Text_Io.Put_line("Début tri");


			declare
				tab : T_tab_liste (0..NbCoord);
				courant, element : Ad_L_Polygone;
				a,b : float;
				k : integer; --hash d'un triangle -> indice de l position dans le tableau 
			begin
				
				Ada.Text_Io.Put_line("Obtention des infos");
			
				info_liste (l, a, b);


				Ada.Text_Io.Put_line("Initialisation liste");
				for i in 0..NbCoord loop
					tab(i):=null;
				end loop;

			
				Ada.Text_Io.Put_line("Remplisaege liste");

				
				courant :=l;
				

				while (courant /= null ) loop
					element:=courant;
					courant:=courant.suc;
					k:=hash(Float(NbCoord), a, b, cle(element.Coord));
					element.suc:=null;

					concat (tab(k), element); 
					Ada.Text_io.Put_line("Boucle infinie");
				end loop;

				Ada.Text_io.Put_line("Concaténation");


				l:=null;

				for i in 0..NbCoord loop
					concat(l, tab(i));
				end loop;

				Ada.Text_io.Put_line("Debug 6");
				
			end;
			Ada.Text_Io.Put_line("Fin tri");

		end if;

	end tri_paquet;



end listeDeDoublet;
