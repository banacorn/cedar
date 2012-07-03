build: build.js
	node build.js
	node node_modules/requirejs/bin/r.js -o cssIn=stylesheets/style.css out=stylesheets/style.css
	
compile: node_modules/requirejs/bin/r.js
	coffee --compile --output scripts/ src/
	lessc -x src/less/style.less > stylesheets/style.css
	
watch:
	coffee --watch --compile --output scripts/ src/  

.PHONY: build
