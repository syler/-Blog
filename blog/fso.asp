<!--#include file="../INC/checkAdmin.asp"-->
<!--#include file="../INC/function.asp"-->
<%
response.buffer=true
dim URL,filename,userfilepath
dim isObjIn
isObjIn=isObjInstalled("")
if isObjIn=false then
	response.write "fso��֧�֣��޷�������"
	response.end
end if
userfilepath="html"  '��Ҫ����html�ļ�·��(�����blog�ĸ�·��)

filepath=server.mappath("./")&"\"&"../"  'ȡ�õ�ǰ�ļ�·��
filepath=filepath&trim(userfilepath)&"\"
URL=trim(request.QueryString("url"))
if request.QueryString("Codeready")="true" then
	call createFile()
elseif trim(URL)<>"" then
	call main()
else
	response.write "<span style='font-size:12px'>�������(url)������ο������ļ���<br>������������������<br>http://"&request.servervariables("server_name")&request.servervariables("script_name")&"?url=http://"&request.servervariables("server_name")&"/</span>"
end if
sub main()
dim http_99love_126_com'��ʱ�ļ���
http_99love_126_com=split(url,"=")
if URL="" or isempty(URL) then exit sub
filename=http_99love_126_com(ubound(http_99love_126_com))
if not isnumeric(filename) then exit sub
%>
<html>
<head>
<title>99love FSO ���ɾ�̬ҳ��</title>
<script>
function getSrc(url){
var i=document.frames['inn'];
i.location.href=url;
}
function window.onerror(msg,url,line){
document.getElementById('stat').innerText="��������\n�ļ���"+url+"\n����λ�ã�"+line+"��\n��Ϣ��"+msg;
return true;
}
function ready(){
	var i=document.frames['inn'];
	document.getElementById('stat').innerText="״̬��"+i.document.readyState;
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
response.write "<span style='font-size:12px'>����ϵͳ��������δȡ��ֵ������<a href='mailto:powerdrm@126.com'>powerdrm@126.clm</a>��ϵ��˵��bug��</span>"
exit sub
end if
dim badcode'��Ҫ�Ĵ���
'���ͣ�ʲô�ǲ�Ҫ�Ĵ��룿
'��Ҫ�Ĵ����Ǿ����ھ�̬ҳ�����ɹ�������<script>�β������������룬����ܻ�Ӱ��ҳ������ۣ�Ҳ����ʹ��������һ�η���ʱ����������
'���������ⲿ�ִ���ȥ������ô����ζ�����δ��룿
'����ʵ�ʶ������мǵ��ǣ�˫����"Ӧ�ñ��˫˫����""
'Ҫ�ǲ�����ǰ�����Һ�,��Ȼ,�������������Բ�����������Ӱ�����κ�����ġ�
'http://99love.126.com
'mail:powerdrm@126.com
'���������ʼ�
badcode="<A href=""http://web.168173.com/99love/counter6/supervise/index.asp?uid=99love"" target=_blank><IMG height=18 alt=""COCOON Counter 6"" src=""http://web.168173.com/99love/counter6/core/default.asp?id=99love&amp;l=zh-cn&amp;t=18&amp;p=http%3A//web.168173.com/99love/inc/viewFile.asp%3FblogID%3D34&amp;r=http%3A//web.168173.com/99love/blog/fso.asp%3Furl%3D../inc/viewFile.asp%3FblogID%3D34&amp;s=1024_768&amp;c=16&amp;v=1&amp;z=-8"" width=18 border=0></A>"

createcode=replace(createcode,badcode,"")
set fso=server.createobject("scripting.filesystemobject")
if fso.folderexists(filepath)=false then
	dim cf
	Set cf = fso.CreateFolder(filepath)
end if
set filewrite=fso.CreateTextFile(filepath&request("filename")&".html", True)
filewrite.write createcode'д���ļ�
if err.number<>0 then
	response.write "��������"&err.description
	err.clear
	exit sub
end if
filewrite.close
set fso=nothing
response.write "<span style='font-size:12px'>��ϲ���ɹ�����<a href='../html/"&request("filename")&".html' target='_blank'>"&filepath&request("filename")&".html</a><br><a href='javascript:history.go(-2)'>������ﷵ��</a><br>���غ���ˢ��ҳ��</span>"
end sub%>