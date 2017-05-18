<%
'���ڸ�ʽ������
function formatMyDate(theDate,i)
dim theYear,theMonth,theDay,theHour,theMinute,theSecond

theYear=year(theDate)
theMonth=month(theDate)
theMonth=string(2-len(theMonth),"0")&theMonth
theDay=day(theDate)
theDay=string(2-len(theDay),"0")&theDay
theHour=hour(theDate)
theHour=string(2-len(theHour),"0")&theHour
theMinute=minute(theDate)
theMinute=string(2-len(theMinute),"0")&theMinute
theSecond=second(theDate)
theSecond=string(2-len(theSecond),"0")&theSecond


select case i
case 0:

formatMyDate=theMonth&"-"&theDay&" "&theHour&":"&theMinute
case 1:
formatMyDate=theMonth&"/"&theDay&" "&theHour&":"&theMinute
case 2:
formatMyDate=theMonth&"-"&theDay
case 3:
formatMyDate=theYear&"-"&theMonth&"-"&theDay
case 4:
formatMyDate=theYear&"/"&theMonth&"/"&theDay
case 5:
formatMyDate=theYear&"��"&theMonth&"��"&theDay&"��"
case 6:
formatMyDate=theYear&theMonth&theDay
case 7:
formatMyDate=theYear&"��"&theMonth&"��"&theDay&"��"&theHour&"ʱ"&theMinute&"��"
case 8:
formatMyDate=theYear&theMonth
case 9:
formatMyDate=theYear&"��"&theMonth&"��"
case else:
formatMyDate=theDate
end select

end function





'safeRequest����

'varName:��������-�ַ���
'varType:��������-������(1��ʾ���ϲ��������֣�0��ʾ���ϲ���Ϊ�ַ�)
'varDefault:�����յ���ֵʱ��Ĭ��ֵ

function safeRequest(varName,varType,varDefault)

       dim reValue
       if not isempty(request(varName)) and trim(request(varName))<>"" then
              reValue=request(varName)
       else	
              reValue=varDefault
       end if

       if varType=1 then
              if not isNumeric(reValue) then
                     response.redirect ("../public/requestErr.asp")
                     response.end
              end if
              reValue=cint(reValue)

       else
              reValue=server.HTMLencode(replace(reValue,"'","''"))
       end if
       safeRequest=reValue

end function


'�ж� 5,67,678,433���Ƿ����565��һ��
function inX(s,mystring)
dim mySplit

mySplit=split(mystring,",")
inX=false

for each split_item in mySplit
	if cint(split_item)=cint(s) then
	inX=true
	exit for
	end if
next
end function




'����Ϊ�����ֽڵ��ַ�������
function strlen(str) 
dim p_len 
p_len=0 
strlen=0 
if trim(str)<>"" then 
p_len=len(trim(str)) 
for xx=1 to p_len 
if asc(mid(str,xx,1))<0 then 
strlen=int(strlen) + 2 
else 
strlen=int(strlen) + 1 
end if 
next 
end if 
end function 


function strvalue(str,lennum) 
dim p_num 
dim i 
if strlen(str)<=lennum then 
strvalue=str 
else 
p_num=0 
x=0 
do while not p_num > lennum-2 
x=x+1 
if asc(mid(str,x,1))<0 then 
p_num=int(p_num) + 2 
else 
p_num=int(p_num) + 1 
end if 
strvalue=left(trim(str),x)&"��" 
loop 
end if 
end function

Function IsObjInstalled(strClassString)
	if strClassString="" or isempty(strClassString) then StrClassString="scripting.filesystemobject"
	On Error Resume Next
	IsObjInstalled = False
	Err = 0
	Dim xTestObj
	Set xTestObj = Server.CreateObject(strClassString)
	If 0 = Err Then IsObjInstalled = True
	Set xTestObj = Nothing
	Err = 0
End Function






'��ҳ�ӹ���

