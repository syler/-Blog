<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID,isObjIn,msg
msg=""
ID=safeRequest("ID",1,0)
isObjIn=isObjInstalled("")
sqlcmd="update Contents set is_show=not is_show where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
if isObjIn then
	dim fso,sfile
	sfile=server.mappath("../html/"&ID&".html")
	set fso=server.createobject("scripting.filesystemobject")
	if fso.fileexists(sfile)=true then fso.deletefile(sfile)
	set fso=nothing
	msg="ȫ�������ɹ���\n��ʾ��Щʱ�Ѳ����ڸ����¶�Ӧ��html��̬ҳ��\n����Ҫ�������µ�����"
else
	msg="վ�㲻֧��fso��û�и����µ�html����fso������\n��������ɹ���"
end if
response.write "<script>alert('"&msg&"');window.location='"&request.servervariables("http_referer")&"';</script>"
%>