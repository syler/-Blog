<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->

<%
dim blogName,buildDate,cssCode

blogName=safeRequest("blogName",0,"")
buildDate=safeRequest("buildDate",0,"")
cssCode=safeRequest("cssCode",0,"")


sqlcmd="update admin set  blogName='"&blogName&"',buildDate='"&buildDate&"',cssCode='"&cssCode&"' "

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
window.location.href="blogconfig.asp"
// --> 
</SCRIPT>

</body>
</html>