<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../INC/checkAdmin.asp" -->
<!--#INCLUDE FILE="../INC/OLEDBconn.asp" -->
<%
dim name
name=safeRequest("name",0,"�ҵ�����")


set rs=server.createobject("adodb.recordset")
sqlcmd="select id from MyblogKind"
rs.open sqlcmd,conn,1,1,1

orderID=rs.recordcount+1

rs.close
set rs=nothing


set rs=server.createobject("adodb.recordset")
sqlcmd="select name from MyblogKind where name='"&name&"' "
rs.open sqlcmd,conn,1,1,1

if not rs.eof then
 response.write "�Բ�����ͬ������ͻ���������趨��"
 response.end
end if

sqlcmd="insert into MyblogKind (name,orderID) values ('"&name&"',"&orderID&")"
conn.execute sqlcmd

rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<!--#include file=../INC/success.asp-->