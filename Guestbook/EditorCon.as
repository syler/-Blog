// As for Editor Box .
function changeColor(){
	Selection.setFocus(EditBox);
	Selection.setSelection(begin, end);
	myTextFormat = currentFormat;
	myTextFormat.color = cp.getValue();
	EditBox.setTextFormat(begin, end, myTextFormat);
}

function setLink(sUrl){
	Selection.setFocus(EditBox);
	Selection.setSelection(begin, end);
	if(sUrl == null){
//
	} else {
		myTextFormat = currentFormat;
		myTextFormat.url = sUrl;
		myTextFormat.target = "_blank";
		myTextFormat.underline = true;
		myTextFormat.color = "0x0000FF";
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
}

boldBTN.onRelease=function (){
	Selection.setFocus(EditBox);
	Selection.setSelection(begin, end);
	if (boldBTN._currentframe == 1){
		boldBTN.gotoAndStop(2);
		myTextFormat = currentFormat;
		myTextFormat.bold = true;
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
	else {
		boldBTN.gotoAndStop(1);
		myTextFormat.bold = false;
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
}

italicBTN.onRelease=function (){
	Selection.setFocus(EditBox);
	Selection.setSelection(begin, end);
	if (italicBTN._currentframe == 1){
		italicBTN.gotoAndStop(2);
		myTextFormat = currentFormat;
		myTextFormat.italic = true;
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
	else {
		italicBTN.gotoAndStop(1);
		myTextFormat.italic = false;
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
}

underlineBTN.onRelease=function (){
	Selection.setFocus(EditBox);
	Selection.setSelection(begin, end);
	if (underlineBTN._currentframe == 1){
		underlineBTN.gotoAndStop(2);
		myTextFormat = currentFormat;
		myTextFormat.underline = true;
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
	else {
		underlineBTN.gotoAndStop(1);
		myTextFormat.underline = false;
		EditBox.setTextFormat(begin, end, myTextFormat);
	}
}

LinkBTN.onRelease=function(){
	attachMovie("inputlinkBox","linkBox",1);
	linkBox._x=EditBox._x+10;
	linkBox._y=EditBox._y+10;
	linkBox.sLink="http://";
	linkBox.okBtn.onRelease=function(){
			setLink(this._parent.sLink);
			this._parent.removeMovieClip();
	}
	if(currentFormat.url!=null)	linkBox.sLink=currentFormat.url;}

function Timer(){
		curSel = Selection.getFocus(); 
	if (curSel eq EditBox) { 
		begin = Selection.getBeginIndex(); 
		end = Selection.getEndIndex(); 
		cursor = Selection.getCaretIndex(); 
	}
	currentFormat = EditBox.getTextFormat(begin, end);
	if (currentFormat.bold == true) {
		boldBTN.gotoAndStop(2);
	}
	else {
		boldBTN.gotoAndStop(1);
	}
	if (currentFormat.italic == true) {
		italicBTN.gotoAndStop(2);
	}
	else {
		italicBTN.gotoAndStop(1);
	}
	if (currentFormat.underline == true) {
		underlineBTN.gotoAndStop(2);
	}
	else {
		underlineBTN.gotoAndStop(1);
	}

}
setInterval(Timer,10);

sizeList.setChangeHandler("mySizeHandler");
function mySizeHandler(){
	myTextFormat = currentFormat;
	myTextFormat.size = sizeList.getSelectedItem().label;
	myTextFormat.textHeight = sizeList.getSelectedItem().label;
	EditBox.setTextFormat(begin, end, myTextFormat);
}

stop();