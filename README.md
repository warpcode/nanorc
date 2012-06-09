nanorc
======

Better syntax highlighting definitions for the [GNU nano] text editor.

Description
-----------

The syntax highlighting definitions that come bundled with nano are of
pretty poor quality. This is an attempt at providing a good set of accurate
syntax definitions to replace and expand the defaults.

Also included is a simple theming system, where all `color` statements (e.g.
`color brightred`) have been replaced with token identifiers (e.g.
`KEYWORD`, `OPERATOR`). These are replaced with colors according to the
chosen theme at build time. This system helps to keep colors uniform accross
different languages and also to keep the definitions clear and maintainable.

Installation
------------

Use `make install` for a standard installation using the default theme.

Alternatively, use `make install THEME=light`, where `light` is the name of
a [theme].

The build system will concatenate all `.nanorc` files together, apply the
selected (or default) theme and install everything as a bundle to
`~/.nanorc`. Obviously any customizations should be done in the original
source files, as `~/.nanorc` will be overwritten on subsequent builds.

[main.nanorc] contains runtime options and key bindings. It can be safely
deleted or changed according to preference. The default bindings try to stay
close to GUI/[GNOME] conventions where possible
(e.g. `Ctrl+S` for save, `Ctrl+O` for open).

Compatibility
-------------

On OSX, the default theme is `osx`, which is the same as the `light` theme
but also removes various [nanorc] features that aren't available in the
older versions of nano included with OSX.

The features that will be removed are:

* All `header` patterns
* All `bind` commands
* The `set undo` option

The detection of OSX is somewhat naive but will hopefully suffice until
Apple decide to bundle a newer build of nano.

Any manually specified theme will still override this default, so OSX users
who haven't compiled a newer version of nano themselves should install using
just `make install`.

[GNU nano]: http://www.nano-editor.org/
[nanorc]: http://www.nano-editor.org/dist/v2.3/nanorc.5.html
[theme]: https://github.com/craigbarnes/nanorc/tree/master/themes
[main.nanorc]: https://github.com/craigbarnes/nanorc/blob/master/main.nanorc
[GNOME]: http://www.gnome.org/
