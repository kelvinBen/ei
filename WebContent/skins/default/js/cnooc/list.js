
//国际化
var list_msg_1 = "List类型未定义!";								//function initList				59行
var list_msg_2 = "List标签错误--对象非Table!"						//function getListObj			187
var list_msg_3 = "List标签错误--Table对象缺少<TR>标签!"			//function getListObj			194
var list_msg_4 = "List标签错误--ListLeft对象缺少<TD>标签!"			//function getLeftObj			207
var list_msg_5 = "List标签错误--listLeft对象缺少<SELECT>标签!"		//function getLeftObj			213
var list_msg_6 = "List标签错误--ListRight对象缺少<TD>标签!"		//function getMiddleObj			225
var list_msg_7 = "List标签错误--listMiddle对象缺少<P>标签!"		//function getMiddleObj			231
var list_msg_8 = "List标签错误--ListRight对象缺少<TD>标签!"		//function getRightObj			243
var list_msg_9 = "List标签错误--listRight对象缺少<SELECT>标签!"	//function getRightObj()		249
var list_msg_10 = "List标签错误--右移动按钮缺少<IMG>标签!"			//function getMoveRightBtn()	260
var list_msg_11 = "List标签错误--缺少<IMG>标签!"					//function getMoveRightAllBtn()	273
														//function getMoveLeftBtn()		291		300
																//function getMoveLeftAllBtn()	314
var list_msg_12 = "只能选择一项进行右移！"							//function radioMoveRight()		342
function LIST(id)
{
	//全局变量
	var listObj=null;                 //List对象table
	var listBody=null;                //List标签体table的tr
	var listLeft=null;                //左边list
  var listMiddle=null;					  	//中间操作区
	var listRight=null;               //右边list
	var rightImg=null;							  //右移按钮
	var rightAllImg=null;							//全右移按钮
	var leftImg=null;							    //左移按钮
	var leftAllImg=null;							//全左移按钮
	

	//私有变量
	this.id=id;
	this.leftOriginalLength=null;			//左边初始元素个数
	this.rightOriginalLength=null;		//右边初始元素个数
	this.leftCanAdd=true;							//左list可以增加选项
	this.leftCanRemove=true;					//左list可以删除选项
	this.rightCanAdd=true;						//右list可以增加选项
	this.rightCanRemove=true;					//右list可以删除选项
	//私有方法
	this.initList=initList;					//初始化List
	this.getListObj=getListObj;  			//获取list对象
	this.getRightObj=getRightObj;			//获取右边list对象
	this.getLeftObj=getLeftObj;				//获取左边list对象
	this.getMiddleObj=getMiddleObj;			//获取中间按钮对象
	this.getMoveRightBtn=getMoveRightBtn;	//获取右移按钮对象
	this.getMoveRightAllBtn=getMoveRightAllBtn; //获取全部右移按钮对象
	this.getMoveLeftBtn=getMoveLeftBtn;		//获取左移按钮对象
	this.getMoveLeftAllBtn=getMoveLeftAllBtn;//获取全部左移按钮对象
	this.getAllObjects=getAllObjects; 		 //获取所有List相关对象
	this.radioMoveRight=radioMoveRight;       //单选,右移
	this.radioMoveLeft=radioMoveLeft;         //单选,左移
	this.multiMoveRight=multiMoveRight;				//多选,右移
	this.multiMoveLeft=multiMoveLeft;					//多选,左移
	this.multiMoveRightAll=multiMoveRightAll;	//多选,全右移
	this.multiMoveLeftAll=multiMoveLeftAll;	//全选,全左移

	this.limit_MoveRight=limit_MoveRight;				//多选,限制右移
	this.limit_MoveLeft=limit_MoveLeft;					//多选,限制左移
	this.limit_MoveRightAll=limit_MoveRightAll;	//多选,限制全右移
	this.limit_MoveLeftAll=limit_MoveLeftAll;	//全选,限制全左移

	this.getRightOptionsValues=getRightOptionsValues;   //获取所有右边选项值(value)
	this.getLeftOptionsValues=getLeftOptionsValues;    //获取所有左边选项值(value)
	this.getRightOptionsLabels=getRightOptionsLabels;   //获取所有右边选项显示值(label)
	this.getLeftOptionsLabels=getLeftOptionsLabels;    //获取所有左边选项显示值(label)
	this.getRightOptions=getRightOptions;								//获取所有右边选项(包括value和label)
	this.getLeftOptions=getLeftOptions;								//获取所有左边选项(包括value和label)
	this.leftSort = leftSort;                                  //对左边选项进行排序
	this.rightSort = rightSort;									 //对右边选项进行排序

//	this.sortRightOptions=sortRightOptions; //对左边选项进行排序
//	this.sortLeftOptions=sortLeftOptions;   //对右边选项进行排序
}


