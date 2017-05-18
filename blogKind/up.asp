<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp-->

<%
dim ID
ID=safeRequest("ID",1,0)

set rs=server.createobject("adodb.recordset")
sqlcmd="select orderID from MyblogKind where ID="&ID
rs.open sqlcmd,conn,1,1,1

orderID=rs("orderID")-1

rs.close
set rs=nothing

sqlcmd="update MyblogKind set orderID=orderID+1 where orderID="&orderID
conn.execute sqlcmd

sqlcmd="update MyblogKind set orderID=orderID-1 where ID="&ID
conn.execute sqlcmd
conn.close
set conn=nothing
response.redirect request.servervariables("http_referer")
%>