/^+STRING/ {
    r mixins/string.nanorc
    d
}
/^+BOOLEAN/ {
    r mixins/boolean.nanorc
    d
}
/^+FUNCTION/ {
    r mixins/function.nanorc
    d
}
/^+CCOMMENT/ {
    r mixins/ccomment.nanorc
    d
}
/^+HASHCOMMENT/ {
    r mixins/hashcomment.nanorc
    d
}
/^+INI/ {
    r mixins/ini.nanorc
    d
}

/^+TODO/ {
    r mixins/todo.nanorc
    d
}

/^+LINT/ {
    r mixins/lint.nanorc
    d
}

/^+LONGLINE/ {
    r mixins/longline.nanorc
    d
}

s|^PLAIN:|color black|
s|^FUNCTION:|color brightblue|
s|^STRING:|color yellow|
s|^COMMENT:|color cyan|
s|^TYPE:|color brightgreen|
s|^BOOLEAN:|color brightcyan|
s|^NUMBER:|color blue|
s|^REGEXP:|color magenta|
s|^VARIABLE:|color brightyellow|
s|^OPERATOR:|color red|
s|^KEYWORD:|color green|
s|^~KEYWORD:|icolor green|
s|^MACRO:|color brightyellow|
s|^ESCAPE:|color magenta|
s|^WARNING:|color brightwhite,red|
s|^SECTION:|color brightmagenta|
