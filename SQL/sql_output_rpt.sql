SET DEFINE ON;
SET ECHO OFF;
SET FEEDBACK off;
SET PAGESIZE 4000;
SET LINESIZE 4000;
SET VERIFY OFF;
set serveroutput on;

SET MARKUP HTML ON HEAD "<style type='text/css'> -
body { -
font:10pt Arial,Helvetica,sans-serif; -
} -
p { -
font:8pt Arial,sans-serif; -
color:grey; background:white; } -
table { -
  background-color: #F2F2F5;- 
  border-color: #C9CBD3;-
  border-style: solid; width: auto; align:left-
  }-
td {-
  color: #000000;-
  font-family: Tahoma, Arial, Helvetica, Geneva, sans-serif;-
  font-size: 9pt;-
  background-color: #EAEFF5;-
  padding: 8px;-
  background-color: #F2F2F5;-
  border-color: #ffffff #ffffff #cccccc #ffffff;-
  border-style: solid solid solid solid;-
  border-width: 1px 0px 1px 0px;}-
th {-
  font-family: Tahoma, Arial, Helvetica, Geneva, sans-serif;-
  font-size: 9pt;-
  padding: 8px;-
  background-color: #CFE0F1;-
  border-color: #ffffff #ffffff #cccccc #ffffff;-
  border-style: solid solid solid none;-
  border-width: 1px 0px 1px 0px;-
  }-
h1 { -
font:16pt Arial,Helvetica,Geneva,sans-serif; -
color:#336699; -
background-color:White; -
border-bottom:1px solid #cccc99; -
margin-top:0pt; margin-bottom:0pt; padding:0px 0px 0px 0px;} -
h2 { -
font:bold 10pt Arial,Helvetica,Geneva,sans-serif; -
color:#336699; -
background-color:White; -
margin-top:4pt; margin-bottom:0pt;} -
a { -
font:9pt Arial,Helvetica,sans-serif; -
color:#663300; -
background:#ffffff; -
margin-top:0pt; margin-bottom:0pt; vertical-align:top;} -
.threshold-critical { -
font:bold 10pt Arial,Helvetica,sans-serif; -
color:red; } -
.threshold-warning { -
font:bold 10pt Arial,Helvetica,sans-serif; -
color:orange; } -
.threshold-ok { -
font:bold 10pt Arial,Helvetica,sans-serif; -
color:green; } -
</style> -
<title>EV5 VALIDATION REPORT</title>"-
BODY "" -
TABLE "border='1' width='100%'" -
ENTMAP OFF SPOOL ON



SET MARKUP HTML ON;

SPOOL TEST.html;


EXEC DBMS_OUTPUT.PUT_LINE ('<body ><br/><b><font size=6 color="000000"> <center>EV5 VALIDATION REPORT </center> </font></b> <hr>');



EXEC DBMS_OUTPUT.PUT_LINE ('<b><font size=3 color="000000">');
PROMPT BELOW RECORDS ARE AVAILABLE IN FACTS SET BUT NOT IN DIMENSIONS
EXEC DBMS_OUTPUT.PUT_LINE ('</font></b><br/>');
  --1.  Missing Tables


SELECT DISTINCT CLNT_OBJ_ID,PAY_GRP_CD,CMPNY_CD FROM T_FACT_WORK_ASGNMT
MINUS
SELECT DISTINCT CLNT_OBJ_ID,PAY_GRP_CD,CMPNY_CD FROM T_DIM_PAY_GRP;


  
SPOOL OFF;

 EXIT;