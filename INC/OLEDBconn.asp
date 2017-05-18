<%response.Buffer=true%>
<!--#include file="function.asp"-->
<!--#include file="md5.asp"-->
<!--#include file="web_config.asp"-->

<%
Dim conn
set conn=server.createobject("adodb.connection")
conn.Open "Driver={Microsoft Access Driver (*.mdb)};DBQ="& Server.MapPath(dbName)
if err then
	response.Clear()
	response.Write("ERR"&err.number&" occured:"&err.description)
	conn.close
	set conn=nothing
	response.End()
end if
%>