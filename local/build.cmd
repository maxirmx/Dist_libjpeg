@echo off
rem --------------------------------------------------------------------
rem A script to build libjpeg locally
rem Usage build.cmd <platform> <configuration>
rem        platform: either 'X64' or 'x86'
rem                  'amd64' is accepted as well and converted to 'X64'
rem                   (load-library) default is 'X64'
rem        configuration: either 'debug' or 'release'
rem                   (load-library) default is 'debug'
rem --------------------------------------------------------------------
@echo on

cd ..

IF NOT EXIST podofo    (powershell -ExecutionPolicy Bypass %~dp0..\load-libjpeg.ps1) 
powershell -ExecutionPolicy Bypass .\build-libjpeg.ps1 %1 %2 -configure

cd %~dp0


