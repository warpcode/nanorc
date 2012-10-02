MAKEFLAGS += --no-print-directory

light:
	@$(MAKE) -B ~/.nanorc

dark:
	@$(MAKE) FILTER="-e 's|^color \+\(bright\)\?black|color \1white|'"

~/.nanorc: theme.sed *.nanorc
	cat *.nanorc | sed -f theme.sed $(FILTER) $(STRIP) > $@

ifeq ($(shell uname),Darwin)
  STRIP += | sed -e '/^header/d;/^bind/d;/^set undo/d'
endif

ifdef BSDREGEX
  STRIP += | sed -e 's|\\<|[[:<:]]|g;s|\\>|[[:>:]]|g'
endif

.PHONY: light dark
