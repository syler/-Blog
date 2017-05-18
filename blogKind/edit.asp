<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp -->

<%
dim ID
ID=safeRequest("ID",1,0)

set rs=server.createobject("adodb.recordset")
sqlcmd="select * from MyblogKind where ID="&ID
rs.open sqlcmd,conn,1,1,1

%>
<html>
<head>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<title>修改分类</title>
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
<body onload="document.form1.name.focus()" oncontextmenu="window.event.returnValue=false" ondragstart="window.event.returnValue=false" onsource="event.returnValue=false" BGCOLOR="#D4D0C8" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<form name="form1" method="post" action="edit_action.asp?id=<%=id%>" onsubmit="return checkform()">
  <br>
  <table width="180" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr valign="top"> 
      <td width="71" height="14" align="center" valign="middle"> 类　名:</td>
      <td width="115" height="14" align="left"> <input type="text" name="name" size="13" value="<%=rs("name")%>"> 
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