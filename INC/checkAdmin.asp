<%
Response.Buffer=true

if session("UID")="" then
  response.redirect "../administrator/login.asp?message=对不起，你还没有登录，请登录！"
end if
%>