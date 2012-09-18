MAKEFLAGS += --no-print-directory

light:
	@$(MAKE) -B ~/.nanorc

dark:
	@$(MAKE) FILTER="-e 's|^color \+\(bright\)\?black|color \1white|'"

~/.nanorc: theme.sed *.nanorc
	sed -f theme.sed $(FILTER) $(STRIP) *.nanorc > $@

ifeq ($(shell uname),Darwin)
  STRIP = -e '/^header/d;/^bind/d;/^set undo/d'
endif


.PHONY: light dark
