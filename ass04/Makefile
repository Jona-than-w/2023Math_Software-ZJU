all: test interp.dat interp.eps inter.tex inter.pdf

test: ass04_inter.cpp
	g++ -o test ass04_inter.cpp -lm -lgsl -lgslcblas

interp.dat: ass04_inter.cpp
	./test > interp.dat

interp.eps: interp.dat
	graph -T ps < interp.dat > interp.eps

inter.pdf: interp.eps inter.tex
	xelatex inter

clean:
	rm test *.dat *.pdf *.log *.aux
