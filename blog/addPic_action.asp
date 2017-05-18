<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp-->
<!--#INCLUDE FILE="../INC/upload_5xsoft.asp"-->
<%
dim isObjIn,msg
isObjIn=isObjInstalled("")
if isObjIn=false then 
	response.write "组件不支持，无法操作！"
	response.end
end if
set upload=new upload_5xSoft
set file=upload.file("file1")
formPath=upload.form("type")&"/"
imagetype=upload.form("type")
id=upload.form("id")

'先删除现有图片，以防jpg与gif重复增加垃圾文件。

set rs=server.createobject("adodb.recordset")
sqlcmd="select "&upload.form("type")&" from Contents where ID="&ID
rs.open sqlcmd,conn,1,1,1

imagename=formPath&rs(0)
rs.close
set rs=nothing
	set fso=server.createobject("scripting.filesystemobject")
	if fso.fileexists(server.mappath(imagename)) then fso.deletefile server.mappath(imagename)
	set fso=nothing


'上传新图片
if file.FileSize>0 then         '如果 FileSize > 0 说明有文件数据
	fileName=file.FileName
	filename=id&replace(date(),"-","")&replace(time(),":","")&right(fileName,(len(fileName)-InStrRev(fileName,".")+1))
	file.SaveAs Server.mappath(formPath&filename)   ''保存文件
end if

'更新数据库相关字段
sql="update Contents"
sql=sql&" set "&imagetype&"='"&fileName&"' where id="&id
conn.Execute (sql)
conn.close
set conn=nothing
set file=nothing     
%>
<script language=Javascript>
<!--
alert("上传图片成功！");
opener.location.reload();
window.close();
-->
</script>