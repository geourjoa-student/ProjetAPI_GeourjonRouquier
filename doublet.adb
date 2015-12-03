package body doublet is

	procedure creer_coord ( x,y,z : in float ; coord : out T_Coord ) is
	begin
		coord.X=x;
		coord.Y=y;
		coord.Z=z;
	end creer_triangle;

	procedure creer_triangle ( s1, s2, s3 : in T_Coord ; triangle : out T_Triangle ) is
	begin
		triangle.Coord_1=s1;
		triangle.Coord_2=s2;
		triangle.Coord_3=s3;
	end creer_triangle;

end doublet;
