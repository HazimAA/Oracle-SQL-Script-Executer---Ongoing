CREATE TABLE SCRIPT_REPOSITORY
  (
    SCRIPT_NAME VARCHAR2(500) NOT NULL,
    SCRIPT_CONTENT CLOB NOT NULL,
    SCRIPT_OUTPUT CLOB,
    RELEASE_VERSION VARCHAR2(8) NOT NULL,
    SCRIPT_APPLIED  VARCHAR2(1) NOT NULL,
    RUN_DATE        DATE NOT NULL,
    RAN_BY          VARCHAR2(70) NOT NULL
  )
  LOGGING NOCOMPRESS NOCACHE NOPARALLEL NOMONITORING;