//***************************初始化list*****************************
function initList(type,isdisabled)
{
	 if(type==null || type=="")
	 {
	  alert("List类型未定义!");
	  return;
    }
	
	this.getAllObjects();
		//获取列表原先元素个数
	this.leftOriginalLength=listLeft.options.length;
	this.rightOriginalLength=listRight.options.length;
	
  //单选
  if (type=="oneImg"&&isdisabled=="false")
  {
		var str=this.id+".radioMoveRight()";
		var click=new Function(str);
		listLeft.attachEvent("ondblclick",click);
		rightImg.attachEvent("onclick",click);
	
		var str1=this.id+".radioMoveLeft()";
	  var click1=new Function(str1);
	  listRight.attachEvent("ondblclick",click1);
		leftImg.attachEvent("onclick",click1);
  }
  //多选
	if (type=="multiImg"&&isdisabled=="false")
	{
		
		var str2=this.id+".multiMoveRight()";
	  var click2=new Function(str2);
		listLeft.attachEvent("ondblclick",click2);
		rightImg.attachEvent("onclick",click2);

		var str3=this.id+".multiMoveLeft()";
	  var click3=new Function(str3);
	  listRight.attachEvent("ondblclick",click3);
		leftImg.attachEvent("onclick",click3);
		if (leftAllImg!=null)
		{
			var str4=this.id+".multiMoveLeftAll()";
			var click4=new Function(str4);
			leftAllImg.attachEvent("onclick",click4);
		}
	
    if (rightAllImg!=null)
    {
			var str5=this.id+".multiMoveRightAll()";
			var click5=new Function(str5);
			rightAllImg.attachEvent("onclick",click5);
		}
		
	}
  //限制性右移
	if ((type=="limitMoveRight"||type=="limitMoveDown")&&isdisabled=="false")
	{
		
		var str21=this.id+".limit_MoveRight()";
	  var click21=new Function(str21);
		listLeft.attachEvent("ondblclick",click21);
		rightImg.attachEvent("onclick",click21);

		var str31=this.id+".multiMoveLeft()";
	  var click31=new Function(str31);
	  listRight.attachEvent("ondblclick",click31);
		leftImg.attachEvent("onclick",click31);
		if (leftAllImg!=null)
		{
			var str41=this.id+".multiMoveLeftAll()";
			var click41=new Function(str41);
			leftAllImg.attachEvent("onclick",click41);
		}
	
    if (rightAllImg!=null)
    {
			var str51=this.id+".limit_MoveRightAll()";
			var click51=new Function(str51);
			rightAllImg.attachEvent("onclick",click51);
		}
		
	}
	//限制性左移
	if ((type=="limitMoveLeft"||type=="limitMoveUp")&&isdisabled=="false")
	{
		
		var str22=this.id+".multiMoveRight()";
	  var click22=new Function(str22);
		listLeft.attachEvent("ondblclick",click22);
		rightImg.attachEvent("onclick",click22);

		var str32=this.id+".limit_MoveLeft()";
	  var click32=new Function(str32);
	  listRight.attachEvent("ondblclick",click32);
		leftImg.attachEvent("onclick",click32);
		if (leftAllImg!=null)
		{
			var str42=this.id+".limit_MoveLeftAll()";
			var click42=new Function(str42);
			leftAllImg.attachEvent("onclick",click42);
		}
	
    if (rightAllImg!=null)
    {
			var str52=this.id+".multiMoveRightAll()";
			var click52=new Function(str52);
			rightAllImg.attachEvent("onclick",click52);
		}
		
	}

}
//***************************初始化list结束**************************

