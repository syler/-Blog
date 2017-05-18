<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../INC/checkAdmin.asp"-->
<!--#INCLUDE FILE="../INC/OLEDBconn.asp" -->
<%
dim name,linkTo,ID
ID=safeRequest("ID",1,0)
name=safeRequest("name",0,"ÐÂÁ´½Ó")
linkTo=safeRequest("linkTo",0,"#")

sqlcmd="update Friendlinks set name='"&name&"',linkTo='"&linkTo&"' where ID="&ID
conn.execute sqlcmd

conn.close
set conn=nothing
%>

<!--#include file=../INC/success.asp-->