<!--#include file="../INC/checkAdmin.asp"-->
<html>
<head>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<title>清空日志</title>
</head>
<BODY onload=document.form1.password.focus() oncontextmenu=window.event.returnValue=false ondragstart=window.event.returnValue=false onsource="event.returnValue=false" BGCOLOR=#D4D0C8 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" method="post" action="delLog_action.asp">
  <br>
  <table width="138" border="0" align="center" cellpadding="3" cellspacing="1">
    <tr align="left" valign="top"> 
      <td width="54" height="28" align="center">密码:</td>
      <td width="69"> 
        <input name="password" type="password" size="10" maxlength="20">
      </td>
    </tr>
    <tr align="left" valign="top"> 
      <td colspan="2" align="center"> 
        <input type="submit" name="Submit" value="确定">
        <input type="submit" name="Submit2" value="取消" onclick=window.close()>
      </td>
    </tr>
  </table>
</form>
</body>
</html>