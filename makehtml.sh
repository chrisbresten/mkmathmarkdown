#!/bin/bash
export MNAME=`echo $1|cut  -f 1 -d .`
export TITLE=`echo $MNAME|sed 's/_/ /g'`
export _F=$1
ls $_F||(echo "no file $_F" ;exit 0)

mkhtml() {
    echo "<head><html><title> $TITLE </title></head>" > $MNAME.html
    PYTHONPATH=. mistletoe -r mymathjax.MathJaxRenderer  $1 >> $MNAME.html
    echo "</html>" >> $MNAME.html
}

mklatex() {
    mistletoe -r  mistletoe.latex_renderer.LaTeXRenderer $1 > $MNAME.tex
    sed -i 's/solidity/java/i' $MNAME.tex #code highlighter doesnt know solidity
}

mkpdflatex() {
    mklatex $1
    pdflatex $MNAME.tex 
}

mkdvilatex() {
    mklatex $1
    latex $MNAME.tex 
    dvipdf $MNAME.dvi
}



( mkhtml $_F && echo "html g2g"; ) || echo html ded
mkdvilatex $_F &&echo "pdf g2g"
