<%@ Language=VBScript %>
<!--#include file="../INC/md5.asp"-->
<%
Dim AdminId
Dim AdmimPassWord
Dim SendFlag
SendFlag=0
AdminId=Request("AdminID")
AdminPassWord=TRim(Request("password"))
Session("AdminLogged")=0
IF  isempty(AdminId) or isempty(AdminPassWord) THEN
	SendFlag=2
ELSE
%>
	<!--#include file="Fgbconn.asp"-->
	<%set con=Server.CreateObject("ADODB.Connection")
	con.Open connectionstring
	Set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "select  userName  from  admin where userName='"&AdminID&"' and password='"&md5(AdminPassWord)&"'",con,1,1
	if rs.eof or rs.bof then
		SendFlag=3
	else
		sendFlag=1
		Session("AdminLogged")=1
	end if
	rs.close
	set rs=nothing
	con.close
	set con=nothing
END IF
if session("uname")<>"" then
	SendFlag=1
	Session("AdminLogged")=1
end if
Response.Write "&&SendFlag="&SendFlag
%>