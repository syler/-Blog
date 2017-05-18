<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file=../INC/OLEDBconn.asp-->
<HTML>
<HEAD>
<TITLE>修改信息</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link rel="stylesheet" href="../INC/style.css" type="text/css">

<script language=Javascript>
<!--
function checkForm(){

if (document.form1.title.value=="")
	{
	alert("标题不能为空！");
	document.form1.title.focus();
	return false;
	}

if (eWebEditor.getHTML()=="")
	{
	alert("内容不能为空！");
	document.form1.doc_html.focus();
	return false;
	}
document.form1.submit();
}	
//-->
</script>

</HEAD>
<BODY onload="document.form1.title.focus()"  BGCOLOR="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
function selectTreeList()
	dim sqlcmd
	dim rs
	dim rsID
	set rs=server.createObject("adodb.recordset")
	sqlcmd="select * from MyblogKind order by orderID"
	rs.open sqlcmd,conn,1,1,1


	if rs.eof then
		exit function
	else
		do while not rs.eof 
			rsID=rs("id")
			rsName=rs("name")
			response.write "<option value='"&rsID&"' "
			if rsID=blogKind then response.write " class='fontStriking' selected"
			response.write ">"
			response.write rsName&"</option>"
			rs.movenext
		loop
	end if
end function


ID=safeRequest("ID",1,0)

set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Contents where ID="&ID
rs.open sqlcmd,conn,1,1,1

blogKind=rs("blogKind")
%>



<form name="form1" action="edit_action.asp?ID=<%=ID%>"  method="post">
  <br>
  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="114" height="7" align="right" valign="middle">所属类别：</td>
      <td width="396" height="7"> <select name="blogKind" size="1">
          <%call selectTreeList()%>
        </select> 
      <td width="144"> 
      <td width="352"> 
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="114" height="12" align="right" valign="middle">标　　题：</td>
      <td height="12" colspan="3"> <input type=text name="title" size="50" maxlength="50"  value="<%=rs("title")%>"> 
      </td>
    </tr>
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="114" height="12" align="right" valign="middle">关 键 字：</td>
      <td height="12" colspan="3"> <input type=text name="keyword" size="50" maxlength="80"  value="<%=rs("keyword")%>">
        多个关键词请用半角逗号“,”隔开</td>
    </tr>
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="114" height="135" align="right" valign="top">内　　容：</td>
      <td height="135" colspan="3">
		<input type="hidden" name="UploadFiles" value="<%=rs("UploadFiles")%>"> 
        <!--<textarea name="content" style="display:none"></textarea> --><input name="content" type="hidden" value="<%=server.HTMLencode(rs("content"))%>">
         <iframe ID='eWebEditor' src='../eWebEditor/ewebeditor.asp?ID=content&savepathfilename=UploadFiles' frameborder=0 scrolling=no width='100%' HEIGHT='400'></iframe> 
      </td>
    </tr>
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="114" align="right" valign="middle">原 作 者：</td>
      <td colspan="3"><input name="author" type=text id="author" size="20" maxlength="50"  value="<%=rs("author")%>">
      </td>
    </tr>
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td align="right" valign="middle">链 接 到：</td>
      <td colspan="3"><input name="linkTo" type=text size="85" maxlength="100"  value="<%=rs("linkTo")%>"></td>
    </tr>
    <tr align="left" valign="top" bgcolor="#F8F8F8"> 
      <td width="114" height="2" align="right" valign="middle">&nbsp;</td>
      <td height="2" colspan="3" valign="top"> <center>
          <input type="button" name="OK" value="确定" onClick="document.form1.content.value=eWebEditor.getHTML();return checkForm()">
          　　 
          <input type="button" name="cancel" value="取消" onclick="window.location.href='control.asp?blogKind=<%=rs("blogKind")%>&page=<%=session("thisPage")%>'">
        </center></td>
    </tr>
  </table>	

</form>
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>