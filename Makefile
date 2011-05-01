.PHONY: clean

default: clean all

all: index.html

index.html: resume.html
	ln -fs $< $@

%.html: %.rst
	rst2html --link-stylesheet --stylesheet-path=$*.css $< > $@

test: all
	firefox index.html

clean:
	rm -f *.html
