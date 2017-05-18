<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->

<%
dim ID,toID,isObjIn
ID=safeRequest("ID",1,0)
toID=0
isObjIn=isObjInstalled("")
set rs=server.createobject("adodb.recordset")
sqlcmd="select toID from Mycomments where ID="&ID
rs.open sqlcmd,conn,1,1,1
if not rs.eof then toID=rs("toID")
rs.close
set rs=nothing

if toID<>0 then
sqlcmd="update Contents set hots=hots-1 where ID="&toID
conn.execute sqlcmd
end if


'É¾³ý¼ÇÂ¼
sqlcmd="delete from Mycomments where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
if isObjIn then 
	response.redirect "fso.asp?url=../inc/viewfile.asp?blogID="&toID
else
	response.redirect request.servervariables("http_referer")
end if
%>