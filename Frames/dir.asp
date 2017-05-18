<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<HTML>
<HEAD>
<TITLE>eBlog</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../INC/style.css" type="text/css" rel="stylesheet">
<style type="text/css">
<!--
body {overflow-x:hidden;overflow-y:auto}
.counter {height:18;BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 9px; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: transparent; TEXT-ALIGN: center}
-->
</style>

<SCRIPT language=JavaScript>
function expands(expid,picid)
{
  //expid="confriend"
  //alert(expid);
  //if(this.document.all.confriend.style.display=="none")
  if(this.document.all[expid].style.display=="none")
  { 
    this.document.all[expid].style.display="block";
    this.document.all[picid].src="../icon/minusbottom.gif"
  }
  else
  {
    this.document.all[expid].style.display="none";
    this.document.all[picid].src="../icon/plusbottom.gif";
  }
}

function turnit(ss,ii,bb)
{
 if (ss.style.display=="none") 
  {ss.style.display="";
   ii.src="../icon/fopen.gif";
   bb.src="../icon/minuMid.gif";
  }
 else
  {ss.style.display="none"; 
   ii.src="../icon/folder.gif";
   bb.src="../icon/plusMid.gif";
  }
}

function turnitTop(ss,ii,bb)
{
 if (ss.style.display=="none") 
  {ss.style.display="";
   ii.src="../icon/fopen.gif";
   bb.src="../icon/minuTop.gif";
  }
 else
  {ss.style.display="none"; 
   ii.src="../icon/folder.gif";
   bb.src="../icon/plusTop.gif";
  }
}

function turnitBottom(ss,ii,bb)
{
 if (ss.style.display=="none") 
  {ss.style.display="";
   ii.src="../icon/fopen.gif";
   bb.src="../icon/minusBottom.gif";
  }
 else
  {ss.style.display="none"; 
   ii.src="../icon/folder.gif";
   bb.src="../icon/plusBottom.gif";
  }
}
</SCRIPT>


<BODY  bgColor="#FFFFFF" background="../icon/bgleft.gif" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<table width="140" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="15"></td>
    <td width="125"> 
	
	
<table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
<tr>
<td height="5"></td>
</tr>
</table>

<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#FF9900">
<FORM id=frmTimer name=frmTimer action="">
<tr>
<td bgcolor="#FFCC00">
<INPUT id="timer" type="hidden" value="<%=session.timeout%>" name="timer" zvalue="1">
用户：<%=session("uname")%> <br>
超时：<INPUT class="counter" id="clock" onmouseover="javascript:window.status='您的会话将在此时间后被自动注销，如果有重要数据请及时保存，以免当前操作丢失！'" onmouseout="javascript:window.status=''" readOnly size="8">
</td>
</tr>
</FORM>
<SCRIPT src="../INC/timer.js" type=text/javascript></SCRIPT>
<SCRIPT language=javascript>
window.onload = function() { startTimer(); }
</SCRIPT>
</table> 
	
	
	
	
	
	
      <table cellspacing="0" cellpadding="0" width="130" border="0" align="center">
        <tbody> 
        <tr> 
            <td width="129" height="28" align="left"> <b><a href="javascript:window.location.reload(true)" target="_self" title="刷新菜单栏">- 
              |请从这里开始|</a></b></td>
        </tr>







<!--- 2 START --->
        <tr>
            <td language=JScript onMouseUp=turnitTop(Content2,Img2,tag2); 
    style="CURSOR: hand" valign=center width=129 colspan=3><img src="../icon/plusTop.gif" width=18 
      height=22 align="absmiddle" id=tag2><img 
      src="../icon/folder.gif" align="absmiddle" id=Img2><font color=#000000>[内容管理]</font></td>
        </tr>
        <tr> 
          <td id=Content2 style="DISPLAY: none" valign=center width=129 colspan=4>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 



<%
'建立文字类别的RS对象
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from MyblogKind order by orderID"
rs.open sqlcmd,conn,1,1,1
i=1
do while not rs.eof
%>

				<tr> 
                    <td valign="center" colspan="2"><img src="../icon/line.gif" width="18" border="0" align="absmiddle"><img src="../icon/join.gif" width="18" height="22" border="0" align="absmiddle"> 
                      <a class=menu title="<%=rs("name")%>" href="../blog/control.asp?blogKind=<%=rs("ID")%>"  target=FrmRightMain>[<%=rs("name")%>]</a> 
                    </td>
				</tr>

 <%
