nanorc
======

Improved syntax highlighting definitions for [GNU nano].

Description
-----------

The syntax highlighting definitions that come bundled with nano are of
pretty poor quality. This is an attempt at providing a good set of accurate
syntax definitions to replace and expand the defaults.

Screenshots:
------------

#### Editing HTML:

![HTML Screenshot](http://cra.igbarn.es/img/nanorc-html.png)

#### Editing C:

![C Screenshot](http://cra.igbarn.es/img/nanorc-c.png)

Installation
------------

Using `make install` will concatenate all syntax files together and
install to `~/.nano/syntax.nanorc`. You can then include this file into
your main `~/.nanorc` configuration by adding the line:

    include ~/.nano/syntax.nanorc

If your terminal **text** color isn't black, you'll need to specify it when
installing, using `make install TEXT=color`, where `color` must be one of:
`red`, `green`, `yellow`, `blue`, `magenta`, `cyan` or `white`.

After installation, use `nano examples/*` to test if everything is
working properly. If some or all of the files aren't highlighted properly,
see the "Compatibility" section below.

Theme System
------------

All `*.nanorc` files are passed through [mixins.sed] and [theme.sed] before
installation. These scripts allow rules to be specified in terms of token
names or [mixins], instead of hard-coded colors.

For example, the following named rule:

    TYPE: "int|bool|string"

becomes:

    color green "int|bool|string"

and the following "mixin":

    +BOOLEAN

becomes:

    color brightcyan "\<(true|false)\>"

This system helps to keep colors uniform across different languages and
also to keep the definitions clear and maintainable, which is something that
becomes quite awkward using only plain [nanorc] files.

**Note:** if `~/.nanotheme` exists it will be used as a custom theme, in
place of [theme.sed]. A custom theme may also be specified by installing
with `make THEME=your-custom-theme.sed`. Themes must be valid sed scripts,
defining *all* color codes found in [theme.sed] in order to work correctly.

Compatibility
-------------

### Interaction with `/etc/nanorc` on Debian/Ubuntu/Arch/...

If syntax highlighting fails, try removing any `include` or `syntax` lines
from `/etc/nanorc`. There appears to be [a bug in older versions of nano][5]
that causes highlighting to fail when `/etc/nanorc` and `~/.nanorc` both
exist and contain active `syntax` rules.

### Regular expression workaround on OS X and *BSD

In order to reliably highlight keywords, this projects makes heavy use of
the GNU regex word boundary extensions (`\<` and `\>`). BSD implementations
also have these extensions but use a different, incompatible syntax
(`[[:<:]]` and `[[:>:]]`). Since version 2.1.5, nano can automatically
translate the GNU syntax to BSD syntax at run-time, but for the benefit of
people running a pre-2.1.5 version of nano on OS X or *BSD, the `~/.nanorc`
file itself can be translated by installing with `make BSDREGEX=1`.

[GNU nano]: http://www.nano-editor.org/
[nanorc]: http://www.nano-editor.org/dist/v2.3/nanorc.5.html
[theme.sed]: https://github.com/craigbarnes/nanorc/tree/master/theme.sed
[mixins.sed]: https://github.com/craigbarnes/nanorc/tree/master/mixins.sed
[mixins]: https://github.com/craigbarnes/nanorc/tree/master/mixins
[5]: https://github.com/craigbarnes/nanorc/issues/5 "between 2.2.6 and 2.3.2"
