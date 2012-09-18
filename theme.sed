s|^STRING:|color yellow|
s/^+STRING/color yellow ""(\\\\.|[^"])*"|'(\\\\.|[^'])*'"/

s|^BOOLEAN:|color brightcyan|
s|^+BOOLEAN|color brightcyan "\\<(true\|false)\\>"|

s|^FUNCTION:|color brightblue|
s|^+FUNCTION|color brightblue "\\w+\\s*\\("\ncolor black "\\("|

s|^COMMENT:|color cyan|
s|^+CCOMMENT|color cyan "(^\|\\s)//.*"\ncolor cyan start="/\\*" end="\\*/"|
s|^+HASHCOMMENT|color cyan "(^\|\\s)#([^{].*)?$"|

s|^PLAIN:|color black|
s|^TYPE:|color brightgreen|
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

s|^+TODO|color brightwhite,cyan "TODO:?"|
s|^+LINT|color ,green "\\s+$"\ncolor ,red "\t+"|
s|^+LONG-LINE-WARNING|color ,red "^.{81,}$"|
