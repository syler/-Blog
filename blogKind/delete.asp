<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID,orderID,isObjIn,msg
isObjIn=isObjInstalled("")
ID=safeRequest("ID",1,0)
orderID=safeRequest("orderID",1,0)
'ɾ���÷���
sqlcmd="delete from MyblogKind where ID="&ID
conn.execute sqlcmd
'���µ�����������
sqlcmd="update MyblogKind set orderID=orderID-1 where orderID>"&orderID
conn.execute sqlcmd
	dim rs,sql
	set rs=server.createobject("adodb.recordset")
	sql="select ID from Contents where blogKind ="&ID
	rs.open sql,conn,1,1
	do while not(rs.eof or rs.bof)
		if isObjIn then'ɾ����̬ҳ��
			dim fso,filepath
			filepath=server.mappath("../html/"&rs("ID")&".html")
			set fso=server.createobject("scripting.filesystemobject")
			if fso.fileexists(filepath) then fso.deletefile filepath
			set fso=nothing
			msg="�����ɹ���"
		else
			msg="ϵͳ��֧��fso������÷����¶�Ӧ��html�����ֶ�ɾ��\n��Ϊϵͳ�޷��Զ�ɾ�����ǣ�"
		end if
		conn.execute "delete from Mycomments where toID="&rs("ID")'ɾ����������������
		rs.movenext
		if rs.eof or rs.bof then exit do
	loop
	rs.close
	set rs=nothing

'ɾ���������������
sqlcmd="delete from Contents where blogKind="&ID
conn.execute sqlcmd
conn.close
set conn=nothing
response.write "<script>alert('"&msg&"');window.location='"&request.servervariables("http_referer")&"';</script>"
%>