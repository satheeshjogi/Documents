declare
stmt clob;
begin
for i in (select * from dba_views where owner='ADPDC_VPD01' and rownum<2)
loop
stmt := 'CREATE OR REPLACE VIEW '||I.VIEW_NAME||' AS '||i.text||';';
dbms_output.put_line(Stmt);
--execute immediate Stmt;
end loop;
end;
/


https://confluence.es.ad.adp.com/pages/worddav/preview.action?fileName=clnt_copy.docx&pageId=5898876


select sys_context( 'userenv', 'os_user' ) from dual;

create table schema_audit_qa(
ddl_date varchar2(20),
ddl_user varchar2(20),
ddl_type varchar2(20),
ddl_name varchar2(20),
ddl_event varchar2(20)
);




create or replace trigger qa_audit
after ddl on schema 
begin 
insert into schema_audit_qa values(
sysdate,
sys_context( 'userenv', 'os_user'),
ora_dict_obj_type,
ora_dict_obj_name,
ora_sysevent
);
end;
/



/* Formatted on 10/2/2018 2:17:01 AM (QP5 v5.256.13226.35510) */
DECLARE
   stmt   CLOB;
BEGIN
   FOR i IN (SELECT *
               FROM dba_views
              WHERE owner = 'VPD_WFN9SCH053TLM' AND VIEW_NAME LIKE 'T_FACT%'
            )
   LOOP
   begin
      stmt := 'CREATE OR REPLACE VIEW ' || I.VIEW_NAME || ' AS ' || i.text;
      --DBMS_OUTPUT.put_line (Stmt);
      EXECUTE IMMEDIATE Stmt; 
      exception when others then 
         dbms_output.put_line(I.view_name||SQLCODE||SQLERRM);
          continue;
      end;
      
   END LOOP;
   EXCEPTION      when others then
    dbms_output.put_line(SQLCODE||SQLERRM);
   
END;
/


CREATE OR REPLACE PROCEDURE write_log AS
  2     l_line VARCHAR2(255);
  3     l_done NUMBER;
  4     l_file utl_file.file_type;
  5  BEGIN
  6     l_file := utl_file.fopen('TMP', 'foo.log', 'A');
  7     LOOP
  8        EXIT WHEN l_done = 1;
  9        dbms_output.get_line(l_line, l_done);
 10        utl_file.put_line(l_file, l_line);
 11     END LOOP;
 12     utl_file.fflush(l_file);
 13     utl_file.fclose(l_file);
 14  END write_log;
 15  /