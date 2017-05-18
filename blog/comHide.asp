<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<%
dim ID,translate
ID=safeRequest("ID",1,0)
translate=request("translate")
sqlcmd="update Mycomments set is_show=not is_show where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
if isObjInstalled("") and translate then
response.redirect "fso.asp?url=../inc/viewfile.asp?blogID="&safeRequest("toID",1,0)
else
response.redirect "comCon.asp"
end if
%>