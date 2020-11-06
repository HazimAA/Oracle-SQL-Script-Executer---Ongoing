-- IF YOU AREN'T EXECUTING SCRIPT IN THE PROCEDURE / OR WANT TO RE EXECUTE THE SCRIPTS STORED IN REPOSITORY TABLE THEN USE THE --CODE BELOW FOR EXECUTING SCRIPT STORED IN THE REPOSITORY TABLE
-- For file_name, select the sql file name from the script repository table, that you would like to execute.
DECLARE
  l_sql CLOB;
  file_name varchar(20) := '&filename';
BEGIN
  SELECT SCRIPT_CONTENT INTO l_sql FROM SCRIPT_REPOSITORY WHERE SCRIPT_NAME = file_name;
  DBMS_OUTPUT.PUT_LINE(l_sql);
  EXECUTE IMMEDIATE l_sql;
END;
/
