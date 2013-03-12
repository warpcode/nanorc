build: build/ $(addprefix build/, $(wildcard *.nanorc))

build/:
	@mkdir $@

build/%.nanorc: %.nanorc mixins/*.nanorc $(THEME)
	@sed -f mixins.sed $< | sed -f $(THEME) $(FILTER) > $@
	@echo $@

clean:
	rm -rf build/


.PHONY: build clean
