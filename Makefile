
CC=gcc
CCPP=g++
flags = -Os -c
outFileName = "prog"
buildPath = "build"

#Automatic find source files into scr dir
SOURCES_C=$(shell find src -type f -iname '*.c')
SOURCES_CPP=$(shell find src -type f -iname '*.cpp')


all: Linking

CompileC: $(SOURCES_C)
ifneq ($(SOURCES_C),)
	$(CC) $(flags) $^
else
	echo "No C files found"
endif
CompileCPP: $(SOURCES_CPP)
ifneq ($(SOURCES_CPP),)
	$(CCPP) -c $(flags) $^
else
	echo "No CPP files found"
endif
Linking: CompileC CompileCPP
	$(CCPP) -o $(outFileName) ./*.o

clean:
	rm *.o
	
	
