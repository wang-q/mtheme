SRC = demo.tex
PDF = demo.pdf
AUX = demo.aux
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/mtheme

TEXC := latexmk -xelatex 

.PHONY: clean install

all: $(PDF)

$(AUX):
	$(TEXC) $(SRC)

$(PDF): beamerthemem.sty $(AUX) $(SRC)
	$(TEXC) $(SRC)

clean:
	@rm -f $(PDF)
	@git clean -xf
	@rm -fr _minted-demo/

install:
	mkdir -p $(INSTALL_DIR)
	cp *.sty $(INSTALL_DIR)
