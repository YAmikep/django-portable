set TOOLS_ROOT=%~dp0\tools
set POSTGRESQL_ROOT=%TOOLS_ROOT%\PostgreSQL\pgsql

PATH=%POSTGRESQL_ROOT%\bin;%PATH%

@ECHO ON
REM The script sets environment variables helpful for PostgreSQL
@SET PATH="%POSTGRESQL_ROOT%\bin";%PATH%
@SET PGDATA=%POSTGRESQL_ROOT%\data
@SET PGDATABASE=postgres
@SET PGUSER=postgres
@SET PGPORT=5439
@SET PGLOCALEDIR=%POSTGRESQL_ROOT%\share\locale
REM Next line MUST be uncomment the first time to init the server, it can then be commented.
"%POSTGRESQL_ROOT%\bin\initdb" -U postgres -A trust
"%POSTGRESQL_ROOT%\bin\pg_ctl" -D "%POSTGRESQL_ROOT%/data" -l %POSTGRESQL_ROOT%/logfile start
ECHO "Click enter to stop"
pause
"%POSTGRESQL_ROOT%\bin\pg_ctl" -D "%POSTGRESQL_ROOT%/data" stop
