<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<?xml version="1.0" encoding="gb2312"?>
<!--#include file="../INC/OLEDBconn.asp"-->
<!--#include file="../INC/site_set.asp"-->
<rss version='2.0' xmlns:dc='http://purl.org/dc/elements/1.1/' xmlns:trackback='http://madskills.com/public/xml/rss/module/trackback/' xmlns:wfw='http://wellformedweb.org/CommentAPI/' xmlns:slash='http://purl.org/rss/1.0/modules/slash/'>

	<channel>
		<TITLE><%=blogName%></TITLE> 
		<LINK><%=mySite%></LINK>
		<description><%=myDescription%></description>
		<copyright><%=myName%></copyright>
		<generator><%=myMaster%></generator>
		<webMaster><%=myEmail%></webMaster>

<%
dim kind,count,title,rs,sql

kind=safeRequest("kind",1,0)
if kind<>0 then kindCon=" and blogKind="&kind
count=safeRequest("count",1,15)


set rs=server.createobject("adodb.recordset")
sqlcmd="select top "&count&" ID,title,pubDate,author,content from Contents where is_show=1 "&kindCon&"  order by ID desc"

rs.open sqlcmd,conn,1,1,1



if rs.Eof or rs.Bof then
  response.write "<item></item>"
end if

while not rs.Eof 

linkto=mySite&currentPath&"blog/?blogID="&rs("ID")
if not isNull(rs("content")) then
brief=replace(noHTML(rs("content")),"{--Break--}"," ")
brief=replace(brief,"&nbsp;","")
brief=replace(brief,"&copy;","")
brief=replace(brief,"&reg;","")
brief=left(brief,100)&"……"
else
brief=""
end if

    response.Write "<item>"
	response.write "<link>"&linkTo&"</link>"
	Response.write "<title>"&rs("title")&"</title>"
	response.write "<creator>"&rs("author")&"</creator>"
	response.write "<PubDate>"&rs("pubDate")&"</PubDate>"
 	response.write "<description>"&brief&"</description>"
	response.write "</item>"
	rs.MoveNext 
wend
set rs=nothing
conn.close
set conn = nothing
%>
	</channel>
</rss>