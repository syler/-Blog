<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID,orderID,isObjIn,msg
isObjIn=isObjInstalled("")
ID=safeRequest("ID",1,0)
orderID=safeRequest("orderID",1,0)
'删除该分类
sqlcmd="delete from MyblogKind where ID="&ID
conn.execute sqlcmd
'重新调整分类数据
sqlcmd="update MyblogKind set orderID=orderID-1 where orderID>"&orderID
conn.execute sqlcmd
	dim rs,sql
	set rs=server.createobject("adodb.recordset")
	sql="select ID from Contents where blogKind ="&ID
	rs.open sql,conn,1,1
	do while not(rs.eof or rs.bof)
		if isObjIn then'删除静态页面
			dim fso,filepath
			filepath=server.mappath("../html/"&rs("ID")&".html")
			set fso=server.createobject("scripting.filesystemobject")
			if fso.fileexists(filepath) then fso.deletefile filepath
			set fso=nothing
			msg="操作成功！"
		else
			msg="系统不支持fso，如果该分类下对应有html，请手动删除\n因为系统无法自动删除它们！"
		end if
		conn.execute "delete from Mycomments where toID="&rs("ID")'删除该文章所属评论
		rs.movenext
		if rs.eof or rs.bof then exit do
	loop
	rs.close
	set rs=nothing

'删除所属分类的文章
sqlcmd="delete from Contents where blogKind="&ID
conn.execute sqlcmd
conn.close
set conn=nothing
response.write "<script>alert('"&msg&"');window.location='"&request.servervariables("http_referer")&"';</script>"
%>