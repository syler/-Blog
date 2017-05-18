<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/OLEDBconn.asp"-->
<%
dim thisPage,RPP,thisURL
RPP=50 '每页显示的记录数 record per page
'获取由网址?传来的page的值
if not isempty(request("page")) then
thisPage=cint(request("page"))
else
thisPage=1
end if

if thisPage<1 then thisPage=1


'取得本页当前URL
thisURL="http://"&request.serverVariables("server_name")&request.serverVariables("URL")
%>

<html>
<head>
<title>登录日志</title>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select * from powerdrmLog order by ID desc"
rs.open sqlcmd,conn,1,1,1
rs.pagesize=RPP
pageCount=rs.pagecount

tenPage=thisPage\10
%>
<br>
<table width="96%" border="0" align="center" cellpadding="1" cellspacing="0">
  <tr> 
    <td width="78" bgcolor="f5f5f5"><img src="../icon/arrow.gif">页次:<%=thisPage%>/<%=pageCount%></td>
    <td width="484" bgcolor="f5f5f5"> <%if thisPage>1 then%> <a href="<%=thisURL%>?page=1" target="_self" title="首页">首页</a> 
      <a href="<%=thisURL%>?page=<%=thisPage-1%>" target="_self" title="首页">前页</a> 
      <%else%>
      首页 前页 
      <%end if%> <%
if pageCount-tenPage*10>=10 then
maxPage=thisPage+10
else
maxPage=pageCount
end if
%> <%for i=thisPage to maxPage%> <%if i=thisPage then%> <a href="<%=thisURL%>?page=<%=i%>" target="_self">{<%=i%>}</a> <%else%> <a href="<%=thisURL%>?page=<%=i%>" target="_self"><%=i%></a> <%end if%> <%next%> <%if thisPage<pageCount then%> <a href="<%=thisURL%>?page=<%=thisPage+1%>" target="_self" title="首页">下页</a> 
      <a href="<%=thisURL%>?page=<%=pageCount%>" target="_self" title="尾页">尾页</a> 
      <%else%>
      下页 尾页 
      <%end if%> <%if thisPage>1 then%> <a href="<%=thisURL%>?Page=<%=thisPage-10%>" target="_self" title="下页">前10页</a> 
      <%end if%> <%if tenPage<pageCount\10 then%> <a href="<%=thisURL%>?page=<%=thisPage+10%>" target="_self" title="下页">后10页</a> 
      <%end if%> </td>
    <td width="195" align="center" bgcolor="f5f5f5">
<a href=# onClick="window.open('delLog.asp','delLog','scrollbars=yes,width=150,height=100')">{清空日志}</a>　
总数:<%=rs.recordcount%></td>
  </tr>
  <tr bgcolor="#666666"  height="1">
    <td height="1"></td>
    <td height="1"></td>
    <td height="1"></td>
  </tr>
</table>

  
<br>
<table width="96%" border=0 align="center" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC">
    <tr bgcolor="#eeeeee" align="center"> 
      <td width="4%">ID</td>
      <td width="12%">用户名</td>
      <td width="12%">密码</td>
      <td width="12%">IP</td>
      <td width="15%">浏览器</td>
      <td width="16%">操作系统</td>
      <td width="20%">访问时间</td>
      <td width="10%">成功否</td>
    </tr>
	<%
	i=1
	if not (rs.eof or err) then rs.move (thisPage-1)*RPP
	do while not (rs.eof or err)
		mystring=split(rs("sys")&";;",";")
	%>
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td><%=rs("id")%></td>
      <td><%=rs("userName")%></td>
      <td><%=rs("password")%></td>
      <td><%=rs("ip")%></td>
	  <td title="<%=rs("sys")%>"><%=mystring(1)%></td>
	  <td title="<%=rs("sys")%>"><%=replace(mystring(2),")","")%></td>
      <td><%=rs("mytime")%></td>
      <td><%=rs("is_success")%></td>
    </tr>
<%
i=i+1
if i>RPP then exit do
rs.moveNext
loop
%>
</table>
<%
rs.close
set rs=nothing
conn=close
set conn=nothing
%>
<br>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
        <tr> 
        <td align="center" bgcolor="#f8f8f8"><%=myCopyright%></td>
        </tr>
  <tr height="1"  bgcolor="#dddddd"><td></td></tr>
</table>


</body>
</html>