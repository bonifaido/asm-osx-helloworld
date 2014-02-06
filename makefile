hello: hello.o
	ld -arch i386 -o hello hello.o -lSystem -no_pie -macosx_version_min 10.8

hello.o: hello.asm
	nasm -f macho hello.asm

clean:
	rm -f hello hello.o

# to assemble some example content
asm:
	gcc -S hello.c
	cat hello.s
