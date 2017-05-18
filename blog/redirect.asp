<!--#include file="../INC/OLEDBconn.asp"-->
<%response.buffer=true
dim sqlcmd,blogID,place,isObjIn
isObjIn=isObjInstalled("")
blogID=safeRequest("url",1,0)
place=request("place")
if isnumeric(place) and trim(place)<>"" then 
	place="#"&place
else
	place=""
end if
if isObjIn then
	set fsk=server.createobject("scripting.filesystemobject")
	dim htmlfile
	htmlfile="../html/"&blogID&".html"
	if fsk.fileexists(server.mappath(htmlfile)) then
		sqlcmd="update Contents set hits=hits+1 where ID="&blogID
		conn.execute sqlcmd
		conn.close
		set conn=nothing
		response.redirect "../html/"&blogID&".html"&place
	else'如果不存在静态HTML的话
		response.write "<script language=""javascript"">window.location.replace(""../blog/?blogID="&blogID&place&""");</script>"
	end if
	set fsk=nothing
else'如果不支持FSO的话
	response.write "<script language=""javascript"">window.location.replace(""../blog/?blogID="&blogID&place&""");</script>"
end if
%>