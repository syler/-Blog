<%
Response.Buffer=true

if session("UID")="" then
  response.redirect "../administrator/login.asp?message=�Բ����㻹û�е�¼�����¼��"
end if
%>