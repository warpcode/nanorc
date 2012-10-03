~/.nanorc: theme.sed *.nanorc mixins/*.nanorc
	cat *.nanorc | sed -f mixins.sed | sed -f theme.sed $(FILTER) > $@

ifeq ($(shell uname),Darwin)
  OLDNANO = 1
endif

ifdef OLDNANO
  FILTER += | sed -e '/^header/d;/^bind/d;/^set undo/d'
endif

ifdef TEXT
  FILTER += | sed -e 's|^color \(bright\)\{0,1\}black|color \1$(TEXT)|'
endif

ifdef BSDREGEX
  FILTER += | sed -e 's|\\<|[[:<:]]|g;s|\\>|[[:>:]]|g'
endif


.PHONY: ~/.nanorc
