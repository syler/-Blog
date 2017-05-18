<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID
ID=safeRequest("ID",1,0)

sqlcmd="delete from Friendlinks where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
response.Redirect(request.ServerVariables("HTTP_REFERER"))
%>