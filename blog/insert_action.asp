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
content=replace(request.Form("content"),"'","''")'���ڹٷ��ṩ���ռ����ݵķ����������⣬��Ȼ��ȡ�������ݵ�ֵ������ע���������У������insert.asp102�У�����"document.form1.content.value=eWebEditor.getHTML();"һ�䣬��������������ȡֵ��ֻ��Ҫע��һ�°ѵ����Ż������������š�
uploadFiles=safeRequest("uploadFiles",0,"")

linkTo=server.HTMLencode(safeRequest("linkTo",0,""))


if trim(content)="" then
response.write"<br><br><center>�Բ������ݲ���Ϊ�գ���<a href='javascript:history.back(1)' target=_self>������д��</a></center>"
response.end
end if

sqlcmd="insert into Contents (blogkind,mytag,title,keyword,content,author,linkTo,uploadFiles,smallImg,bigImg,other,hits,hots)values("&blogkind&",'"&mytag&"','"&title&"','"&keyword&"','"&content&"','"&author&"','"&linkTo&"','"&uploadFiles&"','nothing.gif','nothing.gif','',0,0)"
conn.execute sqlcmd

conn.close
set conn=nothing
%>

<html>
<head>
<title>�����ɹ�</title>
</head>
<body bgcolor="#ffffff">
<SCRIPT language=Javascript>
<!-- hide 
alert('ף�����������ɹ�!')
window.location.href="control.asp?blogKind=<%=blogKind%>&page=<%=session("thisPage")%>"
// --> 
</SCRIPT>

</body>
</html>