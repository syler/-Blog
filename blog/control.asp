<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<%
dim RPP,thisPage,blogKind
dim isObjIn
isObjIn=IsObjInstalled("")
'设置每页显示的记录条数 record per page
RPP=25

'获取由网址?传来的page的值
thisPage=safeRequest("page",1,1)
session("thisPage")=thisPage

'获取文章类别
blogKind=safeRequest("blogKind",1,0)

set rs=server.createobject("adodb.recordset")
sqlcmd="select name from MyblogKind where ID="&blogKind
rs.open sqlcmd,conn,1,1,1
if not rs.eof then kindName=rs("name")
rs.close
set rs=nothing
%>
<html>
<head>
<title>文章管理</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">
<script language=javascript type=text/javascript>
<!--
function isDel()
{
return confirm("注意:删除文章将同时删除该文章的所有插图.您真的要删除吗？")
}
//-->
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
<center>
<%
if blogKind=0 then
%>
<br><br><br><br><br><center>[请从左边选择一个类别。]</center>
<%
response.end
end if
%>
</center>

<%
'建立文字信息的RS对象
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Contents where blogKind="&blogKind&" order by id desc"
rs.open sqlcmd,conn,1,1,1

if rs.eof then
%>
<br><br><br><br><br><center>[本频道暂无信息,现在<a href="insert.asp?blogKind=<%=blogKind%>" target="_self">新建</a>]</center>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
response.end
end if
%>

<table width="100%" height="22" border="0" align="center" cellpadding="1" cellspacing="0">
  <tr> 
    <td width="90%" height="20" valign="middle" background="../icon/bgblue.gif" class="border1b">
	　<span class="fontTitle">[<%=kindName%>]</span> <img src="../icon/arrow.gif">
	
	
	<%call showPages(rs,RPP,thisPage)%>
	
	</td>
    <td width="10%" align="center" valign="middle"  background="../icon/bgblue.gif">
      <a href="insert.asp?blogKind=<%=blogKind%>" target="_self">[新建]</a>&nbsp;</td>
  </tr>
</table>



<table border="0" width="100%" cellpadding="1" cellspacing="0" bgcolor="#ffffff" align="center">
  <tr align="center" bgcolor="#eeeeee" background="../icon/titlebg.gif" height="22">
    <td width="2%" background="../icon/titlebg.gif" class="borderRightTitle">　</td>
    <td width="37%" background="../icon/titlebg.gif" bgcolor="#eeeeee" class="borderRightTitle">
	<span class="fontTitle">标　　题</span></td>
    <td width="20%" background="../icon/titlebg.gif" bgcolor="#eeeeee" class="borderRightTitle">
	<span class="fontTitle">作者</span></td>
    <td width="8%" colspan="2" background="../icon/titlebg.gif" class="borderRightTitle" ><span class="fontTitle">小　图</span></td>
    <td width="8%" colspan="2" background="../icon/titlebg.gif" class="borderRightTitle" ><span class="fontTitle">大　图</span></td>
    <td width="4%" background="../icon/titlebg.gif" class="borderRightTitle"  ><span class="fontTitle">隐</span></td>
    <td width="4%" background="../icon/titlebg.gif" class="borderRightTitle"  ><span class="fontTitle">荐</span></td>
    <td width="4%" background="../icon/titlebg.gif" class="borderRightTitle"  ><span class="fontTitle">改</span></td>
	<td width="4%" background="../icon/titlebg.gif" class="borderRightTitle"  ><span class="fontTitle">导</span></td>
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
  <tr onMouseOut="this.style.backgroundColor='#f8f8f8'" onMouseOver="this.style.backgroundColor='#EFF3FF'"  bgcolor="#f8f8f8" align="center" height="22"> 
<%else%>
  <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#EFF3FF'"  bgcolor="#FFFFFF" align="center" height="22"> 
<%end if%>

