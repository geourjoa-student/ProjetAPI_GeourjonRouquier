# BUILD RULES
all: main

# Les règles pour compiler koch puis les autres fractales sont à rajouter

main : 
	gnatmake main.adb 

clean : 
	rm main *.o *.ali
