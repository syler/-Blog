<!--#include file="Oledbconn.asp"-->
<%	dim rs,sqlcmd,blogID
	blogID=safeRequest("blogID",1,0)
	set rs=server.createobject("adodb.recordset")
	sqlcmd="select * from Contents where ID="&blogID
	rs.open sqlcmd,conn,1,1,1
	
	if rs.eof then 
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	response.redirect ("../public/requesterr.asp")
	end if
	dim blogContent,title,pubdate,hits,hots,linkto,author,bodytitle
	blogContent=rs("content")
	blogContent=replace(blogContent,"<IMG","<img onclick=""javascript:window.open(this.src);"" onload=""javascript:if(this.width>500) this.style.width=500;"" style=""CURSOR: pointer"" ")
	blogContent=replace(blogContent,"{--Break--}","")
	title=rs("title")&" ---- "&blogName&"  "&Mydescription
	bodytitle=rs("title")
	pubdate=formatMyDate(rs("pubDate"),1)
	hits=rs("hits")
	hots=rs("hots")
	linkto=rs("linkto")
	author=rs("author")
	dim arrKey
	arrKey=split(rs("keyword"),",")
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	%>
<html>
<head>
<title><%=title%></title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=99love,缘梦动力,powerdrm,ASP,ASP.NET,MS-SQL,ACCESS,MYSQL,FLASH,FIREWORKS,DREAMWEAVER,KOF,PHOTOSHOP,asp、.net空间赞助 name=keywords>
<META content=99love.126.com,99LOVE的博客，asp、asp.net、flash学习的地方 name=description>
<META content="99love powerdrm#gmail.com" name=author>
<SCRIPT language=JavaScript type=text/javascript>
function fontZoom(size)
{
 document.getElementById('fontzoom').style.fontSize=size+'px'
}
function runEx(cod1)  {
 cod=document.all(cod1)
  var code=cod.value;
  if (code!=""){
  var newwin=window.open('','','');
  newwin.opener = null 
  newwin.document.write(code); 
  newwin.document.close();
		}
}
function ResetFrame(frameID){
	var frameHeight=document.frames(frameID).document.body.scrollHeight;
	document.getElementById(frameID).height=frameHeight;
}
//-->
</SCRIPT>
<link href="../INC/css.asp" rel="stylesheet" type="text/css">
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<iframe onload="ResetFrame('top')" allowTransparency="true" title="head" src="../INC/head.asp" id="top" frameborder="0" scrolling="no" width="775" align="center"></iframe>
<TABLE cellSpacing=0 cellPadding=0 width=775 align=center bgColor=#e7e7e7 border=0>
<TBODY>
<TR>
<TD class=bgLeft vAlign=top width=180>
<iframe onload="ResetFrame('left')" allowTransparency="true" id="left" src="../INC/left.asp" width="180" scrolling="no" frameborder="0"></iframe>
</TD>
<TD width=1 bgColor=#666666></TD>
<TD vAlign=top align=middle width=650>

	  <table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr> 
          <td height="20" class="bgMain1"><font color="#000000">Title</font> 
		  <font color="#0000FF"><b><%=bodytitle%></b></font>
		  at <%=pubDate%>
		  </td>
        </tr>
        <tr> 
          <td align="right" valign="top">字号：[<a href="javascript:fontZoom(16)">大</a>] [<a href="javascript:fontZoom(14)">中</a>] [<a href="javascript:fontZoom(12)">小</a>] &nbsp;&nbsp;</td>
        </tr>
        <tr> 
          <td style="word-break:break-all;font-size:12px" height="200" align="left" valign="top" class="bgMain2" ID="fontZoom"><%=blogContent%></td>
        </tr>
        <tr>
          <td align="left" class="bgMain2">
		  
		  Author：<%=author%><br>
		  Key Words：
		  
		  <%
		  for i=0 to ubound(arrKey)
			  response.write ("<a href=""../blog/?key="&arrKey(i)&"&keykind=keyword"" target=""_self"">")
			  response.write (arrKey(i))
			  response.write ("</a>&nbsp;")
		  next		  
		  %>
		  <br>
		  Link：<a href="<%=linkTo%>" target="_blank"><%=linkTo%></a>

		  </td>
        </tr>
        <tr>
          <td align="right" class="bgMain1"><table border="0" align="left" cellpadding="0" cellspacing="0"><tr><td><font color="#003366">Edit by [admin] At <%=pubDate%></font></td></tr></table> [<%=hits%>]views&nbsp;&nbsp;Comments[<%=hots%>]&nbsp;&nbsp;[<a href="#top"><font color="#0000FF">Go Top</font></a>]&nbsp;</td>
        </tr>
</table>
<iframe onload="ResetFrame('comments')" allowTransparency="true" src="../INC/comments.asp?blogID=<%=blogID%>" scrolling="no" align="left" id="comments" frameborder="0" width="595"></iframe>
<BR></TD></TR></TBODY></TABLE>
<iframe onload="ResetFrame('bottom')" allowTransparency="true" align="center" frameborder="0" id="bottom" scrolling="no" width="775" src="../INC/bottom.asp"></iframe>
</BODY></html>