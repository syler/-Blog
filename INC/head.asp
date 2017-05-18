<!--#include file="../INC/OLEDBconn.asp"-->
<!--#include file="../INC/site_set.asp"-->
<html><head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=99love,缘梦动力,powerdrm,ASP,ASP.NET,MS-SQL,ACCESS,MYSQL,FLASH,FIREWORKS,DREAMWEAVER,KOF,PHOTOSHOP,asp、.net空间赞助 name=keywords>
<META content=99love.126.com,99LOVE的博客，asp、asp.net、flash学习的地方 name=description>
<META content="99love powerdrm#gmail.com" name=author>
<link href="../INC/css.asp" rel="stylesheet" type="text/css">
</head>
<BODY bgColor="transparent" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE height=190 cellSpacing=0 cellPadding=0 width=775 align=center bgColor=#e7e7e7 border=0>
  <TBODY>
    <TR> 
      <TD class=bgTop1 bgColor=#88b8ff>&nbsp; </TD>
    </TR>
    <TR> 
      <td height="20" align="left" class="bgTop2">&nbsp;&nbsp;&nbsp;<a href="../" target="_top" class="fontNav">Home</a> 
      | 
      <%
		set rs=server.createobject("adodb.recordset")
		sqlcmd="select ID,name from MyblogKind order by orderID"
		rs.open sqlcmd,conn,1,1,1
		i=1
		do while not rs.eof
		%>
      <a href="../blog/?blogKind=<%=rs("ID")%>" target="_top" class="fontNav"><%=rs("name")%></a> 
      | 
      <%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		%>
      <a href="../guestbook/guestbook.htm" target="_top" class="fontNav">GuestBook</a> </td>
    </TR>
    <TR height=6> 
      <TD class=bgTop3 height=6></TD>
    </TR>
  </TBODY>
</TABLE>
</body></html>