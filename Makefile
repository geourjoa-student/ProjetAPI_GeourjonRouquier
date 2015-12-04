# BUILD RULES
all: main testListeDeDoublet

# Les règles pour compiler koch puis les autres fractales sont à rajouter

testListeDeDoublet :
	gnatmake testListeDeDoublet.adb 

main : 
	gnatmake main.adb

clean : 
	rm main *.o *.ali
