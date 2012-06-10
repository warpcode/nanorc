THEME = light

ifeq ($(shell uname),Darwin)
    THEME = osx
endif

install: themes/$(THEME) *.nanorc
	@$^ > ~/.nanorc
	@echo 'Installed nanorc using "$(THEME)" theme'


.PHONY: install
