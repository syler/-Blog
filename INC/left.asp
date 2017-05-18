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
  function adminLogin()
  	{
		document.administratorLogin.submit();
		document.administratorLogin.reset();
		return false;
	 }
//-->
</SCRIPT>
</head>
<BODY bgColor="transparent" leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=4 width="100%" bgColor=#e7e7e7 border=0>
<TBODY>
<TR>
<TD class=titleLeft>&nbsp;&nbsp;Date&amp;Time</TD></TR></TBODY></TABLE><!--日历开始-->
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
                <td width="16%" height="21" align="center"><a href="../blog/?q=month&date=<%= SubtractOneMonth(dDate) %>" target="_top" style='font-family:"webdings"'>7</a></td>
                <td width="68%" align="center"><font color="#0000FF"><b>[<%=formatMyDate(dDate,4)%>]</b></font></td>
                <td width="16%" align="center"><a href="../blog/?q=month&date=<%= AddOneMonth(dDate) %>" target="_top" style='font-family:"webdings"'>8</a></td>
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
	response.write ("<a href=""../blog/?date=" & Month(dDate) & "-" & iCurrent & "-" & Year(dDate) & """ target=""_top"" class="""&className&""" >" & iCurrent & "<img src=""../icon/biezhen.gif"" border=""0""></A>")
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
			<td bgcolor="#F8F8F8" class="fontnav">@<a href="../" target="_top"><b>Home</b></a></td>
		</tr>
	  	<tr>
			<td bgcolor="#F8F8F8" class="fontnav">@<a href="../about" target="_top"><b>About Me</b></a></td>
		</tr>		
        <%
		set rs=server.createobject("adodb.recordset")
		sqlcmd="select ID,name from MyblogKind order by orderID"
		rs.open sqlcmd,conn,1,1,1
		i=1
		do while not rs.eof
		%>
        <tr>                     
          <td bgcolor="#F8F8F8" class="fontnav">@<a href="../blog/?blogKind=<%=rs("ID")%>" target="_top"><b><%=rs("name")%></b></a>&nbsp;&nbsp;<a href="../blog/rss.asp?kind=<%=rs("ID")%>" target="_blank"><img src="../icon/xml.gif" width="20" height="11" border="0"></a></td>
		</tr>

		<%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
        <tr>                     
          <td bgcolor="#F8F8F8" class="fontnav">@<a href="../guestbook/guestbook.htm" target="_top"><b>GuestBook</b></a></td>
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
		  	response.write "<b>"&commentI&"</b>"&"、<a href=""../blog/redirect.asp?url="&commentRS("toID")&"&place="&commentRS("ID")&""" target=""_top"">"&left(replace(replace(commentRS("content"),"<br>",""),"<BR>",""),24)&"...</a>"
		  else
		  	response.write "<b>"&commentI&"</b>"&"、<a href=""../blog/redirect.asp?url="&commentRS("toID")&"&place="&commentRS("ID")&""" target=""_top"">"&replace(replace(commentRS("content"),"<br>",""),"<BR>","")&"</a>"
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
          <td bgcolor="#F8F8F8">&nbsp;&nbsp;- <a href="../blog/redirect.asp?url=<%=rs("ID")%>" target="_top"><%=title%></a>
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
          <td bgcolor="#F8F8F8" align="center"><a href="../blog/redirect.asp?url=<%=rs("ID")%>" target="_top"><img src="../blog/smallImg/<%=rs("smallImg")%>" width="160" border="0"></a> 
          </td>
        </tr>
        <%
		rs.movenext
		loop
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		%>
</body>
</html>