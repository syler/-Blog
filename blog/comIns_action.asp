<!-- #include file="../INC/OLEDBconn.asp"-->
<%
dim blogID,name,email,content,chkValue
blogID=safeRequest("blogID",1,0)
name=safeRequest("name",0,"")
email=safeRequest("email",0,"")
content=safeRequest("content",0,"")
IP=request.servervariables("remote_addr")
chkValue=Request.form("chk_Value")
content=replace(content,vbCrLf,"<br>")

do while instr(content,"<br><br>")<>0
content=replace(content,"<br><br>","<br>")
loop


'����������Ƿ����δ�
dim words
words=split(specialWord,",")
for i=0 to ubound(words)
if instr(content,words(i))<>0 then
%>
<script language="javascript">

window.alert("�Բ������������к��в�����Ĵ��")
window.history.back(1)

</script>
<%
response.end
end if

next


dim trimName,trimContent
trimName=replace(trim(name),"<br>","")
trimContent=replace(trim(content),"<br>","")

if trimName="" or trimContent="" then
%>
<script language="javascript">

window.alert("�Բ����������������ݱ��")
window.history.back(1)

</script>
<%
response.end
end if
if not isnumeric(chkValue) then%>
<script language="javascript">
window.alert("�Բ���У���벻��ȷ��")
window.history.back(1)
</script>	
<%
response.end
end if
if int(chkValue)<>int(session("GetCode")) then%>
<script language="javascript">

window.alert("�Բ���У���벻��ȷ��")
window.history.back(1)

</script>	
<%
response.end
end if

sqlcmd="insert into Mycomments (toID,name,email,content,is_show,IP) values('"&blogID&"','"&name&"','"&email&"','"&content&"',1,'"&IP&"')"
conn.execute sqlcmd


sqlcmd="update Contents set hots=hots+1 where ID="&blogID
conn.execute sqlcmd
conn.close
set conn=nothing

response.redirect (request.servervariables("http_referer"))
%>