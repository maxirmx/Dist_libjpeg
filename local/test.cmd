@echo off
rem --------------------------------------------------------------------
rem Test script to validate some steps of the build procedures locally
rem Usage test.cmd <platform> <configuration>
rem        configuration: either 'debug' or 'release'
rem --------------------------------------------------------------------

cd ..

SET libjpeg_version="9d"
SET libjpeg_files="http://ijg.org/files"

@echo on


IF NOT EXIST libjpeg.zip ( 
powershell -ExecutionPolicy Bypass Invoke-WebRequest -Uri %Libjpeg_files%/jpegsr%libjpeg_version%.zip -ErrorAction Stop -OutFile libjpeg.zip
"C:\Program Files\7-Zip\7z" -tzip -aoa x libjpeg.zip
)

cmd /c build.cmd %1 %libjpeg_version%

cd cd %~dp0


