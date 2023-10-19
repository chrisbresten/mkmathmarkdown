#!/bin/bash

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

mkone(){

export MNAME=`echo $1|cut  -f 1 -d .`
export TITLE=`echo $MNAME|sed 's/_/ /g'`
ls $1||(echo "no file $1" ;exit 0)
cp -f $1 $MNAME.tmp&&export _F=$MNAME.tmp
sed -i 's/\\(/$/g' $_F
sed -i 's/\\)/ $/g' $_F #this is a mathjax thing \( \)and it isnt  handled by mistletoe latex right
sed -i 's/\\\]/ \\\\]/' $_F
sed -i 's/\\\[/\\\\[/' $_F


( mkhtml $_F && echo "html g2g"; ) || echo html ded
mkdvilatex $_F &&echo "pdf g2g"
}


for i in $@
do
    mkone $i
done
