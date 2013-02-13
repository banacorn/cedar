build: build.js
	node build.js
	stylus -c --include src/stylus --include node_modules/nib/lib --compress --out stylesheets src/stylus/style.styl
	
compile: node_modules/requirejs/bin/r.js
	coffee --compile --output scripts/ src/
	stylus --include src/stylus --include node_modules/nib/lib --out stylesheets src/stylus/style.styl
	node node_modules/requirejs-preprocessor/main.js --compile

watch: 
	make -j beobachten

beobachten: coffee stylus preprocessorwatch rinde

coffee:
	coffee --watch --compile --output scripts/ src/ 

stylus:
	stylus --include src/stylus --include node_modules/nib/lib --out stylesheets --watch src/stylus/style.styl

rinde: ./../rinde/Makefile
	make watch -C ./../rinde

preprocessorwatch:
	node node_modules/requirejs-preprocessor/main.js --watch 


.PHONY: build watch compile
.SILENT: beobachten
