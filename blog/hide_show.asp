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
	msg="全部操作成功！\n提示：些时已不存在该文章对应的html静态页面\n若需要可以重新导出！"
else
	msg="站点不支持fso，没有该文章的html进行fso操作！\n其余操作成功！"
end if
response.write "<script>alert('"&msg&"');window.location='"&request.servervariables("http_referer")&"';</script>"
%>