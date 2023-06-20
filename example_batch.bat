@ECHO OFF

:: macros
SET ALL=program.exe

SET SRCDIR="src/"
SET INCDIR="include/"
SET BINDIR="bin/"
SET EXT="cpp"
SET CC="g++"

SET SRCS="%SRCDIR%*.%EXT%"
SET OBJS="%BINDIR%*.o"

IF %1=="make" GOTO MAKE 
IF %1=="create" GOTO CREATE 

ECHO "make <make|create> [run]"
GOTO EOF

:MAKE 


:CREATE



:EOF
