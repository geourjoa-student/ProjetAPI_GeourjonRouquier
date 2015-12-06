with Ada.Text_io;
with Ada.Float_text_io;
with Ada.Unchecked_Deallocation;

package body listeDeDoublet is

	-- Définitions liées au triangle

	function minFloat ( a : in float ; b : in float ) return float is
	begin
		if (a < b) then
			return a;
		else 
			return b;
		end if;
	end minFloat;


	function cle ( triangle : in T_Triangle ) return float is	
	begin
		return minFloat(triangle.Coord_1.Z , minFloat ( triangle.Coord_2.Z, triangle.Coord_3.Z));
	end cle;

	function maxFloat ( a : in float ; b : in float ) return float is
	begin
		if (a > b) then
			return a;
		else 
			return b;
		end if;
	end maxFloat;


	function maxcZ ( triangle : in T_Triangle ) return float is	
	begin
		return maxFloat(triangle.Coord_1.Z , maxFloat ( triangle.Coord_2.Z, triangle.Coord_3.Z));
	end maxcZ;








	function creer_coord ( x : in float; y : in float; z : in float ) return  T_Coord  is
		coord : T_Coord; 		-- PAs sur de la façon dont il faut déclarer (idem pour créer triangle)
	begin

		coord.X:=x;
		coord.Y:=y;
		coord.Z:=z;

		return coord;
	end creer_coord;

	function creer_triangle ( s1  : in T_Coord ; s2 : in T_Coord; s3 : in T_Coord ) return T_Triangle  is
		triangle : T_Triangle;
	begin
		triangle.Coord_1:=s1;
		triangle.Coord_2:=s2;
		triangle.Coord_3:=s3;

		return triangle;
	end creer_triangle;

	-- Définitions liées au liste

	procedure ajouter_en_tete_de_liste ( liste : in out AdDoublet ; valeur : in T_Triangle ) is
	begin
		liste := new Doublet' ( valeur, liste);	

	end ajouter_en_tete_de_liste;

	procedure free is new Ada.Unchecked_Deallocation ( Doublet, AdDoublet);
	
	
	procedure liberer_liste ( l : in out AdDoublet) is
		courant : AdDoublet;
	begin
		while l /= null loop
			courant:=l;
			l:=l.suc;
			free(courant);
		end loop;

	end liberer_liste;







	function est_vide ( liste : in AdDoublet ) return boolean is
	begin
		return (liste = null);
	end est_vide;


	type T_tab_liste is array (integer range <>) of AdDoublet;

	-- La liste ne doit pas être vide
	procedure info_liste ( l: in AdDoublet ; minZ : out float; maxZ : out float) is
		courant : AdDoublet;	
	begin
		courant := l;
		minZ:=cle(courant.triangle);
		maxZ:=maxcZ(courant.triangle);
		courant:=courant.suc;
		while courant /= null loop
			if minZ > cle(courant.triangle) then
				minZ := cle(courant.triangle);
			end if;
			if maxZ < maxcZ(courant.triangle) then
				maxZ := maxcZ (courant.triangle);
			end if;
			courant:=courant.suc;
		end loop;
	end info_liste;


	function hash ( n, a, b, c: in float) return integer is
	begin
		return  Integer ( n * (c-a)/(b-a));
	end hash;



	function concat ( l1 : in out AdDoublet; l2 : in out AdDoublet) return AdDoublet is
		courant : AdDoublet;
	begin
		if l1 = null then
			return l2;
		end if;

		if l2 = null then
			return l1;
		end if;

		courant := l1;

		while courant.suc /= null loop
			courant := courant.suc;
		end loop;

		courant.suc:=l2;

		return l1;

	end concat;

	procedure ajout_en_tete ( l : in out AdDoublet ; e : in AdDoublet ) is
	begin
		if l = null then
			l:=e;
			e.suc:=null;
		else
			e.suc:=l;
			l:=e;
		end if;
	end ajout_en_tete;



	procedure tri_paquet ( l : in out AdDoublet ; NbCoord : in integer) is
	begin
		if l /= null then
			declare
				tab : T_tab_liste (0..NbCoord);
				courant, element : AdDoublet;
				a,b : float;
				k : integer; --hash d'un triangle -> indice de l position dans le tableau 
			begin
				info_liste (l, a, b);

				for i in 0..NbCoord loop
					tab(i):=null;
				end loop;

				courant :=l;

				while (courant /= null ) loop
					element:=courant;
					courant:=courant.suc;
					k:=hash(Float(NbCoord), a, b, cle(element.triangle));
					ajout_en_tete(tab(k), element); 
				end loop;

				l:=null;

				for i in 0..NbCoord loop
					l:=concat(l, tab(i));
				end loop;
			end;
		end if;

	end tri_paquet;








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


	procedure Put_triangle ( triangle : in T_Triangle )is
	begin
		Ada.Text_io.Put("S1 : ");
		Put_coord(triangle.Coord_1);
		Ada.Text_io.Put(", S2 : ");
		Put_coord(triangle.Coord_2);
		Ada.Text_io.Put(", S3 : ");
		Put_coord(triangle.Coord_3);
		Ada.Text_io.Put(".");
	end Put_triangle;


	procedure Put ( liste : in AdDoublet ) is
	begin
		Ada.Text_io.Put_line("Ce doublet représente le triangle: ");
		Put_triangle(liste.all.Triangle);
		Ada.Text_io.new_line;
		Ada.Text_io.Put("la clé de ce doublet est : " & Float'Image (cle (liste.triangle)));
		Ada.Text_io.new_line;
	end Put;

	procedure Put_liste (liste : in AdDoublet ) is
		courant  : AdDoublet;
		i : integer :=0;
	begin

		courant:=liste;

		while not (est_vide (courant)) loop
			Ada.Text_Io.Put_line("Element n°" & Integer'Image (i) & ":");
			Put(courant);
			courant := courant.suc;
			Ada.Text_Io.new_line;
			i:=i+1;

		end loop;

	end Put_liste;

end listeDeDoublet;
