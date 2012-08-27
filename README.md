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

Use `make install` for a standard installation.

All `*.nanorc` files will be concatenated together and installed as a bundle
to `~/.nanorc`.

[main.nanorc] contains runtime options and key bindings. It can be safely
deleted or changed according to preference. The default bindings try to stay
close to common GUI conventions where possible (e.g. `Ctrl+S` for save,
`Ctrl+O` for open).

Themes
------

All `*.nanorc` files are passed through a [theme] script before installation.
This allows rules to be specified in terms of token names or "mixins",
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
also to keep the definitions clear and maintainable.

The default [theme] is for terminals with a light background color. To use a
dark theme, install with `make install THEME=dark`.

Compatibility
-------------

The current builds of Nano included with OSX are quite old and lack support
for various [nanorc] features used by this project. To work around this issue,
when installing on OSX, the build process will automatically strip out the
following features:

* All `header` commands
* All `bind` commands
* The `set undo` option

[GNU nano]: http://www.nano-editor.org/
[nanorc]: http://www.nano-editor.org/dist/v2.3/nanorc.5.html
[theme]: https://github.com/craigbarnes/nanorc/tree/master/themes
[main.nanorc]: https://github.com/craigbarnes/nanorc/blob/master/main.nanorc
