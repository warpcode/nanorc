light: theme.sed *.nanorc mixins/*.nanorc
	cat *.nanorc | sed -f theme.sed $(FILTER) > ~/.nanorc

dark:
	@$(MAKE) --no-print-directory DARK=1

ifeq ($(shell uname),Darwin)
  OLDNANO = 1
endif

ifdef OLDNANO
  FILTER += | sed -e '/^header/d;/^bind/d;/^set undo/d'
endif

ifdef DARK
  FILTER += | sed -e 's|^color \+\(bright\)\?black|color \1white|'
endif

ifdef BSDREGEX
  FILTER += | sed -e 's|\\<|[[:<:]]|g;s|\\>|[[:>:]]|g'
endif


.PHONY: light dark
