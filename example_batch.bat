@ECHO OFF

:: macros
SET ALL=program.exe

SET SRCDIR="src"
SET INCDIR="include"
SET BINDIR="bin"
SET EXT="cpp"
SET CC="g++"

SET SRCS="%SRCDIR%*.%EXT%"
SET OBJS="%BINDIR%*.o"

IF %1=="make" GOTO MAKE 
IF %1=="create" GOTO CREATE 

ECHO "make <make|create> [run]"
GOTO EOF


:MAKE 
%CC% -I %INCDIR% %SRCS% -O %BINDIR%/file.o
:: ^ fazer pra todos os arquivos como nao sei for do batch e estranho
FORFILES /P %SRCS% /M *.%EXT% /C "%CC% -I %INCDIR% @FNAME -O %BINDIR%/@FNAME.O"

%CC% %OBJS% -O %ALL%

IF %2 == "RUN"
    %ALL%

GOTO EOF

:CREATE

MKDIR src include bin

:EOF
