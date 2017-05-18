<%
	Dim sID
	Dim sReply
	Dim ReplyFlag
	SendFlag=0
	sID=request("idNumber")
	sReply=request("ftext")
	IF Session("AdminLogged")=1 THEN
		IF (isempty(sID) OR isempty(sReply)) THEN
			SendFlag=2
		ELSE %>
			<!--#include file="Fgbconn.asp"-->
			<%set con=Server.CreateObject("ADODB.Connection")
			con.Open connectionstring
			Set rs=Server.CreateObject("ADODB.RecordSet")
				rs.Open "select reply from guestbook where number="&sID,con,3,3
			IF rs.eof and rs.bof THEN
				SendFlag=3
			ELSE
				rs("reply")=sReply
				rs.update
				rs.close
				SendFlag=1
			END IF
				set rs=nothing
				con.close
				set con=nothing
		END IF
	ELSE 
		SendFlag=4
	END IF
	Response.Write "&&SendFlag="&SendFlag
%>