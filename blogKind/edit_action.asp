<!--#include file="../INC/checkAdmin.asp"-->
<!--#INCLUDE FILE="../INC/OLEDBconn.asp" -->
<%
dim name,ID
ID=safeRequest("ID",1,0)
name=safeRequest("name",0,"")

set rs=server.createobject("adodb.recordset")
sqlcmd="select name from MyblogKind where name='"&name&"' and id<>"&id&" "
rs.open sqlcmd,conn,1,1,1

if not rs.eof then
 response.write "相同类名冲突。请重新设定。"
 response.end
end if

sqlcmd="update MyblogKind set name='"&name&"' where ID="&ID
conn.execute sqlcmd

rs.close
set rs=nothing
conn.close
set conn=nothing
%>

<!--#include file=../INC/success.asp-->