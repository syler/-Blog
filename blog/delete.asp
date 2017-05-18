<%'on error resume next%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->

<%
dim ID,isObjIn,msg
msg=""
isObjIn=isObjInstalled("")
ID=safeRequest("ID",1,0)

'删除大小插图
set rs=server.createobject("adodb.recordset")
sqlcmd="select bigImg,smallImg from Contents where ID="&ID
rs.open sqlcmd,conn,1,1,1

imagename="bigImg/"&rs("bigImg")

if imagename<>"nothing" then
	if isObjIn then
		set fsk=server.createobject("scripting.filesystemobject")
		if fsk.fileexists(server.mappath(imagename)) then fsk.deletefile server.mappath(imagename)
		imagename="smallImg/"&rs("smallImg")
		if fsk.fileexists(server.mappath(imagename)) then fsk.deletefile server.mappath(imagename)
		 set fsk=nothing
	 else
		msg="不支持fso导致：大小插图可能没有删除！"
	end if
end if
if isObjIn then
	htmlfile="../html/"&ID&".html"
	set fsk=server.createobject("scripting.filesystemobject")
	if fsk.fileexists(server.mappath(htmlfile)) then fsk.deletefile server.mappath(htmlfile)
	set fsk=nothing
else
	msg=msg&"可能对应的html没有删除！"
 end if
rs.close
set rs=nothing


'删除文章记录
sqlcmd="delete from Contents where ID="&ID
conn.execute sqlcmd

'删除相关评论
sqlcmd="delete from Mycomments where toID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
if msg="" then msg="全部操作成功！"
response.write "<script>alert('"&msg&"');window.location='"&request.ServerVariables("HTTP_REFERER")&"';</script>"

%>