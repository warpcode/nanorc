THEME = theme.sed
OBJDIR := build
BUILD_TYPE = single
PREFIX = ~/.nano/

# Remove "header" directives if not supported (introduced in nano 2.1.6)
NANOVER = $(shell nano -V | sed -n 's/^.* version \([0-9\.]*\).*/\1/p')
ifeq ($(shell printf "2.1.5\n$(NANOVER)" | sort -nr | head -1),2.1.5)
  FILTER += | sed -e '/^header/d'
endif

ifdef TEXT
  FILTER += | sed -e 's|^color \(bright\)\{0,1\}black|color \1$(TEXT)|'
endif

ifdef BSDREGEX
  FILTER += | sed -e 's|\\<|[[:<:]]|g;s|\\>|[[:>:]]|g'
endif

# Rules
all: $(BUILD_TYPE)

single: $(OBJDIR)/syntax.nanorc
	
individual: $(addprefix $(OBJDIR)/, $(wildcard *.nanorc))
	
clean:
	@rm -rf "$(OBJDIR)"

# Dependencies
$(OBJDIR):
	@mkdir -p $@

$(OBJDIR)/syntax.nanorc: *.nanorc mixins/*.nanorc $(THEME) | $(OBJDIR)
	@printf 'Building $@\n'
	@sed -f mixins.sed *.nanorc | sed -f $(THEME) $(FILTER) > $@
	
$(OBJDIR)/%.nanorc: %.nanorc mixins/*.nanorc $(THEME) | $(OBJDIR)
	@printf 'Building $@\n'
	@sed -f mixins.sed $< | sed -f $(THEME) $(FILTER) > $@