<%'on error resume next%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->

<%
dim ID,isObjIn,msg
msg=""
isObjIn=isObjInstalled("")
ID=safeRequest("ID",1,0)

'ɾ����С��ͼ
set rs=server.createobject("adodb.recordset")
sqlcmd="select bigImg,smallImg from Contents where ID="&ID
rs.open sqlcmd,conn,1,1,1

imagename="bigImg/"&rs("bigImg")

if imagename<>"nothing" then
	if isObjIn then
		set fsk=server.createobject("scripting.filesystemobject")
		if fsk.fileexists(server.mappath(imagename)) then fsk.deletefile server.mappath(imagename)
		imagename="smallImg/"&rs("smallImg")
		if fsk.fileexists(server.mappath(imagename)) then fsk.deletefile server.mappath(imagename)
		 set fsk=nothing
	 else
		msg="��֧��fso���£���С��ͼ����û��ɾ����"
	end if
end if
if isObjIn then
	htmlfile="../html/"&ID&".html"
	set fsk=server.createobject("scripting.filesystemobject")
	if fsk.fileexists(server.mappath(htmlfile)) then fsk.deletefile server.mappath(htmlfile)
	set fsk=nothing
else
	msg=msg&"���ܶ�Ӧ��htmlû��ɾ����"
 end if
rs.close
set rs=nothing


'ɾ�����¼�¼
sqlcmd="delete from Contents where ID="&ID
conn.execute sqlcmd

'ɾ���������
sqlcmd="delete from Mycomments where toID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
if msg="" then msg="ȫ�������ɹ���"
response.write "<script>alert('"&msg&"');window.location='"&request.ServerVariables("HTTP_REFERER")&"';</script>"

%>