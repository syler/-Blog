tpwd.password=true;
loginBtn.onRelease=function(){
	var sstr="........."
   	var myLoadVars=new LoadVars();
   		myLoadVars.adminID=AdminID;
   		myLoadVars.password=password;
   		myLoadVars.SendFlag=0;
		myLoadvars.sendAndLoad(_root.URLpreFix+"adminlog.asp",myLoadvars,"POST");
		myLoadvars.onLoad=function(success){
			if(success){
				if(this.SendFlag==1){
					sendBox.onEnterFrame=null;
					sendBox.sText="���ȷ�ϳɹ���";
					sendBox.btn.text="OK";				
					sendBox.btn.onRelease=function(){
					_root.Body.attachMovie("msglist","msgList",1);
						}					
					}
				if(this.SendFlag==2){
					sendBox.onEnterFrame=null;
					sendBox.sText="���벻��ȷ,���������룡";
					sendBox.btn.text="OK";				

					}
				if(this.SendFlag==3){
					sendBox.onEnterFrame=null;
					sendBox.sText="����/�û������ԣ�����";
					sendBox.btn.text="OK";
					}
				
			}else{
					sendBox.onEnterFrame=null;
					sendBox.sText="�쳣����#2��";
					sendBox.btn.text="OK";
				}
		}


		attachMovie("SendingBox","sendBox",10);
		sendBox._x=146;
		SendBox._y=40;
		sendBox.onEnterFrame=function(){
		sendBox.sText="������֤���"+sstr.substr(0,random(6));
		}
		sendBox.btn.text="Cancel";
		sendBox.btn.onRelease=function(){
			this._parent.removeMovieClip();		
		}
}
exitBtn.onRelease=function(){
	_root.Body.attachMovie("msgList","msgList",1);
}
stop();