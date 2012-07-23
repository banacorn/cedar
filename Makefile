build: build.js
	node build.js
	
compile: node_modules/requirejs/bin/r.js
	coffee --compile --output scripts/ src/
	stylus --include src/stylus --include node_modules/nib/lib --out stylesheets --watch src/stylus/style.styl
	
watch: 
	make -j beobachten

beobachten: coffee stylus

coffee:
	coffee --watch --compile --output scripts/ src/ 

stylus:
	stylus --include src/stylus --include node_modules/nib/lib --out stylesheets --watch src/stylus/style.styl

.PHONY: build watch compile
.SILENT: beobachten
