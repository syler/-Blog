<%CODEPAGE="936"%>
<!--#include file=../INC/OLEDBconn.asp -->
<!--#include file="../INC/checkAdmin.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select top 1 * from admin"
rs.open sqlcmd,conn,1,1,1
dim blogName,buildDate,cssCode
blogName=rs("blogName")
buildDate=rs("buildDate")
cssCode=rs("cssCode")
rs.close
set rs=nothing
conn.close
set conn=nothing
%>

<html>
<head>
<title>修改Blog配置</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<BODY onload="document.form1.blogName.focus()" BGCOLOR=#FFFFFF leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action=blogConfig_action.asp>
  <br>
  <table width="100%" border="0" cellspacing="1" cellpadding="4" align="center">
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="100" align="right" valign="middle">blog名：</td>
      <td> 
        <input type="text" name="blogName" size="40" maxlength="15" value="<%=blogName%>">
      </td>
    </tr>

	
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td align="right" valign="middle">建立日期：</td>
      <td> 
        <input type="text" name="buildDate" size="40" maxlength="15" value="<%=buildDate%>">
      </td>
    </tr>


		
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td align="right" valign="middle">CSS样式：</td>
      <td> 
        <textarea name="cssCode" cols="140" rows="30"><%=cssCode%></textarea>
      </td>
    </tr>

    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td colspan="2" align="center"> <br>
        <input name="Submit" type="submit" class="button" value="确定">
      </td>
    </tr>
  </table>
</form>
</body>
</html>