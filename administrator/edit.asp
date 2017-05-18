<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/OLEDBconn.asp" -->
<!--#include file="../INC/checkAdmin.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select top 1 * from admin"
rs.open sqlcmd,conn,1,1,1
%>
<html>
<head>
<title>修改用户</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<BODY onload="document.form1.userName.focus()" BGCOLOR=#FFFFFF leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action=edit_action.asp>
  <br>
  <table width="613" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#F8F8F8">
    <tr align="left" valign="top"> 
      <td width="100" height="2" align="right" valign="middle"> 
        <p>用 户 名： </p></td>
      <td height="2"> 
        <input type="text" name="userName" size="20" maxlength="20" value="<%=rs("userName")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">密码：</td>
      <td><a href=# class="fontStriking" onClick="window.open('editpw.asp?id=<%=rs("id")%>','edit','scrollbars=yes,width=250,height=180')">我想修改密码！！！</a></td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">姓名：</td>
      <td> 
        <input type="text" name="name" size="20"  maxlength="20" value="<%=rs("name")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">身份证号：</td>
      <td> 
        <input type="text" name="IDcard" size="40" maxlength="18"  value="<%=rs("IDcard")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">性别： </td>
      <td> 
        <select name="sex">
          <%if rs("sex") then%>
          <option value="1" selected>男</option>
          <option value="0">女</option>
          <%else%>
          <option value="1">男</option>
          <option value="0" selected>女</option>
          <%end if%>
        </select> </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">网站：</td>
      <td> 
        <input type="text" name="webSite" size="40" maxlength="40" value="<%=rs("webSite")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle" class="efont">电子邮件：</td>
      <td> 
        <input type="text" name="email" size="40" maxlength="40" value="<%=rs("email")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle" class="efont">OICQ：</td>
      <td> 
        <input type="text" name="OICQ" size="40" maxlength="40" value="<%=rs("OICQ")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle" class="efont">MSN：</td>
      <td> 
        <input type="text" name="MSN" size="40" maxlength="40" value="<%=rs("MSN")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">电话：</td>
      <td> 
        <input type="text" name="tel" size="40" maxlength="15" value="<%=rs("tel")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">简介：</td>
      <td> 
        <textarea name="intro" cols="80" rows="10"><%=rs("intro")%></textarea> 
      </td>
    </tr>
    <tr align="left" valign="middle"> 
      <td height="50" colspan="2" align="center"> 
        <input name="Submit" type="submit" class="button" value="确定">
      </td>
    </tr>
  </table>
</form>
</body>
</html>