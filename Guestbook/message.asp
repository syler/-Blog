<%@ Language=VBScript %>
<% Response.Buffer=True %>
<%
Dim GuestBookName
dim GuestbookUrl
Dim MailBox
Dim Password1
Dim AllowUbbcode
Dim ConnectionString
Dim PageSize
Dim AdminLogFlag

IF Session("AdminLogged")<>1 THEN 
	AdminLogFlag=0
ELSE 
	AdminLogFlag=1
END IF

'default Ado Connection Object
dim conn
'default ado recordset object
dim rs

PageSize=15
GuestBookName=" BlueIdea.com "
AllowUbbCode=False%>
<!--#include file="Fgbconn.asp"-->
<%
Dim i 
Dim intPageCount
Dim intRecordCount
Dim page
if  isempty(Request("Page")) then
	Page=1
else
	if isnumeric(request("page")) then
		on error resume next
		Page=clng(abs(Request("Page")))
		if err.number<>0 then
			Page=1
			err.clear
		end if
		on error goto 0
	else
		Page=1
	end if
end if

Response.ContentType = "text/xml"
Response.Expires = -1
Response.Write "<?xml version='1.0' encoding='GB2312'?>"
Response.Write "<threads "

Set con=Server.CreateObject("ADODB.Connection")
	con.Open ConnectionString
Set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "select * from GuestBook where is_show=1 order by postdatetime desc",con,3

	intRecordCount=rs.RecordCount
	if not (rs.EOF and rs.BOF) then
		rs.PageSize=PageSize
		intPageCount=rs.PageCount
		if page>intPageCount then
			page=intPageCount
		end if
		rs.AbsolutePage=Page
		
		Response.Write "PageCount="""&intPageCount&""" RecordCount="""&intRecordCount&""" AdminLog="""&AdminLogFlag&""">"
		
		for i=1 to pagesize
			if rs.EOF then
				exit for
			end if
		Response.Write "<message>"
		
		Response.Write "<subject>"
		Response.Write rs("subject")
		Response.Write "</subject>"
		
		Response.Write "<number>"
		Response.Write rs("number")
		Response.Write "</number>"
		
		Response.Write "<email>"
		Response.Write rs("email")
		Response.Write "</email>"

		Response.Write "<url>"
		Response.Write rs("url")
		Response.Write "</url>"

		Response.Write "<body><![CDATA["
		Response.Write rs("message")
		Response.Write "]]></body>"

		Response.Write "<sex>"
		Response.Write rs("sex")
		Response.Write "</sex>"

		Response.Write "<reply><![CDATA["
		Response.Write rs("reply")
		Response.Write "]]></reply>"

		Response.Write "<icon>"
		Response.Write rs("icon")
		Response.Write "</icon>"

		Response.Write "<posted>"
		Response.Write rs("postdatetime")
		Response.Write "</posted>"

		Response.Write "<face>"
		Response.Write rs("face")
		Response.Write "</face>"

		Response.Write "<username>"
		Response.Write rs("username")
		Response.Write "</username>"

		Response.Write "<icq>"
		Response.Write rs("icq")
		Response.Write "</icq>"

		Response.Write "</message>"
		rs.MoveNext
		NEXT
	END IF 

	rs.Close
	Set rs=nothing
	con.Close
	Set con=nothing
Response.Write "</threads>"
%>