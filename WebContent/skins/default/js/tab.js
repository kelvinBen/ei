/***********************************************************************************/
/****   TAB控件前台JS类   ***********************************************************/
/****   主要功能：初始化TAB标签，响应card点击事件等×××××××××××/
/****   作者：刘彦峰******************************************************************/
//   类名：TabTag
function Tab(){

var objTab=null;	//整个tab页
var titles=null;	//标题数组
var cards=new Array();		//卡片数组
var cardNum=null;	//卡片数量

var tabType="top";	//标题位置

//初始化tab页
this.initTab=initTab;
function initTab(tabId,index){
	objTab=document.all(tabId);
	titles=objTab.children[0].cells;
	cardNum=titles.length;
	for(var j=1;j<=cardNum;j++)
		cards[cards.length]=objTab.children[j];
	//处理selected缺省的情况
	if(index!=null&&index==-1){
		titles[0].className ="tabtd current";
		cards[0].style.display="";
	}
	for(var i=0;i<cardNum;i++)
		titles[i].attachEvent("onmousedown",new Function(tabId+".doMouseDown("+i+");"));
}

//相应鼠标点击事件
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

//显示卡片并执行点击，参数是id
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

//显示某卡片
this.showCard=showCard;
function showCard(index){
	if(index<0||index>=cardNum)
		return;
	titles[index].fireEvent("onmousedown");
}

//获得某卡片的标题
this.getTitle=getTitle;
function getTitle(index){
	if(index<0||index>=cardNum)
		return;
	return titles[index].innerText;
}

//卡片标题左移一个标题的距离
this.moveLeft1=moveLeft1;
function moveLeft1(){
}

//卡片标题左移到完整显示当前最左的标题
this.moveLeft=moveLeft;
function moveLeft(){
}

//卡片标题右移一个标题的距离
this.moveRight=moveRight;
function moveRight(){
}

//设置某个卡片是否可见，目前只能用于标题较短、标题不移动的情况
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

//复位
this.resetCards=resetCards;
function resetCards(){
}

//卡片点击接口函数
this.doCardClick=doCardClick;
function doCardClick(card){
}
//卡片点击接口函数
this.beforeCardHidden=beforeCardHidden;
function beforeCardHidden(card){
}
//隐藏某卡片
this.hideCard=hideCard;				//隐藏某卡片
function hideCard(cardId){
		for(var i=0;i<cardNum;i++)
		if(cards[i].id==cardId){
			cards[i].style.display="none";
			titles[i].style.display="none";
			showCard(0);
		}
}

//获取下一个卡片序号
this.getNextIndex=getNextIndex;	//获取下一个卡片序号
function getNextIndex(index){
	for(var i=index+1;i<cardNum;i++){
		if(titles[i].style.display!="none")
		return i;
	}
}

//获取上一个卡片序号
this.getPreviousIndex=getPreviousIndex; //获取上一个卡片序号
function getPreviousIndex(index){
	for(var i=index-1;i>0;i--){
		if(titles[i].style.display!="none")
		return i;
	}
}

//获取可见的卡片总量
this.getAllVisible=getAllVisible;//获取可见的卡片总量
function getAllVisible(){
}

//获取当前显示的卡片序号
this.getCurrentCardIndex=getCurrentCardIndex;//获取当前显示的卡片序号
function getCurrentCardIndex(){
	for(var i=0;i<cardNum;i++)
		if(cards[i].style.display!="none")			 
			return i;
	return null;
}


//根据index获取相应的card对象
this.getCardByIndex=getCardByIndex;//根据index获取相应的card对象
function getCardByIndex(index){
	return cards[index];//cards是卡片数组
}


//获取当前的卡片id
this.getCurrentCardId=getCurrentCardId;	//获取当前的卡片id
function getCurrentCardId(){
	for(var i=0;i<cardNum;i++)
		if(cards[i].style.display!="none")
			return cards[i].id;
	return null;
}


//使卡片失效，其内容不提交
this.disableCard=disableCard;	//使卡片失效，其内容不提交
function disableCard(cardId){
	for(var i=0;i<cards.length;i++)
		if(cards[i].id==cardId){
			cards[i].disabled=true;
			return true;
		}
	return false;
}

}