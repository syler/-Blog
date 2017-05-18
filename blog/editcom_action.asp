<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<%
 dim thisID,name,email,IP,toID,content,pubdate,founderr
 thisID=request("thisID")
 name=request("name")
 email=request("email")
 IP=request("IP")
 toID=request("referto")
 pubdate=request("date")
 content=replace(trim(request("content")),chr(13),"<BR>")
 if not isnumeric(toID) then founderr=true
 if not isdate(pubdate) then founderr=true
 if founderr=true then
	response.write "表单填写有误！"
	response.end
 end if
dim sqlcmd
sqlcmd="update Mycomments set name='"&name&"',email='"&email&"',IP='"&IP&"',toID="&toID&",pubDate='"&pubdate&"',content='"&content&"' where ID="&thisID
conn.execute sqlcmd
conn.close
set conn=nothing
response.write "<script>alert('更新评论成功！');window.location='"&request.servervariables("http_referer")&"';</script>"
%>