<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<title>类别管理</title>
<link rel="stylesheet" href="../INC/style.css" type="text/css">

<script language=javascript type=text/javascript>
function isDel()
{
return confirm("注意:删除分类将删除所有属于该分类的信息！\n包括：\n①所下属的全部文章\n②所下属文章的全部评论\n③所下属文章的静态html页面(如果服务器支持fso的话)\n\n≮删除将不可恢复≯ ≮您真的要删除吗≯")
}
</script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from MyblogKind order by orderID"
rs.open sqlcmd,conn,1,1,1
%>

<br>
<table width="96%" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr bgcolor="f5f5f5"> 
    <td width="89%" align="left"><img src="../icon/arrow.gif">总数:<%=rs.recordcount%></td>
    <td width="11%" align="left"><a href=# onClick="window.open('insert.asp','insert','scrollbars=yes,width=200,height=100')">{新建}</a> 

    </td>
  </tr>
  <tr bgcolor="#666666" height="1">
    <td align="left"></td>
    <td align="left"></td>
  </tr>
</table>

<br>
<table width=96% border=0 cellpadding="2" cellspacing="1" align="center" bgcolor="#CCCCCC">
  <tr bgcolor="#E8FFFF" align="center">
    <td height="2" bgcolor="e8e8e8">排序</td>
    <td height="2" bgcolor="e8e8e8">编号</td>
    <td height="2" bgcolor="e8e8e8">ID号</td> 
    <td height="2" bgcolor="e8e8e8">类名</td>
    <td height="2" bgcolor="e8e8e8">修改</td>
    <td height="2" bgcolor="e8e8e8">删除</td>
	</tr>
  <%do while not rs.eof%>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td> 
      <%if rs("orderID")<=1 then%>
      <img src="../icon/up2.gif" width="15" height="15" border="0"> <a href=down.asp?id=<%=rs("id")%>><img src="../icon/down.gif" width="15" height="15" border="0"></a> 
      <%else 
if rs("orderID")>=rs.recordcount then
%>
      <a href=up.asp?id=<%=rs("id")%>><img src="../icon/up.gif" width="15" height="15" border="0"></a> 
      <img src="../icon/down2.gif" width="15" height="15" border="0"> 
      <%else%>
      <a href=up.asp?id=<%=rs("id")%>><img src="../icon/up.gif" width="15" height="15" border="0"></a> 
      <a href=down.asp?id=<%=rs("id")%>><img src="../icon/down.gif" width="15" height="15" border="0"></a> 
      <%end if%>
      <%end if%>
	  </td>
    <td><%=rs("orderID")%> </td>
    <td><%=rs("id")%></td>
    <td><%=rs("name")%></td>	
    <td height="2"><a href="#" onClick="window.open('edit.asp?id=<%=rs("ID")%>','edit','scrollbars=yes,width=200,height=100')"><img src="../icon/edit.gif" width="15" height="15" border="0"></a></td> 
    <td height="2"><a href="delete.asp?ID=<%=rs("ID")%>&orderID=<%=rs("orderID")%>" onClick="return isDel()"><img src="../icon/delete.gif" width="15" height="15" border="0"></a></td>
      <%
rs.movenext
loop
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</table>
<br>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
        <tr>
          <td align="center" bgcolor="#f8f8f8"><%=myCopyright%></td>
        </tr>
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
</table>
</body>
</html>