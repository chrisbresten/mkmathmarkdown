# README

scripts/template for writing code-exerpt plus math-containing markdown files and compiling them to html and latex/pdf

originally was trying to write in either markdown or rst and have it rendered in a way compatible to github's style (specifically with regards to the math), and was amazed by how poorly defined markdown is, how many packages i fiddled with, and how many configs i needed to tweak to do this, so i made this template when i was finally happy. 


usage
-----

write markdown files, name them with ending ``.md``

``make all``

renders to html with mathjax and to pdf via latex  

supports old school ``$`` inline and ``$$`` enclosure for  block

also ``\( \)`` for inline and ``\[ \]`` for block. 

``make publcean``

removes the intermediate artifacts leaving html and pdf

``make clean``

removes them all

requirements
------------

```bash
pip install mistletoe``
apt install texlive-science
```
