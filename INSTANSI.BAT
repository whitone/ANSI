@echo off
cls   
echo    ___________________________________________________________________
echo   !                                                                   !
echo   !                      INSTALLATION OF "ANSI"                       !
echo   !___________________________________________________________________!
echo.
echo      The ANSI program is written in the MS-DOS language and is used
echo  to handle the wonders that can be obtained with the ANSI.SYS driver
echo  typically contained in each DOS PC.
echo.
echo      The following system requirements are required:
echo  - MS-DOS ver. 3.2 or later;
echo  - EGA, VGA/SVGA or later graphics monitors;
echo  - processor 286, 386, 486, Pentium or later
echo.
echo      The program does not need to be installed but it has to make two
echo  changes to the CONFIG.SYS system file because it needs to load the
echo  ANSI.SYS driver needed for the program to run and to add space for
echo  the system variables.
echo.
choice /C:yn You want to make the changes to the CONFIG.SYS system file 
if errorlevel 2 goto errp
if errorlevel 1 goto edit
if errorlevel 0 goto edit
goto end

:edit
echo.
if exist c:\config.ans goto restore
if (%temp%)==() set temp=a:
find "device=%windir%\command\ansi.sys /X" c:\config.sys /i >nul
if errorlevel 1 goto useless
find "device=c:\dos\ansi.sys /X" c:\config.sys /i >nul
if errorlevel 1 goto useless
echo Making a copy of CONFIG.SYS...
if exist c:\config.sys goto backup
goto append

:backup
copy c:\config.sys c:\config.ans
goto append

:append
echo Adding ANSI.SYS driver load to the CONFIG.SYS
echo. >> c:\config.sys
if exist %windir%\command\ansi.sys goto windows
echo device=c:\dos\ansi.sys /X >> c:\config.sys
goto done

:windows
echo device=%windir%\command\ansi.sys /X >> c:\config.sys
goto done

:done
echo CONFIG.SYS modified.
echo.
choice /c:yn Do you want to see the modified CONFIG.SYS file 
if errorlevel 2 goto next
if errorlevel 1 goto view
if errorlevel 0 goto next
goto next

:view
more < c:\config.sys
echo.
goto next

:useless
echo Addition to CONFIG.SYS already done.
set instansi=useless
echo.
goto next

:restore
choice /c:yn Do you want to restore old CONFIG.SYS file 
if errorlevel 2 goto next
if errorlevel 1 goto res
if errorlevel 0 goto next
goto next

:res
copy c:\config.ans c:\config.sys
del c:\config.ans
goto next

:next
if exist c:\ansi.bat goto complete
echo Knowing that the ANSI program works well launched from floppy disk
choice /C:yn do you want to install the ANSI program on your hard drive 
if errorlevel 2 goto reboot
if errorlevel 1 goto install
if errorlevel 0 goto install
goto end

:install
copy ansi.bat c:\ansi.bat
goto complete

:complete
echo.
echo Installation completed!
goto reboot

:reboot
if (%instansi%)==(useless) goto goon
echo.
echo You must restart the system if you want the changes made to the
echo CONFIG.SYS file to be executed.
echo.
goto end

:errp
echo.
echo Installation aborted!
echo.
goto end

:goon
set instansi=
echo.
goto end

:end
