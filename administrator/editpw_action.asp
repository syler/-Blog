<head>
<title>修改密码</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<%
dim password,newpw1,newpw2
password=request.form("password")
newpw1=request.form("newpw1")
newpw2=request.form("newpw2")


for i=1 to len(password)

ps=mid(password,i,1)

if ps="'" or ps="%" or ps="<" or ps=">" or ps="&" then
response.redirect "err.asp?message=对不起，您输入的密码包括禁用字符。"
response.end
end if
next

for i=1 to len(newpw1)

ps=mid(newpw1,i,1)

if ps="'" or ps="%" or ps="<" or ps=">" or ps="&" then
response.redirect "err.asp?message=对不起，您输入的密码包括禁用字符。"
response.end
end if
next


for i=1 to len(newpw2)

ps=mid(newpw2,i,1)

if ps="'" or ps="%" or ps="<" or ps=">" or ps="&" then
response.redirect "err.asp?message=对不起，您输入的密码包括禁用字符。"
response.end
end if
next


if newpw1<>newpw2 then
response.write "两次输入的密码不同"
response.end
end if
%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select top 1 password from admin"
rs.open sqlcmd,conn,1,1,1

if md5(password)<>rs("password") then
rs.close
set rs=nothing
conn.close
set conn=nothing
%>

<SCRIPT language=Javascript>
<!-- hide 
function sorry()
{
alert('密码错误，无权修改!')
window.opener.location.reload(true);
self.close()
} 

sorry()
// --> 
</SCRIPT>

<%
response.end
else
sqlcmd="update admin set password='"&md5(newpw1)&"' "
conn.execute sqlcmd
conn.close
set conn=nothing
end if
%>
<!--#include file="../INC/success.asp"-->