<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/web_config.asp"-->
<!--#include file="../INC/function.asp"-->
<html>
<head>
<title></title>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<body>

<br><br><br><br>

<center>
<br><br>
<font color="ff0000"><b>{<%=session("uname")%>}</b></font>,您好。欢迎您登录<font color="ff0000"><b>[<%=myName%>]</b></font>管理平台。<br>本平台为您提供了方便稳定的编辑系统，请从左栏选择您需要编辑的内容。<br><br>注意：由于系统采用的是flash留言本，因此在管理中有诸多不便，<br>于是，在这个后台管理中只提供了删除留言和隐藏留言的功能，<br><font color="003366">如果您要回复或编辑留言，请到<a href="../guestbook/guestbook.htm" target="_blank">这里</a>登陆管理。</font><br>(您在登陆本后台之后，要管理留言便不再需要重复登陆，直接点击留言本的login即可！)
<%if isObjInstalled("")=false then response.write "<br>注意：<font color=""000ff"">站点不支持fso(Scripting.FilesyStemObject)！这将使您一些功能不能使用！</font>"%>
</center>
</body>
</html>