<!--#include file=../INC/checkAdmin.asp -->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID
ID=safeRequest("ID",1,0)

sqlcmd="update guestbook set is_show=not is_show where number="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
%>
<html>
<head></head>
<body style="font-size:12px">
�����ɹ���<br>�����������˰�ť���أ�
</body>
</html>