@echo off

REM : SET PATH 
set TOOLS_ROOT=%~dp0\tools
set PROJECTS_ROOT=%~dp0\projects
set GIT_ROOT=%TOOLS_ROOT%\PortableGit
set PYTHON_ROOT=%TOOLS_ROOT%\PortablePython
set POSTGRESQL_ROOT=%TOOLS_ROOT%\postgresq
set VIRTUALENVS_ROOT=%TOOLS_ROOT%\virtualenvs

REM : SET PATH FOR ALL THE VIRTUAL ENVS
REM : One line per virtualenv => just replace <VIRTUALENV_NAME> by the name of the virtual env
REM echo %PYTHON_ROOT%\App > %VIRTUALENVS_ROOT%\<VIRTUALENV_NAME>\Lib\orig-prefix.txt
echo %PYTHON_ROOT%\App > %VIRTUALENVS_ROOT%\django-1.4\Lib\orig-prefix.txt


REM
REM : DO NOT MODIFY BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
REM
PATH=%PYTHON_ROOT%\App;%PYTHON_ROOT%\App\Scripts;%PATH%
PATH=%POSTGRESQL_ROOT%\bin;%PATH%

doskey shell=python manage.py shell
doskey dbshell=python manage.py dbshell
doskey shell_plus=python manage.py shell_plus
doskey syncdb=python manage.py syncdb
doskey runserver=python manage.py runserver
set runserver=python manage.py runserver
doskey cleanpyc=del *.pyc /q/a/s

IF "%1"=="" GOTO NOPROJECT
set PROJECT_NAME=%1
set PROJECT_ROOT=%PROJECTS_ROOT%\%PROJECT_NAME%

cd %PROJECT_ROOT%
title "%PROJECT_NAME%"


:NOPROJECT
@call %GIT_ROOT%\git-bash.bat

@echo on