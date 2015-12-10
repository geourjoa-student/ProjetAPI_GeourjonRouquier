package donnee is

	-- Définitions liées à la répresentation des données

	--Coordonnée d'un point dans un repère x,y,z
	type T_Coord is record
		X : float;
		Y : float;
		Z : float;
	end record;

	type L_Coord;

	-- Pointeur vers une liste de coordonnées
	type Ad_L_Coord is access L_Coord ;

	-- Liste de coordonnées
	type L_Coord is record
		Coord : T_Coord; 
		Suc : Ad_L_Coord ;
	end record;

	type L_Polygone;

	-- Pointeur sur une liste de polygone
	type Ad_L_Polygone is access L_Polygone;

	-- Liste de polygone
	type L_Polygone is record
		Coord : Ad_L_Coord;
		Suc : Ad_L_Polygone;
	end record;

	--Définitions liées à la manipulation des triangles et coordonnées
	
	function cle ( liste : in Ad_L_Coord ) return float;

	function creer_coord ( x : in float; y : in float; z : in float )  return T_Coord; 

	-- Définitions liées au liste

	procedure ajouter_polygone_en_tete( liste : in out Ad_L_Polygone ; valeur : in Ad_L_Coord ) ;

	procedure ajouter_coord_en_tete( liste : in out Ad_L_Coord ; valeur : in T_Coord );

	procedure liberer_liste_polygone ( l : in out Ad_L_Polygone);

	function est_vide ( liste : in Ad_L_Polygone) return boolean;

	procedure Put ( liste : in Ad_L_Polygone );

	procedure tri_paquet ( l : in out Ad_L_Polygone; NbCoord : in integer); 

end donnee;
