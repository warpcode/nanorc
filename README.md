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

The included Makefile will concatenate everything together and install as a
bundle to `~/.nanorc`. Use either `make light` or `make dark`, dedending on
the background color of your terminal. Using only `make` will default to
`make light`.

Theming System
--------------

All `*.nanorc` files are passed through [theme.sed] before installation.
This script allows rules to be specified in terms of token names or "mixins",
instead of hard-coded colors.

For example, the following named rule:

    KEYWORD: "\<(if|else|return)\>"

becomes:

    color green "\<(if|else|return)\>"

and the following "mixin":

    +BOOLEAN

becomes:

    color brightcyan "\<(true|false)\>"

This system helps to keep colors uniform accross different languages and
also to keep the definitions clear and maintainable, which is something that
becomes quite awkward using only plain [nanorc] files.

Key Bindings
------------

[main.nanorc] contains runtime options and key bindings. It can be safely
deleted or changed according to preference. The default bindings try to stay
close to common GUI conventions where possible (e.g. `Ctrl+S` for save,
`Ctrl+O` for open).

Testing
-------

There are a few files representing some of the supported languages in the
`examples` directory. For a quick demonstration, use `nano examples/*`.

Compatibility
-------------

### Features

The current builds of Nano included with OS X are quite old and lack support
for various [nanorc] features used by this project. To work around this issue,
when installing on OS X, the build process will automatically strip out the
following features:

* All `header` commands
* All `bind` commands
* The `set undo` option

### Regular Expressions

In order to reliably highlight keywords, this projects makes heavy use of
the GNU regex word boundary extensions (`\<` and `\>`). BSD implementations
also have these extensions but use a completely different syntax (`[[:<:]]`
and `[[:>:]]`). If you're using Mac OS X or a BSD and highlighting seems
messed up, add `BSDREGEX=1` to the command line when installing, for example
`make dark BSDREGEX=1`.

[GNU nano]: http://www.nano-editor.org/
[nanorc]: http://www.nano-editor.org/dist/v2.3/nanorc.5.html
[theme.sed]: https://github.com/craigbarnes/nanorc/tree/master/theme.sed
[main.nanorc]: https://github.com/craigbarnes/nanorc/blob/master/main.nanorc
