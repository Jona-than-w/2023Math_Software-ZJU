PROJ = navier-stokes


all:  $(PROJ).pdf



$(PROJ).pdf: $(PROJ).tex references.bib
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ) 




clean:
	rm -rf *.aux *.bbl *.blg *.log *.out *.toc *.scale *.dir *.pdf \
	$(PROJ) $(GENDATA) $(DATA) $(IMAGE) \
	*.nav *.snm *.dat

.PHONY: all clean



