<%on error resume next%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<%
dim ID,imgtype,isObjIn
isObjIn=isObjInstalled("")
ID=safeRequest("ID",1,0)
imgtype=safeRequest("type",0,"smallImg")

'delete the image
set rs=server.createobject("adodb.recordset")
sqlcmd="select "&imgtype&" from Contents where ID="&ID
rs.open sqlcmd,conn,1,1,1

imagename=imgtype&"/"&rs(0)

if imagename<>imgtype&"nothing" then
	if isObjIn then
		set fso=server.createobject("scripting.filesystemobject")
		if fso.fileexists(server.mappath(imagename)) then fso.deletefile server.mappath(imagename)
		set fso=nothing
	end if
end if
rs.close
set rs=nothing

'update the record from database
sqlcmd="update Contents set "&imgtype&"='nothing.gif' where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
response.redirect request.serverVariables("http_referer")
%>