<!--#include file="../INC/OLEDBconn.asp"-->
	<%dim rs
	set rs=server.createobject("adodb.recordset")
	rs.open "select csscode from admin",conn,1,1
	if not rs.eof then
	dim css
	css=rs("csscode")
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	end if%>
<STYLE type=text/css>
<!--
<%=css%>
//-->
</STYLE>