<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/web_config.asp"-->
<%
  session("is_login")=false
  session("uid")=""
  session("uname")=""
  session("urealname")=""
  session("email")=""
  session("usex")=""
  session("is_admin")=false
  message=request.querystring("message")

%>

<HTML>
<HEAD>
<title><%=mySite%> Editor Login...</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</HEAD>
<BODY onload="document.form1.userName.focus()"  BGCOLOR=#FFFFFF >
<br>
<TABLE WIDTH=500 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
  <TR> 
    <TD height="17" align="center" bgcolor="f0f0f0" class="tfont"><br>
      <%=myName%><br>
      <br> </TD>
  </TR>
  <TR>
    <TD height="19" align="center" bgcolor="#000099"><span class="fontTitle"><font color="#FFFFFF">管理员登录
      </font></span></TD>
  </TR>
  <TR> 
    <TD height="2" align="center" bgcolor="f8f8f8"> <form name=form1 action="checkuser.asp" method="post" target="_top">
        <br>
        <%=message%><br>
        <table width="250" border="0" align="center" cellpadding="5" cellspacing="0">
          <tr> 
            <td width="240" align="center"> 用户名: 
              <input type=text name="userName" size=20 maxlength="20"> </td>
          </tr>
          <tr> 
            <td align="center" height="8"> 密　码: 
              <input type=password name="password" size=20 maxlength="20"> </td>
          </tr>
          <tr> 
            <td align="center" height="2"> <input type=submit name=submit value="登录" >
              　 
              <input type="reset" name="Reset" value="取消"> </td>
          </tr>
        </table>
        <br>
      </form></TD>
  </TR>
</TABLE>
<br>
<table width="500" border="0" cellspacing="0" cellpadding="0" align="center" height="23">
  <tr> 
    <td align="center" bgcolor="f8f8f8"><%=myCopyright%></td>
  </tr>
</table>
</BODY>
</HTML>