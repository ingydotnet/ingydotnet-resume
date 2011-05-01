.PHONY: clean

all: index.html

index.html: resume.html
	ln -s $< $@

%.html: %.rst
	rst2html $< > $*

clean:
	rm *.html
