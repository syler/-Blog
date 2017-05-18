<%
set rs=server.createobject("adodb.recordset")
sqlcmd="select blogName,buildDate,hits,name,email,OICQ,MSN,tel from admin"
rs.open sqlcmd,conn,1,1,1

if not rs.eof then

blogName=rs("blogName")
blogBuildDate=rs("buildDate")
blogHits=rs("hits")

myName=rs("name")
myEmail=rs("email")
myOICQ=rs("OICQ")
myMSN=rs("MSN")
myTel=rs("tel")

end if

rs.close
set rs=nothing


set rs=server.createobject("adodb.recordset")
sqlcmd="select  count(*) as blogComment from Mycomments where is_show=1"
rs.open sqlcmd,conn,1,1,1

blogComment=rs("blogComment")

rs.close
set rs=nothing

set rs=server.createobject("adodb.recordset")
sqlcmd="select count(*) as blogs from Contents where is_show=1"
rs.open sqlcmd,conn,1,1,1

blogs=rs("blogs")

rs.close
set rs=nothing

set rs=server.CreateObject("adodb.recordset")
sqlcmd="select count(*) as blogGbook from guestbook where is_show=1"
rs.open sqlcmd,conn,1,1,1
blogGbook=rs("blogGbook")

rs.close
set rs=nothing
%>