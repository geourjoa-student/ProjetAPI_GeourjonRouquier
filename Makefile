# BUILD RULES
all: main

# Les règles pour compiler koch puis les autres fractales sont à rajouter

testListe : 
	gnatmake testListeDeDoublet.adb 

main : 
	gnatmake main.adb

clean : 
	rm main *.o *.ali
