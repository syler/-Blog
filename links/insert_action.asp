<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#INCLUDE FILE="../INC/checkAdmin.asp" -->
<!--#INCLUDE FILE="../INC/OLEDBconn.asp" -->
<%
dim name,linkTo
name=safeRequest("name",0,"ÐÂÁ´½Ó")
linkTo=safeRequest("linkTo",0,"#")

sqlcmd="insert into Friendlinks (name,linkTo) values ('"&name&"','"&linkTo&"')"
conn.execute sqlcmd

conn.close
set conn=nothing
%>
<!--#include file=../INC/success.asp-->