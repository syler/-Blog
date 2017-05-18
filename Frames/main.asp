
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="main.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript>

function TL(){
	switchPoint.innerText=4
        switchPoint2.innerText=8
	switchPoint.title="打开左栏"
	switchPoint2.title="左栏最大化"
	document.all("frmLeft").style.width="0"
}
function TR(){
	switchPoint.innerText=3
        switchPoint2.innerText=7
	switchPoint.title="关闭左栏"
	switchPoint2.title="右栏最大化"
}

function SwitchLeftBar(){
	if (switchPoint.innerText==3){
		TL()
	}
	else{
		TR()
		document.all("frmLeft").style.width="140"
	}
}
	
function ToLeftRight(){
	if (switchPoint2.innerText==7){
		TL()
	}
	else{
		TR()
		document.all("frmLeft").style.width="100%"
	}

}
	
function ToMiddle(){
	document.all("frmLeft").style.width="50%"
}


</SCRIPT>
</HEAD>

<BODY language=javascript style="MARGIN: 0px" scroll="no">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY> 
  <TR><TD id=frmLeft vAlign=center noWrap align=middle width=140 name="frmLeft">
<IFRAME id=BoardTitle style="Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%" name=BoardTitle src="dir.asp" frameBorder=0></IFRAME>
    <TD width=10 bgColor=#d9e8d9 background="../icon/bgv.gif"> 
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR><TD style="HEIGHT: 100%" onclick=SwitchLeftBar()><SPAN class=navPoint1 id=switchPoint title=关闭左栏>3</SPAN></TR>
        <TR>
          <TD onclick=ToLeftRight() height=10><SPAN class=navPoint2 id=switchPoint2 title=右栏最大化>7</SPAN></TR>
        <TR>
          <TD onclick=ToMiddle() height=10><SPAN class=navPoint2 id=switchPoint4 title=平分两栏>2</SPAN></TR>
        <TR>
          <TD height=10></TD></TR></TBODY></TABLE>
		  </TD>
    <TD><IFRAME id=FrmRight style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%" name="FrmRightMain" src="../public/welcome.asp" frameBorder=0></IFRAME><br>
</TD></TR></TBODY></TABLE>
</BODY></HTML>