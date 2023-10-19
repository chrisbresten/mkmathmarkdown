# README

scripts/template for writing code-exerpt plus math containing markdown files and compiling them to html and latex/pdf

originally was trying to write in either markdown or rst and have it rendered in a way compatible to github's style (specifically with regards to the math), and was amazed by how poorly defined markdown is, how many packages i fiddled with, and how many configs i needed to tweak to do this, even had to modify mistletoe mathjax renderer which was just turning inline math to block math to skip around mathjax's omission of classic ``$``  delims


usage
-----

write markdown files, name them with ending ``.md``

- ``make all``
    - renders to html with mathjax and to pdf via latex  
- ``make publcean``
    - removes the intermediate artifacts leaving html and pdf
- ``make clean``
    - removes them all

features
--------

- supports old school ``$`` inline and ``$$`` enclosure for  block math
- also - ``\( \)`` for inline and ``\[ \]`` for block math by converting the former to dollar signs and double slashing the latter

requirements
------------

```bash
pip install mistletoe
apt install texlive-science
```
