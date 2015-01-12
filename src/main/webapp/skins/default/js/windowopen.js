/*
模式对话框
url 路径URL
name 名称
w 宽度
h 高度
*/
function dialog(url,name,w,h)
{
	var lookups=window.showModalDialog(url, name, "dialogHeight:" + h + "px; dialogWidth:" + w + "px; center: Yes; help: No; resizable: No; status: No;");
	if(lookups!=null)
	{
		return lookups;
	}
	else
	{
		return null;
	}
}

function dialog_1(url,name,w,h)
{
	var lookups=window.showModalDialog(url, name, "dialogHeight:" + h + "px; dialogWidth:" + w + "px; center: Yes; help: No; resizable: No; status: No;scroll:No");

	if(lookups!=null)
	{
		return lookups;
	}
	else
	{
		return null;
	}
}
/*
自定义位置，大小
打开window 对话框
url 路径Url
name 名称
w 对话框宽
h 对话框高
letf 左位置
top 上位置
resizable 是否可调整对话框大小 "yes" 可调整 "no" 不可调整
scrollbars 是否加上滚动条      "yes" 有滚动条 "no" 没有滚动条
*/
function opens(url,name,w,h,left,top,resizable,scrollbars)
{
	window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" + h + "px,Width=" + w + "px,left="+left+"px,top="+top+"px").focus();
}
/*
左上角
打开window 对话框
url 路径Url
name 名称
w 对话框宽
h 对话框高
resizable 是否可调整对话框大小 "yes" 可调整 "no" 不可调整
scrollbars 是否加上滚动条      "yes" 有滚动条 "no" 没有滚动条
*/
function opens_lt(url,name,w,h,resizable,scrollbars)
{
	window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" + h + "px,Width=" + w + "px").focus();
}
/*
居中
打开window 对话框
url 路径Url
name 名称
w 对话框宽
h 对话框高
resizable 是否可调整对话框大小 "yes" 可调整 "no" 不可调整
scrollbars 是否加上滚动条      "yes" 有滚动条 "no" 没有滚动条
*/
function opens_center(url,name,w,h,resizable,scrollbars){
  var screenWidth = window.screen.width;
  var screenHeight = window.screen.height;
  var myw=w;
  if(myw>=screenWidth){
  	myw=screenWidth-10;
  }
  var myh=h;
  if(myh>=screenHeight){
  	myh=screenHeight-60;
  }
  var left = (screenWidth-myw-10)/2;
  var top = (screenHeight-myh-60)/2;
  if(left<0){
   left=0;
  }
  if(top<0){
   top=0;
  }
  var openwin=window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" +myh + "px,Width=" + myw + "px,Left="+left+"px,top="+top+"px");
  if(openwin){
  	openwin.focus();
  }
}

function opens_fullcenter(url,name,resizable,scrollbars){
  var screenWidth = window.screen.width;
  var screenHeight = window.screen.height;
  var myw= screenWidth-10;
  var myh=screenHeight-60;
  var left=0;
  var top=0;
  var openwin=window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" +myh + "px,Width=" + myw + "px,Left="+left+"px,top="+top+"px");
  if(openwin){
  	openwin.focus();
  }
}