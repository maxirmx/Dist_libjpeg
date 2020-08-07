# Microsoft toolchain options

cc     = cl.exe
link   = link.exe
cflags = -nologo -c -MD -W3 -O2 -Oy- -Fd"libjpeg" -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE
conlflags = -nologo -incremental:no -opt:ref

!IFDEF CFG
!IF "$(CFG)" =="release"
cdebug = 
ldebug = 
!ELSE
cdebug = -Zi 
ldebug = -debug 
!ENDIF
!ENDIF
