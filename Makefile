all : peintre

peintre : *.adb *.ads
	gnatmake peintre.adb

clean : 
	rm  *.o *.ali peintre
