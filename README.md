nanorc
======

Better syntax highlighting definitions for the [GNU nano] text editor.

Description
-----------

The syntax highlighting definitions that come bundled with nano are of
pretty poor quality. This is an attempt at providing a good set of accurate
syntax definitions to replace and expand the defaults.

Also included is a simple theming system, where all [nanorc] `color`
statements (e.g. `color brightred`) have been replaced with identifiers
(`KEYWORD`, `OPERATOR`, etc.) or pre-defined mixins (`+FUNCTION`, `+BOOLEAN`
etc.). These are replaced with colors according to the chosen theme at build
time. This system helps to keep colors uniform accross different languages
and also to keep the definitions clear and maintainable.

Installation
------------

Use `make install` for a standard installation using the default theme.

Alternatively, use `make install THEME=light`, where `light` is the name of
a [theme].

The build system will concatenate all `.nanorc` files together, apply the
theme and install everything as a bundle to `~/.nanorc`.

[main.nanorc] contains runtime options and key bindings. It can be safely
deleted or changed according to preference. The default bindings try to stay
close to common GUI conventions where possible (e.g. `Ctrl+S` for save,
`Ctrl+O` for open).

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
