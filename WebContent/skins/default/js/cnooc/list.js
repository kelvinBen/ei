
//���ʻ�
var list_msg_1 = "List����δ����!";								//function initList				59��
var list_msg_2 = "List��ǩ����--�����Table!"						//function getListObj			187
var list_msg_3 = "List��ǩ����--Table����ȱ��<TR>��ǩ!"			//function getListObj			194
var list_msg_4 = "List��ǩ����--ListLeft����ȱ��<TD>��ǩ!"			//function getLeftObj			207
var list_msg_5 = "List��ǩ����--listLeft����ȱ��<SELECT>��ǩ!"		//function getLeftObj			213
var list_msg_6 = "List��ǩ����--ListRight����ȱ��<TD>��ǩ!"		//function getMiddleObj			225
var list_msg_7 = "List��ǩ����--listMiddle����ȱ��<P>��ǩ!"		//function getMiddleObj			231
var list_msg_8 = "List��ǩ����--ListRight����ȱ��<TD>��ǩ!"		//function getRightObj			243
var list_msg_9 = "List��ǩ����--listRight����ȱ��<SELECT>��ǩ!"	//function getRightObj()		249
var list_msg_10 = "List��ǩ����--���ƶ���ťȱ��<IMG>��ǩ!"			//function getMoveRightBtn()	260
var list_msg_11 = "List��ǩ����--ȱ��<IMG>��ǩ!"					//function getMoveRightAllBtn()	273
														//function getMoveLeftBtn()		291		300
																//function getMoveLeftAllBtn()	314
var list_msg_12 = "ֻ��ѡ��һ��������ƣ�"							//function radioMoveRight()		342
function LIST(id)
{
	//ȫ�ֱ���
	var listObj=null;                 //List����table
	var listBody=null;                //List��ǩ��table��tr
	var listLeft=null;                //���list
  var listMiddle=null;					  	//�м������
	var listRight=null;               //�ұ�list
	var rightImg=null;							  //���ư�ť
	var rightAllImg=null;							//ȫ���ư�ť
	var leftImg=null;							    //���ư�ť
	var leftAllImg=null;							//ȫ���ư�ť
	

	//˽�б���
	this.id=id;
	this.leftOriginalLength=null;			//��߳�ʼԪ�ظ���
	this.rightOriginalLength=null;		//�ұ߳�ʼԪ�ظ���
	this.leftCanAdd=true;							//��list��������ѡ��
	this.leftCanRemove=true;					//��list����ɾ��ѡ��
	this.rightCanAdd=true;						//��list��������ѡ��
	this.rightCanRemove=true;					//��list����ɾ��ѡ��
	//˽�з���
	this.initList=initList;					//��ʼ��List
	this.getListObj=getListObj;  			//��ȡlist����
	this.getRightObj=getRightObj;			//��ȡ�ұ�list����
	this.getLeftObj=getLeftObj;				//��ȡ���list����
	this.getMiddleObj=getMiddleObj;			//��ȡ�м䰴ť����
	this.getMoveRightBtn=getMoveRightBtn;	//��ȡ���ư�ť����
	this.getMoveRightAllBtn=getMoveRightAllBtn; //��ȡȫ�����ư�ť����
	this.getMoveLeftBtn=getMoveLeftBtn;		//��ȡ���ư�ť����
	this.getMoveLeftAllBtn=getMoveLeftAllBtn;//��ȡȫ�����ư�ť����
	this.getAllObjects=getAllObjects; 		 //��ȡ����List��ض���
	this.radioMoveRight=radioMoveRight;       //��ѡ,����
	this.radioMoveLeft=radioMoveLeft;         //��ѡ,����
	this.multiMoveRight=multiMoveRight;				//��ѡ,����
	this.multiMoveLeft=multiMoveLeft;					//��ѡ,����
	this.multiMoveRightAll=multiMoveRightAll;	//��ѡ,ȫ����
	this.multiMoveLeftAll=multiMoveLeftAll;	//ȫѡ,ȫ����

	this.limit_MoveRight=limit_MoveRight;				//��ѡ,��������
	this.limit_MoveLeft=limit_MoveLeft;					//��ѡ,��������
	this.limit_MoveRightAll=limit_MoveRightAll;	//��ѡ,����ȫ����
	this.limit_MoveLeftAll=limit_MoveLeftAll;	//ȫѡ,����ȫ����

	this.getRightOptionsValues=getRightOptionsValues;   //��ȡ�����ұ�ѡ��ֵ(value)
	this.getLeftOptionsValues=getLeftOptionsValues;    //��ȡ�������ѡ��ֵ(value)
	this.getRightOptionsLabels=getRightOptionsLabels;   //��ȡ�����ұ�ѡ����ʾֵ(label)
	this.getLeftOptionsLabels=getLeftOptionsLabels;    //��ȡ�������ѡ����ʾֵ(label)
	this.getRightOptions=getRightOptions;								//��ȡ�����ұ�ѡ��(����value��label)
	this.getLeftOptions=getLeftOptions;								//��ȡ�������ѡ��(����value��label)
	this.leftSort = leftSort;                                  //�����ѡ���������
	this.rightSort = rightSort;									 //���ұ�ѡ���������

//	this.sortRightOptions=sortRightOptions; //�����ѡ���������
//	this.sortLeftOptions=sortLeftOptions;   //���ұ�ѡ���������
}


