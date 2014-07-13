/***********************************************************************************/
/****   TAB�ؼ�ǰ̨JS��   ***********************************************************/
/****   ��Ҫ���ܣ���ʼ��TAB��ǩ����Ӧcard����¼��ȡ���������������������/
/****   ���ߣ������******************************************************************/
//   ������TabTag
function Tab(){

var objTab=null;	//����tabҳ
var titles=null;	//��������
var cards=new Array();		//��Ƭ����
var cardNum=null;	//��Ƭ����

var tabType="top";	//����λ��

//��ʼ��tabҳ
this.initTab=initTab;
function initTab(tabId,index){
	objTab=document.all(tabId);
	titles=objTab.children[0].cells;
	cardNum=titles.length;
	for(var j=1;j<=cardNum;j++)
		cards[cards.length]=objTab.children[j];
	//����selectedȱʡ�����
	if(index!=null&&index==-1){
		titles[0].className ="tabtd current";
		cards[0].style.display="";
	}
	for(var i=0;i<cardNum;i++)
		titles[i].attachEvent("onmousedown",new Function(tabId+".doMouseDown("+i+");"));
}

//��Ӧ������¼�
this.doMouseDown=doMouseDown;
function doMouseDown(idx)
{
	for(var i=0;i<cardNum;i++){
		if(titles[i].className=="tabtd current"){
			this.beforeCardHidden(cards[i]);
		}
		titles[i].className =(i!=idx?"tabtd":"tabtd current");
		cards[i].style.display=(i!=idx?"none":"");
	}
	this.doCardClick(cards[idx]);		
}

//��ʾ��Ƭ��ִ�е����������id
this.doCardShow=doCardShow;
function doCardShow(cardId){
	if(document.readyState!="complete"){
		document.body.onload=function(){eval(objTab.id).doCardShow(cardId);};
	}else{
		for(var i=0;i<cardNum;i++)
			if(cards[i].id==cardId){
				this.showCard(i);
				break;
		}
	}
}

//��ʾĳ��Ƭ
this.showCard=showCard;
function showCard(index){
	if(index<0||index>=cardNum)
		return;
	titles[index].fireEvent("onmousedown");
}

//���ĳ��Ƭ�ı���
this.getTitle=getTitle;
function getTitle(index){
	if(index<0||index>=cardNum)
		return;
	return titles[index].innerText;
}

//��Ƭ��������һ������ľ���
this.moveLeft1=moveLeft1;
function moveLeft1(){
}

//��Ƭ�������Ƶ�������ʾ��ǰ����ı���
this.moveLeft=moveLeft;
function moveLeft(){
}

//��Ƭ��������һ������ľ���
this.moveRight=moveRight;
function moveRight(){
}

//����ĳ����Ƭ�Ƿ�ɼ���Ŀǰֻ�����ڱ���϶̡����ⲻ�ƶ������
this.setVisible=setVisible;
function setVisible(cardId,visible){
	for(var i=0;i<cardNum;i++)
		if(cards[i].id==cardId){
		if(visible){
			//cards[i].style.display="";
			titles[i].style.display="";
		}else{
			cards[i].style.display="none";
			titles[i].style.display="none";
			showCard(0);
		}
	}
}

//��λ
this.resetCards=resetCards;
function resetCards(){
}

//��Ƭ����ӿں���
this.doCardClick=doCardClick;
function doCardClick(card){
}
//��Ƭ����ӿں���
this.beforeCardHidden=beforeCardHidden;
function beforeCardHidden(card){
}
//����ĳ��Ƭ
this.hideCard=hideCard;				//����ĳ��Ƭ
function hideCard(cardId){
		for(var i=0;i<cardNum;i++)
		if(cards[i].id==cardId){
			cards[i].style.display="none";
			titles[i].style.display="none";
			showCard(0);
		}
}

//��ȡ��һ����Ƭ���
this.getNextIndex=getNextIndex;	//��ȡ��һ����Ƭ���
function getNextIndex(index){
	for(var i=index+1;i<cardNum;i++){
		if(titles[i].style.display!="none")
		return i;
	}
}

//��ȡ��һ����Ƭ���
this.getPreviousIndex=getPreviousIndex; //��ȡ��һ����Ƭ���
function getPreviousIndex(index){
	for(var i=index-1;i>0;i--){
		if(titles[i].style.display!="none")
		return i;
	}
}

//��ȡ�ɼ��Ŀ�Ƭ����
this.getAllVisible=getAllVisible;//��ȡ�ɼ��Ŀ�Ƭ����
function getAllVisible(){
}

//��ȡ��ǰ��ʾ�Ŀ�Ƭ���
this.getCurrentCardIndex=getCurrentCardIndex;//��ȡ��ǰ��ʾ�Ŀ�Ƭ���
function getCurrentCardIndex(){
	for(var i=0;i<cardNum;i++)
		if(cards[i].style.display!="none")			 
			return i;
	return null;
}


//����index��ȡ��Ӧ��card����
this.getCardByIndex=getCardByIndex;//����index��ȡ��Ӧ��card����
function getCardByIndex(index){
	return cards[index];//cards�ǿ�Ƭ����
}


//��ȡ��ǰ�Ŀ�Ƭid
this.getCurrentCardId=getCurrentCardId;	//��ȡ��ǰ�Ŀ�Ƭid
function getCurrentCardId(){
	for(var i=0;i<cardNum;i++)
		if(cards[i].style.display!="none")
			return cards[i].id;
	return null;
}


//ʹ��ƬʧЧ�������ݲ��ύ
this.disableCard=disableCard;	//ʹ��ƬʧЧ�������ݲ��ύ
function disableCard(cardId){
	for(var i=0;i<cards.length;i++)
		if(cards[i].id==cardId){
			cards[i].disabled=true;
			return true;
		}
	return false;
}

}