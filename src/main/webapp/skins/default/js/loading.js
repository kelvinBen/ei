/*******************************************************************
/*loading���
/*�����������ڵ�ҳ��ؼ�����ʾ��������
/*******************************************************************/

//loading������
function Loading(divId){
		this.loadingObj=document.all(divId);
		this.iTimeoutID=-1;
}

//����loading������ʾ��λ��
Loading.prototype.setPosition=function(){
	var temp=this.loadingObj;
	var imgTab=this.loadingObj.getElementsByTagName("TABLE")[0];
	this.loadingObj.style.top=document.body.scrollTop+document.body.clientHeight*0.005;
	this.loadingObj.style.left=(document.body.clientWidth-this.loadingObj.clientWidth)/2;
	imgTab.style.marginRight=imgTab.style.marginLeft=(imgTab.offsetParent.offsetWidth-imgTab.offsetWidth)/2;
	imgTab.style.marginTop=imgTab.style.marginBottom=(imgTab.offsetParent.offsetHeight-imgTab.offsetHeight)/2;
}

/*
*��ʾ/����loading�ؼ���isVisibleָʾ��ʾ/����(true/false)��
*timeOut��ʾ��ʾ��ʱ������λ���롣
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