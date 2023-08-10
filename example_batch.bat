@ECHO OFF
SETLOCAL

REM nao funciona pra arquivo src eeem pastas internas 

SET EXE=program.exe
SET SRCDIR="."
SET INCDIR="include"
SET BINDIR="bin"
SET EXT="c"
SET CC="gcc"
SET OBJS="%BINDIR%/*.o"

IF "%1"=="make" GOTO :MAKE 
IF "%1"=="create" GOTO :CREATE 
IF "%1"=="clear" GOTO :CLEAR

ECHO "make [make {run}] [createte] [clear]"
GOTO :EOF



:MAKE 
REM /p = path to search
REM /m = search mask (* wildcard)
REM /s = recurse into subfolders
REM /c = command to each file found 
FORFILES /P %SRCDIR% /M *.%EXT% /S /C "CMD /C ECHO compilando arquivo @file && %CC% -I %INCDIR% -c @relpath -o %BINDIR%\\@FNAME.o"
ECHO linkando arquivos em %EXE%
%CC% %OBJS% -o %EXE%
ECHO pronto :3

IF "%2"=="run" (
    CLS
    %EXE%
)

GOTO :EOF

:CREATE
MKDIR %INCDIR% %BINDIR%

:CLEAR
DEL /Q /S *.o *.exe %BINDIR%\*

:EOF
ENDLOCAL
