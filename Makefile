THEME = light

install: themes/$(THEME)
	$< *.nanorc > ~/.nanorc
ifeq ($(shell uname),Darwin)
	sed -ie '/^header.*/d;/^bind.*/d;/^set undo.*/d' ~/.nanorc
endif

.PHONY: install
