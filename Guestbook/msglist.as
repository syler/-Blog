var sstr="..............";
var MsgList = new XML();
	MsgList.ignoreWhite=true;
	MsgList.onLoad=xmlfunc;
	MsgList.load (_root.URLpreFix+"message.asp?page="+_root.curPage);
	attachMovie("msgLoading","loading",1);
	loading.onEnterFrame=function(){
		this.text="Loading"+sstr.substr(0,random(8));
	}

function xmlfunc(success){
		if (success){
			AdminLog=this.firstChild.attributes.AdminLog;//管理员登陆标识
			createEmptyMovieClip("msglistLayer",1);
			var theMc=eval("msglistLayer");
			iCount=this.firstChild.childNodes.length;//本页留言显示数目
			for(var i=0;i<iCount;i++){
			theMc.attachMovie("MsgItem","msg",1);
			var theMc=eval("theMc.msg");
				theMc._y=21;
				theMc.subject=this.firstChild.childNodes[i].childNodes[0].firstChild.nodeValue;
				theMc.posted=this.firstChild.childNodes[i].childNodes[8].firstChild.nodeValue.split(" ")[0];
				theMc.author=this.firstChild.childNodes[i].childNodes[10].firstChild.nodeValue;
				theMc.content=this.firstChild.childNodes[i].childNodes[4].firstChild.nodeValue;
				theMc.reply=this.firstChild.childNodes[i].childNodes[6].firstChild.nodeValue;
				theMc.Num=this.firstChild.childNodes[i].childNodes[1].firstChild.nodeValue;
				theMc.mail=this.firstChild.childNodes[i].childNodes[2].firstChild.nodeValue;
				theMc.url=this.firstChild.childNodes[i].childNodes[3].firstChild.nodeValue;
				theMc.icq=this.firstChild.childNodes[i].childNodes[11].firstChild.nodeValue;
				theMc.face=this.firstChild.childNodes[i].childNodes[9].firstChild.nodeValue;
				theMc.sex=this.firstChild.childNodes[i].childNodes[5].firstChild.nodeValue;						
				theMc.icon=this.firstChild.childNodes[i].childNodes[7].firstChild.nodeValue;
				if(theMc.mail!=null) {
					theMc.MailBTN.onRelease=function(){
							getURL("mailto:"+this._parent.mail);
						}
					theMc.MailBTN.onRollOver=function(){
							_root.showMessage(this._parent.mail);
						}
					theMc.MailBTN.onRollOut=function(){
							_root.hideMessage();
						}					

					}else{
					theMc.MailBTN._visible=false;
				}
				if(theMc.url!=null) {
					theMc.urlBTN.onRelease=function(){
							getURL(this._parent.url,"_blank");
						}
					theMc.urlBTN.onRollOver=function(){
							_root.showMessage(this._parent.url);
						}
					theMc.urlBTN.onRollOut=function(){
							_root.hideMessage();
						}					
					}else{
					theMc.urlBTN._visible=false;
				}
				if(theMc.icq!=null){
					theMc.icqBTN.onRollOver=function(){
						_root.showMessage(this._parent.icq);
					}
					theMc.icqBTN.onRollOut=function(){
						_root.hideMessage();
					}					
					}else{
					theMc.icqBTN._visible=false;
					}
				if(AdminLog!=1){
					theMc.delBTN._visible=false;
					theMc.editBTN._visible=false;
				}else{
					theMc.delBTN.onRelease=function(){
						_root.hideMessage();
//////////////////////////////////////////////////				
						_root.curNum=this._parent.Num;
						_root.canListOpen=false;
						attachMovie("DeleteBox","DeleteBox",10);				
						DeleteBox._x=146;
						DeleteBox._y=100;
						DeleteBox.sText="你确认要删除留言吗？";
						DeleteBox.noBtn.onRelease=function(){
							_root.canListOpen=true;
							this._parent.removeMovieClip();
						}

						DeleteBox.yesBtn.onRelease=function(){
							var sstr=".........";
						   	var myLoadVars=new LoadVars();
								myLoadVars.idNumber=_root.curNum;
								myLoadVars.SendFlag=0;
								myLoadvars.sendAndLoad(_root.URLpreFix+"delete.asp",myLoadvars,"POST");								
								myLoadvars.onLoad=function(success){
								if(success){
									if(this.SendFlag==1){
										sendBox.onEnterFrame=null;
										sendBox.sText="删除成功！";
										sendBox.btn.text="OK";				
										sendBox.btn.onRelease=function(){
											_root.canListOpen=true;
											_root.Body.attachMovie("msglist","msgList",1);
										}
									}
									if(this.SendFlag==3){
										sendBox.onEnterFrame=null;
										sendBox.sText="您删除的留言不存在！";
										sendBox.btn.text="OK";				
									}
									if(this.SendFlag==4){
										sendBox.onEnterFrame=null;
										sendBox.sText="只有管理员才能删除留言！";
										sendBox.btn.text="OK";				
									}
									
								}else{
									sendBox.onEnterFrame=null;
									sendBox.sText="异常错误#2！";
									sendBox.btn.text="OK";
								}
								}
								
								attachMovie("SendingBox","sendBox",10);
								sendBox._x=120;
								SendBox._y=60;
								sendBox.onEnterFrame=function(){
								sendBox.sText="正在删除."+sstr.substr(0,random(6));
								}
								sendBox.btn.text="Cancel";
								sendBox.btn.onRelease=function(){
									_root.canListOpen=true;
									this._parent.removeMovieClip();
								}
														
						}
/////////////////////////////////////////////////////////////////////
						
					}
					theMc.delBTN.onRollOver=function(){
						_root.showMessage("删除留言");
					}
					theMc.delBTN.onRollOut=function(){
						_root.hideMessage();
					}
					theMc.editBTN.onRelease=function(){//编辑留言,通过_root传递留言信息
						_root.hideMessage();
						_root.curContent=this._parent.content;
						_root.curNum=this._parent.Num;
						_root.curSubject=this._parent.subject;
						_root.curPosted=this._parent.posted;
						_root.curAuthor=this._parent.author;
						_root.curReply=this._parent.reply;
						_root.curMail=this._parent.mail;
						_root.curUrl=this._parent.url;
						_root.curIcq=this._parent.icq;
						_root.curFace=this._parent.face;
						_root.curIcon=this._parent.icon;
						_root.Body.attachMovie("AdminEditor","AdminEditor",1);						
					}
					theMc.editBTN.onRollOver=function(){
						_root.showMessage("编辑留言");
						
					}
					theMc.editBTN.onRollOut=function(){
						_root.hideMessage();
					}
				
				}
				
				theMc.attachMovie("itemMaskOut","maskOut",10);				
				theMc.maskOut.gotoAndPlay(60-i*2);//动态显示留言列表
				
			var faceN=this.firstChild.childNodes[i].childNodes[9].firstChild.nodeValue;
				theMc.attachMovie("f"+faceN,"cface",3);//显示表情
				theMc.ibtn.close=true;
				theMc.ibtn.onRelease=function(){ //打开留言
					if(!_root.canListOpen) return;
					if(this.close){
					this._parent.createEmptyMovieClip("contentMC",4);
					var theCon=eval("this._parent.contentMC");
						theCon._y=22;
						_root.drawMsgBox(theCon,120,10,520,this._parent.content,"left");
						theCon.attachMovie("icon"+this._parent.icon,"iconMc",20);
						theCon.iconMc._xscale=_root.iconScale;
						theCon.iconMc._yscale=_root.iconScale;
						theCon.iconMc._x=40+theCon.iconMc._width/2;
						theCon.iconMc._y=theCon.iconMc._height/2;
						if(this._parent.reply.length>1){						
						theCon.createEmptyMovieClip("replyMC",5);
					var theReply=eval("theCon.replyMC");//显示回复
						theReply._y=theCon.msgContentMc._height+20;
						_root.drawMsgBox(theReply,80,10,520,this._parent.reply,"right");
						theReply.attachMovie("icon"+19,"adminIcon",22);
						theReply.adminIcon._xscale=_root.iconScale;
						theReply.adminicon._yscale=_root.iconScale;
						theReply.adminIcon._x=670;
						theReply.adminIcon._y=theReply._height-theReply.adminIcon._height/2-10;						
						}else{
						if(AdminLog==1){
						theCon.attachMovie("ReplyBTN","replyBTN",5); //显示回复按钮
						var theBtn=eval("theCon.replyBTN");
							theBtn._x=700;
							theBtn._y=14;
							theBtn.onRelease=function(){
								_root.curContent=this._parent._parent.content;
								_root.curNum=this._parent._parent.Num;
								_root.Body.attachMovie("replyEditor","replyEditor",1);
							}
						}
						}
						this._parent.msg._y=this._parent.contentMC._height+30;
						with(this._parent){ //填充留言显示背景
						beginFill(_root.msgBGColor,100);
						moveTo(0,21);
						lineTo(740,21);
						lineTo(740,this._parent.contentMC._height+28);
						lineTo(0,this._parent.contentMC._height+28);
						lineTo(0,21);
						endFill();		
						}
						this.close=!this.close;
					}else{
						this._parent.contentMC.removeMovieClip();
						this._parent.clear();
						this._parent.msg._y=21;
						this.close=!this.close;
					}
				}
			}

// ------------------------------------------------------			
			PageCount=this.firstChild.attributes.PageCount;//留言总页数
			theMc.attachMovie("foot","msg",1);
			var theMc=eval("theMc.msg");
				theMc._y=21;
				theMc.addBTN.onRelease=function(){//点击增加新留言
					_root.Body.attachMovie("TextEditor","TextEditor",1);
				}
				if(AdminLog==1){
					theMc.AdminBtn._visible=false;
					theMc.logoutBTN.onRelease=function(){ //管理员退出
						var sstr="........."
						var myLoadVars=new LoadVars();
							myLoadVars.SendFlag=0;
							myLoadvars.sendAndLoad(_root.URLpreFix+"adminlogout.asp",myLoadvars,"POST");
							myLoadvars.onLoad=function(success){
								if(success){
									if(this.SendFlag==1){
									sendBox.onEnterFrame=null;
									sendBox.sText="退出成功！";
									sendBox.btn.onRelease=function(){
										_root.Body.attachMovie("msglist","msgList",1);
											}															
										}
										else{
											sendBox.onEnterFrame=null;
											sendBox.sText="异常错误#1！";																													
										}
									}else{
									sendBox.onEnterFrame=null;
									sendBox.sText="异常错误#2！";																			
								}
							}


							attachMovie("SendingBox","sendBox",10);
							sendBox._x=146;
							SendBox._y=100;
							sendBox.onEnterFrame=function(){
							sendBox.sText="正在发送请求"+sstr.substr(0,random(6));
							}				
							sendBox.btn.onRelease=function(){
								this._parent.removeMovieClip();	
							}
					}
				}else{
					theMc.logoutBTN._visible=false;
					theMc.AdminBtn.onRelease=function(){ //管理员登陆
						_root.Body.attachMovie("loginForm","loginForm",1);
					}
				}
				theMc.RefreshBtn.onRelease=function(){ 刷新本页留言
					_root.Body.attachMovie("msgList","msgList",1);
				}
			theMc.pageSwitch.createEmptyMovieClip("Btns",1); //显示页码选择
			theMc.pageSwitch.Btns._x=_root.pageBtnsPosX;
			for(var i=1;i<PageCount;i++){
			theMc.pageSwitch.Btns.attachMovie("pageBTN","page"+i,i);
			theBtn=eval("theMc.pageSwitch.Btns.page"+i);
			theBtn.pageNum=i;
			theBtn._x=i*30;
			theBtn._y=5;
			theBtn.onPress=function(){
				_root.curPage=this.pageNum;
				_root.pageBtnsPosX=this._parent._x;
				_root.Body.attachMovie("msglist","msgList",1);
			}
			theBtn.onRollOver=function(){
				this.ip.textColor=0x0000FF;
			}
			theBtn.onRollOut=function(){
				this.ip.textColor=0x000000;
			}
			
			}
			
			var theCurPageBtn=eval("theMc.pageSwitch.Btns.page"+_root.curPage)//当前页
			theCurPageBtn.ip.textColor=0x0000ff;			
			theCurPageBtn.onRollOver=null;
			theCurPageBtn.onRollOut=null;
			
			
			theMc.pageSwitch.Btns.setMask(theMc.pageSwitch.maskrect);
			theMc.pageSwitch.Btns.onEnterFrame=function(){
				//if(this._parent.maskrect._width<this._width){
				if(this._x>20 && this.gsx>0) this.gsx=0;
				if(this._x<this._parent.maskrect._width-this._width && this.gsx<0) this.gsx=0;
				this._x+=this.sx;
				this.sx+=(this.gsx-this.sx)/5;				
				//}
			}
			themC.pageSwitch.prePageBtn.onRollOver=function(){
				this._parent.Btns.gsx=12;

			}
			themC.pageSwitch.prePageBtn.onRollOut=function(){
				this._parent.Btns.gsx=0;
			}
			theMc.pageSwitch.nextPageBtn.onRollOver=function(){
				this._parent.Btns.gsx=-12;
			}
			theMc.pageSwitch.nextPageBtn.onRollOut=function(){
				this._parent.Btns.gsx=0;
			}
		}
		else {
			Loading.onEnterFrame=null;
			Loading.text="数据载入出错，你可以尝试刷新页面。";
		}
}