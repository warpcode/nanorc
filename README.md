nanorc
======

Improved syntax highlighting definitions for [GNU nano].

Description
-----------

The syntax highlighting definitions that come bundled with nano are of
pretty poor quality. This is an attempt at providing a good set of accurate
syntax definitions to replace and expand the defaults.

Installation
------------

Simply use `make` to concatenate everything together and install as a bundle
to `~/.nanorc`. If your terminal text color isn't black, you'll need to
specify it when installing, e.g. `make TEXT=white` or `make TEXT=green` etc.

After installation, use `nano examples/*` to test if everything is
working properly. If some or all of the files fail to highlight properly,
see the "Compatibility" section below.

Theming System
--------------

All `*.nanorc` files are passed through [mixins.sed] and [theme.sed] before
installation. These scripts allow rules to be specified in terms of token
names or [mixins], instead of hard-coded colors.

For example, the following named rule:

    KEYWORD: "\<(if|else|return)\>"

becomes:

    color green "\<(if|else|return)\>"

and the following "mixin":

    +BOOLEAN

becomes:

    color brightcyan "\<(true|false)\>"

This system helps to keep colors uniform across different languages and
also to keep the definitions clear and maintainable, which is something that
becomes quite awkward using only plain [nanorc] files.

Key Bindings
------------

[main.nanorc] contains runtime options and key bindings. It can be safely
deleted or changed according to preference. The default bindings try to stay
close to common GUI conventions where possible (e.g. `Ctrl+S` for save,
`Ctrl+O` for open).

Compatibility
-------------

### Interaction with `/etc/nanorc` on Debian/Ubuntu/Arch/...

If syntax highlighting fails, try removing any `include` or `syntax` lines
from `/etc/nanorc`. There appears to be a bug in older versions of nano that
causes highlighting to fail when `/etc/nanorc` and `~/.nanorc` both exist
and contain active `syntax` rules.

### Disabled features on OS X

The current builds of Nano included with OS X are quite old and lack support
for various [nanorc] features used by this project. To work around this issue,
when installing on OS X, the build process will automatically strip out the
following features:

* All `header` commands
* All `bind` commands
* The `set undo` option

### Regular expression workaround for some versions of OS X and *BSD

In order to reliably highlight keywords, this projects makes heavy use of
the GNU regex word boundary extensions (`\<` and `\>`). BSD implementations
also have these extensions but use a completely different syntax (`[[:<:]]`
and `[[:>:]]`). If you're using Mac OS X or a BSD and highlighting seems
messed up, try to install using `make BSDREGEX=1`.

[GNU nano]: http://www.nano-editor.org/
[nanorc]: http://www.nano-editor.org/dist/v2.3/nanorc.5.html
[theme.sed]: https://github.com/craigbarnes/nanorc/tree/master/theme.sed
[mixins.sed]: https://github.com/craigbarnes/nanorc/tree/master/mixins.sed
[mixins]: https://github.com/craigbarnes/nanorc/tree/master/mixins
[main.nanorc]: https://github.com/craigbarnes/nanorc/blob/master/main.nanorc
