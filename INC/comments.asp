<!--#include file="../INC/OLEDBconn.asp"-->
<!--#include file="../INC/site_set.asp"-->
<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=99love,缘梦动力,powerdrm,ASP,ASP.NET,MS-SQL,ACCESS,MYSQL,FLASH,FIREWORKS,DREAMWEAVER,KOF,PHOTOSHOP,asp、.net空间赞助 name=keywords>
<META content=99love.126.com,99LOVE的博客，asp、asp.net、flash学习的地方 name=description>
<META content="99love powerdrm#gmail.com" name=author>
<link href="../INC/css.asp" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkForm(){

if (document.formComment.name.value=="")
	{
	alert("姓名必须填写！");
	document.formComment.name.focus();
	return false;
	}

if (document.formComment.content.value=="")
	{
	alert("评论内容必须填写！");
	document.formComment.content.focus();
	return false;
	}

if (document.formComment.content.value.length>500)
	{
	alert("评论内容不能超过500字！");
	document.formComment.content.focus();
	return false;
	}
return true;
}	
//-->
</SCRIPT>
</head>
<BODY bgColor="transparent" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<BR>
<%
dim comments_IP
dim blogID
blogID=request.queryString("blogID")
if not isnumeric(blogID) or trim(blogID)="" then
	response.write "<span style='font-size:12px'>&nbsp;参数传递出错！<a href='../'>返回首页</a></span>"
	response.end
end if
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Mycomments where toID="&blogID&" and is_show=1 order by ID desc"
rs.open sqlcmd,conn,1,1

do while not rs.eof
%>
<table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="5" cellspacing="0"  >
<tr valign="top">
<td style="word-break:break-all" class="bgMain2"><a name="<%=rs("ID")%>">
<%=replace(rs("content"),vbCrLf,"<br>")%></a>
</td>
</tr>
<tr valign="top">
<td width="100%" height="22" class="bgMain2" >by [<span class="fontTitle"><%
if rs("email")=empty then
response.write rs("name")
else
response.write "<a href=""mailto:"&rs("email")&""">"&rs("name")&"</a>"
end if
%></span>] at <%=rs("pubDate")%> From IP [<%=left(rs("IP"),instrrev(rs("IP"),"."))&"*"%>]</td>
</tr>

</table>
<table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td width="100%" height="1" ></td></tr>
</table>
<%
rs.movenext
loop
rs.close()
set rs=nothing
conn.close()
set conn=nothing
%>

<table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="3" cellspacing="0">
<tr><td height="30" class="bgMain1"><img src="../icon/arrow.gif" border="0">&nbsp;<font color="#0000FF"><b>Post a Comment</b></font></td></tr>
</table>
<table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="3" cellspacing="0">
<form name="formComment" action="../blog/comIns_action.asp" method="post" onsubmit="return checkForm()">
<input type="hidden" name="blogID" value="<%=blogID%>">
  <tr>
    <td>Name：</td>
    <td><input name="name" type="text" size="20" maxlength="50"> 验证码:<input type="text" name="chk_Value" size="6" maxlength="4"><img src="../inc/iGetCode.asp?<%=timer()%>" border=3  style="border-color:#eeeeee"></td>
  </tr>
  <tr>
    <td>Email：</td>
    <td><input name="email" type="text" size="40" maxlength="255"></td>
  </tr>
  <tr>
    <td>Comment：</td>
    <td><textarea name="content" cols="75" rows="8"></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input name="submit" type="submit" value="post the comment">
  </tr>
</table>
</body></html>