# README

scripts/template for writing code-exerpt plus math containing markdown files and compiling them to html and latex/pdf

originally was trying to write in either markdown or rst and have it rendered in a way compatible to github's style (specifically with regards to the math), and was amazed by how poorly defined markdown is, how many packages i fiddled with, and how many configs i needed to tweak to do this, even had to modify mistletoe mathjax renderer which was just turning inline math to block math to skip around mathjax's omission of classic ``$``  delims


usage
-----

write markdown files, name them with ending ``.md``

- ``make all``
    - compiles all ``.md`` files in the folder to html and pdf

- ``make publcean``
    - removes the intermediate artifacts leaving html and pdf, helpful for a pre-commit hook that keeps compiled outputs up to date in commits

- ``make clean``
    - removes all compilation artifacts and outputs

features
--------

- supports old school ``$`` inline and ``$$`` enclosure for  block math, including in html output using mathjax, which omits single \$ by default due to its design for use on regular html pages which are written by people unaware of latex syntax. mymathjax.py handles this by converting single \$ enclosed blocks to ``\(`` ``\)`` which are then interpreted by mathjax in browser
- supports ``\(`` ``\)`` for inline and ``\[`` ``\]`` for block math by converting the former to dollar signs and double slash-escapeing  the latter pre-mistletoe compilation(mistletoe requires ``\\`` to resolve to ``\`` post-compilation)
- write dollar sign by escape with single backslash  ``\$``  resolves to \$
- can be configured to use ``pdflatex`` or ``latex`` followed by ``dvipdf`` which could be helpful if you are embedding images. 

requirements
------------

```bash
pip install mistletoe
apt install texlive-science
```
