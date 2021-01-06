param (
  [string] $version="9d"
)

$fname  = "jpegsr" + $version + ".zip"
$fname1 = "jpeg-" + $version
$fname2 = "libjpeg.zip"
$uri    =  "http://ijg.org/files/$fname" 

Invoke-WebRequest -Uri $uri -OutFile $fname2 


& "C:\Program Files\7-Zip\7z" -aoa x $fname2 

Remove-Item $fname2

Rename-Item -Path $fname1 -NewName libjpeg

