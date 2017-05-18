<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->

<%
dim userName,password,name,IDcard,sex,email,tel,webSite,OICQ,MSN,intro

userName=safeRequest("userName",0,"")
name=safeRequest("name",0,"")
IDcard=safeRequest("IDcard",0,"")
sex=safeRequest("sex",1,1)
email=safeRequest("email",0,"")
tel=safeRequest("tel",0,"")
webSite=safeRequest("webSite",0,"")
OICQ=safeRequest("OICQ",0,"")
MSN=safeRequest("MSN",0,"")
intro=safeRequest("intro",0,"")

sqlcmd="update admin set userName='"&userName&"',name='"&name&"',IDcard='"&IDcard&"',email='"&email&"',tel='"&tel&"',webSite='"&webSite&"',OICQ='"&OICQ&"',MSN='"&MSN&"',intro='"&intro&"',sex="&sex&" "

conn.execute sqlcmd
conn.close
set conn=nothing
%>


<html>
<head>
<title>操作成功</title>
</head>
<body bgcolor="#ffffff">
<SCRIPT language=Javascript>
<!-- hide 
alert('祝贺您，操作成功!')
window.location.href="edit.asp"
// --> 
</SCRIPT>

</body>
</html>