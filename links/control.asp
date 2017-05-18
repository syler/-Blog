<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<title>链接管理</title>
<link rel="stylesheet" href="../INC/style.css" type="text/css">

<script language=javascript type=text/javascript>
function isDel()
{
return confirm("您真的要删除吗？")
}
</script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Friendlinks order by ID desc"
rs.open sqlcmd,conn,1,1,1
%>

<br>
<table width="96%" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr bgcolor="f5f5f5"> 
    <td width="89%" align="left"><img src="../icon/arrow.gif">总数:<%=rs.recordcount%></td>
    <td width="11%" align="center"><a href=# onClick="window.open('insert.asp','insert','scrollbars=yes,width=300,height=150')">{新建}</a> 
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
    <td width="6%"  bgcolor="e8e8e8">ID号</td> 
    <td width="20%" bgcolor="e8e8e8">站点名称</td>
	<td width="60%" bgcolor="e8e8e8" >链接地址</td>
    <td width="7%"  bgcolor="e8e8e8">修改</td>
    <td width="7%"  bgcolor="e8e8e8">删除</td>
	</tr>
  <%do while not rs.eof%>
  <tr bgcolor="#FFFFFF" align="center"> 
 
    <td><%=rs("ID")%></td>
    <td><%=rs("name")%></td>	
	<td><a href="<%=rs("linkTo")%>" target="_blank"><%=rs("linkTo")%></a></td>		
    <td height="2"><a href="#" onClick="window.open('edit.asp?id=<%=rs("id")%>','edit','scrollbars=yes,width=300,height=150')"><img src="../icon/edit.gif" width="15" height="15" border="0"></a></td> 
    <td height="2"><a href="delete.asp?ID=<%=rs("ID")%>" onClick="return isDel()"><img src="../icon/delete.gif" width="15" height="15" border="0"></a></td>

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