<td class="borderRight">　</td>
    <td class="borderRight">

	<a href="default.asp?blogID=<%=rs("ID")%>" target="_blank">
	<%=rs("title")%>
	</a>

	</td>
    <td class="borderRight"><%=rs("author")%></td>


    <td class="borderRight"> 
      <%if isObjIn then
		if rs("smallImg")="nothing.gif" then%>
			<img src="../icon/ImgAdd.gif" title="添加小图片" style="cursor:hand" onClick="window.open('addPicture.asp?type=smallImg&id=<%=id%>','addPicture','scrollbars=yes,width=400,height=80')" align="absmiddle"> 
		<%else%>
			<img src="../icon/ImgMod.gif" title="修改小图片" style="cursor:hand" onClick="window.open('addPicture.asp?type=smallImg&id=<%=id%>','addPicture','scrollbars=yes,width=400,height=80')" align="absmiddle"> 
		<%end if
	else%>
		<img src="../icon/ImgAdd.gif" title="fso不支持！" align="absmiddle"> 
	<%end if%>
    </td>
    <td class="borderRight">
      <%if rs("smallImg")="nothing.gif" then%>
	<img <%if isObjIn=false then response.write "title='fso不支持'"%> src="../icon/ImgDel2.gif">
      <%else
			if isObjIn then'检查fso支持%>
				<a href="delPicture.asp?id=<%=rs("id")%>&type=smallImg"><img src="../icon/ImgDel.gif" title="删除小图片" border="0"></a> 
			<%else%><img src="../icon/ImgDel.gif" title="不支持FSO，无法操作" border="0">
			<%end if
      end if %>
	</td>
    <td class="borderRight"> 
      <%if isObjIn then
		 if rs("bigImg")="nothing.gif" then%>
			<img src="../icon/ImgAdd.gif"  title="添加大图片" style="cursor:hand" onClick="window.open('addPicture.asp?type=bigImg&id=<%=id%>','addPicture','scrollbars=yes,width=400,height=80')" align="absmiddle"> 
		<%else%>
			<img src="../icon/ImgMod.gif" title="修改大图片" style="cursor:hand" onClick="window.open('addPicture.asp?type=bigImg&id=<%=id%>','addPicture','scrollbars=yes,width=400,height=80')" align="absmiddle"> 
		<%end if%>
	 <%else%> <img src="../icon/ImgAdd.gif"  title="fso不支持！" align="absmiddle"> <%end if%>
     </td>
    <td class="borderRight">
      <%if rs("bigImg")="nothing.gif" then%>
	<img <%if isObjIn=false then response.write "title='fso不支持'"%> src="../icon/ImgDel2.gif">
      <%else 
			if isObjIn then'检查fso支持%>
				<a href="delPicture.asp?id=<%=rs("id")%>&type=bigImg"><img src="../icon/ImgDel.gif" title="删除大图片" border="0"></a> 
      <%	else
				response.write "<img src='../icon/ImgDel.gif' title='不支持fso，无法删除大图片' border='0'>"
			end if
	  end if %>
	</td>
	
    <td class="borderRight">
	<a href="hide_show.asp?id=<%=id%>" target="_self">
	<%if rs("is_show") then%>
	<img title="隐藏该文章" src="../icon/hideit.gif" border="0">
	<%else%>
	<img title="显示该文章" src="../icon/showit.gif" border="0">
	<%end if%>
	</a> 
	</td>
    <td class="borderRight"><a href="com_com.asp?id=<%=id%>" target="_self"> 
      <%if rs("is_good") then%>
      <img title="取消推荐本文" src="../icon/nocommend.gif" border="0">
      <%else%>
      <img title="推荐本文" src="../icon/commend.gif" border="0">
      <%end if%>
      </a> 
	  </td>
    <td class="borderRight"><a href="edit.asp?ID=<%=ID%>" target="_self" ><img src="../icon/edit.gif" title="编辑该文章" width="15" height="15" border="0"></a></td>
	<%
	if isObjIn then
		dim ishtml,htmlpath
		htmlpath=server.mappath("../html/"&ID&".html")
		set ishtml=server.createobject("scripting.filesystemobject")
		if ishtml.fileexists(htmlpath)=true then%>
			<td class="borderRight"><a href="fso.asp?url=../inc/viewFile.asp?blogID=<%=ID%>" target="_self" ><img title="更新html静态页面" src="../icon/html.gif" width="15" height="15" border="0"></a></td>
		<%else%>
			<td class="borderRight"><a href="fso.asp?url=../inc/viewFile.asp?blogID=<%=ID%>" target="_self" ><img title="导出html静态页面" src="../icon/nohtml.gif" width="15" height="15" border="0"></a></td>
		<%end if
		set ishtml=nothing
	else%>
		<td class="borderRight"><img title="不支持fso，导不出html静态页面" src="../icon/nohtml.gif" width="15" height="15" border="0"></td>
	<%end if%>
    <td class="borderRight"><a href="delete.asp?ID=<%=ID%>" onclick="return isDel()"><img src="../icon/delete.gif" title="删除该文章" width="15" height="15" border="0"></a></td>


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

</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
        <tr>
          <td align="center" bgcolor="#f8f8f8"><%=myCopyright%></td>
        </tr>
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
</table>
</body>
</html>