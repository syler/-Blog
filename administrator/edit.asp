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
<title>�޸��û�</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<BODY onload="document.form1.userName.focus()" BGCOLOR=#FFFFFF leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action=edit_action.asp>
  <br>
  <table width="613" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#F8F8F8">
    <tr align="left" valign="top"> 
      <td width="100" height="2" align="right" valign="middle"> 
        <p>�� �� ���� </p></td>
      <td height="2"> 
        <input type="text" name="userName" size="20" maxlength="20" value="<%=rs("userName")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">���룺</td>
      <td><a href=# class="fontStriking" onClick="window.open('editpw.asp?id=<%=rs("id")%>','edit','scrollbars=yes,width=250,height=180')">�����޸����룡����</a></td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">������</td>
      <td> 
        <input type="text" name="name" size="20"  maxlength="20" value="<%=rs("name")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">���֤�ţ�</td>
      <td> 
        <input type="text" name="IDcard" size="40" maxlength="18"  value="<%=rs("IDcard")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">�Ա� </td>
      <td> 
        <select name="sex">
          <%if rs("sex") then%>
          <option value="1" selected>��</option>
          <option value="0">Ů</option>
          <%else%>
          <option value="1">��</option>
          <option value="0" selected>Ů</option>
          <%end if%>
        </select> </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">��վ��</td>
      <td> 
        <input type="text" name="webSite" size="40" maxlength="40" value="<%=rs("webSite")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle" class="efont">�����ʼ���</td>
      <td> 
        <input type="text" name="email" size="40" maxlength="40" value="<%=rs("email")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle" class="efont">OICQ��</td>
      <td> 
        <input type="text" name="OICQ" size="40" maxlength="40" value="<%=rs("OICQ")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle" class="efont">MSN��</td>
      <td> 
        <input type="text" name="MSN" size="40" maxlength="40" value="<%=rs("MSN")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">�绰��</td>
      <td> 
        <input type="text" name="tel" size="40" maxlength="15" value="<%=rs("tel")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td align="right" valign="middle">��飺</td>
      <td> 
        <textarea name="intro" cols="80" rows="10"><%=rs("intro")%></textarea> 
      </td>
    </tr>
    <tr align="left" valign="middle"> 
      <td height="50" colspan="2" align="center"> 
        <input name="Submit" type="submit" class="button" value="ȷ��">
      </td>
    </tr>
  </table>
</form>
</body>
</html>