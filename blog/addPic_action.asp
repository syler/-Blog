<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp-->
<!--#INCLUDE FILE="../INC/upload_5xsoft.asp"-->
<%
dim isObjIn,msg
isObjIn=isObjInstalled("")
if isObjIn=false then 
	response.write "�����֧�֣��޷�������"
	response.end
end if
set upload=new upload_5xSoft
set file=upload.file("file1")
formPath=upload.form("type")&"/"
imagetype=upload.form("type")
id=upload.form("id")

'��ɾ������ͼƬ���Է�jpg��gif�ظ����������ļ���

set rs=server.createobject("adodb.recordset")
sqlcmd="select "&upload.form("type")&" from Contents where ID="&ID
rs.open sqlcmd,conn,1,1,1

imagename=formPath&rs(0)
rs.close
set rs=nothing
	set fso=server.createobject("scripting.filesystemobject")
	if fso.fileexists(server.mappath(imagename)) then fso.deletefile server.mappath(imagename)
	set fso=nothing


'�ϴ���ͼƬ
if file.FileSize>0 then         '��� FileSize > 0 ˵�����ļ�����
	fileName=file.FileName
	filename=id&replace(date(),"-","")&replace(time(),":","")&right(fileName,(len(fileName)-InStrRev(fileName,".")+1))
	file.SaveAs Server.mappath(formPath&filename)   ''�����ļ�
end if

'�������ݿ�����ֶ�
sql="update Contents"
sql=sql&" set "&imagetype&"='"&fileName&"' where id="&id
conn.Execute (sql)
conn.close
set conn=nothing
set file=nothing     
%>
<script language=Javascript>
<!--
alert("�ϴ�ͼƬ�ɹ���");
opener.location.reload();
window.close();
-->
</script>