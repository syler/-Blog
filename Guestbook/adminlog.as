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
					sendBox.sText="身份确认成功！";
					sendBox.btn.text="OK";				
					sendBox.btn.onRelease=function(){
					_root.Body.attachMovie("msglist","msgList",1);
						}					
					}
				if(this.SendFlag==2){
					sendBox.onEnterFrame=null;
					sendBox.sText="输入不正确,请重新输入！";
					sendBox.btn.text="OK";				

					}
				if(this.SendFlag==3){
					sendBox.onEnterFrame=null;
					sendBox.sText="密码/用户名不对！！！";
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
		SendBox._y=40;
		sendBox.onEnterFrame=function(){
		sendBox.sText="正在验证身份"+sstr.substr(0,random(6));
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