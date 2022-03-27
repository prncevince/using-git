.PHONY: all knit build deploy cleandist pdf

GENERATED_FILES = index.html 
JS_JS_FILES = $(wildcard theme/usr/js/*.js)
JS_HTML_FILES = $(subst .js,.html,$(JS_JS_FILES))

knit: $(GENERATED_FILES)

.knit-auto: $(GENERATED_FILES)
	git diff-index --quiet HEAD || git commit -am "auto knit slides"

js: $(JS_HTML_FILES)

all: .knit-auto build deploy cleandist

pages: build deploy cleandist

index.html: index.Rmd slides/* $(JS_HTML_FILES) 
	R --slave -e "rmarkdown::render('index.Rmd', 'xaringan::moon_reader')"
	touch .knit-auto

$(JS_HTML_FILES): theme/usr/js/%.html: theme/usr/js/%.js
	R --slave \
	-e "library(htmltools); \
	s <- trimws( \
	gsub('\\\\\/\\\\\*.*?\\\\\*\\\\\/|([^\\\\\:]|^)\\\\\/\\\\\/.*$$', \
	'', readLines('$<', warn = F, skipNul = T))); \
	s <- s[s != '']; \
	write(as.character(tags$$ script(HTML(paste0(s, collapse = '\n')))), '$@')"

build:
	git checkout gh-pages
	git diff-index --quiet HEAD || git commit -am "Update theme"
	git merge --no-edit -X theirs main
	R --slave -f build.R
	git add .
	git commit -am "Setup GitHub Pages"

deploy:
	git push --all --recurse-submodules=on-demand

cleandist:
	git revert --no-edit HEAD
	git checkout main

extra.html: extra.Rmd
	R --slave -e "rmarkdown::render('extra.Rmd', 'xaringan::moon_reader')"

pdf:
	Rscript --slave \
	-e "pagedown::chrome_print(input = 'index.Rmd', \
	output = 'pdf/mod-mAndA-n-reponame.pdf', options = list())" \
	-e "pagedown::chrome_print(input = 'extra.Rmd', \
	output = 'pdf/extra.pdf')"
