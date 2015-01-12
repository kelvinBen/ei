/*******************************************************************
/*loading组件
/*功能描述：遮挡页面控件并提示正在运行
/*******************************************************************/

//loading对象类
function Loading(divId){
		this.loadingObj=document.all(divId);
		this.iTimeoutID=-1;
}

//设置loading对象显示的位置
Loading.prototype.setPosition=function(){
	var temp=this.loadingObj;
	var imgTab=this.loadingObj.getElementsByTagName("TABLE")[0];
	this.loadingObj.style.top=document.body.scrollTop+document.body.clientHeight*0.005;
	this.loadingObj.style.left=(document.body.clientWidth-this.loadingObj.clientWidth)/2;
	imgTab.style.marginRight=imgTab.style.marginLeft=(imgTab.offsetParent.offsetWidth-imgTab.offsetWidth)/2;
	imgTab.style.marginTop=imgTab.style.marginBottom=(imgTab.offsetParent.offsetHeight-imgTab.offsetHeight)/2;
}

/*
*显示/隐藏loading控件，isVisible指示显示/隐藏(true/false)；
*timeOut表示显示的时长，单位是秒。
*/
Loading.prototype.show=function(isVisible,timeOut){
	var _isVisible=isVisible==null?true:isVisible;
	var _timeOut=timeOut==null?-1:timeOut;
	if(_isVisible){
		this.loadingObj.style.display="block";
		this.setPosition();
		document.body.scroll="no";
		if(_timeOut!=-1)
			this.iTimeoutID=window.setTimeout("document.all('"+this.loadingObj.id+"').style.display='none';document.body.scroll='yes';",_timeOut*1000);
		}
	else{
		this.loadingObj.style.display="none";
		document.body.scroll="yes";
		window.clearTimeout(this.iTimeoutID);
	}
}