//***************************��ʼ��list*****************************
function initList(type,isdisabled)
{
	 if(type==null || type=="")
	 {
	  alert("List����δ����!");
	  return;
    }
	
	this.getAllObjects();
		//��ȡ�б�ԭ��Ԫ�ظ���
	this.leftOriginalLength=listLeft.options.length;
	this.rightOriginalLength=listRight.options.length;
	
  //��ѡ
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
  //��ѡ
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
  //����������
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
	//����������
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
//***************************��ʼ��list����**************************

//*****************ҳ������ȡ��ʼ************************************
//��ȡҳ������List��ض���
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

//��ȡlist����table
function getListObj()
{
	listObj=document.getElementById(this.id);
    if(listObj==null||(listObj.tagName!="TABLE"))
	{
	   alert("List��ǩ����--��Table!");
	   return;
	}

	listBody=listObj.rows[0];
   if(listBody==null||(listBody.tagName!="TR"))
	 {
	   alert("List��ǩ����--Table��TR!");
	   return;
	 }
	
 return listObj;
}

//��ȡlistLeft����SELECT
function getLeftObj()
{
	//���Һ������ƶ��б���һ����
	var listBodyChild=listObj.rows[0].cells[0];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List��ǩ����--ListLeft��TD!");
	   return;
	}
 listLeft=listBodyChild.children[0];
 if(listLeft==null||(listLeft.tagName!="SELECT"))
	{
	   alert("List��ǩ����--listLeft��SELECT!");
	   return;
	}
 return listLeft;
}

//��ȡlistMiddle����p
function getMiddleObj()
{
	//�����б�
	if(listObj.rows.length==1){
	var listBodyChild=listObj.rows[0].cells[1];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List��ǩ����--ListRight��TD!");
	   return;
	}
 listMiddle=listBodyChild.children[0];
 if(listMiddle==null||(listMiddle.tagName!="P"))
	{
	   alert("List��ǩ����--listMiddle��P!");
	   return;
	}
	}
	//�����б�
	else if(listObj.rows.length==3){
		var listBodyChild=listObj.rows[1].cells[0];
		if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List��ǩ����--ListRight��TD!");
	   return;
	}
 listMiddle=listBodyChild.children[0];
 if(listMiddle==null||(listMiddle.tagName!="P"))
	{
	   alert("List��ǩ����--listMiddle��P!");
	   return;
	}
	}
 return listMiddle;
}

