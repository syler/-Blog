<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->

<%
dim ID
ID=safeRequest("ID",1,0)

set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Friendlinks where ID="&ID
rs.open sqlcmd,conn,1,1,1

%>
<html>
<head>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<title>修改链接</title>
<script language="JavaScript" >
function checkform() {
var name_value
name_value=document.form1.name.value

if (name_value==null  || name_value=="" )
   {
	 alert("名称必须输入！");
	 document.form1.name.focus();
	 return(false); 
   }
}

</script>
</head>
<body onload="document.form1.name.focus()" oncontextmenu="window.event.returnValue=false" ondragstart="window.event.returnValue=false" onsource="event.returnValue=false" BGCOLOR="#D4D0C8" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<form name="form1" method="post" action="edit_action.asp?ID=<%=ID%>" onsubmit="return checkform()">
  <br>
  <table width="280" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr valign="top"> 
      <td width="71" height="14" align="center" valign="middle"> 名称:</td>
      <td width="115" height="14" align="left"> <input type="text" name="name" size="15" maxlength="50" value="<%=rs("name")%>"> 
      </td>
    </tr>
    <tr valign="top"> 
      <td width="71" height="14" align="center" valign="middle">网址:</td>
      <td width="115" height="14" align="left"> <input type="text" name="linkTo" size="30" maxlength="255" value="<%=rs("linkTo")%>"> 
      </td>
    </tr>
       <tr valign="top"> 
      <td align="center" colspan="2"> <br> <input type="submit" name="Submit" value="确定"> 
        <input type="button" name="Submit2" value="取消" onclick=window.close()> 
      </td>
    </tr>
  </table>
</form>

<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>

</body>
</html>