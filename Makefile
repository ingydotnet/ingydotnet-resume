.PHONY: clean

default: clean all

all: index.html ReadMe.pod

index.html: resume.html
	ln -fs $< $@

%.html: %.swim
	swim --to=html --complete=1 $< > $@
	perl -pi -e 's!(</head>)!<link rel="stylesheet" href="resume.css" type="text/css" />\n$$1!' $@

ReadMe.pod: resume.swim
	swim --to=pod --complete=1 --wrap=1 $< > $@

test: all
	firefox index.html

clean purge:
	rm -f *.html
