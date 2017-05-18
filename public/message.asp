<html>
<head>
<title></title>
<link rel="stylesheet" href="../INC/style.css" type="text/css">
</head>
<body>
<%
dim message
message=request.querystring("message")
%>
<br><br><br><br><center><%=message%></center>

</body>
</html>