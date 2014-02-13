all: dep.a

dep.a: dep.o b~dep.o
	ar rcs $@ $^

dep.o: dep.adb dep.ads
	gnatmake -c -fPIC -o $@ $<

b~dep.o: b~dep.adb
	gnatmake -c -fPIC -o $@ $<

dep.ali: dep.o

b~dep.adb: dep.ali
	gnatbind -n $<

clean:
	rm -rf *.o *.ali *.a b~*
