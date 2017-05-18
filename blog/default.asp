&nbsp;<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%response.Buffer=true%>
<%
dim timeStart
timeStart=timer
%>

<!--#include file="../INC/OLEDBconn.asp"-->
<!--#include file="../INC/site_set.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta content="99love,缘梦动力,powerdrm,ASP,ASP.NET,MS-SQL,ACCESS,MYSQL,FLASH,FIREWORKS,DREAMWEAVER,KOF,PHOTOSHOP,asp、.net空间赞助" name=keywords>
<meta content="99love.126.com,99LOVE的博客，asp、asp.net、flash学习的地方" name=description>
<meta name=author content="99love powerdrm#gmail.com">
<script language="JavaScript" type="text/javascript">
function fontZoom(size)
{
 document.getElementById('fontzoom').style.fontSize=size+'px'
}
</script>

<script language=Javascript>
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

  function adminLogin()
  	{
		document.administratorLogin.submit();
		document.administratorLogin.reset();
		return false;
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
//-->
</script>
<link href="../INC/css.asp" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="775" height="190" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#E7E7E7">
  <tr> 
    <td colspan="2" bgcolor="#88B8FF" class="bgTop1">&nbsp; </td>
  </tr>
  <tr>
    <td height="20" align="left" class="bgTop2">&nbsp;&nbsp;&nbsp;<a href="../" target="_self" class="fontNav">Home</a> 
      | 
      <%
		set rs=server.createobject("adodb.recordset")
		sqlcmd="select ID,name from MyblogKind order by orderID"
		rs.open sqlcmd,conn,1,1,1
		i=1
		do while not rs.eof
		%>
      <a href="../blog/?blogKind=<%=rs("ID")%>" target="_self" class="fontNav"><%=rs("name")%></a> 
      | 
      <%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
      <a href="../guestbook/guestbook.htm" target="_self" class="fontNav">GuestBook</a> </td>
	  <td height="20" width="250" align="right" class="bgTop2"></td>
  </tr>
  <tr height="6" >
    <td colspan="2" height="6" class="bgTop3"></td>
  </tr>
</table>

<table bgcolor="#E7E7E7" width="775" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="180"  valign="top" class="bgLeft">
      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="4" cellspacing="0">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;Date&Time</td>
        </tr>
      </table>
	  

<!--日历开始-->
<%
'背景色设置
dayColor="#f8f8f8"
nodayColor="#f8f8f8"
thisdayColor="#3366FF"
weekColor="#f5f5ee"
titleColor="#e5e5e5"


' 要调用的函数声明
'根据年份及月份得到每月的总天数
Function GetDaysInMonth(iMonth, iYear)
	Select Case iMonth
		Case 1, 3, 5, 7, 8, 10, 12
			GetDaysInMonth = 31
		Case 4, 6, 9, 11
			GetDaysInMonth = 30
		Case 2
			If IsDate("February 29, " & iYear) Then
				GetDaysInMonth = 29
			Else
				GetDaysInMonth = 28
			End If
	End Select
End Function
'得到一个月开始的日期.
Function GetWeekdayMonthStartsOn(dAnyDayInTheMonth)
	Dim dTemp
	dTemp = DateAdd("d", -(Day(dAnyDayInTheMonth) - 1), dAnyDayInTheMonth)
	GetWeekdayMonthStartsOn = WeekDay(dTemp)
End Function
'得到当前一个月的上一个月.
Function SubtractOneMonth(dDate)
	SubtractOneMonth = DateAdd("m", -1, dDate)
End Function
'得到当前一个月的下一个月.
Function AddOneMonth(dDate)
	AddOneMonth = DateAdd("m", 1, dDate)
End Function
' 函数声明结束

Dim dDate     ' 日历显示的日期
Dim iDOW      ' 每一月开始的日期
Dim iCurrent  ' 当前日期
Dim iPosition ' 表格中的当前位置


' 得到选择的日期并检查日期的合法性
If IsDate(Request.QueryString("date")) Then
	dDate = CDate(Request.QueryString("date"))
Else
	If IsDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year")) Then
		dDate = CDate(Request.QueryString("month") & "-" & Request.QueryString("day") & "-" & Request.QueryString("year"))
	Else
		dDate = Date()
	
		If Len(Request.QueryString("month")) <> 0 Or Len(Request.QueryString("day")) <> 0 Or Len(Request.QueryString("year")) <> 0 Or Len(Request.QueryString("date")) <> 0 Then
			Response.Write "您所选择的日期格式不正确，系统会使用当前日期.<BR><BR>"
		End If
	
	End If
End If

'得到日期后我们先得到这个月的天数及这个月的起始日期.
iDIM = GetDaysInMonth(Month(dDate), Year(dDate))
iDOW = GetWeekdayMonthStartsOn(dDate)

%>
      <table border="0" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF" width="180">
        <tr bgcolor="<%=titleColor%>"> 
          <td height="23" colspan="7" align="center"> <table bgcolor="#E7E7E7" border="0" cellpadding="1" cellspacing="0" width="100%">
              <tr> 
                <td width="16%" height="21" align="center"><a href="../blog/?q=month&date=<%= SubtractOneMonth(dDate) %>" target="_self" style='font-family:"webdings"'>7</a></td>
                <td width="68%" align="center"><font color="#0000FF"><b>[<%=formatMyDate(dDate,4)%>]</b></font></td>
                <td width="16%" align="center"><a href="../blog/?q=month&date=<%= AddOneMonth(dDate) %>" target="_self" style='font-family:"webdings"'>8</a></td>
              </tr>
            </table></td>
        </tr>
        <tr bgcolor="<%=weekColor%>"> 
          <td width="14%" align="center"><font
                color="#FF0000">日</font></td>
          <td width="14%" align="center"><font
                color="330066">一</font></td>
          <td width="14%" align="center"><font
                color="330066">二</font></td>
          <td width="14%" align="center"><font
                color="330066">三</font></td>
          <td width="14%" align="center"><font
                color="330066">四</font></td>
          <td width="14%" align="center"><font
                color="#330066">五</font></td>
          <td width="14%" align="center"><font
                color="#FF0000">六</font></td>
        </tr>
        <%
' 如果这个月的起始日期不是周日的话就加空的单元.
If iDOW <> 1 Then
	Response.Write  "<TR>" 
	iPosition = 1
	Do While iPosition < iDOW
		Response.Write "<TD bgcolor='"&nodayColor&"'>&nbsp;</TD>" 
		iPosition = iPosition + 1
	Loop
End If

' 绘制这个月的日历
iCurrent = 1
iPosition = iDOW
Do While iCurrent <= iDIM
	' 如果是一行的开头就使用 TR 标记
	If iPosition = 1 Then
		Response.Write  "<TR>" 
	End If
	
	' 如果这一天是我们选择的日期就高亮度显示该日期.
	If iCurrent = Day(dDate) Then
		Response.Write "<TD BGCOLOR='"&thisdayColor&"'>" 
		className="calendarToDay"
	Else
		Response.Write  "<TD bgcolor='"&dayColor&"'>"
		className="calendarDay"
	End If
	
	set rs=server.createobject("adodb.recordset")
	sqlcmd="select pubDate from Contents where is_show=1 and year(pubDate)="&year(dDate)&" and  month(pubDate)="&month(dDate)&" and  day(pubDate)="&iCurrent&" "
	rs.open sqlcmd,conn,1,1,1
	if not rs.eof then 
	response.write ("<a href=""../blog/?date=" & Month(dDate) & "-" & iCurrent & "-" & Year(dDate) & """ target=""_self"" class="""&className&""" >" & iCurrent & "<img src=""../icon/biezhen.gif"" border=""0""></A>")
	else
	response.write ("<span class="""&className&""" >" & iCurrent & "</span>")
	end if
	rs.close
	set rs=nothing
	response.write ("</TD>")
	
	' 如果满一周的话表格就另起一行
	If iPosition = 7 Then
		Response.Write  "</TR>" 
		iPosition = 0
	End If
	
	iCurrent = iCurrent + 1
	iPosition = iPosition + 1
Loop

' 如果一个月不是以周六结束则加上相应的空单元.
If iPosition <> 1 Then
	Do While iPosition <= 7
		Response.Write  "<TD bgcolor='"&nodayColor&"'>&nbsp;</TD>" 
		iPosition = iPosition + 1
	Loop
	Response.Write  "</TR>" 
End If
%>
      </table>
      <!--日历结束-->
      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="4" cellspacing="0">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;<b>Categorise</b></td>
        </tr>
      </table> 
	  
      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="2" cellspacing="1">
	  	<tr>
			<td bgcolor="#F8F8F8" class="fontnav">@<a href="../"><b>Home</b></a></td>
		</tr>
	  	<tr>
			<td bgcolor="#F8F8F8" class="fontnav">@<a href="../about"><b>About Me</b></a></td>
		</tr>		
        <%
		set rs=server.createobject("adodb.recordset")
		sqlcmd="select ID,name from MyblogKind order by orderID"
		rs.open sqlcmd,conn,1,1,1
		i=1
		do while not rs.eof
		%>
        <tr>                     
          <td bgcolor="#F8F8F8" class="fontnav">@<a href="../blog/?blogKind=<%=rs("ID")%>" target="_self"><b><%=rs("name")%></b></a>&nbsp;&nbsp;<a href="../blog/rss.asp?kind=<%=rs("ID")%>" target="_blank"><img src="../icon/xml.gif" width="20" height="11" border="0"></a></td>
		</tr>

		<%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
        <tr>                     
          <td bgcolor="#F8F8F8" class="fontnav">@<a href="../guestbook/guestbook.htm" target="_self"><b>GuestBook</b></a></td>
		</tr>

	  </table>	  
	   		<table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;Blog Info:</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="left" valign="baseline" bgcolor="#FFFFFF" class="fontnav">Total Diary:<%=blogs%></td>
          </tr>
        <tr align="right" bgcolor="#FFFFFF">
          <td align="left" class="fontnav"> Comments: <%=blogComment%></td>
        </tr>
        <tr align="right" bgcolor="#FFFFFF">
          <td align="left" class="fontnav"> Guestbook Records:<%=blogGbook%> </td>
        </tr>		
        <tr align="right" bgcolor="#FFFFFF">
          <td align="left" class="fontnav"> Reviews:<%=blogHits%> </td>
        </tr>		
      </table>
	  <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="4" cellspacing="0">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;Search In Blog</td>
        </tr>
      </table>

      <table bgcolor="#E7E7E7" width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
        <form name="form1" action="../blog/" methed="get" target="_top">
          <tr bgcolor="f8f8f8"> 
            <td width="62" align="right"><input type="text" name="key" size="8" maxlength="30" value="<%=request.querystring("key")%>"></td>
            <td width="68"><select name="keykind" size="1">
                <option value="title" <%if request.querystring("keykind")="title" then response.write("selected")%>>Title</option>
                <option value="keyword" <%if request.querystring("keykind")="keyword" then response.write("selected")%>>Key Words</option>
                <option value="content" <%if request.querystring("keykind")="content" then response.write("selected")%>>Content</option>
              </select> </td>
            <td width="30"><input name="imageField" type="image" src="../icon/search.gif" title="搜索" width="18" height="19" border="0" class="radio"></td>
          </tr>
        </form>
      </table>  

	  <form name="administratorLogin" method="post" action="../administrator/checkuser.asp" target="_blank" onSubmit="return adminLogin()">
      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td colspan="2" class="titleLeft">&nbsp;&nbsp; Login</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="20" align="center" valign="baseline" bgcolor="#FFFFFF" class="fontnav">Name:</td>
          <td height="20" class="fontnav">
            <input name="userName" type="text" id="userName" size="18">
			</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td height="20" align="center" valign="baseline" class="fontnav">Pswd:</td>
          <td height="20" class="fontnav"><input name="password" type="password" id="password" size="18"></td>
        </tr>
        <tr align="right" bgcolor="#FFFFFF">
          <td colspan="2" class="fontnav"><input name="Rset" type="reset" id="Rset" value="Reset" class="button">&nbsp;&nbsp;            <input type="submit" name="Submit2" value="Login" class="button"></td>
          </tr>
      </table>
      </form>  

	  	<table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;Top 10 Comments</td>
        </tr>
	<%
	dim commentRS,commentSQL,commentI
	commentI=1
	commentSQL="select top 10 content,ID,toID from Mycomments where is_show=1 order by ID desc"
	set commentRS=server.CreateObject("adodb.recordset")
	commentRS.open commentSQL,conn,1,1
	if not commentRS.eof then
	do while not commentRS.eof
	%>
        <tr align="right" bgcolor="#FFFFFF">
          <td align="left" class="fontnav"> <%
		  if len(commentRS("content"))>24 then
		  	response.write "<b>"&commentI&"</b>"&"、<a href=""../blog/redirect.asp?url="&commentRS("toID")&"&place="&commentRS("ID")&""">"&left(replace(replace(commentRS("content"),"<br>",""),"<BR>",""),24)&"...</a>"
		  else
		  	response.write "<b>"&commentI&"</b>"&"、<a href=""../blog/redirect.asp?url="&commentRS("toID")&"&place="&commentRS("ID")&""">"&replace(replace(commentRS("content"),"<br>",""),"<BR>","")&"</a>"
		  end if
		  %></td>
        </tr>
	<%commentRS.movenext
	commentI=commentI+1
	if commentRS.eof or commentRS.bof then exit do
	loop
	else%>	
	        <tr align="right" bgcolor="#FFFFFF">
          <td align="left" class="fontnav"> NO any Records</td>
        </tr>
	<%end if
	commentRS.close
	set commentRS=nothing%>	
      </table>	  


      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="4" cellspacing="0">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;Good Article</td>
        </tr>
      </table>
	  
	  
      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="2" cellspacing="1">
	  <%
	  set rs=server.createobject("adodb.recordset")
	  sqlcmd="select top 10 ID,title from Contents where is_show=1 and is_good=1 order by ID desc"
	  rs.open sqlcmd,conn,1,1,1
	  do while not rs.eof
	  title=strvalue(rs("title"),22)
	  %>	  
        <tr> 
          <td bgcolor="#F8F8F8">&nbsp;&nbsp;- <a href="../blog/redirect.asp?url=<%=rs("ID")%>" target="_self"><%=title%></a>
		  </td>
        </tr>
		<%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
      </table>

	  <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="4" cellspacing="0">
        <tr> 
          <td class="titleLeft">&nbsp;&nbsp;Picture</td>
        </tr>
      </table>
      <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="5" cellspacing="1">
      <%
	  set rs=server.createobject("adodb.recordset")
	  sqlcmd="select top 5 ID,smallImg from Contents where is_show=1 and smallImg<>'nothing.gif' order by ID desc"
	  rs.open sqlcmd,conn,1,1,1
	  do while not rs.eof
	  %>
        <tr> 
          <td bgcolor="#F8F8F8" align="center"><a href="../blog/redirect.asp?url=<%=rs("ID")%>" target="_self"><img src="../blog/smallImg/<%=rs("smallImg")%>" width="160" border="0"></a> 
          </td>
        </tr>
        <%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
      </table></td>
    <td width="1" bgcolor="#666666"></td>
    <td width="650" align="center" valign="top">
    <%
	dim blogID
	blogID=safeRequest("blogID",1,0)
	if blogID=0 then
	call Main()
	else
	call blogShow()
	end if	
	%>
	
 </td>   
  </tr>
</table>
<table bgcolor="#E7E7E7" width="775" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="20" class="F_Link"><%
	  set rs=server.createobject("adodb.recordset")
	  sqlcmd="select name,linkTo from Friendlinks order by ID asc"
	  rs.open sqlcmd,conn,1,1,1
	  do while not rs.eof
	  name=strvalue(rs("name"),22)
	  %>&nbsp;&nbsp;- <a href="<%=rs("linkTo")%>" target="_blank"><%=name%></a>
		<%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%></td>
  </tr>
  <tr> 
    <td height="30" align="center" valign="top" class="bgBottom2">
	<%
	dim timeEnd
	timeEnd=timer()
	timeDiff=Round(timeEnd-timeStart,4)
	response.Write("<span class=""fontCopyright"">"&myCopyright&"&nbsp;&nbsp;本页执行时间："&timeDiff&" 秒</span>")
	%>
    </td>
  </tr>
</table>
</body>
</html>

<%
'简单访问记数
if request.ServerVariables("QUERY_STRING")="" then
sqlcmd="update admin set hits=hits+1"
conn.execute sqlcmd
end if

conn.close
set conn=nothing
%>


		<%
		'---------------------------------Main过程----------------------------
		sub Main()
		
		dim RPP,thisPage,blogKind
		'设置每页显示的记录条数 record per page
		RPP=10
		
		'获取由网址?传来的page的值
		thisPage=safeRequest("page",1,1)
		session("thisPage")=thisPage
		
		'获取检索条件
		blogKind=safeRequest("blogKind",1,0)
		theDate=formatMyDate(dDate,6)
		theYear=left(theDate,4)
		theMonth=mid(theDate,5,2)
		theDay=right(theDate,2)
		'response.write theDate
		'response.end
		Q=safeRequest("Q",0,"")
		key=safeRequest("key",0,"")
		keykind=safeRequest("keykind",0,"")		
		
		
		blogCon=" where is_show=1 "
		kindName="New Diary..."
		'如果是按分类检索
		if blogKind<>0 then
		set rs=server.createobject("adodb.recordset")
		sqlcmd="select name from MyblogKind where ID="&blogKind
		rs.open sqlcmd,conn,1,1,1
		if not rs.eof then kindName=rs("name")
		rs.close
		set rs=nothing
		
		blogCon=" where is_show=1 and blogKInd="&blogKind
		end if

		'如果是按日期检索
		if safeRequest("date",0,"")<>"" then
			if Q="month" then
			blogCon=" where is_show=1 and year(pubDate)="&theYear&" and month(pubDate)="&theMonth
			kindName=theYear&"-"&theMonth&"的日志"
			else
			blogCon=" where is_show=1 and year(pubDate)="&theYear&" and month(pubDate)="&theMonth&" and day(pubDate)="&theDay
			kindName=theYear&"-"&theMonth&"-"&theDay&"的日志"
			end if
		end if
		
		'如果地按关键词检索
		if keyKind<>"" then


		dim trimKey
		trimKey=replace(trim(key),"<br>","")
		if trimKey=""  then
		%>
		<script language="javascript">
		window.alert("对不起，搜索的关键词必填！")
		window.history.back(1)
		</script>
		<%
		response.end
		end if


		blogCon=" where is_show=1 and "&keykind&" like '%"&key&"%'"
		kindName="搜索“"&key&"”的结果"
		end if
		
		set rs=server.createobject("adodb.recordset")
		sqlcmd="select ID,title,pubDate,content,hits,hots from Contents "&blogCon&" order by ID desc"
		rs.open sqlcmd,conn,1,1,1
		%>
		<script language="javascript">document.title="<%=blogName%>--<%=myDescription%>"</script>
	 <table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr> 
          <td align="left" valign="middle"> [<b><font color="#0000FF"><%=kindName%></font></b>] </td>
        </tr>
      </table>
		
		<%
		i=1
		if not (rs.eof or err) then rs.move (thisPage-1)*RPP
		do while not (rs.eof or err)
		
		ID=rs("ID")
		%>
			  
	  <table bgcolor="#E7E7E7" width="595" border="0" cellpadding="1" cellspacing="0">
        <tr> 
          <td height="20" class="bgMain1"> &nbsp;<img src="../icon/arrow.gif"> <a href="../blog/redirect.asp?url=<%=rs("ID")%>" target="_self"><font color="0000FF"><b><%=rs("title")%></b></font></a> at <%=formatMyDate(rs("pubDate"),1)%> </td>
        </tr>
        <tr> 
          <td style="word-break:break-all" height="35" valign="top"  class="bgMain2">
		  
		<%
		if not isNull(rs("content")) then
			blogContent=rs("content")
			blogContent=replace(blogContent,"<IMG","<img onclick=""javascript:window.open(this.src);"" onload=""javascript:if(this.width>500) this.style.width=500;"" style=""CURSOR: pointer"" ")
			briefEnd=instr(blogContent,"{--Break--}")
			if briefEnd>0 then blogContent=left(blogContent,briefEnd-1)
			response.write (blogContent&"<br>……")
		end if
		%>
            <table bgcolor="#E7E7E7" width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="right"> [<%=rs("hits")%>]views&nbsp;&nbsp;Comments[<%=rs("hots")%>]&nbsp;&nbsp;&nbsp;[<a href="../blog/redirect.asp?url=<%=rs("ID")%>" target="_self" title="查看全文" style="color:#FF3300">№：详细内容（More)</a>]&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
	  
	  <hr width="595" size="1" noshade>
      <%
	i=i+1
	if i>RPP then exit do
	rs.moveNext
	loop
	%>
      <table bgcolor="#E7E7E7" width="595" height="22" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr> 
          <td height="20" align="right" valign="middle" >
            <img src="../icon/arrow.gif"> 
            <%call showPagesEnglish(rs,RPP,thisPage)%>
          </td>
        </tr>
      </table>

	<% 
	rs.close
	set rs=nothing

	end sub
	%>


	<%
	'---------------------------------blogShow过程----------------------------
	sub blogShow()
	sqlcmd="update Contents set hits=hits+1 where ID="&blogID
	conn.execute sqlcmd
	
	set rs=server.createobject("adodb.recordset")
	sqlcmd="select * from Contents where ID="&blogID
	rs.open sqlcmd,conn,1,1,1
	
	if rs.eof then response.redirect ("../public/requesterr.asp")

	blogContent=rs("content")
	blogContent=replace(blogContent,"<IMG","<img onclick=""javascript:window.open(this.src);"" onload=""javascript:if(this.width>500) this.style.width=500;"" style=""CURSOR: pointer"" ")

	%>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	document.title="<%=rs("title")%>"+"  <%=blogName%>--<%=myDescription%>"
	-->
	</SCRIPT>
	  <table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr> 
          <td height="20" class="bgMain1"><font color="#000000">Title</font> 
		  <font color="#0000FF"><b><%=rs("title")%></b></font>
		  at <%=formatMyDate(rs("pubDate"),1)%>
		  </td>
        </tr>
        <tr> 
          <td align="right" valign="top">字号：[<a href="javascript:fontZoom(16)">大</a>] [<a href="javascript:fontZoom(14)">中</a>] [<a href="javascript:fontZoom(12)">小</a>] &nbsp;&nbsp;</td>
        </tr>
        <tr> 
          <td style="word-break:break-all;font-size:12px" height="200" align="left" valign="top" class="bgMain2" ID="fontZoom"><%=replace(blogContent,"{--Break--}","")%></td>
        </tr>
        <tr>
          <td align="left" class="bgMain2">
		  
		  Author：<%=rs("author")%><br>
		  Key Words：
		  
		  <%
		  dim arrKey
		  arrKey=split(rs("keyword"),",")
		  for i=0 to ubound(arrKey)
			  response.write ("<a href=""../blog/?key="&arrKey(i)&"&keykind=keyword"" target=""_self"">")
			  response.write (arrKey(i))
			  response.write ("</a>&nbsp;")
		  next		  
		  %>
		  <br>
		  Link：<a href="<%=rs("linkTo")%>" target="_blank"><%=rs("linkTo")%></a>

		  </td>
        </tr>
        <tr>
          <td align="right" class="bgMain1"><table border="0" align="left" cellpadding="0" cellspacing="0"><tr><td><font color="#003366">Edit by [admin] At <%=formatMyDate(rs("pubDate"),1)%></font></td></tr></table> [<%=rs("hits")%>]views&nbsp;&nbsp;Comments[<%=rs("hots")%>]&nbsp;&nbsp;[<a href="#top"><font color="#0000FF">Go Top</font></a>]&nbsp;</td>
        </tr>
</table>
<br>
<table bgcolor="#E7E7E7" width="595" border="0" align="center" cellpadding="1" cellspacing="0">
<tr><td height="30" class="bgMain1"><img src="../icon/arrow.gif" border="0">&nbsp;<span class="fontTitle">Comments</span></td></tr>
</table>


<%
dim comments_IP
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from Mycomments where toID="&blogID&" and is_show=1 order by ID desc"
rs.open sqlcmd,conn,1,1,1

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
    <td><input name="submit" type="submit" value="Post the Comment " class="button"> </td>
  </tr>
  </form>
</table>

<br>
	
<%
rs.close
set rs=nothing
end sub	
%>