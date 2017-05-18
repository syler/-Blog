username=_root.curAuthor;
email=_root.curMail;
inurl=_root.curUrl;
subject=_root.curSubject;
curFace=_root.curFace;
icq=_root.curIcq;
cicon=_root.curIcon;
Editor.EditBox.htmlText=_root.curContent;
Editor2.EditBox.htmlText=_root.curReply;
createEmptyMovieClip("FacesSel",2);
FacesSel._x=180;
FacesSel._y=151;
FacesSel.attachMovie("mrect","mrect",0);
FacesSel.mrect._y=9;
FacesSel.mrect.gx=9+curFace*30;

FacesSel.mrect.onEnterFrame=function(){
	this.dx=this.gx-this._x;
	this._x+=this.dx/4;
	this._yscale=100-Math.ABS(this.dx/2);
}

for(var i=1;i<16;i++){
	FacesSel.attachMovie("f"+i,"face"+i,i);
	var theFace=eval("FacesSel.face"+i);
		theFace._x=i*30;
		theFace.fN=i;
		theFace.onRollOver=function(){
			this._parent.mrect.gx=this._x+9;
			curFace=this.fN;
		}
}

createEmptyMovieClip("IconSel",3);
IconSel.attachMovie("icon"+cicon,"iconM",1);
IconSel._x=127;
IconSel._y=277;

preBtn.onRelease=function(){
	if(cicon>1) cicon--;
	IconSel.attachMovie("icon"+cicon,"iconM",1);
	IconSel._x=127;
	IconSel._y=277;
}
nextBtn.onRelease=function(){
	if(cicon<23) cicon++;
	IconSel.attachMovie("icon"+cicon,"iconM",1);
	IconSel._x=127;
	IconSel._y=277;
}

sendBTN.onRelease=function(){
	var sstr="........."

   	var myLoadVars=new LoadVars();
		myLoadVars.idNumber=_root.curNum;
		myLoadVars.username=username;
		myLoadVars.subject=subject;
		myLoadVars.ftext=Editor.EditBox.htmlText;
		myLoadVars.reply=Editor2.EditBox.htmlText;
		myLoadVars.curFace=curFace;
		myLoadVars.cicon=cicon;
		myLoadvars.email=email;
		myLoadvars.inurl=inurl;
		myLoadvars.icq=icq;
		myLoadvars.SendFlag=0;
		myLoadvars.sendAndLoad(_root.URLpreFix+"update.asp",myLoadvars,"POST");

		myLoadvars.onLoad=function(success){
			if(success){
				if(this.SendFlag==1){
					sendBox.onEnterFrame=null;
					sendBox.sText="编辑成功！";
					sendBox.btn.text="OK";				
					sendBox.btn.onRelease=function(){
					_root.Body.attachMovie("msglist","msgList",1);
						}
					
					}
				if(this.SendFlag==3){
					sendBox.onEnterFrame=null;
					sendBox.sText="您编辑的留言不存在！";
					sendBox.btn.text="OK";				

					}
				if(this.SendFlag==4){
					sendBox.onEnterFrame=null;
					sendBox.sText="只有管理员才能编辑留言！";
					sendBox.btn.text="OK";
					}
				
			}else{
					sendBox.onEnterFrame=null;
					sendBox.sText="异常错误#2！";
					sendBox.btn.text="OK";
				}
		}

		attachMovie("SendingBox","sendBox",10);
		sendBox._x=146;
		SendBox._y=100;
		sendBox.onEnterFrame=function(){
		sendBox.sText="正在发送数据"+sstr.substr(0,random(6));
		}
		sendBox.btn.text="Cancel";
		sendBox.btn.onRelease=function(){
			this._parent.removeMovieClip();		
		}

}
resetBTN.onRelease=function(){
	Editor.ftext="";
}
resetBTN2.onRelease=function(){
	Editor2.ftext="";
}

exitBTN.onRelease=function(){
	_root.Body.attachMovie("msglist","msgList",1);
}

stop();