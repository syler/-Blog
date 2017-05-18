<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID
ID=safeRequest("ID",1,0)

sqlcmd="update Contents set is_good=not is_good where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
response.redirect request.servervariables("http_referer")
%>