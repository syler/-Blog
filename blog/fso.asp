<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/function.asp"-->
<%
response.buffer=true
dim URL,filename,userfilepath
dim isObjIn
isObjIn=isObjInstalled("")
if isObjIn=false then
	response.write "fso不支持，无法操作！"
	response.end
end if
userfilepath="html"  '将要生成html文件路径(相对于blog的根路径)

filepath=server.mappath("./")&"\"&"../"  '取得当前文件路径
filepath=filepath&trim(userfilepath)&"\"
URL=trim(request.QueryString("url"))
if request.QueryString("Codeready")="true" then
	call createFile()
elseif trim(URL)<>"" then
	call main()
else
	response.write "<span style='font-size:12px'>传入参数(url)出错，请参考帮助文件。<br>参数传入类似于下面<br>http://"&request.servervariables("server_name")&request.servervariables("script_name")&"?url=http://"&request.servervariables("server_name")&"/</span>"
end if
sub main()
dim http_99love_126_com'临时文件名
http_99love_126_com=split(url,"=")
if URL="" or isempty(URL) then exit sub
filename=http_99love_126_com(ubound(http_99love_126_com))
if not isnumeric(filename) then exit sub
%>
<html>
<head>
<title>99love FSO 生成静态页面</title>
<script>
function getSrc(url){
var i=document.frames['inn'];
i.location.href=url;
}
function window.onerror(msg,url,line){
document.getElementById('stat').innerText="出错啦！\n文件："+url+"\n错误位置："+line+"行\n信息："+msg;
return true;
}
function ready(){
	var i=document.frames['inn'];
	document.getElementById('stat').innerText="状态："+i.document.readyState;
	if (i.document.readyState=='complete'){
	   document.getElementById('src').innerText=i.document.documentElement.innerHTML;
	   if(document.getElementById('src').innerText.length>28) {document.aform.submit();}
	}
}
</script>
</head>
<body onload="getSrc('<%=URL%>')">
<div id="stat" style="border:solid 1px;"></div>
<iframe id="inn" onreadystatechange='ready()' style='width:1px;height:1px'></iframe>
<form name="aform" action="fso.asp?Codeready=true" method="post">
<textarea name="src" style='width:expression(document.body.offsetWidth-40)' rows="20" id="src"></textarea><br/>
<input type="hidden" id="filename" name="filename" value="<%=filename%>">
<input type="hidden" id="filepath" name="filepath" value="<%=filepath%>">
</form>
</body>
</html>
<%end sub
sub createFile()
dim createcode,fso,filewrite
filepath=request("filepath")
createcode="<html>"&request("src")&"</html>"
if len(createcode)<=28 then 
response.write "<span style='font-size:12px'>可能系统发生错误，未取得值。请与<a href='mailto:powerdrm@126.com'>powerdrm@126.clm</a>联系以说明bug。</span>"
exit sub
end if
dim badcode'不要的代码
'解释：什么是不要的代码？
'不要的代码是就是在静态页面生成过程中由<script>段产生的垃圾代码，这可能会影响页面的美观，也可能使计数器在一次访问时计两次数。
'所以允许将这部分代码去掉，那么，如何定义这段代码？
'这由实际而定。切记的是，双引号"应该变成双双引号""
'要是不明白前来问我呵,当然,下面的内容你可以不管它，不会影响你任何事情的。
'http://99love.126.com
'mail:powerdrm@126.com
'拒收垃圾邮件
badcode="<A href=""http://web.168173.com/99love/counter6/supervise/index.asp?uid=99love"" target=_blank><IMG height=18 alt=""COCOON Counter 6"" src=""http://web.168173.com/99love/counter6/core/default.asp?id=99love&amp;l=zh-cn&amp;t=18&amp;p=http%3A//web.168173.com/99love/inc/viewFile.asp%3FblogID%3D34&amp;r=http%3A//web.168173.com/99love/blog/fso.asp%3Furl%3D../inc/viewFile.asp%3FblogID%3D34&amp;s=1024_768&amp;c=16&amp;v=1&amp;z=-8"" width=18 border=0></A>"

createcode=replace(createcode,badcode,"")
set fso=server.createobject("scripting.filesystemobject")
if fso.folderexists(filepath)=false then
	dim cf
	Set cf = fso.CreateFolder(filepath)
end if
set filewrite=fso.CreateTextFile(filepath&request("filename")&".html", True)
filewrite.write createcode'写入文件
if err.number<>0 then
	response.write "发生错误："&err.description
	err.clear
	exit sub
end if
filewrite.close
set fso=nothing
response.write "<span style='font-size:12px'>恭喜！成功生成<a href='../html/"&request("filename")&".html' target='_blank'>"&filepath&request("filename")&".html</a><br><a href='javascript:history.go(-2)'>点击这里返回</a><br>返回后请刷新页面</span>"
end sub%>