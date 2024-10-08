@ECHO OFF
SETLOCAL

SET EXE="program.exe"
SET SRCDIR="."
SET INCDIR="include"
SET BINDIR="out"
SET EXT="c"
SET CC="gcc"
SET OBJS="%BINDIR%/*.o"

IF "%1"=="create" GOTO :CREATE 
IF "%1"=="clean" GOTO :CLEAN
IF "%1"=="help" GOTO :HELP
IF "%1"=="file" GOTO :FILE
GOTO :MAKE 



:HELP
ECHO make        -^> compile all files on src dir
ECHO make run    -^> compile ^& run
ECHO make file   -^> compile one file
ECHO make create -^> create bin, src ^& include dirs
ECHO make clean  -^> clean bin dir
ECHO make help   -^> ...
GOTO :EOF



:MAKE 
FORFILES /P %SRCDIR% /M *.%EXT% /S /C "CMD /C ECHO compilando arquivo @file && %CC% -I %INCDIR% -c @relpath -o %BINDIR%\\@FNAME.o"
ECHO linkando arquivos em %EXE%
%CC% %OBJS% -o %EXE%
ECHO pronto :3

IF "%1"=="run" (
    CLS
    %EXE%
)

GOTO :EOF



:FILE
REM compilando arquivo %2
REM %CC% -I %INCDIR% -c %2 -o %BINDIR%\%2
FORFILES /P %SRCDIR% /M %2 /S /C "CMD /C ECHO compilando arquivo @file && %CC% -I %INCDIR% -c @relpath -o %BINDIR%\\@FNAME.o"
ECHO linkando arquivos em %EXE%
%CC% %OBJS% -o %EXE%
ECHO pronto :3
GOTO :EOF


:CREATE
MKDIR %INCDIR% %BINDIR% %SRCDIR%
GOTO :EOF



:CLEAN
DEL /Q /S *.o *.exe %BINDIR%\*



:EOF
ENDLOCAL