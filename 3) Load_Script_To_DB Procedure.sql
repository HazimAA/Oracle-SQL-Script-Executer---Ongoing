-- PROCEDURE FOR LOADING AN SQL FILE FROM DIRECTORY ONTO YOUR REPOSITORY TABLE
-- COMPILE THE PROCEDURE GIVEN BELOW, THEN
-- UPDATE THE SQL FILE NAME WHILE EXECUTING THE PROCEDURE, Example: EXEC load_script_to_db('test.sql');

CREATE OR REPLACE PROCEDURE load_script_to_db(
    p_filename IN VARCHAR2)
AS
  l_clob CLOB;
  l_bfile bfile;
  l_dest_offset  integer := 1;
  l_src_offset   integer := 1;
  l_lang_context number := dbms_lob.default_lang_ctx;
  l_warning      number;
BEGIN
  INSERT
  INTO SCRIPT_REPOSITORY
    (
      script_name,
      script_content,
      release_version,
      script_applied,
      run_date,
      ran_by
    )
    VALUES
    (
      p_filename,
      empty_clob(),
      '1',
      'N',
      sysdate,
      'ADMIN'
    )
  RETURNING script_content
  INTO l_clob;
  l_bfile := bfilename( 'SCRIPT_FILES', p_filename );
  dbms_lob.fileopen( l_bfile );
  dbms_lob.LOADCLOBFROMFILE( l_clob, l_bfile, dbms_lob.getlength(l_bfile), l_dest_offset, l_src_offset, dbms_lob.default_csid, l_lang_context, l_warning);
  dbms_lob.fileclose( l_bfile );
  
  --UNCOMMENT THE CODE BELOW IF YOU WANT TO EXECUTE THE SCRIPT IN THE PROCEDURE ITSELF
  --EXECUTE IMMEDIATE l_clob;
END;
