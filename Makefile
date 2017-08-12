.PHONY: build deploy

build:
	npm run build

deploy:
	surge -p . -d bike-gear.surge.sh

