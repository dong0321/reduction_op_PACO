PDFLATEX=lualatex

MAIN_TEX= EuroMPI20_Using_Advanced_Vector_Extensions_AVX-512_for_MPI_Reductions.tex cover_letter.tex

all: pdf-pdftex

pdf-pdftex:
	latexmk -f -pdf -pdflatex='pdflatex' -latexoption="--shell-escape" $(MAIN_TEX)

pdf-force:
	latexmk -f -pdf -pdflatex='lualatex --interaction=nonstopmode' $(MAIN_TEX)
	makeglossaries $(MAIN_TEX)
	latexmk -f -pdf -pdflatex='lualatex --interaction=nonstopmode' $(MAIN_TEX)

pdf-interact:
	latexmk -f -pdf -pdflatex='lualatex' $(MAIN_TEX)
	makeglossaries $(MAIN_TEX)
	latexmk -f -pdf -pdflatex='lualatex' $(MAIN_TEX)

tidy: .FORCE
	rm -f *~

git-clean: .FORCE
	git clean -Xdf

clean: tidy
	latexmk -c

scrub: clean
	rm -f $(MAIN_TEX).pdf
	rm -f $(MAIN_TEX).ps
	rm -f $(MAIN_TEX).acn
	rm -f $(MAIN_TEX).acr
	rm -f $(MAIN_TEX).alg
	rm -f $(MAIN_TEX).aux
	rm -f $(MAIN_TEX).bbl
	rm -f $(MAIN_TEX).blg
	rm -f $(MAIN_TEX).fdb_latexmk
	rm -f $(MAIN_TEX).fls
	rm -f $(MAIN_TEX).glo
	rm -f $(MAIN_TEX).gls
	rm -f $(MAIN_TEX).glg
	rm -f $(MAIN_TEX).ist
	rm -f $(MAIN_TEX).log
	rm -f $(MAIN_TEX).out
	rm -f $(MAIN_TEX).toc
	rm -f $(MAIN_TEX).tdo


.FORCE:
