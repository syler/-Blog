<%
	Dim sID
	Dim sReply
	Dim SendFlag
	SendFlag=0
	sID=request("idNumber")
	IF Session("AdminLogged")=1 THEN%>
			<!--#include file="Fgbconn.asp"-->
			<%set con=Server.CreateObject("ADODB.Connection")
			con.Open connectionstring
			Set rs=Server.CreateObject("ADODB.RecordSet")
				rs.Open "select * from guestbook where number="&sID,con,3,3
			IF rs.eof and rs.bof THEN
				SendFlag=3
			ELSE
				rs("UserName")=trim(request("UserName"))
				rs("email")=request("email")
				rs("icq")=request("icq")
				rs("face")=request("curFace")
				rs("icon")=request("cicon")
				rs("url")=request("inurl")
				rs("message")=request("fText")
				rs("subject")=trim(request("subject"))
				rs("reply")=request("reply")
				rs.update
				rs.close
				SendFlag=1
			END IF
				set rs=nothing
				con.close
				set con=nothing
	ELSE 
		SendFlag=4
	END IF
	Response.Write "&&SendFlag="&SendFlag
%>