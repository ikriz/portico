@echo off

rem ##########################################################################
rem Please consult the README file to learn more about this example federate #
rem ##########################################################################

rem ################################
rem # check command line arguments #
rem ################################
:checkargs
if "%1" == "" goto usage

rem ###################
rem # Set up RTI_HOME #
rem ###################
:rtihome
cd ..\..\..
set RTI_HOME=%CD%
cd examples\cpp\ieee1516e
echo RTI_HOME environment variable is set to %RTI_HOME%
goto run

:run
if "%1" == "clean" goto clean
if "%1" == "compile" goto compile
if "%1" == "execute" goto execute

rem ############################################
rem ### (target) clean #########################
rem ############################################
:clean
echo Deleting example federate executable and left over logs
del *.obj
del main.exe
rd /S /Q logs
goto finish

############################################
### (target) compile #######################
############################################
:compile
echo Compiling example federate
<<<<<<<< HEAD:codebase/src/cpp/ieee1516e/example/win32-vc14.bat
cl /I"%RTI_HOME%\include\ieee1516e" /DRTI_USES_STD_FSTREAM /EHsc main.cpp ExampleCPPFederate.cpp ExampleFedAmb.cpp "%RTI_HOME%\lib\vc14\librti1516e.lib" "%RTI_HOME%\lib\vc14\libfedtime1516e.lib"
========

rem Comment out these lines if you are running from the Visual Studio command prompt
rem We assume you are running from a vanilla prompt and you have the VS 2022 Build Tools installed (seem to install into the x86 directory)
rem The commented out options are for if you have Visual Studio Professional or Community installed
rem call "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\VsDevCmd" %-arch=amd64
rem call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd" %-arch=amd64
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd" %-arch=amd64

cl /I"%RTI_HOME%\include\hla13" /DRTI_USES_STD_FSTREAM /EHsc main.cpp ExampleCPPFederate.cpp ExampleFedAmb.cpp "%RTI_HOME%\lib\vc14_3\libRTI-NG_64.lib" "%RTI_HOME%\lib\vc14_3\libFedTime_64.lib"
>>>>>>>> bd7b11e (Add VS22 support to C++ interface and fix associated C++ build issues):codebase/src/cpp/hla13/example/win64-vc14_3.bat
goto finish

############################################
### (target) execute #######################
############################################
:execute
SHIFT
<<<<<<<< HEAD:codebase/src/cpp/ieee1516e/example/win32-vc14.bat
set PATH=%RTI_HOME%\jre\bin\client;%RTI_HOME%\jre\lib\i386\client;%RTI_HOME%\bin\vc14;%PATH%
========
set PATH=%RTI_HOME%\jre\bin\server;%RTI_HOME%\bin\vc14_3;%PATH%
>>>>>>>> bd7b11e (Add VS22 support to C++ interface and fix associated C++ build issues):codebase/src/cpp/hla13/example/win64-vc14_3.bat
main %1 %2 %3 %4 %5 %6 %7 %8 %9
goto finish


:usage
echo usage: win32-vc14.bat [compile] [clean] [execute [federate-name]]

:finish
