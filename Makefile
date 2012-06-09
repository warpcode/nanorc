THEME = light

ifeq ($(shell uname),Darwin)
    THEME = osx
endif

install: themes/$(THEME)
	cat *.nanorc | $< > ~/.nanorc


.PHONY: install
