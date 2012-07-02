build: build.js
	node build.js	
	
compile:
	coffee --compile --output scripts/ src/
	
watch:
	coffee --watch --compile --output scripts/ src/  

.PHONY: build
