MDS := $(patsubst notes/markdown/%.md, public/%.html, $(wildcard notes/markdown/*.md))
ASSETS := $(patsubst assets/%, public/assets/%, $(wildcard assets/*))
all: $(MDS) $(patsubst notes/%.html, public/%.html, $(wildcard notes/*.html)) public/assets

notes/%.html: notes/markdown/%.md
	pandoc -f markdown_github $< > $@

public/%.html: notes/%.html tmpl/layout.html
	./bin/build $< tmpl/layout.html > $@

public/assets:
	rsync -rupE assets public/

clean:
	rm public/* -rf
