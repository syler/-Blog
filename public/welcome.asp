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
<font color="ff0000"><b>{<%=session("uname")%>}</b></font>,���á���ӭ����¼<font color="ff0000"><b>[<%=myName%>]</b></font>����ƽ̨��<br>��ƽ̨Ϊ���ṩ�˷����ȶ��ı༭ϵͳ���������ѡ������Ҫ�༭�����ݡ�<br><br>ע�⣺����ϵͳ���õ���flash���Ա�������ڹ���������಻�㣬<br>���ǣ��������̨������ֻ�ṩ��ɾ�����Ժ��������ԵĹ��ܣ�<br><font color="003366">�����Ҫ�ظ���༭���ԣ��뵽<a href="../guestbook/guestbook.htm" target="_blank">����</a>��½����</font><br>(���ڵ�½����̨֮��Ҫ�������Ա㲻����Ҫ�ظ���½��ֱ�ӵ�����Ա���login���ɣ�)
<%if isObjInstalled("")=false then response.write "<br>ע�⣺<font color=""000ff"">վ�㲻֧��fso(Scripting.FilesyStemObject)���⽫ʹ��һЩ���ܲ���ʹ�ã�</font>"%>
</center>
</body>
</html>