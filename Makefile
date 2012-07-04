THEME = light

install: themes/$(THEME)
	$< *.nanorc > ~/.nanorc
ifeq ($(shell uname),Darwin)
	sed -i '/^header.*/d;/^bind.*/d;/^set undo.*/d' ~/.nanorc
endif

.PHONY: install