//*****************页面对象获取开始************************************
//获取页面所有List相关对象
function getAllObjects()
{
	this.getListObj();
	this.getLeftObj();
	this.getMiddleObj();
	this.getRightObj();
	this.getMoveRightBtn();
	this.getMoveRightAllBtn();
	this.getMoveLeftBtn();
	this.getMoveLeftAllBtn();
}

//获取list对象，table
function getListObj()
{
	listObj=document.getElementById(this.id);
    if(listObj==null||(listObj.tagName!="TABLE"))
	{
	   alert("List标签错误--非Table!");
	   return;
	}

	listBody=listObj.rows[0];
   if(listBody==null||(listBody.tagName!="TR"))
	 {
	   alert("List标签错误--Table无TR!");
	   return;
	 }
	
 return listObj;
}

//获取listLeft对象，SELECT
function getLeftObj()
{
	//左右和上下移动列表是一样的
	var listBodyChild=listObj.rows[0].cells[0];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List标签错误--ListLeft无TD!");
	   return;
	}
 listLeft=listBodyChild.children[0];
 if(listLeft==null||(listLeft.tagName!="SELECT"))
	{
	   alert("List标签错误--listLeft非SELECT!");
	   return;
	}
 return listLeft;
}

//获取listMiddle对象，p
function getMiddleObj()
{
	//左右列表
	if(listObj.rows.length==1){
	var listBodyChild=listObj.rows[0].cells[1];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List标签错误--ListRight无TD!");
	   return;
	}
 listMiddle=listBodyChild.children[0];
 if(listMiddle==null||(listMiddle.tagName!="P"))
	{
	   alert("List标签错误--listMiddle非P!");
	   return;
	}
	}
	//上下列表
	else if(listObj.rows.length==3){
		var listBodyChild=listObj.rows[1].cells[0];
		if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List标签错误--ListRight无TD!");
	   return;
	}
 listMiddle=listBodyChild.children[0];
 if(listMiddle==null||(listMiddle.tagName!="P"))
	{
	   alert("List标签错误--listMiddle非P!");
	   return;
	}
	}
 return listMiddle;
}

//获取listRight对象，SELECT
function getRightObj()
{
	//左右列表
	if(listObj.rows.length==1){
	var listBodyChild=listObj.rows[0].cells[2];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List标签错误--ListRight无TD!");
	   return;
	}
 listRight=listBodyChild.children[0];
 if(listRight==null||(listRight.tagName!="SELECT"))
	{
	   alert("List标签错误--listRight非SELECT!");
	   return;
	}
}
//上下列表
else if(listObj.rows.length==3){
	var listBodyChild=listObj.rows[2].cells[0];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List标签错误--ListRight无TD!");
	   return;
	}
 listRight=listBodyChild.children[0];
 if(listRight==null||(listRight.tagName!="SELECT"))
	{
	   alert("List标签错误--listRight非SELECT!");
	   return;
	}
	}
 return listLeft;
}
//获取右移按钮
function getMoveRightBtn()
{
	rightImg=listMiddle.children[0];
	if(rightImg==null||(rightImg.tagName!="IMG"))
	{
	   alert("List标签错误--右移动按钮非IMG!");
	   return;
	}
 return rightImg;
}
//获取全部右移按钮
function getMoveRightAllBtn()
{
	if (listMiddle.children.length==8)
	{
	 rightAllImg=listMiddle.children[2];
   if(rightAllImg==null||rightAllImg.tagName!="IMG")
	 {
	   alert("List标签错误--缺少IMG!");
	   return;
	 }
  }
	else if(listMiddle.children.length==4){
		rightAllImg=listMiddle.children[1];
		}
	else if (listMiddle.children.length==5||listMiddle.children.length==2)
	{
		rightAllImg=null;
	}
 return rightAllImg;
}
//获取左移按钮
function getMoveLeftBtn()
{
	if (listMiddle.children.length==8)
	{
	 leftImg=listMiddle.children[5];
   if(leftImg==null||(leftImg.tagName!="IMG"))
	 {
	   alert("List标签错误--缺少IMG!");
	   return;
	 }
  }
	else if(listMiddle.children.length==2){
		leftImg=listMiddle.children[1];
		}
	else if(listMiddle.children.length==4){
		leftImg=listMiddle.children[2];
		}
	else if (listMiddle.children.length==5)
	{
		leftImg=listMiddle.children[3];
    if(leftImg==null||(leftImg.tagName!="IMG"))
	  {
	   alert("List标签错误--缺少IMG!");
	   return;
	  }
	 }
 return leftImg;
}
//获取全部左移按钮
function getMoveLeftAllBtn()
{
	if (listMiddle.children.length==8)
	{
	 leftAllImg=listMiddle.children[7];
   if(leftAllImg==null||(leftAllImg.tagName!="IMG"))
	 {
	   alert("List标签错误--缺少IMG!");
	   return;
	 }
  }
	else if(listMiddle.children.length==4){
		leftAllImg=listMiddle.children[3];
	}
	else if (listMiddle.children.length==5||listMiddle.children.length==2)
	{
		leftAllImg=null;
  }
 return leftAllImg;
}
//*****************对象获取结束************************************

