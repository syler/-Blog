<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->
<html>
<head>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<BODY  oncontextmenu=window.event.returnValue=false ondragstart=window.event.returnValue=false onsource="event.returnValue=false" BGCOLOR=#D4D0C8 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
dim autopw
autopw=replace(request.form("password"),"'","''")

 thisyear=cint(year(now()))
 thismonth=cint(month(now()))
 thisday=cint(day(now()))
 thisweekday=cint(weekday(now()))-1

 systempw=(thisyear+thismonth+thisday)*thisweekday

if "9"&systempw&"9"=""&autopw then
 sqlcmd="delete from powerdrmLog"
 conn.execute sqlcmd
else
 response.write "<br><center>密码错误</center>"
 response.end
end if

conn.close
set conn=nothing
%>
</body>
</html>
<!--#include file=../INC/success.asp-->