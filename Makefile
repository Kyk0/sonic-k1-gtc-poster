# make          build main.pdf and copy it to SONIC-K1_GTC2027_Poster.pdf
# make preview  render preview.png (look at it after every change)
# make watch    rebuild on every save
# make check    fail on LaTeX errors, overfull boxes or numbers typed outside numbers.tex
# make clean    remove build files

.PHONY: all preview watch check clean

all: SONIC-K1_GTC2027_Poster.pdf

SONIC-K1_GTC2027_Poster.pdf: main.tex style.tex numbers.tex $(wildcard sections/*.tex) $(wildcard figures/*)
	latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
	cp main.pdf SONIC-K1_GTC2027_Poster.pdf

preview: SONIC-K1_GTC2027_Poster.pdf
	pdftoppm -png -r 50 -singlefile SONIC-K1_GTC2027_Poster.pdf preview

watch:
	latexmk -pdf -pvc -interaction=nonstopmode main.tex

check: SONIC-K1_GTC2027_Poster.pdf
	@! grep -E "^!" main.log || (echo "LaTeX errors above"; exit 1)
	@! grep -E "Overfull" main.log || (echo "Overfull boxes above"; exit 1)
	@! grep -nE "[0-9]+\.[0-9]+ ?\\\\%" sections/*.tex || (echo "Percentages typed in sections/: move them to numbers.tex"; exit 1)
	@echo "check passed"

clean:
	latexmk -C main.tex
	rm -f preview.png
