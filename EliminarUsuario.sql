SELECT session_id
FROM sys.dm_exec_sessions
WHERE login_name = 'Usuario4'

kill 52

ALTER AUTHORIZATION ON SCHEMA::db_datareader TO dbo;
ALTER AUTHORIZATION ON SCHEMA::db_denydatawriter TO dbo;

SELECT s.name
FROM sys.schemas s
WHERE s.principal_id = USER_ID('Usuario4');