-- Compile First. Execute the following procedure, by giving the sql file name from repository as the Input parameter. 
-- Example: EXEC execute_test_script('test.sql'); (Where 'test.sql' is the sql file uploaded onto SCRIPT_REPOSITORY Table)

create or replace PROCEDURE execute_test_script(t_filename IN VARCHAR2)
AS
  l_sql CLOB;
BEGIN
  SELECT SCRIPT_CONTENT INTO l_sql 
  FROM SCRIPT_REPOSITORY 
  WHERE SCRIPT_NAME = t_filename;
  
  DBMS_OUTPUT.PUT_LINE('Statement Executed is as follows: ' || CHR(13) || l_sql);
  
  EXECUTE IMMEDIATE l_sql;
  
  UPDATE SCRIPT_REPOSITORY 
  SET 
  SCRIPT_APPLIED = 'Y',
  RUN_DATE = sysdate
  WHERE SCRIPT_NAME = t_filename ;
  
END;
