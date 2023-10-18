export NAME=$(shell (ls test.md||(ls *.md|head -n 1;);)|cut -d '.' -f 1)
default:
	echo make ${NAME}
	make all
clean:
	#rm *.tex 2> /dev/null || echo "."
	rm ${NAME}.tex 2> /dev/null || echo "."
	rm ${NAME}.pdf 2> /dev/null || echo "."
	rm ${NAME}.html 2> /dev/null|| echo "."
	rm ${NAME}.htm 2> /dev/null|| echo "."
	rm ${NAME}.log  2> /dev/null|| echo "."
	rm ${NAME}.tmp  2> /dev/null|| echo "."
	rm ${NAME}.out  2> /dev/null|| echo "."
	rm ${NAME}.aux  2> /dev/null|| echo "."
	rm ${NAME}.dvi  2> /dev/null|| echo "."
	echo clean
pubclean:
	rm ${NAME}.tex 2> /dev/null || echo "."
	rm ${NAME}.htm 2> /dev/null|| echo "."
	rm ${NAME}.log  2> /dev/null|| echo "."
	rm ${NAME}.tmp  2> /dev/null|| echo "."
	rm ${NAME}.out  2> /dev/null|| echo "."
	rm ${NAME}.aux  2> /dev/null|| echo "."
	rm ${NAME}.dvi  2> /dev/null|| echo "."
all:
	./makehtml.sh ${NAME}.md
