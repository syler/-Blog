<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../inc/oledbconn.asp"-->
<%'on error resume next

dim RPP,thisPage
'����ÿҳ��ʾ�ļ�¼���� record per page
RPP=20

'��ȡ����ַ?������page��ֵ
thisPage=safeRequest("page",1,1)
%>

<html>
<head>
<title>���Թ���</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<script language=javascript type=text/javascript>
<!--
function isDel()
{
return confirm("ע��:�����Ҫɾ����")
}
//-->
</script>
<style type="text/css">
<!--
a { color: #000000; text-decoration: none}
a:hover { color: #FF3300; text-decoration: underline}
td {
	font-family: Tahoma, "����";
	font-size: 12px;
	text-indent: 10px;
}

-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
'������Ƶ����������Ϣ��RS����
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from GuestBook order by postdatetime desc"
rs.open sqlcmd,conn,1,1,1
%>

<table width="100%" height="22" border="0" align="center" cellpadding="1" cellspacing="0">
  <tr> 
    <td height="20" valign="middle" background="../icon/bgblue.gif" class="border1b"> 
      ��<span class="fontTitle">[<a href="../guestbook/guestbook.htm" target="_blank">���Թ���</a>]</span> 
      <%call showPages(rs,RPP,thisPage)%>
    </td>
  </tr>
</table>




<%
i=1
if not (rs.eof or err) then rs.move (thisPage-1)*RPP
do while not (rs.eof or err)
id=rs("number")
dim str1,str2
str1="<TEXTFORMAT LEADING=""1"">"
str2="</TEXTFORMAT>"
message=replace(replace(replace(rs("message")&"",str1,""),str2,""),"SIZE=","font-size=")
reply=replace(replace(replace(rs("reply")&"",str1,""),str2,""),"SIZE=","font-size=")
%>
<table align=center width="90%" height="117" cellpadding="2" cellspacing="0" class="b_border" bgcolor=#f9f9f9>
  <tr> 
    <td height="36" colspan="2"> <table border=0 cellpadding="1" cellspacing="0" width="100%">
        <tr  bgcolor="#E7E7E7"> 
          <td width="141" height="20">[����]<%=rs("username")%> </td>
          <td width="766" align="left"> [��վ]<%=rs("url")%> �� [QQ]<%=rs("icq")%> 
            �� [Email]<a href=mailto:<%=rs("email")%>><%=rs("email")%></a>
        <tr>
		<td colspan="2">[����]<font color="#003366"><%=rs("subject")%></font></td>
		</tr>
		</table>
  <tr> 
    <td style="word-break:break-all" colspan="2" valign="top"><font color="#000000">[��������] </font>����</td>
  <tr>
    <td style="word-break:break-all" colspan="2" valign="top"><%=message%> </td>
  <tr> 
    <td style="word-break:break-all" colspan="2"><font color="#000000">[�ظ�]</font>�� 
  <tr>
    <td style="word-break:break-all" colspan="2"><%=reply%>  
  <tr> 
    <td width="70%" height="27" align="left">����:<%=rs("postdatetime")%> </td>
    <td width="30%" align="center">
      �� <a href=delete.asp?id=<%=id%> onClick="return isDel()"><img src="../icon/delete.gif" width="15" height="15" border="0" alt="ɾ������"></a> 
      �� <a href=hide_show.asp?id=<%=id%>> 
      <%if rs("is_show") then%>
      <img src="../icon/hideit.gif" width="15" height="15" border="0" title="����"> 
      <%else%>
      <img src="../icon/showit.gif" width="15" height="15" border="0" title="��ʾ"> 
      <%end if%>
      </a> 
  
</table>		
				 
<br>
<br>
<%
i=i+1
if i>RPP then exit do
rs.moveNext

loop

rs.close
set rs=nothing
conn.close
set conn=nothing
%>

</body>
</html>