Param (
#  platform: either 'amd64' or 'x86'
#            'X64' is accepted as well and converted to 'amd64'
   [parameter(Mandatory=$false)][string]$platform="amd64",
#  platform: either 'debug' or 'release'
   [parameter(Mandatory=$false)][string]$configuration="debug",
# configure switch implies running vcvarsall.bat through CmdScript to inherit environment variables (local build)
   [parameter()][switch]$configure
)

 switch($platform) {
   "X64"   { $platform = "amd64"; break;  } 
   "x86"   { break; } 
   "amd64" { break; } 
   default { "build-libjpeg.ps1: platform <" + $platform + "> was not recognized"; exit (-1);  } 
 }

 $env:CFLAGS    = '-nologo -c -W3 -Zi -Fd"libjpeg" -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE'
 $env:CONLFLAGS = '-nologo -incremental:no -opt:ref -debug'

 switch($configuration) {
   "release" { 
     $env:CFLAGS = $env:CFLAGS + ' -MD -O2'
     break; 
   } 
   "debug"   { 
     $env:CFLAGS = $env:CFLAGS + ' -MDd -Od'
     break; 
   } 
   default   { "build-libjpeg.ps1: configuration <" + $configuration + "> was not recognized"; exit (-1);  } 
 }


 if ($configure) {
  .\EZTools\use-environment.ps1 "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" $platform
 } 

 "CFLAGS:        " + $env:cflags
 "CONLFLAGS:     " + $env:conlflags

 $dname = Get-Location

 $bp1 =  @("-x -",
          "-f", "makefile.vs",  
          "setup-v16") 

 $bp2 =  @("-e", "-x -",
          "-f", "makefile.vs",  
          "cc=cl.exe",
          "libjpeg.lib") 

 Set-Location "libjpeg"
 & nmake $bp1
 & nmake $bp2
 Set-Location $dname
