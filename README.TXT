   ________________________________________________________________________
  !                                                                        !
  !                     ANSI - ANSI.SYS driver handler                     !
  !________________________________________________________________________!


     The ANSI program is written in the MS-DOS language and is used
 to handle the wonders that can be obtained with the ANSI.SYS driver
 typically contained in each DOS PC.

     The following system requirements are required:
 - MS-DOS ver. 3.2 or later;
 - EGA, VGA/SVGA or later graphics monitors;
 - processor 286, 386, 486, Pentium or later

     The program does not need to be installed but it has to make two
 changes to the CONFIG.SYS system file because it needs to load the
 ANSI.SYS driver needed for the program to run and to add space for
 the system variables.

     Just run "instansi" to make these modifications to CONFIG.SYS and
 eventually install the program.

     Written by Stefano Cotta Ramusino.

 _____________________________________________________________________________

 > ansi /?

 ANSI.SYS driver handler

  ansi                         show command history
  ansi /?                      get this help page
  ansi n                       reset all customizations

 Change screen attributes with '-scr' or shorter '-s'

  ansi -scr ?                  get scr help page
  ansi -scr b                  set text in bold mode
  ansi -scr f                  set screen in flashing mode
  ansi -scr inv                set white background and black foreground
  ansi -scr hide               set black both background and foreground
  ansi -scr no                 remove screen attributes
  ansi -scr /b ?               get scr b help page
  ansi -scr /f ?               get scr f help page
  ansi -scr /b bgcol /f fgcol  set background and foreground colors
  ansi -scr /m ?               get scr m help page
  ansi -scr /m mode            set desired screen mode
  ansi -scr /z ?               set scr z help page
  ansi -scr /z zoom            set desired screen zoom
  ansi cls                     clean screen

 Move prompt cursor with '-cur' or shorter '-c'

  ansi -cur ?                  get cur help page
  ansi -cur up lines           move the cursor up by the number of lines
  ansi -cur down lines         move the cursor down by the number of lines
  ansi -cur lx cols            move the cursor left by the number of columns
  ansi -cur rx cols            move the cursor right by the number of columns
  ansi -cur lines cols         move the cursor at the specified coordinates
  ansi nc                      reset cursor changes
  ansi del                     restore cursor to prompt line
  ansi save                    save current cursor position
  ansi ret                     return to saved cursor position

 Swap keys with '-key' or shorter '-k'

  ansi -key ?                  get key help page
  ansi -key key1 key2          swap key1 with key2
  ansi r                       reset key codes manipulations

 _____________________________________________________________________________

 > ansi -scr ?
 
 The parameters to change DOS screen attributes are:

  b     bold
  f     flashing
  inv   inverted screen (white background and black foreground)
  hide  hidden screen (black background and black foreground)
  no    no attributes

  '/b' color    to change the background color
  '/f' color    to change the foreground color

  '/m' mode     to change the graphics mode

  '/z' zoom     to change the zoom

 The first five attributes can be put together with '/b' and '/f',
 whereas '/m' and '/z' are availables only alone.

 _____________________________________________________________________________

 > ansi -scr /b ?

 The 8 colors you can use for the foreground and/or the background are:

  black          green          yellow            magenta

  red            blue           liteblue          white

 _____________________________________________________________________________

 > ansi -scr /m ?

 The parameters to enter to change the graphics mode are:

  tmono       40 x 148 x 25   monochrome   (only text)
  tcol        40 x 148 x 25   with colors  (only text)
  nmono       80 x 148 x 25   monochrome   (only text)  - standard
  ncol        80 x 148 x 25   with colors  (only text)  - standard
  g1mono     320 x 148 x 200  monochrome   (graphics)
  g1col      320 x 148 x 200  with colors  (graphics)
  g1c4       320 x 148 x 200  with colors  (4 color graphics)
  g1c256     320 x 148 x 200  with colors  (256 color graphics)
  g2mono     640 x 148 x 200  monochrome   (graphics)
  g2col      640 x 148 x 200  with colors  (16 color graphics)
  g3mono     640 x 148 x 480  monochrome   (graphics)
  g3col      640 x 148 x 480  with colors  (16 color graphics)
  emono      640 x 148 x 350  monochrome   (graphics)           - EGA
  ecol       640 x 148 x 350  with colors  (16 color graphics)  - EGA

 Standard mode is the most used one and is set as default with
 the command "ansi n", while EGA graphics are not supported by
 VGA and higher video cards.

 _____________________________________________________________________________

 > ansi -scr /z ?

 The parameters to change the screen zoom are:

  ++      maximum zoom   25 x 40
  +-      medium  zoom   43 x 40
  n       normal  zoom   25 x 80  - standard
  --      minimum zoom   50 x 80

  l+      maximum lines  25 lines  - standard
  l-      medium  lines  43 lines
  l--     minimum lines  50 lines

  c+      maximum cols   40 cols
  c-      minimum cols   80 cols  - standard
  
 _____________________________________________________________________________

 > ansi -cur ?

 The parameters to insert to move the cursor are
 (between quotes the invariable words):

  'up'   lines    move the cursor up by the number of lines
  'down' lines    move the cursor down by the number of lines
  'rx'   cols     move the cursor right by the number of columns
  'lx'   cols     move the cursor left by the number of columns
  lines  cols     move the cursor at the specified coordinates

 To save the position of the cursor use "ansi save" and then
 to return to that: "ansi ret".

 _____________________________________________________________________________

 > ansi -key ?

 Possible keys availables:

  a     b     c     d     e     f     g     h     i     j     k

  l     m     n     o     p     q     r     s     t     u     v

  w     x     z     A     B     C     D     E     F     G     H

  I     J     K     L     M     N     O     P     Q     R     S

  T     U     V     W     X     Z     ^     !     @     #     $

  %     (     *     &     `     )     _     -     =     \     ~

  +     }     [     {     ]     ;     :     '     "     ,     .

  /     ?
