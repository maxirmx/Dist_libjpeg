@echo off
rem --------------------------------------------------------------------
rem A script to generate NMake command line and execute it 
rem Usage build.cmd <configuration> <libjpeg-version> 
rem        configuration: either 'debug' or 'release'
rem        libjpeg version: something like "9d"
rem --------------------------------------------------------------------

SET conlflags=-nologo -incremental:no -opt:ref -debug
SET cflags=-nologo -c -W3 -Zi -Fd"libjpeg" -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE

IF "%1"=="release" (
rem  echo Building release 
SET cflags=-MD -O2 %cflags%
) ELSE (
IF "%1"=="debug" (
rem  echo Building debug
SET cflags=-MDd -Od %cflags%
) ELSE (
  echo Configuration "%1" was not recognized
  exit -1 
)
)

rem --------------------------------------------------------------------
rem nmake -e Causes environment variables to override makefile macro definitions.
rem          (CFLAGS) 
rem --------------------------------------------------------------------

@echo on
cd jpeg-%2
nmake -f makefile.vs setup-v16 
nmake -e -f makefile.vs cc=cl.exe libjpeg.lib
cd ..

