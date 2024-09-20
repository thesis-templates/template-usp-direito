all:
	@echo "main [option]"
	@echo "  doc  : Make doc.pdf"
	@echo "  pkgs : Install packages"
	@echo "  save : Save changes"

save:
	git add .
	git commit -m $(shell date -Iseconds)
	git push origin main

pkgs:
	sudo apt update -y
	sudo apt install -y $(shell cat ./apt-packages.txt)

doc: data
	@pandoc \
	--filter pandoc-citeproc \
	--filter pandoc-plantuml \
	-o doc.pdf \
	./meta.yml \
	$(shell cat ./thesis.txt)


data:
	@python3 src
