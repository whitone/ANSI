@echo off
rem
rem ANSI.SYS driver handler 1.0
rem
rem Author: Stefano Cotta Ramusino
rem
if (%1)==() goto config
if (%1)==(/?) goto help
if (%1)==(save) goto save
if (%1)==(SAVE) goto save
if (%1)==(sAvE) goto save
if (%1)==(SaVe) goto save
if (%1)==(SavE) goto save
if (%1)==(sAve) goto save
if (%1)==(saVe) goto save
if (%1)==(Save) goto save
if (%1)==(savE) goto save
if (%1)==(SAve) goto save
if (%1)==(saVE) goto save
if (%1)==(sAVe) goto save
if (%1)==(sAVE) goto save
if (%1)==(SAVe) goto save
if (%1)==(SAvE) goto save
if (%1)==(SaVE) goto save
if (%1)==(ret) goto return
if (%1)==(RET) goto return
if (%1)==(Ret) goto return
if (%1)==(rEt) goto return
if (%1)==(reT) goto return
if (%1)==(ReT) goto return
if (%1)==(rET) goto return
if (%1)==(REt) goto return
if (%1)==(del) goto delete
if (%1)==(DEL) goto delete
if (%1)==(Del) goto delete
if (%1)==(dEl) goto delete
if (%1)==(deL) goto delete
if (%1)==(DEl) goto delete
if (%1)==(dEL) goto delete
if (%1)==(DeL) goto delete
if (%1)==(cls) goto clean
if (%1)==(CLS) goto clean
if (%1)==(Cls) goto clean
if (%1)==(cLs) goto clean
if (%1)==(clS) goto clean
if (%1)==(CLs) goto clean
if (%1)==(cLS) goto clean
if (%1)==(ClS) goto clean
if (%1)==(n) goto default
if (%1)==(N) goto default
if (%1)==(nc) goto normal
if (%1)==(NC) goto normal
if (%1)==(Nc) goto normal
if (%1)==(nC) goto normal
if (%1)==(r) goto restore
if (%1)==(R) goto restore
if (%1)==(-cur) goto cursor
if (%1)==(-CUR) goto cursor
if (%1)==(-Cur) goto cursor
if (%1)==(-cUr) goto cursor
if (%1)==(-cuR) goto cursor
if (%1)==(-CUr) goto cursor
if (%1)==(-cUR) goto cursor
if (%1)==(-CuR) goto cursor
if (%1)==(-c) goto cursor
if (%1)==(-C) goto cursor
if (%1)==(-scr) goto screen
if (%1)==(-SCR) goto screen
if (%1)==(-Scr) goto screen
if (%1)==(-sCr) goto screen
if (%1)==(-scR) goto screen
if (%1)==(-SCr) goto screen
if (%1)==(-sCR) goto screen
if (%1)==(-ScR) goto screen
if (%1)==(-s) goto screen
if (%1)==(-S) goto screen
if (%1)==(-key) goto key
if (%1)==(-KEY) goto key
if (%1)==(-Key) goto key
if (%1)==(-kEy) goto key
if (%1)==(-keY) goto key
if (%1)==(-KEy) goto key
if (%1)==(-kEY) goto key
if (%1)==(-KeY) goto key
if (%1)==(-k) goto key
if (%1)==(-K) goto key
if (%1)==(vhkigvloihvxbogu) goto rip_err
if (%1)==(bnkjghkhlhbhlkjhlojhoij) goto end
goto error

:help
echo.
echo ANSI.SYS driver handler 1.0
echo.
echo  ansi                         show command history
echo  ansi /?                      get this help page
echo  ansi n                       reset all customizations
echo.
echo Change screen attributes with '-scr' or shorter '-s'
echo. 
echo  ansi -scr ?                  get scr help page
echo  ansi -scr b                  set text in bold mode
echo  ansi -scr f                  set screen in flashing mode
echo  ansi -scr inv                set white background and black foreground
echo  ansi -scr hide               set black both background and foreground
echo  ansi -scr no                 remove screen attributes
echo  ansi -scr /b ?               get scr b help page
echo  ansi -scr /f ?               get scr f help page
echo  ansi -scr /b bgcol /f fgcol  set background and foreground colors
echo  ansi -scr /m ?               get scr m help page
echo  ansi -scr /m mode            set desired screen mode
echo  ansi -scr /z ?               set scr z help page
echo  ansi -scr /z zoom            set desired screen zoom
echo.
pause
echo  ansi cls                     clean screen
echo.
echo Move prompt cursor with '-cur' or shorter '-c'
echo.
echo  ansi -cur ?                  get cur help page
echo  ansi -cur up lines           move the cursor up by the number of lines
echo  ansi -cur down lines         move the cursor down by the number of lines
echo  ansi -cur lx cols            move the cursor left by the number of columns
echo  ansi -cur rx cols            move the cursor right by the number of columns
echo  ansi -cur lines cols         move the cursor at the specified coordinates
echo  ansi nc                      reset cursor changes
echo  ansi del                     restore cursor to prompt line
echo  ansi save                    save current cursor position
echo  ansi ret                     return to saved cursor position
echo.
echo Swap keys with '-key' or shorter '-k'
echo.
echo  ansi -key ?                  get key help page
echo  ansi -key key1 key2          swap key1 with key2
echo  ansi r                       reset key codes manipulations
echo.
rem echo  ansi -key /s ?               get key s help page
rem echo  ansi -key /s key1            search for key1 code
rem echo  ansi -key /c ?               get key c help page
rem echo  ansi -key /c code1 cmd       execute cmd when key with code1 is pressed
goto end

:rip_err
echo Error: only ANSI program can access to the file.
echo.
goto end

:key
if (%temp%)==() set temp=a:
set l=
if (%2)==(?) goto help_key
goto keys

:config
if (%temp%)==() set temp=a:
if not exist %temp%\ansi.cfg goto no_mod
type %temp%\ansi.cfg
echo.
goto end

:no_mod
echo The default settings are active.
echo.
goto end