function getURL()

  dim searchStr,queryStr,relultURL


  searchStr="page="
  queryStr=Request.ServerVariables("QUERY_STRING")

  If queryStr="" Then
            relultURL= "?" & searchStr
  Else
            If InstrRev(queryStr,searchStr)=0 Then
                     relultURL= "?" & queryStr &"&"& searchStr
            Else
                     j=InstrRev(queryStr,searchStr)-2
                     If j=-1 Then
                              relultURL= "?" & searchStr

                     Else

                              queryStr=Left(queryStr,j)

                              relultURL= "?" & queryStr &"&" & searchStr
                     End If
            End If
  End If  

  getURL=relultURL
  
end function





sub showPages(rs,RPP,thisPage)

dim fullURL
fullURL=getURL()

rs.pagesize=RPP
pageCount=rs.pageCount
recordCount=rs.recordcount

%>

ҳ��:<span class="fontStriking"><%=thisPage%></span>/<%=pageCount%>&nbsp;&nbsp;

<%if thisPage>1 then%>
<a href="<%=fullURL&"1"%>"  target="_self" style='font-family:"webdings"'>9</a>
<a href="<%=fullURL&(thisPage-1)%>"  target="_self" style='font-family:"webdings"'>7</a>
<%
end if

pageStart=thisPage-4
if pageStart<1 then pageStart=1
pageEnd=thisPage+4
if pageEnd>rs.pagecount then pageEnd=rs.pagecount

for i=pageStart to pageEnd
if i=thisPage then
%>
<a href="<%=fullURL&i%>"  target="_self" class="fontStriking
"><b>[<%=i%>]</b></a>
<%else%>
<a href="<%=fullURL&i%>" target="_self"><b><%=i%></b></a> 
<%
end if
next

if thisPage<rs.pagecount then
%>
<a href="<%=fullURL&(thisPage+1)%>"  target="_self" style='font-family:"webdings"'>8</a>
<a href="<%=fullURL&pagecount%>"  target="_self" style='font-family:"webdings"'>:</a>
<%end if%>
&nbsp;&nbsp;��<%=recordCount%>����Ϣ
&nbsp;&nbsp;<%=RPP%>��/ҳ


<%end sub%>



<%
sub showPagesEnglish(rs,RPP,thisPage)

dim fullURL
fullURL=getURL()

rs.pagesize=RPP
pageCount=rs.pageCount
recordCount=rs.recordcount

%>

Pages:<span class="fontStriking"><%=thisPage%></span>/<%=pageCount%>&nbsp;&nbsp;

<%if thisPage>1 then%>
<a href="<%=fullURL&"1"%>"  target="_self" >[��һҳ]</a>
<a href="<%=fullURL&(thisPage-1)%>"  target="_self" >[��һҳ]</a>
<%
end if

pageStart=thisPage-4
if pageStart<1 then pageStart=1
pageEnd=thisPage+4
if pageEnd>rs.pagecount then pageEnd=rs.pagecount

for i=pageStart to pageEnd
if i=thisPage then
%>
<a href="<%=fullURL&i%>"  target="_self" class="fontStriking
"><b>[<%=i%>]</b></a>
<%else%>
<a href="<%=fullURL&i%>" target="_self"><b><%=i%></b></a> 
<%
end if
next

if thisPage<rs.pagecount then
%>
<a href="<%=fullURL&(thisPage+1)%>"  target="_self" >[��һҳ]</a>
<a href="<%=fullURL&pagecount%>"  target="_self" >[���һҳ]</a>
<%end if%>
&nbsp;&nbsp;total:<%=recordCount%>
&nbsp;&nbsp;<%=RPP%> info/page


<%end sub%>


<%
'ȥ��HTML����
function noHTML(str)
    dim re
    Set re=new RegExp
    re.IgnoreCase =true
    re.Global=True
    re.Pattern="(\<.[^\<]*\>)"
    str=re.replace(str," ")
    re.Pattern="(\<\/[^\<]*\>)"
    str=re.replace(str," ")
    nohtml=str
    set re=nothing
end function
%>