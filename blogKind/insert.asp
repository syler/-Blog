<!--#include file="../INC/checkAdmin.asp"-->

<html>
<head>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<title>建立分类</title>
<script language="JavaScript" >
function checkform() {
var name_value
name_value=document.form1.name.value

if (name_value==null  || name_value=="" )
   {
	 alert("类名必须输入！");
	 document.form1.name.focus();
	 return(false); 
   }
}

</script>
</head>
<body onload=document.form1.name.focus() oncontextmenu=window.event.returnValue=false ondragstart=window.event.returnValue=false onsource="event.returnValue=false" BGCOLOR=#D4D0C8 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<form name="form1" method="post" action="insert_action.asp" onsubmit="return checkform()">
  <br>
  <table width="190" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr valign="top"> 
      <td align="center" height="7"> 类　名:<br></td>
      <td align="left" height="7"><input type="text" name="name" size="13"></td>
      </tr>
	  
       <tr> 
      <td align="center" colspan="2"> <br>
        <input type="submit" name="Submit" value="确定">
        <input type="button" name="Submit2" value="取消" onclick=window.close()>
      </td></tr>
    </table>
</form>
</body>
</html>