//��ȡlistRight����SELECT
function getRightObj()
{
	//�����б�
	if(listObj.rows.length==1){
	var listBodyChild=listObj.rows[0].cells[2];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List��ǩ����--ListRight��TD!");
	   return;
	}
 listRight=listBodyChild.children[0];
 if(listRight==null||(listRight.tagName!="SELECT"))
	{
	   alert("List��ǩ����--listRight��SELECT!");
	   return;
	}
}
//�����б�
else if(listObj.rows.length==3){
	var listBodyChild=listObj.rows[2].cells[0];
  if(listBodyChild==null||(listBodyChild.tagName!="TD"))
	{
	   alert("List��ǩ����--ListRight��TD!");
	   return;
	}
 listRight=listBodyChild.children[0];
 if(listRight==null||(listRight.tagName!="SELECT"))
	{
	   alert("List��ǩ����--listRight��SELECT!");
	   return;
	}
	}
 return listLeft;
}
//��ȡ���ư�ť
function getMoveRightBtn()
{
	rightImg=listMiddle.children[0];
	if(rightImg==null||(rightImg.tagName!="IMG"))
	{
	   alert("List��ǩ����--���ƶ���ť��IMG!");
	   return;
	}
 return rightImg;
}
//��ȡȫ�����ư�ť
function getMoveRightAllBtn()
{
	if (listMiddle.children.length==8)
	{
	 rightAllImg=listMiddle.children[2];
   if(rightAllImg==null||rightAllImg.tagName!="IMG")
	 {
	   alert("List��ǩ����--ȱ��IMG!");
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
//��ȡ���ư�ť
function getMoveLeftBtn()
{
	if (listMiddle.children.length==8)
	{
	 leftImg=listMiddle.children[5];
   if(leftImg==null||(leftImg.tagName!="IMG"))
	 {
	   alert("List��ǩ����--ȱ��IMG!");
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
	   alert("List��ǩ����--ȱ��IMG!");
	   return;
	  }
	 }
 return leftImg;
}
//��ȡȫ�����ư�ť
function getMoveLeftAllBtn()
{
	if (listMiddle.children.length==8)
	{
	 leftAllImg=listMiddle.children[7];
   if(leftAllImg==null||(leftAllImg.tagName!="IMG"))
	 {
	   alert("List��ǩ����--ȱ��IMG!");
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
//*****************�����ȡ����************************************

//*****************type=oneImg��ťִ�еĽű�************************
//��ѡ,����
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
	alert("ֻ��ѡ��һ��������ƣ�");
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

//��ѡ,����
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
//*****************type=oneImg��ťִ�еĽű�����************************

//*****************type=multiImg��ťִ�еĽű�**************************
//��ѡ,����
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

//��ѡ,����
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

//��ѡ,ȫ������
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

//��ѡ,ȫ������
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
//*****************type=oneImg��ťִ�еĽű�����************************

//*****************type=limitMoveLeft��ťִ�еĽű���ʼ************************
//�������ƣ���ԭ���ұ����ݲ����Ƶ����

//��ѡ,����
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
//��ѡ,ȫ������
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
//*****************type=limitMoveLeft��ťִ�еĽű�����************************

//*****************type=limitMoveRight��ťִ�еĽű���ʼ************************
//���������ƣ���ԭ���ұ����ݲ����Ƶ����
//��ѡ,����
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

//��ѡ,ȫ������
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

//*****************type=leftImg��ťִ�еĽű�����************************

//*****************���⹫�ú����ӿ�************************
//��ȡ�����ұ�ѡ��(value��label)
//value��ǰ,label�ں�,ʹ�ö��ŷָ�;��ͬoptionʹ�÷ֺŷָ�
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

//��ȡ�������ѡ��(value��label)
//value��ǰ,label�ں�,ʹ�ö��ŷָ�;��ͬoptionʹ�÷ֺŷָ�
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
//��ȡ�����ұ�ѡ��ֵ(value)
//ʹ�ö��ŷָ�;
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

//��ȡ�������ѡ��(value)
//ʹ�ö��ŷָ�;
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

//��ȡ�����ұ�ѡ��(label)
//ʹ�ö��ŷָ�
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

//��ȡ�������ѡ��(label)
//ʹ�ö��ŷָ�;
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
//�ж�option����sel���Ƿ���ѡ��opi
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
//*******************************����ʼ**********************************************
//�������
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
//�ұ�����
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

//*******************************�������**********************************************