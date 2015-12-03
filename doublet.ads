package doublet is

	type Doublet;

	type AdDoublet is access Doublet ;

	type Doublet is record
		Triangle : T_Triangle ; 
		Suc : AdDoublet ; -- pointeur sur un autre Doublet
	end record;

	type T_Coord is record
		X : integer;
		Y : integer;
		Z : integer;
	end record;

	type T_Triangle is record
		Coord_1 : T_Coord;
		Coord_2 : T_Coord;
		Coord_3 : T_Coord;
	end record;

	procedure creer_coord ( x,y,z : in float ; coord : out T_Coord );

	procedure creer_triangle ( s1, s2, s3 : in T_Coord ; triangle : out T_Triangle );



end doublet;
