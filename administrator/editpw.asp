<!--#include file="../INC/checkAdmin.asp"-->
<html>
<head>
<title>�޸�����</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<script language="javascript" type="text/javascript">

function checkForm()
{
	with(document.form1)
	{
		if(newpw1.value!=newpw2.value)
		{
		alert("���ѣ�\r\r��������������벻ͬ��")
		newpw1.value = "";
		newpw2.value = "";
		newpw1.focus();
		return false;
		}
	
	
	}
}

</script>
</head>

<BODY onload=document.form1.password.focus() oncontextmenu=window.event.returnValue=false ondragstart=window.event.returnValue=false onsource="event.returnValue=false" BGCOLOR=#D4D0C8 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="form1" action="editpw_action.asp" method="post" onsubmit="return checkForm()">
  <table width="208" border="0" cellspacing="1" cellpadding="4" align="center" height="32">
    <tr align="left" valign="middle"> 
      <td width="41%" align="center"><b></b></td>
      <td width="59%">&nbsp;</td>
    </tr>
    <tr align="left" valign="middle"> 
      <td width="41%" align="center">�������룺 </td>
      <td width="59%"> <input type=password name=password size=16> </td>
    </tr>
    <tr align="left" valign="middle"> 
      <td width="41%" align="center">�������룺</td>
      <td width="59%"> <input type=password name=newpw1 size=16> </td>
    </tr>
    <tr align="left" valign="middle"> 
      <td width="41%" align="center">��֤���룺</td>
      <td width="59%"> <input type=password name=newpw2 size=16> </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td colspan="2"> <input type="submit" name="Submit" value="ȷ��">
        �� 
        <input type="submit" name="Submit2" value="ȡ��" onclick=window.close()> 
      </td>
    </tr>
  </table>
</form>
</body>
</html>
