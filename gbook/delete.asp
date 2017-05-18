<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/oledbconn.asp"-->
<%
dim ID
ID=safeRequest("ID",1,0)


sqlcmd="delete from guestbook where number="&ID
conn.execute sqlcmd


conn.close
set conn=nothing
response.redirect "control.asp"
%>