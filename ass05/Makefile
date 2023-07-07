.PHONY:doc
SRCDIR := src
DOCDIR := doc
PROJ = $(SRCDIR)/lsq
PRO = $(DOCDIR)/lsq
SOURCE := $(PROJ).c
GENDATA := $(PROJ)_data
DATA = testdata.txt
IMAGE = output.eps
REF = $(DOCDIR)/references.bib

all: $(PROJ) $(GENDATA) $(DATA) $(IMAGE) $(PRO).pdf 

$(PROJ): $(PROJ).c
	gcc -o $(PROJ) $(PROJ).c

$(GENDATA): $(GENDATA).c
	gcc -o $(GENDATA) $(GENDATA).c

$(DATA): $(GENDATA)
	./$(GENDATA)
	./$(PROJ)
	mv $(PROJ) .

$(IMAGE): $(DATA)
	gnuplot lsq.gp
	mv output.eps $(DOCDIR)

$(PRO).pdf: $(PRO).tex $(IMAGE) $(REF)
	cd doc && xelatex lsq && bibtex lsq && xelatex lsq && xelatex lsq


exe:
	gcc -o $(PROJ) $(PROJ).c
	mv $(SRCDIR)/lsq .

doc:
	gcc -o $(PROJ) $(PROJ).c
	gcc -o $(GENDATA) $(GENDATA).c
	./$(GENDATA)
	./$(PROJ)
	gnuplot lsq.gp
	mv output.eps $(DOCDIR)
	cd doc && xelatex lsq && bibtex lsq && xelatex lsq && xelatex lsq
	rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.toc \
	$(PROJ) $(GENDATA) $(DATA) $(IMAGE) \
	$(PROJ).o $(GENDATA).o \
	$(DOCDIR)/*.log $(DOCDIR)/*.blg $(DOCDIR)/*.bbl $(DOCDIR)/*.aux $(DOCDIR)/*.eps \
	*.nav *.snm *.dat *.eps \
	lsq

clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.toc \
	$(PROJ) $(GENDATA) $(DATA) $(IMAGE) \
	$(PROJ).o $(GENDATA).o \
	$(DOCDIR)/*.log $(DOCDIR)/*.blg $(DOCDIR)/*.bbl $(DOCDIR)/*.aux $(DOCDIR)/*.pdf $(DOCDIR)/*.eps \
	*.nav *.snm *.dat *.eps \
	lsq

.PHONY: all clean
