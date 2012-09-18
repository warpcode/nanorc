MAKEFLAGS += --no-print-directory

light:
	@$(MAKE) -B ~/.nanorc

dark:
	@$(MAKE) FILTER="| sed 's|^color \+\(bright\)\?black|color \1white|'"

~/.nanorc: theme.sed *.nanorc
	cat *.nanorc | sed -f theme.sed $(FILTER) $(STRIP) > $@

ifeq ($(shell uname),Darwin)
  STRIP = | sed '/^header/d;/^bind/d;/^set undo/d'
endif


.PHONY: light dark
