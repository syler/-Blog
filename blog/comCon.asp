<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<%
dim RPP,thisPage
'设置每页显示的记录条数 record per page
RPP=25

'获取由网址?传来的page的值
thisPage=safeRequest("page",1,1)
session("thisPage")=thisPage

%>
<html>
<head>
<title>评论管理</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<script language=javascript type=text/javascript>
<!--
function isDel()
{
return confirm("注意:您真的要删除吗？")
}
function modifyform(thisID){
	document.editcom.thisID.value=thisID;
	document.editcom.name.value=document.getElementById('name'+thisID).innerText;
	document.editcom.email.value=document.getElementById('email'+thisID).innerText;
	document.editcom.IP.value=document.getElementById('ip'+thisID).innerText;
	document.editcom.date.value=document.getElementById('date'+thisID).innerText;
	document.editcom.content.value=document.getElementById('content'+thisID).innerHTML;
	document.editcom.referto.value=document.getElementById('referto'+thisID).innerText;
}
function hideshow(ID,toID){
<%if isObjInstalled("") then%>
	var translate=window.confirm("隐藏评论后是否重新导出html静态页面?");
	window.location="comHide.asp?ID="+ID+"&toID="+toID+"&translate="+translate;
<%else%>
	window.location="comHide.asp?ID="+ID+"&toID="+toID;
<%end if%>
}
//-->
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">


<%
'建立文字信息的RS对象
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Mycomments order by ID desc"
rs.open sqlcmd,conn,1,1,1

if rs.eof then
%>
<br><br><br><br><br><center>[本频道暂无信息]</center>
<%
response.end
end if
%>

<table width="100%" height="22" border="0" align="center" cellpadding="1" cellspacing="0">
  <tr> 
    <td width="100%" height="20" valign="middle" background="../icon/bgblue.gif" class="border1b">
	　<span class="fontTitle">[评论管理]</span> <img src="../icon/arrow.gif">
	
	
	<%call showPages(rs,RPP,thisPage)%>
	</td>
  </tr>
</table>



<table border="0" width="100%" cellpadding="1" cellspacing="0" bgcolor="#ffffff" align="center">
  <tr align="center" bgcolor="#eeeeee" background="../icon/titlebg.gif" height="22">
    <td width="2%" background="../icon/titlebg.gif" class="borderRightTitle">　</td>
    <td width="8%" background="../icon/titlebg.gif" bgcolor="#eeeeee" class="borderRightTitle">
	<span class="fontTitle">姓名</span></td>
    <td width="70%" background="../icon/titlebg.gif" bgcolor="#eeeeee" class="borderRightTitle">
	<span class="fontTitle">内容</span></td>
    <td width="4%" background="../icon/titlebg.gif" bgcolor="#eeeeee" class="borderRightTitle">
	<span class="fontTitle">指向</span></td>
    <td width="4%" background="../icon/titlebg.gif" class="borderRightTitle"  ><span class="fontTitle">隐</span></td>
    <td width="4%" background="../icon/titlebg.gif" class="borderRightTitle"  ><span class="fontTitle">删</span></td>
    <td width="2%" bgcolor="#eeeeee" background="../icon/titlebg.gif"  height="14"> </td>
</tr>

<%
i=1
if not (rs.eof or err) then rs.move (thisPage-1)*RPP
do while not (rs.eof or err)

id=rs("id")
%>

<%if i mod 2=1 then%>
  <tr onClick='modifyform("<%=rs("ID")%>")' onMouseOut="this.style.backgroundColor='#f8f8f8'" onMouseOver="this.style.backgroundColor='#EFF3FF'"  bgcolor="#f8f8f8" align="center" height="22"> 
<%else%>
  <tr onClick='modifyform("<%=rs("ID")%>")' onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#EFF3FF'"  bgcolor="#FFFFFF" align="center" height="22"> 
<%end if%>

<td class="borderRight">　</td>
<td id="name<%=rs("ID")%>" title="<%="email:"&rs("email")%>" class="borderRight"><%=rs("name")%></td>
 <td title="<%="At "&rs("pubDate")&"   From "&rs("IP")%>" class="borderRight" align="left">
	<%=rs("content")%>
	<!--隐藏域开始-->
	<div style="display:none" id="date<%=rs("ID")%>"><%=rs("pubDate")%></div>
	<div style="display:none" id="ip<%=rs("ID")%>"><%=rs("IP")%></div>
	<div style="display:none" id="email<%=rs("ID")%>"><%=rs("email")%></div>
	<div style="display:none" id="content<%=rs("ID")%>"><%=rs("content")%></div>
	<div style="display:none" id="referto<%=rs("ID")%>"><%=rs("toID")%></div>
	<!--隐藏域结束-->
</td>
 <td class="borderRight">
	<a href="../blog/?blogID=<%=rs("toID")%>" target="_blank"><%=rs("toID")%></a>
</td>

    <td class="borderRight">
	<a href="javascript:hideshow(<%=ID%>,<%=rs("toID")%>)" target="_self">
	<%if rs("is_show") then%>
	<img title="隐藏该评论" src="../icon/hideit.gif" border="0">
	<%else%>
	<img title="显示该评论" src="../icon/showit.gif" border="0">
	<%end if%>
	</a> 
	</td>

     <td class="borderRight"><a href="comDel.asp?ID=<%=ID%>" onclick="return isDel()"><img title="删除该评论" src="../icon/delete.gif" width="15" height="15" border="0"></a></td>


<td></td>
</tr>
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
</table><form action="editcom_action.asp" method="post" name="editcom" id="editcom">
<table width="100%" align="center" cellpadding="1" cellspacing="1" bgcolor="#CBE2FC">
<tr>
	<td id="name" bgcolor="#FFFFFF">
	  name:<input type="text" name="name">
</td>
</tr>
<tr>
  <td id="email" bgcolor="#FFFFFF">email:&nbsp;<input type="text" name="email"><input type="hidden" name="thisID"></td>
</tr>
<tr>
  <td id="date" bgcolor="#FFFFFF">date:&nbsp;&nbsp;<input type="text" name="date"></td>
</tr>
<tr>
  <td id="ip" bgcolor="#FFFFFF">IP:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="IP"></td>
</tr>
<tr>
  <td id="referto" bgcolor="#FFFFFF">refer to:&nbsp;<input type="text" name="referto"></td>
</tr>
<tr>
  <td id="content" bgcolor="#FFFFFF">content:&nbsp;<textarea name="content" cols="100" rows="6"></textarea></td>
</tr>
<tr>
  <td align="center" bgcolor="#FFFFFF"><input type="submit" value="修改"></td>
</tr>
</table>    </form>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
        <tr>
          <td align="center" bgcolor="#f8f8f8"><%=myCopyright%></td>
        </tr>
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
</table>
</body>
</html>