//*****************type=oneImg按钮执行的脚本************************
//单选,右移
function radioMoveRight()
{
	this.getAllObjects();
	var leftLength=listLeft.options.length;
	var selednum=0;
	for(var i=leftLength-1;i>=0;i--)
	{
	 if(listLeft.options[i].selected)
	 {
	 selednum++;
	 }
	}
	if(selednum>1)
	{
	alert("只能选择一项进行右移！");
	return;
	}
	var rightLength=listRight.options.length;
	if(rightLength>1)
	{
	return;
	}
	if(rightLength==1)
	{
	var opi=listRight.options[0];
	if(opi!=null)
	{
		if(this.leftCanAdd&&!hasOption(opi,this.getLeftOptions())){
	 var opn=document.createElement("<OPTION>");
	 listLeft.options.add(opn);
	 opn.innerText=opi.innerText;
	 opn.value=opi.value;
	}
	if(this.rightCanRemove)
	 listRight.options.remove(0);
	 }
	}

	for(var i=leftLength-1;i>=0;i--)
	{
	 if(listLeft.options[i].selected)
	{
		if(this.rightCanAdd&&!hasOption(listLeft.options[i],this.getRightOptions())){
	var opn=document.createElement("<OPTION>");
	 listRight.options.add(opn);
	 opn.innerText=listLeft.options[i].innerText;
	opn.value=listLeft.options[i].value;
}
	if(this.leftCanRemove)
	listLeft.options.remove(i);
	}
	}

}

//单选,左移
function radioMoveLeft()
{
	this.getAllObjects();
	var rightLength=listRight.options.length;
	for(var i=rightLength-1;i>=0;i--)
	{
	 if(listRight.options[i].selected)
	 {
	 	if(this.leftCanAdd&&!hasOption(listRight.options[i],this.getLeftOptions())){
	 var opn=document.createElement("<OPTION>");
	 listLeft.options.add(opn);
	 opn.innerText=listRight.options[i].innerText;
	 opn.value=listRight.options[i].value;
	}
	if(this.rightCanRemove)
	 listRight.options.remove(i);
	 }
	}
}
//*****************type=oneImg按钮执行的脚本结束************************

//*****************type=multiImg按钮执行的脚本**************************
//多选,右移
function multiMoveRight()
{
	this.getAllObjects();
	var leftLength=listLeft.options.length;
	for(var i=0;i<=leftLength-1;i++)
	{
	 if(listLeft.options[i].selected)
	 {
	 	if(this.rightCanAdd&&!hasOption(listLeft.options[i],this.getRightOptions())){
	 var opn=document.createElement("<OPTION>");
	 listRight.options.add(opn);
	 opn.innerText=listLeft.options[i].innerText;
	 opn.value=listLeft.options[i].value;
	}
	//if(this.leftCanRemove)
	 //listLeft.options.remove(i);
	 }
 
	}
	for(var i=leftLength-1;i>=0;i--)
	{
	 if(listLeft.options[i].selected)
	 {
		 if(this.leftCanRemove)
		listLeft.options.remove(i);
	 }
	}
}