rs.movenext
loop
rs.close
set rs=nothing
%>


              </tbody>
            </table>
          </td>
        </tr>
        <!--- 2 END --->




        <!--- 1 START--->
        <tr> 
            <td language=JScript onMouseUp=turnit(Content1,Img1,tag1); 
    style="CURSOR: hand" valign=center width=129 colspan=3><img src="../icon/plusMid.gif" width=18 
      height=22 align="absmiddle" id=tag1><img 
      src="../icon/folder.gif" align="absmiddle" id=Img1><font color=#000000>[其它管理]</font></td>
        </tr>
        <tr> 
          <td id=Content1 style="DISPLAY: none" valign=center width=129 colspan=4> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 

              <tr> 
                    <td valign="center" colspan="2"><img src="../icon/line.gif" width="18" border="0" align="absmiddle"><img src="../icon/join.gif" width="18" height="22" border="0" align="absmiddle"> 
                      <a class=menu 
            title=评论管理 href="../blog/comCon.asp"  target=FrmRightMain>评论管理</a> 
                    </td>
              </tr>

              <tr> 
                    <td valign="center" colspan="2"><img src="../icon/line.gif" width="18" border="0" align="absmiddle"><img src="../icon/join.gif" width="18" height="22" border="0" align="absmiddle"> 
                      <a class=menu 
            title=链接管理 href="../links/control.asp"  target=FrmRightMain>链接管理</a> 
                    </td>
              </tr>

              <tr> 
                    <td valign="center" colspan="2"><img src="../icon/line.gif" width="18" border="0" align="absmiddle"><img src="../icon/join.gif" width="18" height="22" border="0" align="absmiddle"> 
                      <a class=menu 
            title=留言管理 href="../gbook/control.asp"  target=FrmRightMain>留言管理</a> 
                    </td>
              </tr>

              </tbody>
            </table>
          </td>
        </tr>
         <!--- 1 END --->



            <!--- 8 START --->
        <tr> 
            <td language=JScript onMouseUp=turnitBottom(Content8,Img8,tag8); 
    style="CURSOR: hand" valign=center width=129 colspan=3><img src="../icon/plusBottom.gif" width=18 
      height=22 align="absmiddle" id=tag8><img 
      src="../icon/folder.gif" align="absmiddle" id=Img8><font color=#000000>[系统管理]</font></td>
        </tr>
        <tr> 
          <td id=Content8 style="DISPLAY: none" valign=center width=129 colspan=4> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                    <td valign=center colspan=2><img 
            src="../icon/blank.gif" width=18 height=22 border=0 align="absmiddle"><img 
            src="../icon/join.gif" width=18 height=22 border=0 align="absmiddle"> 
                      <a class=menu 
            title=对网站频道的管理 href="../blogKind/control.asp" 
            target=FrmRightMain>Blog分类管理</a> </td>
              </tr>

              <tr> 
                    <td valign=center colspan=2><img 
            src="../icon/blank.gif" width=18 height=22 border=0 align="absmiddle"><img 
            src="../icon/join.gif" width=18 height=22 border=0 align="absmiddle"> 
                      <a class=menu 
            title=用户修改个人资料及密码 
            href="../administrator/edit.asp" 
            target=FrmRightMain>个人资料</a> </td>
              </tr>
              <tr> 
                    <td height="18" colspan=2 valign=center><img 
            src="../icon/blank.gif" width=18 height=22 border=0 align="absmiddle"><img 
            src="../icon/join.gif" width=18 height=22 border=0 align="absmiddle"> 
                      <a class=menu title=Blog配置 href="../administrator/blogconfig.asp" 
            target=FrmRightMain>Blog配置</a> </td>
              </tr>

              <tr> 
                    <td valign=center colspan=2><img 
            src="../icon/blank.gif" width=18 height=22 border=0 align="absmiddle"><img 
            src="../icon/joinbottom.gif" width=18 height=22 border=0 align="absmiddle"> 
                      <a class=menu 
            title=登录日志 href="../administrator/loginLog.asp" 
            target=FrmRightMain>登录日志</a> </td>
              </tr>

              </tbody>
            </table>
          </td>
        </tr>
        <!--- 8 END --->




        </tbody>
      </table>
    </td>
  </tr>
</table>

</BODY></HTML>
<%
conn.close
set conn=nothing
%>