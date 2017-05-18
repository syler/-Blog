	<!--#include file="Fgbconn.asp"-->
	<%
	set con=Server.CreateObject("ADODB.Connection")
	con.Open connectionstring
	Set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "select  * from guestbook where 1=0",con,3,3
	rs.addnew
	rs("UserName")=trim(request("UserName"))
	rs("email")=request("email")
	rs("icq")=request("icq")
	rs("face")=request("curFace")
	rs("icon")=request("cicon")
	rs("url")=request("inurl")
	rs("message")=trim(request("fText"))
	rs("subject")=trim(request("subject"))
	rs("is_show")=True
	rs.update
	rs.close
	set rs=nothing
	con.close
	set con=nothing
	Response.Write "&&sendFlag=1"
%>