//多选,左移
function multiMoveLeft()
{
  this.getAllObjects();
	var rightLength=listRight.options.length;
	for(var i=0;i<=rightLength-1;i++)
	{
	 if(listRight.options[i].selected)
	 {
	 if(this.leftCanAdd&&!hasOption(listRight.options[i],this.getLeftOptions())){
	 var opn=document.createElement("<OPTION>");
	 listLeft.options.add(opn);
	 opn.innerText=listRight.options[i].innerText;
	 opn.value=listRight.options[i].value;
	}
	//if(this.rightCanRemove)
	 //listRight.options.remove(i);
	 }
 
	}
	for(var i=rightLength-1;i>=0;i--)
	{
	 if(listRight.options[i].selected)
	 {
		 if(this.rightCanRemove)
		listRight.options.remove(i);
	 }
	}
}

//多选,全部右移
function multiMoveRightAll()
{
	this.getAllObjects();
	var leftLength=listLeft.options.length;
	for(var i=0;i<=leftLength-1;i++)
	{
		if(this.rightCanAdd&&!hasOption(listLeft.options[i],this.getRightOptions())){
	 var opn=document.createElement("<OPTION>");
	 listRight.options.add(opn);
	 opn.innerText=listLeft.options[i].innerText;
	 opn.value=listLeft.options[i].value;
	}
	}
	 listLeft.options.length=0;
}

//多选,全部左移
function multiMoveLeftAll()
{
	this.getAllObjects();
	var rightLength=listRight.options.length;
	for(var i=0;i<=rightLength-1;i++)
	{
		if(this.leftCanAdd&&!hasOption(listRight.options[i],this.getLeftOptions())){
	 var opn=document.createElement("<OPTION>");
	 listLeft.options.add(opn);
	 opn.innerText=listRight.options[i].innerText;
	 opn.value=listRight.options[i].value;
	}
	}
	listRight.options.length=0;
}
//*****************type=oneImg按钮执行的脚本结束************************

//*****************type=limitMoveLeft按钮执行的脚本开始************************
//限制左移，即原来右边数据不能移到左边

//多选,左移
function limit_MoveLeft()
{
  this.getAllObjects();
	var rightLength=listRight.options.length;
	for(var i=this.rightOriginalLength;i<=rightLength-1;i++)
	{
	 if(listRight.options[i].selected)
	 {
	 	if(this.leftCanAdd&&!hasOption(listRight.options[i],this.getLeftOptions())){
	 var opn=document.createElement("<OPTION>");
	 listLeft.options.add(opn);
	 opn.innerText=listRight.options[i].innerText;
	 opn.value=listRight.options[i].value;
	}
	//if(this.rightCanRemove)
	 //listRight.options.remove(i);
	 }
 
	}
	for(var i=rightLength-1;i>=this.rightOriginalLength;i--)
	{
		if(listRight.options[i].selected)
	 {
			if(this.rightCanRemove)
	         listRight.options.remove(i);
	}
	}
}
//多选,全部左移
function limit_MoveLeftAll()
{
	this.getAllObjects();
	var rightLength=listRight.options.length;
	for(var i=this.rightOriginalLength;i<=rightLength-1;i++)
	{
	if(this.leftCanAdd&&!hasOption(listRight.options[i],this.getLeftOptions())){
	 var opn=document.createElement("<OPTION>");
	 listLeft.options.add(opn);
	 opn.innerText=listRight.options[i].innerText;
	 opn.value=listRight.options[i].value;
	}
	}
		for(var i=rightLength-1;i>=this.rightOriginalLength;i--)
	{
			if(this.rightCanRemove)
	 	listRight.options.remove(i);
	}
}
//*****************type=limitMoveLeft按钮执行的脚本结束************************

