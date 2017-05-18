<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp-->
<%
dim blogKind,mytag,title,keyword,author,linkTo,content
blogkind=safeRequest("blogkind",0,"")
mytag=safeRequest("mytag",0,"")
title=server.HTMLencode(safeRequest("title",0,"untitled"))
keyword=server.HTMLencode(safeRequest("keyword",0,""))
author=server.HTMLencode(safeRequest("author",0,"unnamed friend"))
'For i = 1 To Request.Form("content").Count 
'	content = content & Request.Form("content")(i) 
'Next 
content=replace(request.Form("content"),"'","''")'由于官方提供的收集内容的方法存在问题，依然会取不到内容的值，所以注释以上三行，另改了insert.asp102行，加了"document.form1.content.value=eWebEditor.getHTML();"一句，这样反而能正常取值。只是要注意一下把单引号换成两个单引号。
uploadFiles=safeRequest("uploadFiles",0,"")

linkTo=server.HTMLencode(safeRequest("linkTo",0,""))


if trim(content)="" then
response.write"<br><br><center>对不起，内容不能为空，请<a href='javascript:history.back(1)' target=_self>返回重写。</a></center>"
response.end
end if

sqlcmd="insert into Contents (blogkind,mytag,title,keyword,content,author,linkTo,uploadFiles,smallImg,bigImg,other,hits,hots)values("&blogkind&",'"&mytag&"','"&title&"','"&keyword&"','"&content&"','"&author&"','"&linkTo&"','"&uploadFiles&"','nothing.gif','nothing.gif','',0,0)"
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
window.location.href="control.asp?blogKind=<%=blogKind%>&page=<%=session("thisPage")%>"
// --> 
</SCRIPT>

</body>
</html>