:restore
if (%temp%)==() set temp=a:
if not exist %temp%\del-lit.bat goto err
if (%pr_ansi%)==() set pr_ansi=%prompt%
if not (%lit%)==() set lit=
if not (%2)==() goto del_key
call %temp%\del-lit.bat *
prompt $e[0;134;0;134p
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
del %temp%\del-lit.bat
if (%lit%)==() goto eeee
if (%temp%)==() set temp=a:
echo Keys %lit% restored >> %temp%\ansi.cfg
set lit=
goto end

:del_key
call %temp%\del-lit.bat %2
prompt $e[0;134;0;134p
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if (%lit%)==() goto eeee
if (%temp%)==() set temp=a:
echo Key %lit% restored >> %temp%\ansi.cfg
set lit=
goto end

:eeee
echo Error in the "restorer" file:
echo    cannot recognize the restored keys
goto end

:err
if (%temp%)==() set temp=a:
echo Cannot find the "restorer" file: %temp%\del-lit.bat
echo.
goto end

:default
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[0;37;40m
echo on

@echo off
if (%temp%)==() set temp=a:
if exist %temp%\ansi.cfg del %temp%\ansi.cfg
if exist %temp%\cur.bat del %temp%\cur.bat
prompt $e[=3l
echo on

@echo off
mode con lines=25 cols=80
goto crlf

:save
if not (%3)==() goto error
set pr_ansi=%prompt%
set prompt=$e[s
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if (%temp%)==() set temp=a:
echo Cursor saved >> %temp%\ansi.cfg
goto end

:return
if not (%3)==() goto error
set pr_ansi=%prompt%
set prompt=$e[u
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if (%temp%)==() set temp=a:
echo Cursor returned to saved coordinates >> %temp%\ansi.cfg
goto end

:delete
if not (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[K
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if (%temp%)==() set temp=a:
echo Line deleted >> %temp%\ansi.cfg
goto end

:clean
if not (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[2J
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if (%temp%)==() set temp=a:
echo Screen cleaned >> %temp%\ansi.cfg
goto end

:cursor
if (%2)==() goto error
if (%2)==(?) goto curelp
if (%2)==(up) goto up
if (%2)==(down) goto down
if (%2)==(rx) goto right
if (%2)==(lx) goto left
if (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[%2;%3H
echo @prompt %%prompt%%$e[%2;%3H >> %temp%\cur.bat
echo.>> %temp%\cur.bat
if (%temp%)==() set temp=a:
echo Cursor moved to coordinates: %2;%3 >> %temp%\ansi.cfg
goto end

:curelp
echo The parameters to insert to move the cursor are
echo (between quotes the invariable words):
echo.
echo  'up'   lines    move the cursor up by the number of lines
echo  'down' lines    move the cursor down by the number of lines
echo  'rx'   cols     move the cursor right by the number of columns
echo  'lx'   cols     move the cursor left by the number of columns
echo  lines  cols     move the cursor at the specified coordinates
echo.
echo To save the position of the cursor use "ansi save" and then
echo to return to that: "ansi ret".
echo.
goto end

:up
if (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[%3A
echo @prompt %%prompt%%$e[%3A >> %temp%\cur.bat
echo.>> %temp%\cur.bat
if (%temp%)==() set temp=a:
if (%3)==(1) goto up1
echo Cursor moved %3 lines up >> %temp%\ansi.cfg
goto end

:up1
echo Cursor moved one line up >> %temp%\ansi.cfg
goto end

:down
if (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[%3B
echo @prompt %%prompt%%$e[%3B >> %temp%\cur.bat
echo.>> %temp%\cur.bat
if (%temp%)==() set temp=a:
if (%3)==(1) goto down1
echo Cursor moved %3 lines down >> %temp%\ansi.cfg
goto end

:down1
echo Cursor moved one line down >> %temp%\ansi.cfg
goto end

:right
if (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[%3C
echo @prompt %%prompt%%$e[%3C >> %temp%\cur.bat
echo.>> %temp%\cur.bat
if (%temp%)==() set temp=a:
if (%3)==(1) goto right1
echo Cursor moved %3 columns right >> %temp%\ansi.cfg
goto end

:right1
echo Cursor moved one column right >> %temp%\ansi.cfg
goto end

:left
if (%3)==() goto error
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[%3D
echo @prompt %%prompt%%$e[%3D >> %temp%\cur.bat
echo.>> %temp%\cur.bat
if (%temp%)==() set temp=a:
if (%3)==(1) goto left1
echo Cursor moved %3 columns left >> %temp%\ansi.cfg
goto end

:left1
echo Cursor moved one column left >> %temp%\ansi.cfg
goto end

:screen
if (%2)==() goto error
if (%2)==(?) goto screlp
if (%2)==(b) goto bold1
if (%2)==(f) goto flash1
if (%2)==(inv) goto inver1
if (%2)==(hide) goto hide1
if (%2)==(no) goto no1
goto screen1

:screlp
echo The parameters to change DOS screen attributes are: 
echo.
echo  b     bold
echo  f     flashing
echo  inv   inverted screen (white background and black foreground)
echo  hide  hidden screen (black background and black foreground)
echo  no    no attributes
echo.  
echo  '/b' color    to change the background color
echo  '/f' color    to change the foreground color
echo.
echo  '/m' mode     to change the graphics mode
echo.
echo  '/z' zoom     to change the zoom
echo.
echo The first five attributes can be put together with '/b' and '/f',
echo whereas '/m' and '/z' are availables only alone.
echo.
goto end

:screen1
if (%2)==(/f) goto fg1
if (%2)==(/b) goto bg1
if (%2)==(/m) goto resol1
if (%2)==(/z) goto mode
goto error

:mode
if (%3)==() goto error
if (%3)==(?) goto modelp
if (%3)==(++) goto maximum
if (%3)==(+-) goto medium
if (%3)==(n) goto normalz
if (%3)==(--) goto minimum
if (%3)==(l+) goto linemax
if (%3)==(l-) goto linemed
if (%3)==(l--) goto linemin
if (%3)==(c+) goto colmax
if (%3)==(c-) goto colmin
goto error

:modelp
echo.
echo The parameters to change the screen zoom are:
echo.
echo  ++      maximum zoom   25 x 40
echo  +-      medium  zoom   43 x 40
echo  n       normal  zoom   25 x 80  - standard
echo  --      minimum zoom   50 x 80
echo.
echo  l+      maximum lines  25 lines  - standard
echo  l-      medium  lines  43 lines
echo  l--     minimum lines  50 lines
echo.
echo  c+      maximum cols   40 cols
echo  c-      minimum cols   80 cols  - standard
echo.
goto end

:maximum
mode con lines=25 cols=40
if (%temp%)==() set temp=a:
echo Zoom mode: maximum zoom 25 x 40 >> %temp%\ansi.cfg
cls
goto end

:medium
mode con lines=43 cols=40
if (%temp%)==() set temp=a:
echo Zoom mode: medium zoom 43 x 40 >> %temp%\ansi.cfg
cls
goto end

:normalz
mode con lines=25 cols=80
if (%temp%)==() set temp=a:
echo Zoom mode: normal zoom 25 x 80 - standard >> %temp%\ansi.cfg
cls
goto end

:minimum
mode con lines=50 cols=80
if (%temp%)==() set temp=a:
echo Zoom mode: minimum zoom 50 x 80 >> %temp%\ansi.cfg
cls
goto end

:linemax
mode con lines=25
if (%temp%)==() set temp=a:
echo Zoom mode: maximum lines 25 lines - standard >> %temp%\ansi.cfg
cls
goto end

:linemed
mode con lines=43
if (%temp%)==() set temp=a:
echo Zoom mode: medium lines 43 lines >> %temp%\ansi.cfg
cls
goto end

:linemin
mode con lines=50
if (%temp%)==() set temp=a:
echo Zoom mode: minimum lines 50 lines >> %temp%\ansi.cfg
cls
goto end

:colmax
mode con cols=40
if (%temp%)==() set temp=a:
echo Zoom mode: maximum cols 40 cols >> %temp%\ansi.cfg
cls
goto end

:colmin
mode con cols=80
if (%temp%)==() set temp=a:
echo Zoom mode: minimum cols 80 cols - standard >> %temp%\ansi.cfg
cls
goto end

:resol1
if (%3)==() goto error
if (%3)==(?) goto help_res
if (%3)==(tmono) goto textmono
if (%3)==(tcol) goto textcol
if (%3)==(nmono) goto normono
if (%3)==(ncol) goto norcol
if (%3)==(g1mono) goto grap1mono
if (%3)==(g1col) goto grap1col
if (%3)==(g1c4) goto grap1c4
if (%3)==(g1c256) goto grap1c256
if (%3)==(g2mono) goto grap2mono
if (%3)==(g2col) goto grap2col
if (%3)==(g3mono) goto grap3mono
if (%3)==(g3col) goto grap3col
if (%3)==(emono) goto egamono
if (%3)==(ecol) goto egacol
goto error

:help_res
echo The parameters to enter to change the graphics mode are:
echo.
echo  tmono       40 x 148 x 25   monochrome   (only text)
echo  tcol        40 x 148 x 25   with colors  (only text)
echo  nmono       80 x 148 x 25   monochrome   (only text)  - standard
echo  ncol        80 x 148 x 25   with colors  (only text)  - standard
echo  g1mono     320 x 148 x 200  monochrome   (graphics)
echo  g1col      320 x 148 x 200  with colors  (graphics)
echo  g1c4       320 x 148 x 200  with colors  (4 color graphics)
echo  g1c256     320 x 148 x 200  with colors  (256 color graphics)
echo  g2mono     640 x 148 x 200  monochrome   (graphics)
echo  g2col      640 x 148 x 200  with colors  (16 color graphics)
echo  g3mono     640 x 148 x 480  monochrome   (graphics)
echo  g3col      640 x 148 x 480  with colors  (16 color graphics)
echo  emono      640 x 148 x 350  monochrome   (graphics)           - EGA    
echo  ecol       640 x 148 x 350  with colors  (16 color graphics)  - EGA
echo.
echo Standard mode is the most used one and is set as default with
echo the command "ansi n", while EGA graphics are not supported by
echo VGA and higher video cards.
echo.
goto end

:textmono
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=0h
if (%temp%)==() set temp=a:
echo Graphics mode: 40 x 148 x 25 monochrome (only text) >> %temp%\ansi.cfg
goto crlf

:textcol
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=1h
if (%temp%)==() set temp=a:
echo Graphics mode: 40 x 148 x 25 with colors (only text) >> %temp%\ansi.cfg
goto crlf

:normono
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=2h
if (%temp%)==() set temp=a:
echo Graphics mode: 80 x 148 x 25 monochrome (only text) - standard >> %temp%\ansi.cfg
goto crlf

:norcol
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=3h
if (%temp%)==() set temp=a:
echo Graphics mode: 80 x 148 x 25 with colors (only text) - standard >> %temp%\ansi.cfg
goto crlf

:grap1mono
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=5h
if (%temp%)==() set temp=a:
echo Graphics mode: 320 x 148 x 200 monochrome (graphics) >> %temp%\ansi.cfg
goto crlf

:grap1col
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=13h
if (%temp%)==() set temp=a:
echo Graphics mode: 320 x 148 x 200 with colors (graphics) >> %temp%\ansi.cfg
goto crlf

:grap1c4
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=4h
if (%temp%)==() set temp=a:
echo Graphics mode: 320 x 148 x 200 with colors (4 color graphics) >> %temp%\ansi.cfg
goto crlf

:grap1c256
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=19h
if (%temp%)==() set temp=a:
echo Graphics mode: 320 x 148 x 200 with colors (256 color graphics) >> %temp%\ansi.cfg
goto crlf

:grap2mono
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=6h
if (%temp%)==() set temp=a:
echo Graphics mode: 640 x 148 x 200 monochrome (graphics) >> %temp%\ansi.cfg
goto crlf

:grap2col
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=14h
if (%temp%)==() set temp=a:
echo Graphics mode: 640 x 148 x 200 with colors (16 color graphics) >> %temp%\ansi.cfg
goto crlf

:grap3mono
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=17h
if (%temp%)==() set temp=a:
echo Graphics mode: 640 x 148 x 480 monochrome (graphics) >> %temp%\ansi.cfg
goto crlf

:grap3col
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=18h
if (%temp%)==() set temp=a:
echo Graphics mode: 640 x 148 x 480 with colors (16 color graphics) >> %temp%\ansi.cfg
goto crlf

:egamono
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=15h
if (%temp%)==() set temp=a:
echo Graphics mode: 640 x 148 x 350 monochrome (graphics) - EGA >> %temp%\ansi.cfg
goto crlf

:egacol
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt %prompt%$e[=16h
if (%temp%)==() set temp=a:
echo Graphics mode: 640 x 148 x 350 with colors (16 color graphics) - EGA >> %temp%\ansi.cfg
goto crlf

:crlf
echo on

@echo off
cls
prompt $e[=7h
goto new

:fg1
if (%3)==() goto error
if (%3)==(?) goto help_col
if (%3)==(black) goto f_black
if (%3)==(red) goto f_red
if (%3)==(green) goto f_green
if (%3)==(yellow) goto f_yellow
if (%3)==(blue) goto f_blue
if (%3)==(magenta) goto f_mag
if (%3)==(liteblue) goto f_liblue
if (%3)==(white) goto f_white
goto error

:help_col
echo The 8 colors you can use for the foreground and/or the background are:
echo. 
echo  black          green          yellow            magenta
echo.
echo  red            blue           liteblue          white
echo.
goto end

:bg1
if (%3)==() goto error
if (%3)==(?) goto help_col
if (%3)==(black) goto b_black
if (%3)==(red) goto b_red
if (%3)==(green) goto b_green
if (%3)==(yellow) goto b_yellow
if (%3)==(blue) goto b_blue
if (%3)==(magenta) goto b_mag
if (%3)==(liteblue) goto b_liblue
if (%3)==(white) goto b_white
goto error

:bg2
if (%5)==(?) goto help_col
if not (%2)==() shift
if (%4)==() goto error
if (%4)==(black) goto b_black
if (%4)==(red) goto b_red
if (%4)==(green) goto b_green
if (%4)==(yellow) goto b_yellow
if (%4)==(blue) goto b_blue
if (%4)==(magenta) goto b_mag
if (%4)==(liteblue) goto b_liblue
if (%4)==(white) goto b_white
goto error

:fg2
if (%5)==(?) goto help_col
if not (%2)==() shift
if (%3)==() goto endd
if not (%3)==(/f) goto error
if (%4)==() goto error
if (%4)==(black) goto f_black
if (%4)==(red) goto f_red
if (%4)==(green) goto f_green
if (%4)==(yellow) goto f_yellow
if (%4)==(blue) goto f_blue
if (%4)==(magenta) goto f_mag
if (%4)==(liteblue) goto f_liblue
if (%4)==(white) goto f_white
goto error

:endd
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:f_white
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[37m
if (%temp%)==() set temp=a:
echo Foreground color: white >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_liblue
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[36m
if (%temp%)==() set temp=a:
echo Foreground color: liteblue >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_mag
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[35m
if (%temp%)==() set temp=a:
echo Foreground color: magenta >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_black
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[30m
if (%temp%)==() set temp=a:
echo Foreground color: black >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_blue
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[34m
if (%temp%)==() set temp=a:
echo Foreground color: blue >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_yellow
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[33m
if (%temp%)==() set temp=a:
echo Foreground color: yellow >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_green
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[32m
if (%temp%)==() set temp=a:
echo Foreground color: green >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:f_red
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[31m
if (%temp%)==() set temp=a:
echo Foreground color: red >> %temp%\ansi.cfg
if (%4)==() goto no_show
goto show

:bold1
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[1m
echo on

@echo off
shift
if (%temp%)==() set temp=a:
echo Bold enabled >> %temp%\ansi.cfg
if not (%2)==() goto screen1
set prompt=%pr_ansi%
set %pr_ansi%=
goto end

:flash1
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[5m
echo on

@echo off
shift
if (%temp%)==() set temp=a:
echo Flashing enabled >> %temp%\ansi.cfg
if not (%2)==() goto screen1
set prompt=%pr_ansi%
set %pr_ansi%=
goto end

:inver1
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[7m
echo on

@echo off
shift
if (%temp%)==() set temp=a:
echo Inverted screen enabled >> %temp%\ansi.cfg
if not (%2)==() goto screen1
set prompt=%pr_ansi%
set %pr_ansi%=
goto end

:hide1
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[8m
echo on

@echo off
shift
if (%temp%)==() set temp=a:
echo Hidden screen enabled >> %temp%\ansi.cfg
if not (%2)==() goto screen1
set prompt=%pr_ansi%
set %pr_ansi%=
goto end

:no1
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=$e[0m
echo on

@echo off
shift
if (%temp%)==() set temp=a:
echo No attributes enabled >> %temp%\ansi.cfg
if not (%2)==() goto screen1
set prompt=%pr_ansi%
set %pr_ansi%=
goto end

:show
if (%1)==(/b) goto new
if (%3)==(/b) goto new
echo on

@echo off
prompt %pr_ansi%
cls
if (%2)==(/b) goto fg2
if (%4)==(/b) goto bg2
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:b_white
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[47m
if (%temp%)==() set temp=a:
echo Background color: white >> %temp%\ansi.cfg
goto show

:b_liblue
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[46m
if (%temp%)==() set temp=a:
echo Background color: liteblue >> %temp%\ansi.cfg
goto show

:b_mag
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[45m
if (%temp%)==() set temp=a:
echo Background color: magenta >> %temp%\ansi.cfg
goto show

:b_black
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[40m
if (%temp%)==() set temp=a:
echo Background color: black >> %temp%\ansi.cfg
goto show

:b_blue
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[44m
if (%temp%)==() set temp=a:
echo Background color: blue >> %temp%\ansi.cfg
goto show

:b_yellow
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[43m
if (%temp%)==() set temp=a:
echo Background color: yellow >> %temp%\ansi.cfg
goto show

:b_green
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[42m
if (%temp%)==() set temp=a:
echo Background color: green >> %temp%\ansi.cfg
goto show

:b_red
if (%pr_ansi%)==() set pr_ansi=%prompt%
set prompt=%prompt%$e[41m
if (%temp%)==() set temp=a:
echo Background color: red >> %temp%\ansi.cfg
goto show

:search
if (%3)==() goto error
if (%3)==(?) goto hlpsrch
if not exist %windir%\msdosdrv.txt goto notfound
find "%3   " %windir%\msdosdrv.txt /i
echo.
goto end

:hlpsrch
echo.
echo Search for a key code in MS-DOS DRIVERS readme file if available.
echo.
goto end

:notfound
echo The readme file of MS-DOS DRIVERS was not found.
echo.
goto end

:keys
if (%2)==() goto error
if (%2)==(/s) goto search
if (%2)==(/c) goto command
if (%2)==(a) goto OK
if (%2)==(b) goto OK
if (%2)==(c) goto OK
if (%2)==(d) goto OK
if (%2)==(e) goto OK
if (%2)==(f) goto OK
if (%2)==(g) goto OK
if (%2)==(h) goto OK
if (%2)==(i) goto OK
if (%2)==(j) goto OK
if (%2)==(k) goto OK
if (%2)==(l) goto OK
if (%2)==(m) goto OK
if (%2)==(n) goto OK
if (%2)==(o) goto OK
if (%2)==(p) goto OK
if (%2)==(q) goto OK
if (%2)==(r) goto OK
if (%2)==(s) goto OK
if (%2)==(t) goto OK
if (%2)==(u) goto OK
if (%2)==(v) goto OK
if (%2)==(w) goto OK
if (%2)==(x) goto OK
if (%2)==(y) goto OK
if (%2)==(z) goto OK
if (%2)==(0) goto OK
if (%2)==(1) goto OK
if (%2)==(2) goto OK
if (%2)==(3) goto OK
if (%2)==(4) goto OK
if (%2)==(5) goto OK
if (%2)==(6) goto OK
if (%2)==(7) goto OK
if (%2)==(8) goto OK
if (%2)==(9) goto OK
if (%2)==(A) goto OK
if (%2)==(B) goto OK
if (%2)==(C) goto OK
if (%2)==(D) goto OK
if (%2)==(E) goto OK
if (%2)==(F) goto OK
if (%2)==(G) goto OK
if (%2)==(H) goto OK
if (%2)==(I) goto OK
if (%2)==(J) goto OK
if (%2)==(K) goto OK
if (%2)==(L) goto OK
if (%2)==(M) goto OK
if (%2)==(N) goto OK
if (%2)==(O) goto OK
if (%2)==(P) goto OK
if (%2)==(Q) goto OK
if (%2)==(R) goto OK
if (%2)==(S) goto OK
if (%2)==(T) goto OK
if (%2)==(U) goto OK
if (%2)==(V) goto OK
if (%2)==(W) goto OK
if (%2)==(X) goto OK
if (%2)==(Y) goto OK
if (%2)==(Z) goto OK
if (%2)==(^) goto OK
if (%2)==(!) goto OK
if (%2)==(@) goto OK
if (%2)==(#) goto OK
if (%2)==($) goto OK
if (%2)==(%%) goto OK
if "%2"=="(" goto OK
if (%2)==(*) goto OK
if (%2)==(&) goto OK
if (%2)==(`) goto OK
if "%2"==")" goto OK
if (%2)==(_) goto OK
if (%2)==(-) goto OK
if (%2)==(=) goto OK
if (%2)==(\) goto OK
if (%2)==(~) goto OK
if (%2)==(+) goto OK
if (%2)==(}) goto OK
if (%2)==([) goto OK
if (%2)==({) goto OK
if (%2)==(]) goto OK
if (%2)==(;) goto OK
if (%2)==(:) goto OK
if (%2)==(') goto OK
if (%2)==(") goto OK
if (%2)==(,) goto OK
if (%2)==(.) goto OK
if (%2)==(/) goto OK
if (%2)==(?) goto OK
rem TODO: following key swap is not working
if (%2)==(f1) goto f1
if (%2)==(f2) goto f2
if (%2)==(f3) goto f3
if (%2)==(f4) goto f4
if (%2)==(f5) goto f5
if (%2)==(f6) goto f6
if (%2)==(f7) goto f7
if (%2)==(f8) goto f8
if (%2)==(f9) goto f9
if (%2)==(f10) goto f10
if (%2)==(f11) goto f11
if (%2)==(f12) goto f12
if (%2)==(F1) goto F1
if (%2)==(F2) goto F2
if (%2)==(F3) goto F3
if (%2)==(F4) goto F4
if (%2)==(F5) goto F5
if (%2)==(F6) goto F6
if (%2)==(F7) goto F7
if (%2)==(F8) goto F8
if (%2)==(F9) goto F9
if (%2)==(F10) goto F10
if (%2)==(F11) goto F11
if (%2)==(F12) goto F12
if (%2)==(home) goto home
if (%2)==(HOME) goto home
if (%2)==(up) goto upkey
if (%2)==(UP) goto upkey
if (%2)==(down) goto downkey
if (%2)==(DOWN) goto downkey
if (%2)==(rx) goto rxkey
if (%2)==(RX) goto rxkey
if (%2)==(lx) goto lxkey
if (%2)==(LX) goto lxkey
if (%2)==(pgup) goto pgup
if (%2)==(PGUP) goto pgup
if (%2)==(pgdown) goto pgdown
if (%2)==(PGDOWN) goto pgdown
if (%2)==(end) goto endkey
if (%2)==(END) goto endkey
if (%2)==(ins) goto ins
if (%2)==(INS) goto ins
if (%2)==(del) goto del
if (%2)==(DEL) goto del
if (%2)==(bs) goto bs
if (%2)==(BS) goto bs
if (%2)==(enter) goto enter
if (%2)==(tab) goto OK
if (%2)==(TAB) goto OK
if (%2)==(7nk) goto OK
if (%2)==(7NK) goto OK
if (%2)==(8nk) goto OK
if (%2)==(8NK) goto OK
if (%2)==(2nk) goto OK
if (%2)==(2NK) goto OK
if (%2)==(6nk) goto OK
if (%2)==(6NK) goto OK
if (%2)==(4nk) goto OK
if (%2)==(4NK) goto OK
if (%2)==(9nk) goto OK
if (%2)==(9NK) goto OK
if (%2)==(3nk) goto OK
if (%2)==(3NK) goto OK
if (%2)==(0nk) goto OK
if (%2)==(0NK) goto OK
if (%2)==(.nk) goto OK
if (%2)==(.NK) goto OK
if (%2)==(enternk) goto OK
if (%2)==(enterNK) goto OK
if (%2)==(+nk) goto OK
if (%2)==(+NK) goto OK
if (%2)==(-nk) goto OK
if (%2)==(-NK) goto OK
if (%2)==(*nk) goto OK
if (%2)==(*NK) goto OK
if (%2)==(/nk) goto OK
if (%2)==(/NK) goto OK
if (%2)==(5nk) goto OK
if (%2)==(5NK) goto OK
if (%2)==(1nk) goto OK
if (%2)==(1NK) goto OK
goto error

:help_key
if not (%3)==() goto keys
echo Possible keys availables:
echo.
echo  a     b     c     d     e     f     g     h     i     j     k
echo.
echo  l     m     n     o     p     q     r     s     t     u     v
echo.
echo  w     x     z     A     B     C     D     E     F     G     H
echo.
echo  I     J     K     L     M     N     O     P     Q     R     S
echo.
echo  T     U     V     W     X     Z     ^     !     @     #     $
echo.
echo  %%     (     *     &     `     )     _     -     =     \     ~
echo.
echo  +     }     [     {     ]     ;     :     '     "     ,     .
echo.
echo  /     ?
echo.
goto end

:command
if (%3)==(?) goto help_cmd
set pr_ansi=%prompt%
shift
prompt $e[%3;"%4";13p
echo on

@echo off
set prompt=%pr_ansi%
goto end

:help_cmd
echo Execute a command when key is pressed, for example:
echo
echo  ansi -key /c 0;68 dir
echo.
echo Allows to run "dir" command when f10 key is pressed
echo.
echo WARNING! No restore command is available!
echo.
goto end

:f1
if (%l%)==(0;59) goto rip
if not (%l%)==() set l=%l%;0;59
if not (%l%)==() goto set
set l=0;59
shift
goto keys

:f2
if (%l%)==(0;60) goto rip
if not (%l%)==() set l=%l%;0;60
if not (%l%)==() goto set
set l=0;60
shift
goto keys

:f3
if (%l%)==(0;61) goto rip
if not (%l%)==() set l=%l%;0;61
if not (%l%)==() goto set
set l=0;61
shift
goto keys

:f4
if (%l%)==(0;62) goto rip
if not (%l%)==() set l=%l%;0;62
if not (%l%)==() goto set
set l=0;62
shift
goto keys

:f5
if (%l%)==(0;63) goto rip
if not (%l%)==() set l=%l%;0;63
if not (%l%)==() goto set
set l=0;63
shift
goto keys

:f6
if (%l%)==(0;64) goto rip
if not (%l%)==() set l=%l%;0;64
if not (%l%)==() goto set
set l=0;64
shift
goto keys

:f7
if (%l%)==(0;65) goto rip
if not (%l%)==() set l=%l%;0;65
if not (%l%)==() goto set
set l=0;65
shift
goto keys

:f8
if (%l%)==(0;66) goto rip
if not (%l%)==() set l=%l%;0;66
if not (%l%)==() goto set
set l=0;66
shift
goto keys

:f9
if (%l%)==(0;67) goto rip
if not (%l%)==() set l=%l%;0;67
if not (%l%)==() goto set
set l=0;67
shift
goto keys

:f10
if (%l%)==(0;68) goto rip
if not (%l%)==() set l=%l%;0;68
if not (%l%)==() goto set
set l=0;68
shift
goto keys

:f11
if (%l%)==(0;133) goto rip
if not (%l%)==() set l=%l%;0;133
if not (%l%)==() goto set
set l=0;133
shift
goto keys

:f12
if (%l%)==(0;134) goto rip
if not (%l%)==() set l=%l%;0;134
if not (%l%)==() goto set
set l=0;134
shift
goto keys

:F1
if (%l%)==(0;84) goto rip
if not (%l%)==() set l=%l%;0;84
if not (%l%)==() goto set
set l=0;84
shift
goto keys

:F2
if (%l%)==(0;85) goto rip
if not (%l%)==() set l=%l%;0;85
if not (%l%)==() goto set
set l=0;85
shift
goto keys

:F3
if (%l%)==(0;86) goto rip
if not (%l%)==() set l=%l%;0;86
if not (%l%)==() goto set
set l=0;86
shift
goto keys

:F4
if (%l%)==(0;87) goto rip
if not (%l%)==() set l=%l%;0;87
if not (%l%)==() goto set
set l=0;87
shift
goto keys

:F5
if (%l%)==(0;88) goto rip
if not (%l%)==() set l=%l%;0;88
if not (%l%)==() goto set
set l=0;88
shift
goto keys

:F6
if (%l%)==(0;89) goto rip
if not (%l%)==() set l=%l%;0;89
if not (%l%)==() goto set
set l=0;89
shift
goto keys

:F7
if (%l%)==(0;90) goto rip
if not (%l%)==() set l=%l%;0;90
if not (%l%)==() goto set
set l=0;90
shift
goto keys

:F8
if (%l%)==(0;91) goto rip
if not (%l%)==() set l=%l%;0;91
if not (%l%)==() goto set
set l=0;91
shift
goto keys

:F9
if (%l%)==(0;92) goto rip
if not (%l%)==() set l=%l%;0;92
if not (%l%)==() goto set
set l=0;92
shift
goto keys

:F10
if (%l%)==(0;93) goto rip
if not (%l%)==() set l=%l%;0;93
if not (%l%)==() goto set
set l=0;93
shift
goto keys

:F11
if (%l%)==(0;135) goto rip
if not (%l%)==() set l=%l%;0;135
if not (%l%)==() goto set
set l=0;135
shift
goto keys

:F12
if (%l%)==(0;136) goto rip
if not (%l%)==() set l=%l%;0;136
if not (%l%)==() goto set
set l=0;136
shift
goto keys


:home
if (%l%)==(224;71) goto rip
if not (%l%)==() set l=%l%;224;71
if not (%l%)==() goto set
set l=224;71
shift
goto keys

:upkey
echo WARNING! After this change the arrow key will no longer be usable.
choice /c:yn Do you want to continue 
if errorlevel 2 goto dunno
if errorlevel 1 goto aaaa
if errorlevel 0 goto aaaa

:aaaa
if (%l%)==(224;72) goto rip
if not (%l%)==() set l=%l%;224;72
if not (%l%)==() goto set
set l=224;72
shift
goto keys

:downkey
echo WARNING! After this change the arrow key will no longer be usable.
choice /c:yn Do you want to continue 
if errorlevel 2 goto dunno
if errorlevel 1 goto bbbb
if errorlevel 0 goto bbbb

:bbbb
if (%l%)==(224;80) goto rip
if not (%l%)==() set l=%l%;224;80
if not (%l%)==() goto set
set l=224;80
shift
goto keys

:rxkey
echo WARNING! After this change the arrow key will no longer be usable.
choice /c:yn Do you want to continue 
if errorlevel 2 goto dunno
if errorlevel 1 goto cccc
if errorlevel 0 goto cccc

:cccc
if (%l%)==(224;77) goto rip
if not (%l%)==() set l=%l%;224;77
if not (%l%)==() goto set
set l=224;77
shift
goto keys

:lxkey
echo WARNING! After this change the arrow key will no longer be usable.
choice /c:yn Do you want to continue 
if errorlevel 2 goto dunno
if errorlevel 1 goto dddd
if errorlevel 0 goto dddd

:dddd
if (%l%)==(224;75) goto rip
if not (%l%)==() set l=%l%;224;75
if not (%l%)==() goto set
set l=224;75
shift
goto keys

:pgsu
if (%l%)==(224;73) goto rip
if not (%l%)==() set l=%l%;224;73
if not (%l%)==() goto set
set l=224;73
shift
goto keys

:pggiu
if (%l%)==(224;81) goto rip
if not (%l%)==() set l=%l%;224;81
if not (%l%)==() goto set
set l=224;81
shift
goto keys

:fine
if (%l%)==(224;79) goto rip
if not (%l%)==() set l=%l%;224;79
if not (%l%)==() goto set
set l=224;79
shift
goto keys

:ins
if (%l%)==(224;82) goto rip
if not (%l%)==() set l=%l%;224;82
if not (%l%)==() goto set
set l=224;82
shift
goto keys

:del
if (%l%)==(224;83) goto rip
if not (%l%)==() set l=%l%;224;83
if not (%l%)==() goto set
set l=224;83
shift
goto keys

:bs
if (%l%)==(8) goto rip
if not (%l%)==() set l=%l%;8
if not (%l%)==() goto set
set l=8
shift
goto keys

:enter
if (%l%)==(13) goto rip
if not (%l%)==() set l=%l%;13
if not (%l%)==() goto set
set l=13
shift
goto keys

:F1
if (%l%)==(0;84) goto rip
if not (%l%)==() set l=%l%;0;84
if not (%l%)==() goto set
set l=0;84
shift
goto keys

:F2
if (%l%)==(0;85) goto rip
if not (%l%)==() set l=%l%;0;85
if not (%l%)==() goto set
set l=0;85
shift
goto keys

:F3
if (%l%)==(0;86) goto rip
if not (%l%)==() set l=%l%;0;86
if not (%l%)==() goto set
set l=0;86
shift
goto keys

:F4
if (%l%)==(0;87) goto rip
if not (%l%)==() set l=%l%;0;87
if not (%l%)==() goto set
set l=0;87
shift
goto keys

:F5
if (%l%)==(0;88) goto rip
if not (%l%)==() set l=%l%;0;88
if not (%l%)==() goto set
set l=0;88
shift
goto keys

:F6
if (%l%)==(0;89) goto rip
if not (%l%)==() set l=%l%;0;89
if not (%l%)==() goto set
set l=0;89
shift
goto keys

:F7
if (%l%)==(0;90) goto rip
if not (%l%)==() set l=%l%;0;90
if not (%l%)==() goto set
set l=0;90
shift
goto keys

:F8
if (%l%)==(0;91) goto rip
if not (%l%)==() set l=%l%;0;91
if not (%l%)==() goto set
set l=0;91
shift
goto keys

:F9
if (%l%)==(0;92) goto rip
if not (%l%)==() set l=%l%;0;92
if not (%l%)==() goto set
set l=0;92
shift
goto keys

:F10
if (%l%)==(0;93) goto rip
if not (%l%)==() set l=%l%;0;93
if not (%l%)==() goto set
set l=0;93
shift
goto keys

:F11
if (%l%)==(0;135) goto rip
if not (%l%)==() set l=%l%;0;135
if not (%l%)==() goto set
set l=0;135
shift
goto keys

:F12
if (%l%)==(0;136) goto rip
if not (%l%)==() set l=%l%;0;136
if not (%l%)==() goto set
set l=0;136
shift
goto keys

:rip
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt $e[%l%;%l%p
set l=
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:nothing
prompt Use "ansi r" to restore the keys$e[%l%;"%2"p$e["%2";%l%p
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if not exist %temp%\del-lit.bat goto make
goto av_1

:av_2
echo :%2 >> %temp%\del-lit.bat 
echo prompt Key %2 restored.$e["%2";"%2"p >> %temp%\del-lit.bat
echo echo on >> %temp%\del-lit.bat
echo.>> %temp%\del-lit.bat
echo @echo off >> %temp%\del-lit.bat 
echo if not (%%lit%%)==() set lit=%%lit%%,%2>> %temp%\del-lit.bat
echo if (%%lit%%)==() set lit=%2>> %temp%\del-lit.bat
echo if not (%%1)==(*) a:\ansi.bat bnkjghkhlhbhlkjhlojhoij >> %temp%\del-lit.bat
echo :%3 >> %temp%\del-lit.bat 
echo prompt Key %3 restored.$e["%3";"%3"p >> %temp%\del-lit.bat
echo echo on >> %temp%\del-lit.bat
echo.>> %temp%\del-lit.bat
echo @echo off >> %temp%\del-lit.bat 
echo if not (%%lit%%)==() set lit=%%lit%%,%3>> %temp%\del-lit.bat
echo if (%%lit%%)==() set lit=%3>> %temp%\del-lit.bat
echo if not (%%1)==(*) a:\ansi.bat bnkjghkhlhbhlkjhlojhoij >> %temp%\del-lit.bat
echo.
if (%temp%)==() set temp=a:
echo Key %2 changed to key %3 and vice versa >> %temp%\ansi.cfg
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:av_1
echo :%1 >> %temp%\del-lit.bat 
echo prompt Key %1 restored.$e[%l%;%l%p >> %temp%\del-lit.bat
echo echo on >> %temp%\del-lit.bat
echo.>> %temp%\del-lit.bat
echo @echo off >> %temp%\del-lit.bat
echo if not (%%lit%%)==() set lit=%%lit%%,%1>> %temp%\del-lit.bat
echo if (%%lit%%)==() set lit=%1>> %temp%\del-lit.bat
echo if not (%%1)==(*) a:\ansi.bat bnkjghkhlhbhlkjhlojhoij >> %temp%\del-lit.bat
set l=
echo :%2 >> %temp%\del-lit.bat 
echo prompt Key %2 restored.$e[%2;%2p >> %temp%\del-lit.bat
echo echo on >> %temp%\del-lit.bat
echo.>> %temp%\del-lit.bat
echo @echo off >> %temp%\del-lit.bat
echo if not (%%lit%%)==() set lit=%%lit%%,%2>> %temp%\del-lit.bat
echo if (%%lit%%)==() set lit=%2>> %temp%\del-lit.bat
echo if not (%%1)==(*) a:\ansi.bat bnkjghkhlhbhlkjhlojhoij >> %temp%\del-lit.bat
echo.
if (%temp%)==() set temp=a:
echo Key %1 changed to key %2 and vice versa >> %temp%\ansi.cfg
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:make
echo @echo off > %temp%\del-lit.bat
echo if (%%pr_ansi%%)==() a:\ansi.bat vhkigvloihvxbogu >> %temp%\del-lit.bat
echo if not (%%1)==(*) goto %%1 >> %temp%\del-lit.bat
if not (%l%)==() goto av_1
goto av_2

:OK_2
if (%pr_ansi%)==() set pr_ansi=%prompt%
if (%1)==(f12) goto nothing
prompt Use "ansi r" to restore the keys$e[%l%;"%2"p$e["%2";%l%p
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if not exist %temp%\del-lit.bat goto make
goto av_1

:OK_1
if (%pr_ansi%)==() set pr_ansi=%prompt%
prompt Use "ansi r" to restore the keys$e["%2";"%3"p$e["%3";"%2"p
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if not exist %temp%\del-lit.bat goto make
goto av_2

:eerr
echo Cannot return to the default settings because the variable
echo that contains them is missing.
echo Define the standard prompt, hope it can be fine.
echo.
prompt $p$g
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:OK
if not (%l%)==() goto OK_2
if (%3)==() goto error
if (%3)==(a) goto OK_1
if (%3)==(b) goto OK_1
if (%3)==(c) goto OK_1
if (%3)==(d) goto OK_1
if (%3)==(e) goto OK_1
if (%3)==(f) goto OK_1
if (%3)==(g) goto OK_1
if (%3)==(h) goto OK_1
if (%3)==(i) goto OK_1
if (%3)==(j) goto OK_1
if (%3)==(k) goto OK_1
if (%3)==(l) goto OK_1
if (%3)==(m) goto OK_1
if (%3)==(n) goto OK_1
if (%3)==(o) goto OK_1
if (%3)==(p) goto OK_1
if (%3)==(q) goto OK_1
if (%3)==(r) goto OK_1
if (%3)==(s) goto OK_1
if (%3)==(t) goto OK_1
if (%3)==(u) goto OK_1
if (%3)==(v) goto OK_1
if (%3)==(w) goto OK_1
if (%3)==(x) goto OK_1
if (%3)==(y) goto OK_1
if (%3)==(z) goto OK_1
if (%3)==(0) goto OK_1
if (%3)==(1) goto OK_1
if (%3)==(2) goto OK_1
if (%3)==(3) goto OK_1
if (%3)==(4) goto OK_1
if (%3)==(5) goto OK_1
if (%3)==(6) goto OK_1
if (%3)==(7) goto OK_1
if (%3)==(8) goto OK_1
if (%3)==(9) goto OK_1
if (%3)==(A) goto OK_1
if (%3)==(B) goto OK_1
if (%3)==(C) goto OK_1
if (%3)==(D) goto OK_1
if (%3)==(E) goto OK_1
if (%3)==(F) goto OK_1
if (%3)==(G) goto OK_1
if (%3)==(H) goto OK_1
if (%3)==(I) goto OK_1
if (%3)==(J) goto OK_1
if (%3)==(K) goto OK_1
if (%3)==(L) goto OK_1
if (%3)==(M) goto OK_1
if (%3)==(N) goto OK_1
if (%3)==(O) goto OK_1
if (%3)==(P) goto OK_1
if (%3)==(Q) goto OK_1
if (%3)==(R) goto OK_1
if (%3)==(S) goto OK_1
if (%3)==(T) goto OK_1
if (%3)==(U) goto OK_1
if (%3)==(V) goto OK_1
if (%3)==(W) goto OK_1
if (%3)==(X) goto OK_1
if (%3)==(Y) goto OK_1
if (%3)==(Z) goto OK_1
if (%3)==(^) goto OK_1
if (%3)==(!) goto OK_1
if (%3)==(@) goto OK_1
if (%3)==(#) goto OK_1
if (%3)==($) goto OK_1
if (%3)==(%) goto OK_1
if (%3)==(&) goto OK_1
if (%3)==(`) goto OK_1
if (%3)==(_) goto OK_1
if (%3)==(-) goto OK_1
if (%3)==(=) goto OK_1
if (%3)==(\) goto OK_1
if (%3)==(+) goto OK_1
if (%3)==(}) goto OK_1
if (%3)==([) goto OK_1
if (%3)==({) goto OK_1
if (%3)==(]) goto OK_1
if (%3)==(;) goto OK_1
if (%3)==(:) goto OK_1
if (%3)==(') goto OK_1
if (%3)==(") goto OK_1
if (%3)==(,) goto OK_1
if (%3)==(.) goto OK_1
if (%3)==(/) goto OK_1
if (%3)==(?) goto OK_1
goto error

:normal
if (%pr_ansi%)==() goto eerr
prompt %pr_ansi%
echo on

@echo off
if exist %temp%\cur.bat del %temp%\cur.bat
if (%temp%)==() set temp=a:
echo Cursor restored in the default coordinates >> %temp%\ansi.cfg
goto end

:error
echo Syntax error.
echo.
goto end

:no_show
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
if exist %temp%\cur.bat call %temp%\cur.bat
goto end

:new
echo on

@echo off
prompt %pr_ansi%
set pr_ansi=
cls
if exist %temp%\cur.bat call %temp%\cur.bat
set cmdline=
goto end

:end

