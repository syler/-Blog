<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->

<html>
<head>
<title>�ϴ�ͼƬ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<script language="javascript" type="text/javascript">

function checkForm()
{

with(document.form1)
{


//--------------4

checkpic=file1.value


if (checkpic=="")
{ alert("��ʾ:\r����û��ѡ���ϴ����ļ���"); 
return(false); 
} 



if (checkpic.length > 5)
{ picOK=false; i = checkpic.length-1; ch = checkpic.charAt(i);
if ( ch == "g" || ch == "G" )
{ i = i-1; ch = checkpic.charAt(i);
if ( ch == "p" || ch == "P" )
{ i = i-1; ch = checkpic.charAt(i);
if ( ch == "j" || ch == "J" )
{ i = i-1; ch = checkpic.charAt(i);
if ( ch == ".")
{ picOK=true; }
} } }
else
{
if ( ch == "f" || ch == "F" )
{ i = i-1; ch = checkpic.charAt(i);
if ( ch == "i" || ch == "I" )
{ i = i-1; ch = checkpic.charAt(i);
if ( ch == "g" || ch == "G" )
{ i = i-1; ch = checkpic.charAt(i);
if ( ch == ".")
{ picOK=true; }
} } 
}
if (picOK==false)
{ alert("��ʾ:\rֻ���ϴ�JPG �� GIF ��ʽ���ļ���"); 
return(false); 
} } } 
//--------------4

}
}

</script>



</head>

<body bgcolor="#f5f5f5" text="#000000" leftmargin="0" topmargin="0">
<form method="post" action="addPic_action.asp" name="form1" enctype="multipart/form-data" onsubmit="return checkForm()">
  <table width="100%" border="0" bordercolordark=#9CC7EF bordercolorlight=#145AA0 cellspacing="1" cellpadding="4" align="center">
  <tr> 
    <td height="26" bgcolor="#E1F0FF"> 
      <div align="center" class="fontStriking
">�ϴ�ͼƬ</div>
    </td>
  </tr>
  <tr>
    <td height="29" bgcolor="#f5f5f5"> 
      <div align="center">
          <input type="hidden" name="type" value="<%=Request("type")%>">
          <input type="hidden" name="id" value="<%=Request("id")%>">
          <input type="file" name="file1" size="30">
        <input type="submit" name="Submit" value="�ϴ�">
      </div>
    </td>
  </tr>
  <tr>
    <td height="26" bgcolor="#E1F0FF"> 
      <div align="center">
        <input type="button" name="Submit2" value="  ��  ��  ��  ��  ��  " onClick="Javascript:window.close()">
      </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
