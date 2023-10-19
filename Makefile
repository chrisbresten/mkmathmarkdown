export*=$(shell ls *.md|cut -d '.' -f 1)
default:
	echo make
	make all
clean:
	#rm *.tex 2> /dev/null || echo "."
	rm *.tex 2> /dev/null || echo "."
	rm *.pdf 2> /dev/null || echo "."
	rm *.html 2> /dev/null|| echo "."
	rm *.htm 2> /dev/null|| echo "."
	rm *.log  2> /dev/null|| echo "."
	rm *.tmp  2> /dev/null|| echo "."
	rm *.out  2> /dev/null|| echo "."
	rm *.aux  2> /dev/null|| echo "."
	rm *.dvi  2> /dev/null|| echo "."
	echo clean
pubclean:
	rm *.tex 2> /dev/null || echo "."
	rm *.htm 2> /dev/null|| echo "."
	rm *.log  2> /dev/null|| echo "."
	rm *.tmp  2> /dev/null|| echo "."
	rm *.out  2> /dev/null|| echo "."
	rm *.aux  2> /dev/null|| echo "."
	rm *.dvi  2> /dev/null|| echo "."
all:
	
	./makehtml.sh *.md
