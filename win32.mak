cc     = cl.exe
link   = link.exe
!IF CFG==release
 cflags = -nologo -c -MD -W3 -O2 -Oy- -Fd"libjpeg" -D_CRT_SECURE_NO_DEPRECATE 
!ELSE
 cflags = -nologo -c -MDd -W3 -O2 -Oy- -Zi -Fd"libjpeg" -D_CRT_SECURE_NO_DEPRECATE 
!ENDIF
