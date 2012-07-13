build: build.js
	node build.js
	node node_modules/requirejs/bin/r.js -o cssIn=stylesheets/style.css out=stylesheets/style.css
	
compile: node_modules/requirejs/bin/r.js
	coffee --compile --output scripts/ src/
	lessc -x src/less/style.less > stylesheets/style.css
	
watch: 
	make -j beobachten

beobachten: coffee less

coffee:
	coffee --watch --compile --output scripts/ src/ 

less:
	lessw -wo stylesheets src/less 

.PHONY: build watch compile
.SILENT: beobachten
