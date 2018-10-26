@echo off

set NEW_LINE=&& echo.

:: check JDK 
if "%JAVA_HOME%" == "" (
	echo ERROR: JAVA_HOME is not found! %NEW_LINE%
) else (
	goto :CHECK_JAVA_COMPILER
)

:ENTER_JDK_PATH
set /p JAVA_HOME=Please enter the path of JDK:
if "%JAVA_HOME%" == "" goto :ENTER_JDK_PATH

:CHECK_JAVA_COMPILER
set JAVAC=%JAVA_HOME%\bin\javac.exe
set JAVA=%JAVA_HOME%\bin\java.exe
if not exist "%JAVAC%" (
	echo ERROR: java compiler is not found! We need JDK not JRE %NEW_LINE%
	goto :ENTER_JDK_PATH
)

:: create source file
set CLASS_NAME=HelloWorld
set FILE_NAME=%CLASS_NAME%.java

echo // Meta Programming Demo > %FILE_NAME%
echo public class HelloWorld { >> %FILE_NAME%
echo public static void main(String[] args) { >> %FILE_NAME%
echo System.out.println("Hello World!"); >> %FILE_NAME%
echo } >> %FILE_NAME%
echo } >> %FILE_NAME%

:: compile source file
"%JAVAC%" %FILE_NAME%

:: execute java program
"%JAVA%" %CLASS_NAME%

