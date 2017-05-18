//alert("timer.js");

var timerID;
var timeEnd;
var timerRunning = false;
var timeOut;

function startTimer()
{
	timeOut = parseInt( document.frmTimer.timer.value );
	document.frmTimer.timer.value = "";
	if(isNaN(timeOut) || timeOut < 1)
		alert("请设置会话时间，或者会话时间太短");
	else
	{
		timeEnd = new Date( (new Date()).getTime() + timeOut*60000 );
		
		stopTimer();
		showTime();
	}
}

function stopTimer()
{
	if(timerRunning)
		clearTimeout(timerID);
	timerRunning = false;
}

function showTime(ConfigDefault)
{
	if(document.frmTimer.timer.value != "")
	{
		timeOut = parseInt( document.frmTimer.timer.value );
		document.frmTimer.timer.value = "";
		timeEnd = new Date( (new Date()).getTime() + timeOut*60000 + 5*1000);
	}
	var timeRemainingString = "";
	var timeNow = new Date();
	var time = Math.floor( (timeEnd.getTime() - timeNow.getTime()) / 1000 );
	
	//timeOut = 0;

	if (time < 0)
	{
		alert("提示：\r\n"
			+ "  由于您在 " + timeOut + " 分钟内没有操作。\r\n"
			+ "  您将被自动注销，重新登陆后才可继续使用。\r\n"
			+ "");
		stopTimer();
	}
	else
	{
		hours   = Math.floor( time /3600) % 24;
		minutes = Math.floor( time  / 60) % 60;
		seconds = (time%60);

		if (hours < 10) hours = "0" + hours;
		if (minutes < 10) minutes = "0" + minutes;
		if (seconds < 10) seconds = "0" + seconds;

		timeRemainingString = hours + ":" + minutes + ":" + seconds;
		//timeOut = 1000;
		document.frmTimer.clock.value = timeRemainingString;
		timerID = setTimeout("showTime(58)",1000);
		timerRunning = true;
	}
}