//*****************type=limitMoveRight按钮执行的脚本开始************************
//限制性右移，即原来右边数据不能移到左边
//多选,右移
function limit_MoveRight()
{
	this.getAllObjects();
	var leftLength=listLeft.options.length;
	for(var i=this.leftOriginalLength;i<=leftLength-1;i++)
	{
	 if(listLeft.options[i].selected)
	 {
	 	if(this.rightCanAdd&&!hasOption(listLeft.options[i],this.getRightOptions())){
	 var opn=document.createElement("<OPTION>");
	 listRight.options.add(opn);
	 opn.innerText=listLeft.options[i].innerText;
	 opn.value=listLeft.options[i].value;
	}
	//if(this.leftCanRemove)
	 //listLeft.options.remove(i);
	 }
 
	}
	for(var i=leftLength-1;i>=this.leftOriginalLength;i--)
	{
		if(listLeft.options[i].selected)
		{if(this.leftCanRemove)
	 listLeft.options.remove(i);}
	}
}

//多选,全部右移
function limit_MoveRightAll()
{
	this.getAllObjects();
	var leftLength=listLeft.options.length;
//	alert("leftLength->"+leftLength);
//	alert("this.leftOriginalLength->"+this.leftOriginalLength);
	for(var i=this.leftOriginalLength;i<=leftLength-1;i++)
	{
		if(this.rightCanAdd&&!hasOption(listLeft.options[i],this.getRightOptions())){
	 var opn=document.createElement("<OPTION>");
	 listRight.options.add(opn);
	 opn.innerText=listLeft.options[i].innerText;
	 opn.value=listLeft.options[i].value;
	}
	}
	for(var i=leftLength-1;i>=this.leftOriginalLength;i--)
	{
	if(this.leftCanRemove)
	 listLeft.options.remove(i);
	}
}

//*****************type=leftImg按钮执行的脚本结束************************

//*****************对外公用函数接口************************
//获取所有右边选项(value和label)
//value在前,label在后,使用逗号分割;不同option使用分号分割
function getRightOptions()
{
	this.getAllObjects();
	var rightListOptions="";
	var rightLength=listRight.options.length;
	for(var i=0;i<=rightLength-1;i++)
	{
		if (i==rightLength-1)
		{
		  rightListOptions=rightListOptions+listRight.options[i].innerText+",";
			rightListOptions=rightListOptions+listRight.options[i].value;
		}
		else 
		{
		  rightListOptions=rightListOptions+listRight.options[i].innerText+",";
			rightListOptions=rightListOptions+listRight.options[i].value+";";
		}
	}
	return rightListOptions;
}

//获取所有左边选项(value和label)
//value在前,label在后,使用逗号分割;不同option使用分号分割
function getLeftOptions()
{
	this.getAllObjects();
	var leftListOptions="";
	var leftLength=listLeft.options.length;
	for(var i=0;i<=leftLength-1;i++)
	{
		if (i==leftLength-1)
		{
		  leftListOptions=leftListOptions+listLeft.options[i].innerText+",";
			leftListOptions=leftListOptions+listLeft.options[i].value;
		}
		else 
		{
		  leftListOptions=leftListOptions+listLeft.options[i].innerText+",";
			leftListOptions=leftListOptions+listLeft.options[i].value+";";
		}

	}

  return leftListOptions;
}
//获取所有右边选项值(value)
//使用逗号分割;
function getRightOptionsValues()
{
	this.getAllObjects();
	var rightListOptions="";
	var rightLength=listRight.options.length;
	for(var i=0;i<=rightLength-1;i++)
	{
		if (i==rightLength-1)
		{
		 	rightListOptions=rightListOptions+listRight.options[i].value;
		}
		else 
		{
		  rightListOptions=rightListOptions+listRight.options[i].value+",";
		}
	}
	return rightListOptions;
}	

//获取所有左边选项(value)
//使用逗号分割;
function getLeftOptionsValues()
{
	this.getAllObjects();
	var leftListOptions="";
	var leftLength=listLeft.options.length;
	for(var i=0;i<=leftLength-1;i++)
	{
		if (i==leftLength-1)
		{
		 
			leftListOptions=leftListOptions+listLeft.options[i].value;
		}
		else 
		{
		  
			leftListOptions=leftListOptions+listLeft.options[i].value+",";
		}
	}

  return leftListOptions;
}

