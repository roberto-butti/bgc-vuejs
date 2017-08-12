.PHONY: build deploy fixindexhtml restoreindexhtml surgeexec
GACODE=UA-YYYYYYYYY-Y
-include config.mk

build:
	npm run build

fixindexhtml:
	@echo executing $@
	cp index.html index.html.original
	cat index.html | sed -e "s#UA-XXXXXXXXX-X#$(GACODE)#" > index.html.makefile
	mv index.html.makefile index.html

restoreindexhtml:
	@echo executing $@
	mv index.html.original index.html

surgeexec: 
	@echo executing $@
	surge -p . -d bike-gear.surge.sh

deploy: fixindexhtml surgeexec restoreindexhtml
	@echo "DEPLOY ended"
