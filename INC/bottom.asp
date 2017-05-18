<%dim timestart
timestart=timer()%>
<!--#include file="OleDbconn.asp"-->
<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=99love,缘梦动力,powerdrm,ASP,ASP.NET,MS-SQL,ACCESS,MYSQL,FLASH,FIREWORKS,DREAMWEAVER,KOF,PHOTOSHOP,asp、.net空间赞助 name=keywords>
<META content=99love.126.com,99LOVE的博客，asp、asp.net、flash学习的地方 name=description>
<META content="99love powerdrm#gmail.com" name=author>
<link href="../INC/css.asp" rel="stylesheet" type="text/css">
</head>
<BODY bgColor="transparent" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<table bgcolor="#E7E7E7" width="775" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="20" class="F_Link">
	<%
	  dim rs,sqlcmd
	  set rs=server.createobject("adodb.recordset")
	  sqlcmd="select name,linkTo from Friendlinks order by ID asc"
	  rs.open sqlcmd,conn,1,1,1
	  do while not rs.eof
	  name=strvalue(rs("name"),22)
	  %>
	  &nbsp;&nbsp;- <a href="<%=rs("linkTo")%>" target="_blank"><%=name%></a>
		<%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		%></td>
  </tr>
  <tr> 
    <td height="30" align="center" valign="top" class="bgBottom2">
	<%
	dim timeEnd
	timeEnd=timer()
	timeDiff=Round(timeEnd-timeStart,4)
	response.Write("<span class=""fontCopyright"">"&myCopyright&"&nbsp;&nbsp;本页执行时间："&timeDiff&" 秒</span>")
	%><a href="http://web.168173.com/99love/counter6/supervise/index.asp?uid=99love" target="_blank"><img src="../Counter6/images/count.gif" height="16" width="16" border="0"></a>
    </td>
  </tr>
</table>
</body>
</html>