//获取所有右边选项(label)
//使用逗号分割
function getRightOptionsLabels()
{
	this.getAllObjects();
	var rightListOptions="";
	var rightLength=listRight.options.length;
	for(var i=0;i<=rightLength-1;i++)
	{
		if (i==rightLength-1)
		{
		  rightListOptions=rightListOptions+listRight.options[i].innerText;
			
		}
		else 
		{
		  rightListOptions=rightListOptions+listRight.options[i].innerText+",";
		
		}
	}
	return rightListOptions;
}

//获取所有左边选项(label)
//使用逗号分割;
function getLeftOptionsLabels()
{
	this.getAllObjects();
	var leftListOptions="";
	var leftLength=listLeft.options.length;
	for(var i=0;i<=leftLength-1;i++)
	{
		if (i==leftLength-1)
		{
		  leftListOptions=leftListOptions+listLeft.options[i].innerText;

		}
		else 
		{
		  leftListOptions=leftListOptions+listLeft.options[i].innerText+",";
		
		}

	}

  return leftListOptions;
}
//判断option集合sel中是否含有选项opi
function hasOption(opi,sel){
	if(opi.tagName!="OPTION")
		return;
	var sel_arr=sel.split(";");
	var opi_str=opi.innerText+","+opi.value;
	var len=sel_arr.length;
	for(var i=0;i<len;i++)
		if(sel_arr[i]==opi_str)
			return true;
	return false;
}
//*******************************排序开始**********************************************
//左边排序
function leftSort(type){
	if(type==null)type="1";
	var leftSortLength=listLeft.options.length;
	var text;
	var value;
	for(var i=0; i<=leftSortLength-1;i++)
	{  
		if(type=="0"){
			for(var j=0; j<leftSortLength-i-1;j++)
			{
				if(listLeft.options[j].value>listLeft.options[j+1].value)
				{
					text = listLeft.options[j].text;
					value=listLeft.options[j].value;
					listLeft.options[j].value=listLeft.options[j+1].value;
					listLeft.options[j].text=listLeft.options[j+1].text;
					listLeft.options[j+1].value=value;
					listLeft.options[j+1].text=text;
				}
			}
		}else if(type=="1"){
		
			for(var j=0; j<leftSortLength-i-1;j++)
				{
					if(listLeft.options[j].value<listLeft.options[j+1].value)
					{
						text = listLeft.options[j].text;
						value=listLeft.options[j].value;
						listLeft.options[j].value=listLeft.options[j+1].value;
						listLeft.options[j].text=listLeft.options[j+1].text;
						listLeft.options[j+1].value=value;
						listLeft.options[j+1].text=text;
					}
				}
		
		}else{
			alert("");
		}
	}
}
//右边排序
function rightSort(type){
	if(type==null)type="1";
	var rightSortLength=listRight.options.length;
	var text;
	var value;
	for(var i=0; i<=rightSortLength-1;i++)
	{  
		if(type=="0"){
			for(var j=0; j<rightSortLength-i-1;j++)
			{
				if(listRight.options[j].value>listRight.options[j+1].value)
				{
					text = listRight.options[j].text;
					value=listRight.options[j].value;
					listRight.options[j].value=listRight.options[j+1].value;
					listRight.options[j].text=listRight.options[j+1].text;
					listRight.options[j+1].value=value;
					listRight.options[j+1].text=text;
				}
			}
		}else if(type=="1"){
		
			for(var j=0; j<rightSortLength-i-1;j++)
				{
					if(listRight.options[j].value<listRight.options[j+1].value)
					{
						text = listRight.options[j].text;
						value=listRight.options[j].value;
						listRight.options[j].value=listRight.options[j+1].value;
						listRight.options[j].text=listRight.options[j+1].text;
						listRight.options[j+1].value=value;
						listRight.options[j+1].text=text;
					}
				}
		
		}else{
			alert("");
		}
	}
}

//*******************************排序结束**********************************************