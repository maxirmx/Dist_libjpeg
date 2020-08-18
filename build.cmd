@echo off
rem --------------------------------------------------------------------
rem A script to generate NMake command line and execute it 
rem Usage build.cmd <configuration> <libjpeg-version> 
rem        configuration: either 'debug' or 'release'
rem        libjpeg version: something like "9d"
rem --------------------------------------------------------------------




rem CFLAGS= $(cflags) $(cdebug) $(cvars) -I.
rem LDFLAGS= $(ldebug) $(conlflags)
rem cflags = -nologo -c -MD -W3 -O2 -Oy- -Fd"libjpeg" -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE
rem conlflags = -nologo -incremental:no -opt:ref
rem 
rem !IFDEF CFG
rem !IF "$(CFG)" =="release"
rem cdebug = 
rem ldebug = 
rem !ELSE
rem cdebug = -Zi 
rem ldebug = -debug 
rem!ENDIF
rem !ENDIF


SET cflags=-nologo -D_CRT_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_WARNINGS -W3 -Zi -Fd"libjpeg"
SET conlflags=-nologo -incremental:no -opt:ref -debug


IF "%1"=="release" (
rem  echo Building release 
  SET cdebug=-MD -O2
) ELSE (
IF "%1"=="debug" (
rem  echo Building debug
  SET cdebug=-MDd -Od
) ELSE (
  echo Configuration "%1" was not recognized
  exit -1 
)
)

echo cflags:     ^<%cflags%^>
echo cdebug:     ^<%cdebug%^>
echo cvars:      ^<%cvars%^>
echo ldebug:     ^<%ldebug%^>
echo conlflags:  ^<%conlflags%^>

rem --------------------------------------------------------------------
rem nmake -e Causes environment variables to override makefile macro definitions.
rem          (CFLAGS) 
rem --------------------------------------------------------------------

@echo on
cd jpeg-%2
nmake -e -f scripts\makefile.vcwin32 libpng.lib
cd ..

