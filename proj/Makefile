all : final.pdf

name=final

final.pdf : build/final.tex build/output.eps
	cd build/ && xelatex $(name) && mv $(name).pdf ..

build/output.eps : build/solution.gnu
	cd build/ && gnuplot solution.gnu
clean :
	rm *.pdf
	cd build/ && make clean
