<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
dim userName,password,rs
userName=request.form("userName")
password=request.form("password")


for i=1 to len(userName)
us=mid(userName,i,1)
if us="'" or us="%" or us="<" or us=">" or us="&" then
response.redirect "../public/message.asp?message=对不起，您输入的用户名包括禁用字符。"
response.end
end if
next 



for i=1 to len(password)

ps=mid(password,i,1)

if ps="'" or ps="%" or ps="<" or ps=">" or ps="&" then
response.redirect "../public/message.asp?message=对不起，您输入的密码包括禁用字符。"
response.end
end if
next


%>

<!--#include file="../INC/OLEDBconn.asp" -->

<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from admin where userName='"&userName&"' and password='"&md5(password)&"' order by ID"

rs.open sqlcmd,conn,1,1,1

'记入登录日志
ip=request.servervariables("remote_addr")
sys=request.servervariables("http_user_agent")


if rs.eof then
  sqlcmd="insert into powerdrmLog (ip,sys,userName,password,is_success)values('"&ip&"','"&sys&"','"&userName&"','"&password&"',0)"
  conn.execute sqlcmd
  conn.close
  set conn=nothing
  response.redirect "login.asp?message=对不起，您输入的用户名或密码有误"
else
  sqlcmd="insert into powerdrmLog (ip,sys,userName,password,is_success)values('"&ip&"','"&sys&"','"&userName&"','"&md5(password)&"',1)"
  conn.execute sqlcmd

  session("UID")=rs("ID")
  session("uname")=rs("userName")

  session.timeout=180

  uid=session("uid")
  sqlcmd="update admin set login_times=login_times+1 where id="&uid
  conn.execute sqlcmd

  response.redirect "../Frames/frame.asp"
end if

rs.close
set rs=nothing

conn.close
set conn=nothing
%>
