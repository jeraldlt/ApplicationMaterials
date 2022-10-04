.PHONY: all

all: cv research teaching diversity references clean

# shorthand rules
cv: JeraldThomas_CV clean
research: JeraldThomas_Research clean
teaching: JeraldThomas_Teaching clean
diversity: JeraldThomas_Diversity clean
references: JeraldThomas_References clean
research_teaching: JeraldThomas_Research_Teaching clean

JeraldThomas_Research_Teaching: research_teaching.tex
	-latexmk -xelatex -f -use-make -interaction=nonstopmode -jobname=$@ $<
	-latexmk -c -jobname $@ $<
	-mv $@.pdf output
	-mv $@.log output

JeraldThomas_CV: cv.tex
	-latexmk -xelatex -f -use-make -interaction=nonstopmode -jobname=$@ $<
	-latexmk -c -jobname $@ $<
	-mv $@.pdf output
	-mv $@.log output
	-test -f output/JeraldThomas.pdf && mv output/JeraldThomas.pdf output/tmp.pdf && pdfunite output/tmp.pdf output/$@.pdf output/JeraldThomas.pdf
	-test -f output/JeraldThomas.pdf || cp output/$@.pdf output/JeraldThomas.pdf
	-rm -f output/tmp.pdf

JeraldThomas_Research: research.tex
	-latexmk -xelatex -f -use-make -interaction=nonstopmode -jobname=$@ $<
	-latexmk -c -jobname $@ $<
	-mv $@.pdf output
	-mv $@.log output
	-test -f output/JeraldThomas.pdf && mv output/JeraldThomas.pdf output/tmp.pdf && pdfunite output/tmp.pdf output/$@.pdf output/JeraldThomas.pdf
	-test -f output/JeraldThomas.pdf || cp output/$@.pdf output/JeraldThomas.pdf
	-rm -f output/tmp.pdf

JeraldThomas_Teaching: teaching.tex
	-latexmk -xelatex -f -use-make -interaction=nonstopmode -jobname=$@ $<
	-latexmk -c -jobname $@ $<
	-mv $@.pdf output
	-mv $@.log output
	-test -f output/JeraldThomas.pdf && mv output/JeraldThomas.pdf output/tmp.pdf && pdfunite output/tmp.pdf output/$@.pdf output/JeraldThomas.pdf
	-test -f output/JeraldThomas.pdf || cp output/$@.pdf output/JeraldThomas.pdf
	-rm -f output/tmp.pdf

JeraldThomas_Diversity: diversity.tex
	-latexmk -xelatex -f -use-make -interaction=nonstopmode -jobname=$@ $<
	-latexmk -c -jobname $@ $<
	-mv $@.pdf output
	-mv $@.log output
	-test -f output/JeraldThomas.pdf && mv output/JeraldThomas.pdf output/tmp.pdf && pdfunite output/tmp.pdf output/$@.pdf output/JeraldThomas.pdf
	-test -f output/JeraldThomas.pdf || cp output/$@.pdf output/JeraldThomas.pdf
	-rm -f output/tmp.pdf

JeraldThomas_References: references.tex
	-latexmk -xelatex -f -use-make -interaction=nonstopmode -jobname=$@ $<
	-latexmk -c -jobname $@ $<
	-mv $@.pdf output
	-mv $@.log output
	-test -f output/JeraldThomas.pdf && mv output/JeraldThomas.pdf output/tmp.pdf && pdfunite output/tmp.pdf output/$@.pdf output/JeraldThomas.pdf
	-test -f output/JeraldThomas.pdf || cp output/$@.pdf output/JeraldThomas.pdf
	-rm -f output/tmp.pdf

cleanall: clean
	-latexmk -C
	-rm *.pdf
	-rm *.log
	-rm -f output/*

clean:
	-latexmk -c
	-rm *.aux
	-rm *.fdb_latexmk
	-rm *.fls
	-rm *.out
	-rm *.xdv
	-rm *.bbl
	-rm *.blg
