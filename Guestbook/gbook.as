fscommand("allowscale", "false");
System.useCodePage = true;
//var URLpreFix="http://script.digichina.net/guestbook/";
var URLpreFix="";
var curPage=1;
var pageBtnsPosX=0;
var canListOpen=true;
var msgBGColor=0xf6f6f6;//留言背景色
var DiaBGColor=0xFFFFFF;//对话框背景色
var DiaBorderColor=0xcccccc;//对话框边框色
var DiaShadowColor=0x666666;//对话框阴影色
var iconScale=60;//图标大小
var hintBGColor=0xffffcc;//提示信息背景色
var hintTextColor=0x000000;//提示信息背景色
var hintBorderColor=0x000000;//提示信息边框色
_root.createEmptyMovieClip("Body",1);
_root.Body._x=3; //设定留言本主体位置
_root.Body._y=137;
_root.Body.attachMovie("msglist","msgList",1);
_root.footer.onEnterFrame=function(){
			this.gy=_root.body._y+_root.body._height;
			this._y+=(this.gy-this._y)/3;
			var winHeight=this.gy+this._height+20;
			fscommand("setwinheight", winHeight);  //页面自动适应flash长度
		}

function showMessage(smsg){ //显示提示信息
		_root.createEmptyMovieClip("infobox",1000);
		_root.infobox.createTextField("info", 1, 0, 0, 100, 20);
		_root.infobox.info.text=smsg;
		_root.infobox.info._width=_root.infobox.info.textWidth+5;
		_root.infobox.info._height=_root.infobox.info.textHeight+3;
		_root.infobox.info.border=true;
		_root.infobox.info.selectable=false;
		_root.infobox.info.background=true;
		_root.infobox.info.backgroundColor=_root.hintBGColor;
		_root.infobox.info.textColor=_root.hintTextColor;
		_root.infobox.info.borderColor=_root.hintBorderColor;
		
		_root.infobox._x=_root._xmouse-_root.infobox._width-6;
		_root.infobox._y=_root._ymouse-_root.infobox._height-6;	
}

function hideMessage(){
		_root.infobox.removeMovieClip();
}

function drawMsgBox(theObj,x,y,w,str,type){ //创建对话框 type=Right|Left
	var ow=w;
/*	
	theObj.createTextField("msgContent",10,x,y,w,30);
	theObj.msgContent.html=true;
	theObj.msgContent.multiline=true;
	theObj.msgContent.wordWrap=true;
	通过create方式创建的text，显示会有问题。未进一步查明问题。
*/
	theObj.attachMovie("FTextField","msgContentMc",10);
	var theText=eval("theObj.msgContentMc");
	theText._x=x;
	theText._y=y;
	theText._width=w;
	theText.ftext=str;
	theText.itext._height=theText.itext.textHeight+14;
	theText.itext._width=theText.itext.textWidth+14;
	h=theText._height;
	w=theText._width;
	if(type=="right" && ow>w) {
		x+=ow-w;
		theText._x=x;
	}
	x-=6;
	y-=6;
	w+=12;
	h+=12;
	if(type.toLowerCase()=="left"){
	with(theObj){
		lineStyle(0,_root.DiaBorderColor,100);
		beginFill(_root.DiaShadowColor,100);
		moveTo(x,y);
		lineTo(x+w,y);
		lineTo(x+w,y+h);
		lineTo(x,y+h);
		lineTo(x,y+40);
		lineTo(x-16,y+15);
		lineTo(x,y+25);
		lineTo(x,y);
		endFill();
		x-=3;
		y-=3;
		lineStyle(0,_root.DiaBorderColor,100);
		beginFill(_root.DiaBGColor,100);
		moveTo(x,y);
		lineTo(x+w,y);
		lineTo(x+w,y+h);
		lineTo(x,y+h);
		lineTo(x,y+40);
		lineTo(x-16,y+15);
		lineTo(x,y+25);
		lineTo(x,y);
		endFill();		
	}
	}
	else if (type.toLowerCase()=="right"){
	with(theObj){
		lineStyle(0,_root.DiaBorderColor,100);
		beginFill(_root.DiaShadowColor,100);
		moveTo(x+w,y);
		lineTo(x,y);
		lineTo(x,y+h);
		lineTo(x+w,y+h);
		lineTo(x+w,y+h-25);
		lineTo(x+w+16,y+h-10);
		lineTo(x+w,y+h-40);
		lineTo(x+w,y);
		endFill();		
		x-=3;
		y-=3;
		lineStyle(0,_root.DiaBorderColor,100);
		beginFill(_root.DiaBGColor,100);
		moveTo(x+w,y);
		lineTo(x,y);
		lineTo(x,y+h);
		lineTo(x+w,y+h);
		lineTo(x+w,y+h-25);
		lineTo(x+w+16,y+h-10);
		lineTo(x+w,y+h-40);
		lineTo(x+w,y);
		endFill();		
	}		
	}
}
stop();