Editor.ftext="";
curFace=1;
cicon=1;
username="";
subject="";

createEmptyMovieClip("FacesSel",2);//����ѡ��
FacesSel._x=180; 
FacesSel._y=144;
FacesSel.attachMovie("mrect","mrect",0);
FacesSel.mrect._y=9;
FacesSel.mrect.gx=39;

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

createEmptyMovieClip("IconSel",3); //ͼ��ѡ��
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

sendBTN.onRelease=function(){ //������������
	var sstr="........."
	var errmsg="";
	if(username=="") errmsg=errmsg+" �ǳ� ";
	if(subject=="") errmsg=errmsg+" ���� ";
	if(Editor.ftext=="") errmsg=errmsg+" �������� ";
	if(errmsg!=""){
		attachMovie("SendingBox","sendBox",10);
		sendBox._x=146;
		SendBox._y=100;
		sendBox.sText="����"+errmsg+"����Ϊ�գ�";
		sendBox.btn.text="OK";
		sendBox.btn.onRelease=function(){
			this._parent.removeMovieClip();
		}
		return;
	}

	var myLoadVars=new LoadVars();
		myLoadVars.username=username;
		myLoadVars.subject=subject;
		myLoadVars.ftext=Editor.ftext;
		myLoadVars.curFace=curFace;
		myLoadVars.cicon=cicon;
		myLoadvars.email=email;
		myLoadvars.inurl=inurl;
		myLoadvars.icq=icq;
		myLoadvars.SendFlag=0;
		myLoadvars.sendAndLoad(_root.URLpreFix+"add.asp",myLoadvars,"POST");
		
		myLoadvars.onLoad=function(success){
			if(success){
				if(this.SendFlag==1){
					_root.Body.attachMovie("msglist","msgList",1);	
				}
				else{
					sendBox.onEnterFrame=null;
					sendBox.sText="�쳣����#1��";
					sendBox.btn.text="OK";
				}
			}
			else{
					sendBox.onEnterFrame=null;
					sendBox.sText="�쳣����#2��";
					sendBox.btn.text="OK";
			}	
		}
		
		attachMovie("SendingBox","sendBox",10);
		sendBox._x=146;
		SendBox._y=100;
		sendBox.onEnterFrame=function(){
			sendBox.sText="���ڷ�������"+sstr.substr(0,random(6));
		}
		sendBox.btn.text="Cancel";
		sendBox.btn.onRelease=function(){
				this._parent.removeMovieClip();
			}
		

}
resetBTN.onRelease=function(){
	Editor.ftext="";
}
exitBTN.onRelease=function(){
	_root.Body.attachMovie("msglist","msgList",1);
}

stop();