all: test interp.dat interp.eps inter.tex inter.pdf

test: main.cpp
	g++ -o test main.cpp -lm -lgsl -lgslcblas

interp.dat: main.cpp
	./test > interp.dat

interp.eps: interp.dat
	graph -T ps < interp.dat > interp.eps

inter.pdf: interp.eps inter.tex
	xelatex inter

clean:
	rm test *.dat *.pdf *.log *.aux
