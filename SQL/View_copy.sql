set serveroutput on

DECLARE
     stmt   CLOB;
	 BEGIN
     FOR i IN (  SELECT * FROM &1 WHERE owner = '&2' AND VIEW_NAME LIKE 'T_FACT%'
              )
    LOOP
     begin
        stmt := 'CREATE OR REPLACE VIEW ' || I.VIEW_NAME || ' AS ' || i.text;
        --DBMS_OUTPUT.put_line (Stmt);
        EXECUTE IMMEDIATE Stmt;
		DBMS_OUTPUT.put_line ('View created for' || I.view_name);
		exception when others then
           dbms_output.put_line(I.view_name||SQLCODE||SQLERRM);
            continue;
        end;
    END LOOP;
       EXCEPTION      when others then
       dbms_output.put_line(SQLCODE||SQLERRM);
  
END;
  /
  
  define myvar1 = '&1'
define myvar2 = '&2'
set verify off
select 'both variables are not null : [&myvar1,&myvar2]' test
from dual
where '&myvar1.' is not null and '&myvar2' is not null;

 
  
  
  
--@C:\Users\kanchasa\Desktop\View_copy.sql DBA_VIEWS@QA_CRH_TO_WFR VPD_WFN9SCH053TLM

/*CREATE PUBLIC DATABASE LINK QA_CRH_TO_WFR
 CONNECT TO GGATE
 IDENTIFIED BY GGATE
 USING '(DESCRIPTION = (ADDRESS_LIST = (LOAD_BALANCE = yes) (FAILOVER = ON) (ADDRESS = (PROTOCOL = TCP)(HOST = cdldftff2-scan.es.ad.adp.com)(PORT = 1521))) (CONNECT_DATA = (service_name = wfr11q_svc1)))';*/
 
  CREATE PUBLIC DATABASE LINK QA_WFR_TO_CRH
 CONNECT TO GGATE
 IDENTIFIED BY GGATE
 USING '(DESCRIPTION = (ADDRESS_LIST = (LOAD_BALANCE = yes) (FAILOVER = ON) (ADDRESS = (PROTOCOL = TCP)(HOST = cdldftff2-scan.es.ad.adp.com)(PORT = 1521))) (CONNECT_DATA = (service_name = wfr11q_svc1)))';
 
 DROP DATABASE LINK QA_CRH_TO_WFR;