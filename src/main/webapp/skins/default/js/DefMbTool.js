/******************************************************************************************
*     DefFormTool ��1.0

*		 descript:			���ڶ��ƹ��ߣ�����XML��ʽ���ַ���
*	
*******************************************************************************************/
var path ;
//-------���߼��й�----------------
var mofWindowId;
var mofWindowPreXml;
var mofTableId;
//---------------------------------
//DefFormTool ��
function DefFormTool(name)
{
//�ⲿ����
this.name=name;
this.CurControl=null;

//��ǰ������XML�ڵ�
var CurXmlNode=null;
//ѡ��ʱ,��¼��ֹ��Ԫ������
this.sTop="";
this.sLeft="";
this.sWidth="";
this.sHeight="";
this.eTop="";
this.eLeft="";
this.eWidth="";
this.eHeight="";
//��¼ѡ��ʱ����ֹ��Ԫ�������λ��
this.sRow="";
this.sCol="";
this.eRow="";
this.eCol="";
//��ɫ���ĳ�����
this.curwidth=0;
this.curheight=0;
//ѡ������������ĵ�Ԫ���width,height
this.maxwidth=0;
this.maxheight=0;
///ѡ������������ϵĵ�Ԫ��
this.lastRTd=null;
///ѡ������������µĵ�Ԫ��
//this.lastRbTd=null;
//����LEFT��TOP
this.tabTop=0;
this.tabLeft=0;

//�ܷ�ϲ�
this.IsCanMar=true;
//�ź�����λ��
this.sRowSort="";
this.sColSort="";
this.eRowSort="";
this.eColSort="";
//ͼƬѡ��url
this.imagelisturl='';



//ѡ��ʱ��갴��ʱ��TD���ɿ�ʱ��TD
var firstTd=null;
var secondTd=null;
//��־�Ƿ��Ѿ��ϲ�
var isDel=false;
//��־�Ƿ��Ѿ�����������
var IsMouseDown=false;
var imgMouseDown=false;
var divMouseDown=false;
var oldtop,oldleft,isresizeheightdown,oldtdtop,oldtdleft,istdzydown;//�϶��п�����

//��¼�϶���ͼƬ
var curElement=null;
//��¼�ƶ��Ŀؼ�
var curMoveElement=null;
//��¼ͼƬ��λ��
var imgleft="-10px";
var imgtop="-10px";
//��¼�Ѿ�����ؼ���TD
var currentTd=null;
//��¼ѡ����Ѿ����ڿؼ�
var currentObj=null;
//��¼ѡ����Ѿ����ڰ��DIV,����ɾ���Ȳ���
var currentDiv=null;

//��¼���ı�
var formstr="";
//��¼SQL���
var sqlstr="";
//�����ı���Ϣ

//ȫ��XML����
var XmlDoc=new ActiveXObject("MSXML.DOMDocument");
//�ܵı��
var TabAll=null;
//����������ڵĴ���
var curWin=document.frames.ff;
//�������������
var TabRows=null;
var TabCols=null;
//�ⲿ����xml��·��
var XmlPath="";
//����չ������xml���ɵ�xml
var extendFieldXml='';
var extendFieldHtml='';
//��ʶ����0�½���1�޸�
var formType=0;
//��Сд����0ΪС��1Ϊ��д
var charType=0;
//�Ƿ�Ҫ�����ֻ��
var readonlyType=0;
//�Ѿ�ѡ���td������
var selectedTdArray=new Array();

//��ʼ������
this.init=init;
function init()
	{
	//TabAll=document.all("tab1");
	//if(TabAll!=null)
		//{
		var frammousedown=new Function(this.name+".FrameMouseDown()");
		var frammousemove=new Function(this.name+".FrameMouseMove()");
		var frammouseup=new Function(this.name+".FrameMouseUp()");
		var funmousedown=new Function(this.name+".TabMouseDown()");
		var funmousemove=new Function(this.name+".TabMouseMove()");
		var funmouseup=new Function(this.name+".TabMouseUp()");
		var funclick=new Function(this.name+".TabClick()");
		var fundbclick=new Function(this.name+".TabdbClick()");
		var funmouseout=new Function(this.name+".TabMouseOut()");
		var fundrag=new Function(this.name+".TabDrag()");
		var fundragend=new Function(this.name+".TabDragEnd()");
		document.all("designdiv").attachEvent("onmousedown",funmousedown);
		document.all("designdiv").attachEvent("onmousemove",funmousemove);
		document.all("designdiv").attachEvent("onmouseup",funmouseup);
		document.all("designdiv").attachEvent("onclick",funclick);
		document.all("designdiv").attachEvent("ondblclick",fundbclick);
		document.all("designdiv").attachEvent("ondrag",fundrag);
		document.all("designdiv").attachEvent("ondragend",fundragend);
		document.all("desiangTr").attachEvent("onmousedown",frammousedown);
		document.all("desiangTr").attachEvent("onmousemove",frammousemove);
		document.all("desiangTr").attachEvent("onmouseup",frammouseup);
		//document.all("pages").attachEvent("onmouseout",funmouseout);
		//}
		firstTd=null;
		secondTd=null;
	
	
	}

//**ͨ�ú�����***
this.getRealLeft=getRealLeft;
function getRealLeft(o){
	var l=o.offsetLeft-o.scrollLeft;
	while(o=o.offsetParent){
		l+=o.offsetLeft-o.scrollLeft;
	}
	return(l);
}
this.getRealTop=getRealTop;
function getRealTop(o){
	var t=o.offsetTop-o.scrollTop;
	while(o=o.offsetParent){
		t+=o.offsetTop-o.scrollTop;
	}
	return(t);
}



//����ONMOUSEDOWN�¼�
this.TabMouseDown=TabMouseDown;
function TabMouseDown()
	{
	var obj=event.srcElement;
	oldtop=event.clientY;
	oldleft=event.x;
	oldtdtop=event.clientY;
	oldtdleft=event.x;

	if(obj.tagName=="INPUT" || obj.tagName=="SELECT" || obj.tagName=="SPAN")
		{	
		if(obj.canmove)
			{
			curMoveElement=obj;
			if(obj.parentElement.tagName=="TD")
				currentObj=obj.parentElement;
			}
		return;
		}

if(obj!=null && obj.tagName=="TD")
{	
	
	if(obj.canresizezy)//(obj.style.cursor=="e-resize")
	{
	istdzydown=true;
	currentTd=obj;
	obj.setCapture();
	return;
	}
	if(obj.style.cursor=="s-resize")
	{
	isresizeheightdown=true;
	currentTd=obj;
	}
}
//	else
	//	{
	//	while(obj.tagName!="TD"&& TabAll.contains(obj))
	//		obj=obj.parentElement;
	//	}
	if(obj.tagName=="TD")
		{
		TabAll=obj.offsetParent;
		}
	if(TabAll==null) return;
	BackTdBg();
	ClearTdSelectd();
	if(obj.tagName=="TD")
		{
		firstTd=obj;
		//obj.style.backgroundColor="#9999FF";
		IsMouseDown=true;
		}

	}

//ondbclick�¼�
this.TabdbClick=TabdbClick;
function TabdbClick()
	{
var obj=event.srcElement;
 
if(obj.tagName=="INPUT")
		{
		this.CurControl=obj;
		if(obj.sumtype=="col"){
			 
			showModalDialog(path+"/jsp/mof/window/sumcol.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		}
		else if(obj.sumtype=="row"){
			 
			showModalDialog(path+"/jsp/mof/window/sumrow.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		}
		else{
			 
			showModalDialog(path+"/jsp/mof/window/TEXT_P.htm",window,"dialogWidth:450px;dialogHeight:550px;status:no");
		}
		}
if(obj.tagName=="TEXTAREA" && obj.type!="pl")
		{
		this.CurControl=obj;
	showModalDialog(path+"/jsp/mof/window/TEXT_P.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		}
if(obj.tagName=="SELECT")
		{
	this.CurControl=obj;
	showModalDialog(path+"/jsp/mof/window/TEXT_P.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		}
 

	}
//����ONMOUSEOUT�¼�,����ѡ�а��
this.TabMouseOut=TabMouseOut;
function TabMouseOut()
	{
	IsMouseDown=false;
	}
//����ONCLICK�¼�,����ѡ�а��
this.TabClick=TabClick;
function TabClick()
	{
	var obj=event.srcElement;
 
	if(currentDiv!=null)
		{
		currentDiv.className="";
		if(obj.tagName=="INPUT")
			{
			obj.className="textarea";
		 
			}
		}
	if((obj.tagName=="SPAN" || obj.tagName=="INPUT" || obj.tagName=="TD" ) && obj.id!="designdiv" && !obj.card)
		{

		obj.className="selectspancss";
		currentDiv=obj;
		obj.canmove=true;
		if(obj.tagName=="TD")
			{
				var otab=obj.offsetParent;
	 
				if(document.all("divcontrols").editobject!=otab.mofTableId)
				{
					document.all("divcontrols").editobject=otab.mofTableId;
				 //��̬�������б�
				 
					 
					 
					if(otab.filedlist!=null)	
					{
						document.all("divcontrols").innerHTML=otab.filedlist; 
						 
						 
					}
				}
			 
			}


		}
	if(obj.tagName=="DIV" && obj.parentElement.id!="designdiv"&& obj.id!="designdiv")
		{
		obj.className="selectspancss";
		currentDiv=obj;
		obj.canmove=true;

		}
		
	//����ѡ�а��

	}

//����ONMOUSEMOVE�¼�
this.TabMouseMove=TabMouseMove;
function TabMouseMove()
	{
		var obj=event.srcElement;
		//�϶��п�
		if(obj!=null && obj.tagName=="TD" && obj.id!="designdiv" && !obj.card!=null)
		{

		var cc="";
		var x=getRealLeft(obj);
		var y=getRealTop(obj);
		var w=parseInt(obj.offsetWidth);
		var h=parseInt(obj.offsetHeight);
		//if(event.clientY-y<5)cc+="n";
		//if(y+h-event.clientY<2)cc="s";
		//if(event.clientX-x<5)cc+="w";
		if(x+w-event.clientX<2)cc="e";
		if(cc!="" && !IsMouseDown){
			//obj.style.cursor=cc+"-resize";
			//obj.canresizezy=true;
			//alert(cc);
			return(true);
			}
		else
			{
			obj.style.cursor="default";
			obj.canresizezy=false;
			}

}

//ѡ�е�Ԫ��
	if(IsMouseDown==true)
	{
	//document.selection.empty();
	if(obj==null) return;
	if(TabAll.contains(obj))
		{
		while(obj.offsetParent!=null && obj.offsetParent!=TabAll)
			obj=obj.parentElement;
		}
	else
		return false;
	//if(obj!=null && obj.tagName=="TD")
	//TabAll=obj.offsetParent;
	if(TabAll==null) return;
	if(firstTd==null || IsMouseDown==false) return;
		BackTdBg();

	if(obj==firstTd)
		{
		secondTd=otd;
		return;
		}
	if(obj.tagName=="DIV") obj=obj.parentElement.parentElement;
	if(obj.tagName=="TD")
		{
		fphcindex=parseInt(firstTd.phcol);
		fphrindex=parseInt(firstTd.phrow);
		ophcindex=parseInt(obj.phcol);
		ophrindex=parseInt(obj.phrow);
		if(obj.rowSpan!=1 || obj.colSpan!=1)
			{
			ophrindex=parseInt(ophrindex)+obj.rowSpan-1;
			ophcindex=parseInt(ophcindex)+obj.colSpan-1;
			}
		//alert(ophrindex+","+ophcindex);
		for(var i=0;i<TabAll.rows.length;i++)
			for(var j=0;j<TabAll.rows[i].cells.length;j++)
					{
						var otd=TabAll.rows[i].cells[j];
						ophcol=parseInt(otd.phcol);
						ophrow=parseInt(otd.phrow);
						//alert(ophcol+", "+ophrow);
						if(ophcol>fphcindex-1 && ophcol<=ophcindex && ophrow>fphrindex-1 && ophrow<=ophrindex)
						{//alert(ophcol+"<="+ophcindex+" &&"+(ophcol<=ophcindex));
							//if(otd.style.backgroundColor==null||otd.style.backgroundColor=="" || otd.style.backgroundColor=="#ffffff")
							{
							otd.style.backgroundColor="#9999FF";
							}
							if(otd.changeBgColor==null || otd.changeBgColor=="")
							otd.changeBgColor="#9999FF";

							secondTd=otd;
						}
					}
				}
	}
	}
//����ONMOUSEOUT�¼�
this.TabMouseUp=TabMouseUp;
function TabMouseUp()
	{
	 
	var obj=event.srcElement;
	if(obj.card) return;
	if(istdzydown)
	{
	var ocell=currentTd.cellIndex;
	var colgroup=currentTd.offsetParent.children[0].children[ocell];
	if(colgroup==null || colgroup.tagName!="COL") return;
	var newwid=parseInt(colgroup.offsetWidth)-parseInt(oldtdleft-event.clientX);
	if(newwid<1)
	newwid=2;
	colgroup.width=newwid;
	istdzydown=false;
	currentTd.canresizezy=false;
	currentTd.releaseCapture();
	}
	if(curMoveElement)
	{
	if(obj.tagName=="INPUT" || obj.tagName=="SELECT" || obj.tagName=="SPAN")
		{
		obj=obj.parentElement;
		}
	//obj.appendChild(curMoveElement);
	if(obj!=null && obj.tagName=="TD" && obj.phcol)
	{
		if(obj!=curMoveElement.parentElement)
		{	
			
			
 
			if(obj.offsetParent!=curMoveElement.offsetParent.parentElement.parentElement.parentElement)
			{
					alert("Tab��ֻ����������Tab���϶���");
					if(curMoveElement.canmove)
					{
						curMoveElement.canmove=false;
						curMoveElement.className="";
						curMoveElement=null;
					}
					return;
			}
 
			
			var middleHtml="";
			middleHtml = obj.innerHTML;
			obj.innerHTML=curMoveElement.parentElement.innerHTML;

			curMoveElement.parentElement.innerHTML=middleHtml;
 
			obj.children[1].className="";
 
 
		}
	}
	if(curMoveElement.canmove)
		{
		curMoveElement.canmove=false;
		curMoveElement.className="";
		curMoveElement=null;
		}
	return;
	}
	if(firstTd==null || IsMouseDown==false) return;
	while(obj.tagName!="TD"&& TabAll.contains(obj))
		obj=obj.parentElement;
	if(obj.tagName=="INPUT" || obj.tagName=="SELECT")
		{
		obj=obj.parentElement;
		}
	if(obj.tagName=="DIV") obj=obj.parentElement.parentElement;
	if(TabAll.contains(obj))
		{
		while(obj.offsetParent!=TabAll)
			obj=obj.parentElement;
		}
	if(obj.tagName=="TD")
		{
		secondTd=obj;
		if(firstTd!=secondTd) document.selection.empty();
		IsMouseDown=false;
		obj.releaseCapture();//�ͷ���꽹��
		for(var i=0;i<TabAll.rows.length;i++)
			for(var j=0;j<TabAll.rows[i].cells.length;j++)
					{
						var otd=TabAll.rows[i].cells[j];
						if(otd.style.backgroundColor!=null && otd.style.backgroundColor.toString().toUpperCase()=="#9999FF")
						{
							selectedTdArray[selectedTdArray.length]=otd;
						}
					}	
		}
			if(!TabAll.contains(obj)&& selectedTdArray!=null)//����ڵ�һ�������ѡ���˼���td,Ȼ���ڵڶ���table���ͷ����
			{
			secondTd=selectedTdArray[selectedTdArray.length-1];
			}

	}
//�ƶ��ؼ�
this.TabDrag=TabDrag;
function TabDrag()
	{
	
	}
//�ƶ��ؼ�
this.TabDragEnd=TabDragEnd;
function TabDragEnd()
	{
	var obj=event.srcElement;
	 
	var parenttd=obj.offsetParent;
	if(parenttd!=null && parenttd.tagName=="TD")
		{parenttd=parenttd.offsetParent;}
	for(var i=0;i<parenttd.rows.length;i++)
		for(var j=0;j<parenttd.rows[i].cells.length;j++)
		{
		var otd=parenttd.rows[i].cells[j];
		var opos=getInfo(otd);
		if(event.clientX>opos.left && event.clientY>opos.top && event.clientY<opos.bottom && event.clientX<opos.right)
			{
			otd.appendChild(obj);
			return;
			}
		}
	
	}
//���׼ȷ����
function getInfo(o){//ȡ������
 var to=new Object();
 to.left=to.right=to.top=to.bottom=0;
 var twidth=o.offsetWidth;
 var theight=o.offsetHeight;
 while(o!=document.body){
  to.left+=o.offsetLeft;
  to.top+=o.offsetTop;
  o=o.offsetParent;
 }
 to.left+=document.body.scrollLeft;
 to.top+=document.body.scrollTop;
  to.right=to.left+twidth;
  to.bottom=to.top+theight;
 return to;
}

//���ѡ���td
this.ClearTdSelectd=ClearTdSelectd;
function ClearTdSelectd()
{
	if(selectedTdArray==null || selectedTdArray.length==0)
		return;
	for(var i=0;i<selectedTdArray.length;i++)
		{
		//if(selectedTdArray[i]!=null && selectedTdArray[i].tagName=="TD" && selectedTdArray[i].style.backgroundColor.toUpperCase()=="#9999FF")
			//selectedTdArray[i].style.backgroundColor="";
		//if(selectedTdArray[i]!=null && selectedTdArray[i].tagName=="TD" && selectedTdArray[i].changeBgColor.toUpperCase()=="#9999FF")
			//selectedTdArray[i].changeBgColor="";
		selectedTdArray[i]=null;
		}
	selectedTdArray=new Array();
}
//�ϲ���Ԫ����
this.Merge=Merge;
function Merge()
	{	
	if(TabAll==null || TabAll.type=="sub") return;
	if(firstTd==null || secondTd==null) return;
	var cellCount=checkRowCount(TabAll.rows[0]);
		var fcindex=firstTd.cellIndex;
		var frindex=firstTd.parentElement.rowIndex;
		var scindex=secondTd.cellIndex;
		var srindex=secondTd.parentElement.rowIndex;
		var totalRow=parseInt(secondTd.phrow)-parseInt(firstTd.phrow)+secondTd.rowSpan;
		var totalCol=parseInt(secondTd.phcol)-parseInt(firstTd.phcol)+secondTd.colSpan;
		//alert(totalRow+","+totalCol+","+fcindex+","+scindex+","+frindex+","+srindex);
		var fphrow=parseInt(firstTd.phrow);
		var fphcol=parseInt(firstTd.phcol);
		var sphrow=parseInt(secondTd.phrow)+secondTd.rowSpan-1;
		var sphcol=parseInt(secondTd.phcol)+secondTd.colSpan-1;
		var countTd=0;
//�ж��ܷ�ϲ�

for(var i=0;i<TabAll.rows.length;i++)
	for(var j=0;j<TabAll.rows[i].cells.length;j++)
			{
				var otd=TabAll.rows[i].cells[j];
				var ophcol=parseInt(otd.phcol);
				var ophrow=parseInt(otd.phrow);
				if(ophcol>fphcol-1 && ophcol<=sphcol && ophrow>fphrow-1 && ophrow<=sphrow)
					countTd+=(otd.colSpan*otd.rowSpan);
			}

if(countTd!=totalRow*totalCol)
		{
		BackTdBg();
		firstTd=null;
		secondTd=null;
		return;
		}
// END �ж��ܷ�ϲ�
 



		var arrChild=new Array();

		//�ж��Ƿ�ϲ��ĵ�Ԫ�������������������ϵ���
		var fieldCNum = 0;
		var fieldRNum =0;
		for(var i=TabAll.rows.length-1;i>=0;i--)
		{
			for(var j=TabAll.rows[i].cells.length-1;j>=0;j--)
			{
				  
				var onode=TabAll.rows[i].cells[j];
				
				var otr=TabAll.rows[i];
				var ophrow=parseInt(onode.getAttribute("phrow"));
				var ophcol=parseInt(onode.getAttribute("phcol"));
				if(ophrow>=fphrow && ophrow<=sphrow && ophcol>=fphcol && ophcol<=sphcol)
					{
							 
							 fieldCNum = fieldCNum + onode.children.length;
					}
				if(ophrow==fphrow && ophcol>=fphcol && ophcol<=sphcol)
					{
						 
							fieldRNum = fieldRNum + onode.children.length;
					 
					}

				}
			}//�ж��Ƿ�ϲ��ĵ�Ԫ�������������������ϵ���
 
		if(fieldRNum>2 || fieldCNum>2)
		{
			alert("�ϲ���ĵ�Ԫ����ֻ����һ���������Ƴ��������");
			return;
		}
		arrChild=new Array();
		

		for(var i=TabAll.rows.length-1;i>=0;i--)
			{
			for(var j=TabAll.rows[i].cells.length-1;j>=0;j--)
				{
				  
				var onode=TabAll.rows[i].cells[j];
				var otr=TabAll.rows[i];
				var ophrow=parseInt(onode.getAttribute("phrow"));
				var ophcol=parseInt(onode.getAttribute("phcol"));
				if(ophrow>fphrow && ophrow<=sphrow && ophcol>=fphcol && ophcol<=sphcol)
					{
						for(var kk=0;kk<onode.children.length;kk++)
							{
							arrChild[arrChild.length]=onode.children[kk].outerHTML;
							}
						 
	
					otr.deleteCell(j);
					}
				if(ophrow==fphrow && ophcol>fphcol && ophcol<=sphcol)
					{
						/* for(var kk=0;kk<onode.children.length;kk++)
							{
							arrChild[arrChild.length]=onode.children[kk].outerHTML;
							}
						*/
				 				 
							arrChild[arrChild.length]=onode.innerHTML;
						otr.deleteCell(j);
					}

				}
			}
		if(arrChild.length>0)
		{
			for(var jj=0;jj<arrChild.length;jj++)
			{
			firstTd.insertAdjacentHTML("beforeend",arrChild[jj]);
			}
			 
		}
//��ȫ�ϲ�����ʱ����
if(totalCol==cellCount)
	firstTd.rowSpan=1;
else
	firstTd.rowSpan=totalRow;
firstTd.colSpan=totalCol;
//���кϲ����У�ʹһ���е����е�Ԫ���rowspan����1
var tdarr=new Array();
var rowspanarr=new Array();
var oftdInTr=firstTd.parentElement;
for(var j=0;j<oftdInTr.cells.length;j++)
		{
		var otd=oftdInTr.cells[j];
		if(otd.rowSpan>1)
			{
			tdarr.push(otd);
			rowspanarr.push(otd.rowSpan);
			}
		else
			{
			tdarr=null;
			rowspanarr=null;
			break;
			}
		}
if(tdarr!=null)
		{
		var minrowspan=eval("Math.min("+rowspanarr+");");
		for(var i=0;i<tdarr.length;i++)
			{
			tdarr[i].rowSpan=tdarr[i].rowSpan-minrowspan+1;
			}
		}
//ɾ��û��td��tr����ȫ�ϲ�����ʱ����
for(var i=TabAll.rows.length-1;i>-1;i--)
	{
	var otr=TabAll.rows[i];
	if(otr.cells.length==0)
		otr.removeNode(true);
}
changeRowPhRow(oftdInTr.rowIndex,1);	
BackTdBg();
//alert(XmlDoc.xml);
return (XmlDoc.xml);
	}
//�ж��Ƿ���Ժϲ�
this.IsCanMerge=IsCanMerge;
function IsCanMerge()
	{
	if(firstTd==null || secondTd==null) return;
	if(firstTd==secondTd) return;
	if(XmlDoc==null) return;
	}

//ʹ���Ԫ��ı���ɫ�ָ�
this.BackTdBg=BackTdBg;
function BackTdBg()
	{
	if(TabAll==null) return;
	for(var i=0;i<TabAll.rows.length;i++)
	for(var j=0;j<TabAll.rows[i].cells.length;j++)
			{
				var otd=TabAll.rows[i].cells[j];
				//alert(otd.style.backgroundColor);
				if(otd.changeBgColor!=null)
				{
				if(otd.changeBgColor.toUpperCase()!="#9999FF")
					otd.style.backgroundColor=otd.changeBgColor;
				else
					{	
					otd.style.backgroundColor="";
					otd.changeBgColor="";
					}
				}
				else
					otd.style.backgroundColor="";

			}
	}
//ȡ���߿���ɫ
this.BackTdBorder=BackTdBorder;
function BackTdBorder()
	{
	if(TabAll==null) return;
	for(var i=0;i<TabAll.rows.length;i++)
	for(var j=0;j<TabAll.rows[i].cells.length;j++)
			{
				var otd=TabAll.rows[i].cells[j];
				otd.style.borderColor="";
			}
	}
//���
this.Split=Split;
function Split()
	{
	if(TabAll==null || TabAll.type=="sub") return;
	if(firstTd==null || secondTd==null) return;
	if(firstTd!=secondTd) return;
	var fcindex=firstTd.cellIndex;
	var frindex=firstTd.parentElement.rowIndex;
	//alert(fcindex+" "+frindex);
	//var fTd=XmlDoc.documentElement.selectNodes("//tr")[frindex].childNodes[fcindex];
	var totalRow=firstTd.rowSpan;
	var totalCol=firstTd.colSpan;
	if(totalRow==1 && totalCol==1)
		return;
/*	for(var i=frindex+1;i<frindex+totalRow;i++)
		for(var j=0;j<totalCol;j++)
		{
		var newnode=XmlDoc.createNode("1","td","");
		var otr=XmlDoc.documentElement.selectNodes("//tr")[i];
		var otd=otr.insertBefore(newnode,otr.childNodes[fcindex]);
		//otd.setAttribute("width",100);
		otd.text="1 ";
		}
	for(var k=1;k<totalCol;k++)
		{
		var newnode=XmlDoc.createNode("1","td","");
		var otr=XmlDoc.documentElement.selectNodes("//tr")[frindex];
		var otd=otr.insertBefore(newnode,otr.childNodes[fcindex+1]);
		otd.text="2";
		}
	fTd.setAttribute("rowspan",1);
	fTd.setAttribute("colspan",1);
	*/
for(var i=frindex+1;i<frindex+totalRow;i++)
		for(var j=0;j<totalCol;j++)
		{
		var newnode=TabAll.rows[i].insertCell(fcindex+j);
		var otr=TabAll.rows[i];
		newnode.setAttribute("phrow",parseInt(firstTd.getAttribute("phrow"))+i-frindex);
		newnode.setAttribute("phcol",parseInt(firstTd.getAttribute("phcol"))+j);
		if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
		newnode.style.borderColor=TabAll.tdbordercolor;
		//otd.setAttribute("width",100);
		}
	for(var k=1;k<totalCol;k++)
		{
		var newnode=TabAll.rows[frindex].insertCell(fcindex+k);
		var otr=TabAll.rows[frindex];
		newnode.setAttribute("phrow",firstTd.getAttribute("phrow"));
		newnode.setAttribute("phcol",parseInt(firstTd.getAttribute("phcol"))+k);
		if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
		newnode.style.borderColor=TabAll.tdbordercolor;
		}
	//firstTd.setAttribute("rowspan",1);
	//firstTd.setAttribute("colspan",1);
	firstTd.rowSpan=1;
	firstTd.colSpan=1;
	//return XmlDoc.xml;


	}
//IFRAME��ONMOUSEDOWN�¼�
this.FrameMouseDown=FrameMouseDown;
function FrameMouseDown()
	{
	var pobj=window.event.srcElement;
	if(pobj.banshitype!=null && pobj.banshitype!="" )
		{
		document.all('designdiv').setCapture();
		curElement=pobj;
		imgMouseDown=true;
		document.body.style.cursor="move.ico";
	
		}
	}
////�����ƶ����ONMOUSEDOWN�¼�
//IFRAME��ONMOUSEMOVE�¼�
this.FrameMouseMove=FrameMouseMove;
function FrameMouseMove()
	{
/*	var odiv=window.event.srcElement;
	if(odiv.tagName=="DIV" && odiv.id=="designdiv")
		{
		var topdiv=odiv.parentElement;
		var otd=topdiv.parentElement;
		if(otd.tagName!="TD") return;
		if(topdiv.isCanMove=="true")
			odiv.style.cursor="move";
		}

	if(imgMouseDown)
		{
		var obj=window.event.srcElement;
		if(obj.tagName!="TD") return;
		if(!TabAll.contains(obj)) return;
		BackTdBorder();
		obj.style.border="1 solid red";
		}
	if(divMouseDown)
		{
		var obj=window.event.srcElement;
		if(obj.tagName!="TD") return;
		if(!TabAll.contains(obj)) return;
		BackTdBorder();
		obj.style.border="1 solid red";
		}*/
	}
//�ػ�
this.reDraw=reDraw;
function reDraw(str,otype)
	{
	var str=parseXml(str,otype);
	document.all("page1").innerHTML=str;
	this.init();
	}


//IFRAME��ONMOUSEUP�¼�
this.FrameMouseUp=FrameMouseUp;
function FrameMouseUp()
	{
	var odiv=window.event.srcElement;
	if(odiv.tagName=="INPUT")
		{	
		odiv=odiv.parentElement;
 
		}
		var designdiv=document.all("designdiv");
		if(curElement!=null  && designdiv.contains(odiv))
		{
			if(curElement.tagName=="TD")
				curElement.parentElement.className="";
			if(curElement.tagName=="IMG")
				curElement.parentElement.parentElement.className="";
			document.body.style.cursor="default";
			if(curElement.banshitype=="deftable")
			showDefTable(odiv);
			if(curElement.banshitype=="defdiv")
				odiv.insertAdjacentHTML("beforeEnd",'<span contenteditable=true    style="white-space:nowrap;border:2 dotted ;width:80%"></span>');
			if(curElement.banshitype=="text"){
				if(odiv.tagName!="TD" || odiv.card){
					alert("�ֶ�ֻ���ϵ���Ԫ���ڣ�");
					return;
				}
				if(odiv.children.length>0)
				{
					return
				}

				if(!checkRepeatField(curElement.MOF_COLUMN_ID))//�жϴ��ֶ��Ƿ��Ѿ�����
				{
					curElement = null;
					return;
				}

				if(odiv.parentElement.parentElement.parentElement.mofTableId != document.getElementById("divcontrols").editobject)
				{
					alert("�ֶβ����ڴ˶���!");
					return;
				}
 
				
				odiv.insertAdjacentHTML("beforeEnd",'<label style="width:50%;height:100%;background-color:#E1E8EF;padding-top:5;valign:bottom">'+curElement.DESCRIPTION+'��</label>'+'<input MOF_COLUMN_ID="'+curElement.MOF_COLUMN_ID+'" size=20 MOF_FIELD_ID="' + curElement.MOF_FIELD_ID + '" fieldname="'+ curElement.COLUMNNAME +'" chaname="'+ curElement.DESCRIPTION +'"style="border:1  solid"  style="BORDER-RIGHT: #5B5F62 1px solid; BORDER-TOP: #5B5F62 1px solid; FONT-WEIGHT: normal; BORDER-LEFT: #5B5F62 1px solid; COLOR: #5B5F62; BORDER-BOTTOM: #5B5F62 1px solid;background-color:#F4F5F7;" readonly>');
				
			}
			if(curElement.banshitype=="deftab")
			{
				if(designdiv.children[0]!=null && designdiv.children[0].type=="tab")
				{
				var ocardtab=designdiv.children[0].children[0];
				var ntd=ocardtab.rows[0].insertCell();
				ntd.innerText="Tab���������";
				ntd.className="taboncss";
				 
				ntd.unselectable=true;
				ntd.card=1;
				tabdiv=ocardtab.parentElement;
				tabdiv.insertAdjacentHTML("beforeEnd","<div style='height:100%;border:1 solid;' card=2></div>");
				ntd.fireEvent("onclick");
				}
				else
				{
				tabcardstr='<div style="height:200;" type="tab"><table onclick="doTabpageClick()"><tr><td class="taboncss" unselectable=on card="1">Tab���������</td></tr></table><div  card=2 style="height:100%;border:1 solid ;"></div></div>';
				odiv.insertAdjacentHTML("beforeEnd",tabcardstr);
				}
			}
			if(curElement.banshitype=="defsubtab")
			{
				var cols=6;
				var tablestr='<TABLE type="sub"  height=70  width="100%"  class="designtablecss"  borderColor=#000000 cellSpacing=0 cellPadding=2  border=1>';
				var tabstr='';
				var cosgroupstr='';
				var colwid=Math.round(100/6);

				for(var i=0;i<3;i++)
				{
					tabstr+="<tr>";
					for(var j=0;j<cols;j++)
					{
					tabstr+='<td phcol="'+(j+1)+'" phrow="'+(i+1)+'" >' ;
					if(i==0)
						{
						if(j==5)
							cosgroupstr+='<col>';
						else
							cosgroupstr+='<col width="'+colwid+'%">';

						}
					tabstr+='</td>';
					}
					tabstr+="</tr>";
				}
				tablestr+='<colgroup>'+cosgroupstr+'</colgroup>'+tabstr+'</table>';
				odiv.insertAdjacentHTML("beforeEnd",tablestr);

			}
			designdiv.releaseCapture();
			imgMouseDown=false;
			curElement=null;
			IsMouseDown=false;
			return;
		}
	else
		{
			document.body.style.cursor="default";
			designdiv.releaseCapture();
			imgMouseDown=false;
			curElement=null;
			IsMouseDown=false;
		}
			
	}
//�жϵ�ǰ�е�Ԫ�������Ƿ�����
this.checkRowCount=checkRowCount;
function checkRowCount(otr)
	{
if(otr==null || otr.tagName!="TR")
	return;
var count=0;
for(var i=0;i<otr.cells.length;i++)
		{
		var otd=otr.cells[i];
		if(otd!=null)
			count+=parseInt(otd.colSpan)
		}
return count;
	}
	//�õ���Ԫ�������������ĵ�ǰ�����浥Ԫ������������һ��
this.getCompleteRow=getCompleteRow;
function getCompleteRow(otr)
	{
if(otr==null || otr.tagName!="TR")
	return;
var cellCount=checkRowCount(TabAll.rows[0]);
for(var i=otr.rowIndex-1;i>=0;i--)
		{
		var ntr=TabAll.rows[i];
		if(checkRowCount(ntr)==cellCount)
			{
			return ntr;
			}
		}
return null;
	}
	//�õ���Ԫ�������������ĵ�ǰ��������Ӧphcol��Ԫ��
this.getColByPh=getColByPh;
function getColByPh(otr,phcol)
	{
if(otr==null || otr.tagName!="TR")
	return;
for(var i=otr.rowIndex-1;i>=0;i--)
		{
		var ntr=TabAll.rows[i];
		for(var j=0;j<ntr.cells.length;j++)
			{
			var otd=ntr.cells[j];
			if(otd.phcol==phcol)
				{
				return otd;
				}
			}
		}
return null;
	}

//�ı��е�phrow
this.changeRowPhRow=changeRowPhRow;
function changeRowPhRow(trindex,val)
	{
		if(TabAll==null)
		return;
	for(var i=trindex+1;i<TabAll.rows.length;i++)
		{
		var otr=TabAll.rows[i];
		for(var j=0;j<otr.cells.length;j++)
			{
			var otd=otr.cells[j];
			//otd.phrow=parseInt(otd.phrow)+val;
			if(val>0)
			otd.phrow=parseInt(otr.rowIndex)+val;
			else
			otd.phrow=parseInt(otr.rowIndex)+1;
			}
		}
	}
//�ı��е�phcol
this.changeColPhCol=changeColPhCol;
function changeColPhCol(row,col,val)
	{
	if(row==null || col==null || val==null)
		return;
		for(var j=col+1;j<row.cells.length;j++)
			{
			var otd=row.cells[j];
			if(otd!=null)
			otd.phcol=parseInt(otd.phcol)+val;
			}
	}
//����һ��
this.addRow=addRow;
function addRow()
	{
if(TabAll==null || TabAll.type=="sub") return;
if(firstTd==null) return;
	var otr=firstTd.parentElement;
	var cellCount=checkRowCount(TabAll.rows[0]);
	//alert(cellCount+","+checkRowCount(otr));
	if(checkRowCount(otr)!=cellCount)
		{
			for(var k=0;k<cellCount;k++)
				{
				var hascol=false;
					for(var kk=0;kk<otr.cells.length;kk++)
					{
					var otd=otr.cells[kk];
					if(otd!=null)
						{
						var phcol=otd.phcol;
						if(phcol==k)
							{
							hascol=true;
							break;
							}
						}
					}
				if(!hascol)
					{
					var fcol=getColByPh(otr,k);
					//alert(fcol);
					if(fcol!=null && fcol.rowSpan>1)
						fcol.rowSpan+=1;
					}
				}
			
				//ftr=getCompleteRow(otr);
		}
		//alert(otr.cells.length +","+ otr.cells[0].colSpan);
				var newTr=TabAll.insertRow(otr.rowIndex+1);
				if(otr.cells.length==1 && otr.cells[0].colSpan==cellCount)//ȫ���ϲ�һ��
						{
						for(var i=0;i<cellCount;i++)
							{
							var newtd=newTr.insertCell();
							//newtd.innerText="";
							newtd.phrow=otr.rowIndex+2;
							newtd.phcol=i+1;
							if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
							newtd.style.borderColor=TabAll.tdbordercolor;
							}
						}
					else
						{
								for(var i=0;i<otr.cells.length;i++)
									{
									var otd=otr.cells[i];
									if(otd.rowSpan>1 && otd.rowSpan<cellCount)
										otd.rowSpan+=1;
									
									else
										{
										var newtd=newTr.insertCell();
										newtd.colSpan=otd.colSpan;
										newtd.innerHTML="";
										newtd.phrow=otr.rowIndex+2;
										newtd.phcol=otd.phcol;
										if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
										newtd.style.borderColor=TabAll.tdbordercolor;
										}

									}
						}
			changeRowPhRow(otr.rowIndex+1,1);
	}
//
//ɾ��һ��
this.delRow=delRow;
function delRow()
{
	if(TabAll==null || TabAll.type=="sub") return;
	if(firstTd==null) return;

	if(!confirm("�����а��������ݶ�����ɾ������ȷ����"))
		{
		return;
		}
	var otr=firstTd.parentElement;
	var cellCount=checkRowCount(TabAll.rows[0]);
	if(checkRowCount(otr)!=cellCount)
		{
			for(var k=1;k<cellCount+1;k++)
				{
				var hascol=false;
					for(var kk=0;kk<otr.cells.length;kk++)
					{
					var otd=otr.cells[kk];
					if(otd!=null)
						{
						var phcol=otd.phcol;
						if(phcol==k)
							{
							hascol=true;
							break;
							}
						}
					}
				if(!hascol)
					{
					var fcol=getColByPh(otr,k);
					if(fcol!=null && fcol.rowSpan>1)
						fcol.rowSpan-=1;
					}
				}
			
				//ftr=getCompleteRow(otr);
		}
				for(var i=otr.cells.length-1;i>=0;i--)
					{
					var otd=otr.cells[i];
					if(otd.rowSpan>1)
						{
						otd.rowSpan-=1;
						otd.innerHTML="";
						otd.phrow=otr.rowIndex+2;
						otr.nextSibling.cells[i].insertAdjacentElement("beforeBegin",otd);

						//otd.phrow=parseInt(otd.phrow)-1;
						}
					else
						{
						otd.removeNode(true);
					
						}
					}
			var oldtrindex=otr.rowIndex-1;
			otr.removeNode();
changeRowPhRow(oldtrindex,-1);
//�������������е�phrow
firstTd=null;
}
//����һ��
this.addCol=addCol;
function addCol()
	{
if(TabAll==null)
		return;
if(firstTd==null) return;
	var otr=firstTd.parentElement;
	//var cellCount=checkRowCount(TabAll.rows[0]);
	//alert(cellCount+","+checkRowCount(otr));
	//if(checkRowCount(otr)!=cellCount)
	//	{
			var oldphcol=firstTd.phcol;
			for(var k=0;k<TabAll.rows.length;k++)
				{
				var hascol=null;
				var ntr=TabAll.rows[k];
				var fcol=getColByPh(ntr,oldphcol);
				//alert(firstTd.outerHTML);
//
				//alert("oldphcol"+oldphcol);
					for(var kk=0;kk<ntr.cells.length;kk++)
					{
					var otd=ntr.cells[kk];
					if(otd!=null)
						{
						var phcol=otd.phcol;
						if(phcol==oldphcol)
							{
							hascol=otd;
							break;
							}
						else if(phcol>oldphcol)
							{
							//alert(phcol);
							if(otd.previousSibling!=null && otd.previousSibling.colSpan>1)
								{
								hascol=otd.previousSibling;
								break;
								}
							else if(otd.previousSibling!=null)
								{
								//alert(otd.previousSibling.tagName);
									if(fcol!=null)
									{
									if(fcol.colSpan==1)
										{
										var oldcol=otd.previousSibling.phcol;
										var ntd=ntr.insertCell(otd.previousSibling.cellIndex+1);
										//tabAll.children[0].insertAdjancentHTML("beforeEnd",'<col width="100">');
										changeColPhCol(ntr,otd.previousSibling.cellIndex,1);
										//alert(oldphcol);
										//ntd.innerText="2";
										ntd.phcol=parseInt(oldcol)+2;
										ntd.phrow=ntr.rowIndex+1;
										if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
										ntd.style.borderColor=TabAll.tdbordercolor;
										}
									else
										{
										changeColPhCol(ntr,otd.previousSibling.cellIndex,1);
										}
									}
									break;
								}
								else if(otd.previousSibling==null)
								{
									if(fcol!=null)
									{
									if(fcol.colSpan==1)
										{
										var ntd=ntr.insertCell(0);
										//ntd.innerText="1";
										changeColPhCol(ntr,0,1);
										//alert(oldphcol);
										ntd.phcol=2;
										ntd.phrow=ntr.rowIndex+1;
										if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
										ntd.style.borderColor=TabAll.tdbordercolor;
										}
									}
									break;
								}
								//alert(k+phcol);
								//changeColPhCol(ntr,otd.cellIndex-1,1);
								//break;
								}
							}
						}
				if(hascol!=null)
					{
					//var fcol=getColByPh(ntr,k);
					//alert(fcol);
					if(hascol.colSpan>1)
						{
						hascol.colSpan+=1;
						changeColPhCol(ntr,hascol.cellIndex,1);
						}
					else
						{
						//var newtdstr="<td phrow='"+(ntr.rowIndex+1)+"' phcol='"+(firstTd.cellIndex+1)+"'>1</td>";
						//hascol.insertAdjacentHTML("afterEnd",newtdstr);
						var ntd=ntr.insertCell(hascol.cellIndex+1);
						changeColPhCol(ntr,hascol.cellIndex+1,1);

						ntd.phrow=ntr.rowIndex+1;
						if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
						ntd.style.borderColor=TabAll.tdbordercolor;
						//alert(firstTd.phcol+","+firstTd.colSpan);
						if(hascol.colSpan>1)
							ntd.phcol=parseInt(hascol.phcol)+hascol.colSpan;
						else
							ntd.phcol=parseInt(hascol.phcol)+1;
						ntd.innerHTML="";
						}
					}
				else
					{
					
					//}
					}
				}
			
				//ftr=getCompleteRow(otr);
		//}
		var newcol=document.createElement("COL");
		newcol.width="100";
		TabAll.children[0].appendChild(newcol);
		//alert(TabAll.outerHTML);


	//alert(firstTd.cellIndex);		
	}
//ɾ��һ��
this.delCol=delCol;
function delCol()
{
	if(TabAll==null)
		return;
	if(firstTd==null) return;
	if(!confirm("�����а��������ݶ�����ɾ������ȷ����"))
		{
		return;
		}
	var otr=firstTd.parentElement;
	var oldcellindex=firstTd.cellIndex;
	//var cellCount=checkRowCount(TabAll.rows[0]);
	//alert(cellCount+","+checkRowCount(otr));
	//if(checkRowCount(otr)!=cellCount)
	//	{
			var oldphcol=firstTd.phcol;
			for(var k=0;k<TabAll.rows.length;k++)
				{
				var hascol=null;
				var ntr=TabAll.rows[k];
					for(var kk=0;kk<ntr.cells.length;kk++)
					{
					var otd=ntr.cells[kk];
					if(otd!=null)
						{
						var phcol=otd.phcol;
						if(phcol==oldphcol)
							{
							hascol=otd;
							break;
							}
						else if(phcol>oldphcol)
							{
							if(otd.previousSibling!=null && otd.previousSibling.colSpan>1)
								{
								hascol=otd.previousSibling;
								break;
								}
							else
								{
								//alert(k+phcol);
								changeColPhCol(ntr,otd.cellIndex-1,-1);
								break;
								}
							}
						}
					}
				if(hascol!=null)
					{
					//var fcol=getColByPh(ntr,k);
					//alert(fcol);
					if(hascol.colSpan>1)
						{
						hascol.colSpan-=1;
						changeColPhCol(ntr,hascol.cellIndex,-1);
						}
					else
						{
						//var newtdstr="<td phrow='"+(ntr.rowIndex+1)+"' phcol='"+(firstTd.cellIndex+1)+"'>1</td>";
						//hascol.insertAdjacentHTML("afterEnd",newtdstr);
						//var ntd=ntr.insertCell(hascol.cellIndex+1);
						
						changeColPhCol(ntr,hascol.cellIndex,-1);
						hascol.removeNode(true);
						/*ntd.phrow=ntr.rowIndex+1;
						//alert(firstTd.phcol+","+firstTd.colSpan);
						if(hascol.colSpan>1)
							ntd.phcol=parseInt(hascol.phcol)+hascol.colSpan;
						else if(hascol.colSpan==1)
							ntd.phcol=parseInt(hascol.phcol)+1;
						ntd.innerHTML="";
						*/
						}
					}
				else
					{
					if(ntr.cells[ntr.cells.length-1].colSpan>1)
						ntr.cells[ntr.cells.length-1].colSpan-=1;
					}
				}
			
				//ftr=getCompleteRow(otr);
		//}
				
TabAll.children[0].children[oldcellindex].removeNode(true);
//alert(TabAll.outerHTML);
firstTd=null;
}
//����
this.reDo=reDo;
function reDo()
	{
	var str=stock.putOut();
//	alert(str);
	return str;

//	parseXml(str,1);
//	document.all("tab1").innerHTML=str;
//	this.init();
//
	}
//����
this.repertDo=repertDo;
function repertDo()
	{
	var str=stock.reVerseOut();
	return str;
//	parseXml(str,1);
//	document.all("tab1").innerHTML=str;
//	this.init();
	}

//�ⲿ����
//����ȫ�ֶ���CurXmlNode
this.getCurXmlNode=getCurXmlNode;
function getCurXmlNode()
	{
	return CurXmlNode;
	}

//����ȫ�ֶ���firstTd
this.getFirstTd=getFirstTd;
function getFirstTd()
	{
	return firstTd;
	}
//����ȫ�ֶ���firstTd
this.getSelectedTdArray=getSelectedTdArray;
function getSelectedTdArray()
	{
	return selectedTdArray;
	}

//����ȫ�ֶ���XmlDoc
this.getXmlDoc=getXmlDoc;
function getXmlDoc(str)
	{
	return XmlDoc;
	}
//����ȫ�ֶ���TabRows
this.getTabRows=getTabRows;
function getTabRows()
	{
	return TabRows;
	}
//SETȫ�ֶ���TabRows
this.setTabRows=setTabRows;
function setTabRows(obj)
	{
	TabRows=obj;
	}
//����ȫ�ֶ���TabCols
this.getTabCols=getTabCols;
function getTabCols()
	{
	return TabCols;
	}
//SETȫ�ֶ���TabCols
this.setTabCols=setTabCols;
function setTabCols(obj)
	{
	TabCols=obj;
	}
//�ж���û���ظ���name,objΪinput
this.checkName=checkName;
function checkName(obj,oname)
	{
	if(TabAll==null) return;
	for(var i=0;i<TabAll.rows.length;i++)
		{
		var otr=TabAll.rows[i];
		for(var j=0;j<otr.cells.length;j++)
			{
			var otd=otr.cells[j];
			var content=otd.getElementsByTagName("INPUT");
						if(content.length<1)
							content=otd.getElementsByTagName("SELECT");
						if(content.length<1)
							content=otd.getElementsByTagName("TEXTAREA");
						if(content.length>0)
							content=content[0];
			if(content!=null)
				{
				if(content!=obj && content.id!=null && content.id.toUpperCase()==oname.toUpperCase())
					return content.id;
				}
			}
		}
		return false;
	}
//�����������XML
this.getFormXml=getFormXml;
function getFormXml()
	{
	var divall=document.all("designdiv");
	var tabStr='';
	tabStr = '<?xml version="1.0" encoding="UTF-8"?><root>';
	tabStr = tabStr + mofWindowPreXml;
	if(typeof(divall.children[0])=="undefined")
		return "";
	var tabtab=divall.children[0].children[0];
	var inupdatepage; //�ֶ��Ƿ���ά��ҳ��ʾ
	var insearchpage; //�ֶ��ڲ�ѯҳ����ʾ
	var ISMANDATORY; //�Ƿ������
	var ISCONDITION;  //��Ϊ�򵥲�ѯ����
	var showtitle;      //�Ƿ���ʾ����
	var isreadonly;   //�Ƿ�ֻ��

	if(tabtab!=null)
		{
			
//Ĭ����Tab--��ʼ
	  var mainTabFlag=0;
			for(var mm=0;mm<tabtab.rows[0].cells.length;mm++)
		{
			 
		 
			var odivMain=divall.children[0].children[mm+1];
			var tablesMain=odivMain.getElementsByTagName("TABLE");
	
			for(var nn=0;nn<tablesMain.length;nn++)
			{
				var otableMain=tablesMain[nn];
	 
				if(typeof(otableMain.maintab)!="undefined")
				{
					mainTabFlag = otableMain.maintab;
			 
				}
 
			}
		}
			//alert(mainTabFlag);

//Ĭ����Tab--����
			
			
			
			
			
		
		for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
		{
			var issamtab=0;//�Ƿ�ͬһtab
			var otd=tabtab.rows[0].cells[jj];
			var odiv=divall.children[0].children[jj+1];
			var tables=odiv.getElementsByTagName("TABLE");

			for(var kk=0;kk<tables.length;kk++)
			{
				 
				var seqnoid=(jj+1)*100+kk;
				 
				var otable=tables[kk];
				var tabId = "";
				if(otable.MOF_TAB_ID.substring(0,1)!="@")
					tabId = otable.MOF_TAB_ID;


				var mofTableId=""
				if(typeof(otable.mofTableId)!="undefined")
					mofTableId = otable.mofTableId;

				var buttonstyle=""
				if(typeof(otable.buttonstyle)!="undefined")
					buttonstyle = otable.buttonstyle;
				else
					buttonstyle = "1";

				var detailrows=""
				if(typeof(otable.detailrows)!="undefined")
					detailrows = otable.detailrows;
				
				var maintab=""
				if(typeof(otable.maintab)!="undefined")
					maintab = otable.maintab;
				else
					maintab = "0";
					
				if(mainTabFlag==0 && jj==0 && kk==0)
				{
					maintab = 1;
					otable.maintab = 1;
				}
				var ISUPDATE=""
				if(typeof(otable.ISUPDATE)!="undefined")
					ISUPDATE = otable.ISUPDATE;
				else
					ISUPDATE = "1";	
				

				var tab_INTERCEPTOR=""
				if(typeof(otable.tab_INTERCEPTOR)!="undefined")
					tab_INTERCEPTOR = otable.tab_INTERCEPTOR;
				
				var treetype=""
				if(typeof(otable.treetype)!="undefined")
					treetype = otable.treetype;
				else
					treetype = "0";

				var tabdes=""
				if(typeof(otable.tabdes)!="undefined")
					tabdes = otable.tabdes;

				var tabname=""
				if(typeof(otable.tabname)!="undefined")
					tabname = otable.tabname;

				var detailtab=""
				if(typeof(otable.detailtab)!="undefined")
					detailtab = otable.detailtab;
				else
					detailtab = "0";

				var buttonlyout=""
				if(typeof(otable.buttonlyout)!="undefined")
					buttonlyout = otable.buttonlyout;


				var width=""
				if(typeof(otable.width)!="undefined" && !isNaN(otable.width))
					width = otable.width;

				tabStr+='<tab MOF_WINDOW_ID="'+mofWindowId+'" MOF_TABLE_ID="'+ mofTableId +'" MOF_TAB_ID="'+ tabId +'" ISUPDATE="'+ISUPDATE+'" BUTTONSTYLE="'+buttonstyle+'" MAXLINE="'+detailrows+'" SEQNO="'+seqnoid+'"  ISMAIN="'+maintab+'"  INTERCEPTOR="'+tab_INTERCEPTOR.replace(/\"/g,"\'")+'"  HASTREE="'+treetype+'"  DESCRIPTION="'+tabdes.replace(/\"/g,"\'")+'" NAME="'+ tabname.replace(/\"/g,"\'") +'" ISDETAIL="'+detailtab+'"  LAYOUT="'+buttonlyout.replace(/\"/g,"\'")+'" ISSAMETAB="'+issamtab+'" WIDTH="'+ width +'">';
				issamtab=1;
				var otab=tables[kk];
				for(var r=0;r<otab.rows.length;r++)
				{
					var issamline=0;
					for(var c=0;c<otab.rows[r].cells.length;c++)
					{
					var ootd=otab.rows[r].cells[c];
					var flds=ootd.getElementsByTagName("INPUT");
					for(var f=0;f<flds.length;f++)
						{

						var of=flds[f];
						var oseqno=(r+1)+""+(c+1)+""+(f+1);
						if(typeof(of.inupdatepage)!="undefined")
							inupdatepage = of.inupdatepage;  
						else
							inupdatepage=1;  
						
						if(typeof(of.insearchpage)!="undefined")
							insearchpage = of.insearchpage;
						else
							insearchpage=1; 

						if(typeof(of.ISMANDATORY)!="undefined")
							ISMANDATORY = of.ISMANDATORY;
						else
							ISMANDATORY=0;  

						if(typeof(of.iscansearch)!="undefined")
							ISCONDITION = of.iscansearch;
						else
							ISCONDITION=0;

						if(typeof(of.showtitle)!="undefined")
							showtitle = of.showtitle;
						else
							showtitle=1;
						if(typeof(of.isreadonly)!="undefined")
							isreadonly = of.isreadonly;
						else
							isreadonly=0;
						
						var fieldId = "";
						if(of.MOF_FIELD_ID.substring(0,1)!="@")
							fieldId =  of.MOF_FIELD_ID ;



						var pageevent = "";
						if(typeof(of.pageevent)!="undefined")
							pageevent = of.pageevent;
						 
						var DEFAULTVALUE = "";
						if(typeof(of.DEFAULTVALUE)!="undefined")
							DEFAULTVALUE = of.DEFAULTVALUE;

						var rowSpan = "";
						if(typeof(ootd.rowSpan)!="undefined")
							rowSpan = ootd.rowSpan;  

						var MOF_COLUMN_ID = "";
						if(typeof(of.MOF_COLUMN_ID)!="undefined")
							MOF_COLUMN_ID = of.MOF_COLUMN_ID; 

						var size = "";
						if(typeof(of.size)!="undefined")
							size = of.size; 

						var DISPLAYLOGIC = "";
						if(typeof(of.DISPLAYLOGIC)!="undefined")
							DISPLAYLOGIC = of.DISPLAYLOGIC; 

						var fieldname = "";
						if(typeof(of.fieldname)!="undefined")
							fieldname = of.fieldname; 

						var chaname = "";
						if(typeof(of.chaname)!="undefined")
							chaname = of.chaname; 

						var field_TIP = "";
						if(typeof(of.field_TIP)!="undefined")
							field_TIP = of.field_TIP; 


						var field_VALIDATIONCODE = "";
						if(typeof(of.field_VALIDATIONCODE)!="undefined")
							field_VALIDATIONCODE = of.field_VALIDATIONCODE; 

						var VALIDATIONMSG = "";
						if(typeof(of.VALIDATIONMSG)!="undefined")
							VALIDATIONMSG = of.VALIDATIONMSG; 

						var checkreg = "";
						if(typeof(of.checkreg)!="undefined")
							checkreg = of.checkreg; 

						tabStr+='<field WEBEVENT="'+pageevent.replace(/\"/g,"\'")+'" ISDISPLAY="'+inupdatepage+'" ISQUERY="'+insearchpage+'" ISSAMELINE="'+issamline+'" DEFAULTVALUE="'+DEFAULTVALUE.replace(/\"/g,"\'")+'" ISMANDATORY="'+ISMANDATORY+'" ROWSPAN="'+rowSpan+'" MOF_TAB_ID="'+tabId+'" MOF_COLUMN_ID="'+MOF_COLUMN_ID+'" SEQNO="'+oseqno+'" LENGTH="'+size+'" ISCONDITION="'+ISCONDITION+'" DISPLAYLOGIC="'+ DISPLAYLOGIC.replace(/\"/g,"\'") +'" MOF_FIELD_ID="'+fieldId+'" ISTITLE="'+showtitle+'" ISREADONLY="'+isreadonly+'" NAME="'+fieldname.replace(/\"/g,"\'")+'" DESCRIPTION="'+chaname.replace(/\"/g,"\'")+'" TIP="'+ field_TIP.replace(/\"/g,"\'") +'" VALIDATIONCODE="'+ field_VALIDATIONCODE.replace(/\"/g,"\'") +'" VALIDATIONMSG="'+VALIDATIONMSG.replace(/\"/g,"\'")+'"  VFORMAT="'+checkreg.replace(/\"/g,"\'")+'"/>';
						issamline=1;
						}
					}
				}
				tabStr+='</tab>';
			}
		}
		tabStr+='</window></root>';
 
		 
	}
	//var restr=/\"/g;
	//ostr=ostr.replace(restr,"&quot;");
	//var restr=/\'/g;
	//ostr=ostr.replace(restr,"&apos;");
	//var restr=/&/g;
	//ostr=ostr.replace(restr,"&amp;");
	//var restr=/</g;
	//ostr=ostr.replace(restr,"&lt;");
	//var restr=/>/g;
	//ostr=ostr.replace(restr,"&gt;");
	return tabStr;
	//alert(FieldStr);

}
//�������б��,���ݲ������ɸ������ͱ���xml
this.getFormxmlByType=getFormxmlByType;
function getFormxmlByType(type)
	{
		var xmlDoc = new ActiveXObject("Msxml.DOMDocument");
		xmlDoc.async = false;
		xmlDoc.preserveWhiteSpace = true;
		xmlDoc.load("condition.xml");

	if(charType=="1")//��Сд�й�
		xmlDoc=xmlDoc.childNodes[1].getElementsByTagName("upper")[0];
	else
		xmlDoc=xmlDoc.childNodes[1].getElementsByTagName("lower")[0];

	var usewhen="";
	var readonlywhen="";
	var notnullwhen="";
	var subusewhen="";
	var subreadonlywhen="";
if(xmlDoc!=null)
		{
	var nodeusewhen=xmlDoc.getElementsByTagName("use-when");
	if(nodeusewhen.length!=0)
		usewhen=nodeusewhen[0].text;
	var nodereadonlywhen=xmlDoc.getElementsByTagName("readonly-when");
	if(nodereadonlywhen.length!=0)
		readonlywhen=nodereadonlywhen[0].text;
	var nodenotnullwhen=xmlDoc.getElementsByTagName("notnull-when");
	if(nodenotnullwhen.length!=0)
		notnullwhen=nodenotnullwhen[0].text;
	var nodesubusewhen=xmlDoc.getElementsByTagName("sub-use-when");
	if(nodesubusewhen.length!=0)
		subusewhen=nodesubusewhen[0].text;
	var nodesubreadonlywhen=xmlDoc.getElementsByTagName("sub-readonly-when");
	if(nodesubreadonlywhen.length!=0)
		subreadonlywhen=nodesubreadonlywhen[0].text;
	restr=/&/g;
	usewhen=usewhen.replace(restr,"&amp;");
	readonlywhen=readonlywhen.replace(restr,"&amp;");
	notnullwhen=notnullwhen.replace(restr,"&amp;");
	subusewhen=subusewhen.replace(restr,"&amp;");
	subreadonlywhen=subreadonlywhen.replace(restr,"&amp;");
	restr=/\"/g;
	usewhen=usewhen.replace(restr,'&quot;');
	readonlywhen=readonlywhen.replace(restr,'&quot;');
	notnullwhen=notnullwhen.replace(restr,'&quot;');
	subusewhen=subusewhen.replace(restr,'&quot;');
	subreadonlywhen=subreadonlywhen.replace(restr,'&quot;');

	restr=/\'/g;
	usewhen=usewhen.replace(restr,"&apos;");
	readonlywhen=readonlywhen.replace(restr,"&apos;");
	notnullwhen=notnullwhen.replace(restr,"&apos;");
	subusewhen=subusewhen.replace(restr,"&apos;");
	subreadonlywhen=subreadonlywhen.replace(restr,"&apos;");
	
	restr=/</g;
	usewhen=usewhen.replace(restr,"&lt;");
	readonlywhen=readonlywhen.replace(restr,"&lt;");
	notnullwhen=notnullwhen.replace(restr,"&lt;");
	subusewhen=subusewhen.replace(restr,"&lt;");
	subreadonlywhen=subreadonlywhen.replace(restr,"&lt;");

	restr=/>/g;
	usewhen=usewhen.replace(restr,"&gt;");
	readonlywhen=readonlywhen.replace(restr,"&gt;");
	notnullwhen=notnullwhen.replace(restr,"&gt;");
	subusewhen=subusewhen.replace(restr,"&gt;");
	subreadonlywhen=subreadonlywhen.replace(restr,"&gt;");

	}
var FieldStr='';

	//����ҳ��ı�,�ӱ�
var divAll=document.all("pages");
for(var ii=0;ii<divAll.children.length;ii++)
		{
		var odiv=divAll.children[ii];
		for(var kk=odiv.children.length-1;kk>=0;kk--)
			{
			var otable=odiv.children[kk];
			var legent='';
			if(otable.tagName=="FIELDSET")
				{
				legent=otable.children[0];
				otable=otable.children[1];
				}
			if(otable!=null && otable.tagName=="TABLE" && otable.type==type)
				{
			var subtabname="";
			var subformname="${"+otable.id+"}";
			if(otable.formid!=null && otable.formid!="")
					{
				subformname=otable.formid;
				//if(charType=="1")
					//subformname=otable.formid.toUpperCase();
				//else
					//subformname=otable.formid.toLowerCase();
					}
			if(otable.type=="sub")
					{
					//�滻һ��
				var res=/\$\{subEntityName\}/g;
				FieldStr+='<sub-fields-entity entity-name="'+subformname+'" sub-name="'+otable.id+'" title="'+legent.innerText+'" readonly-when="'+subreadonlywhen.replace(res,otable.id)+'"  use-when="'+subusewhen.replace(res,otable.id)+'"  tab-index="'+(ii+1)+'" >';
				subtabname=otable.id;
					}
			for(var i=0;i<otable.rows.length;i++)
					{		
			for(var j=0;j<otable.rows[i].cells.length;j++)
					{
						var otd=otable.rows[i].cells[j];
						if(otd==null) continue;
						var content=otd.getElementsByTagName("INPUT");
						if(content.length<1)
							content=otd.getElementsByTagName("SELECT");
						if(content.length<1)
							content=otd.getElementsByTagName("TEXTAREA");
						if(content.length>0)
							content=content[0];
						//alert(content);
						if(content!=null && (content.tagName=="INPUT" || content.tagName=="SELECT" ||  content.tagName=="TEXTAREA" ) )
						{
							if(content.type=="pl" || (content.getAttribute("sumField")!=null && otable.type=="sub"))
								continue;

						var titlestr=content.getAttribute("titlestr");
						var titlestr1='';
						if(titlestr!=null && titlestr!="")
							 titlestr1=' title="'+titlestr+'" ';
						//if(otd.previousSibling!=null && otd.previousSibling.tagName=="TD")
							//titlestr1=' title="'+otd.previousSibling.innerText+'" ';
						var tooltip=content.getAttribute("tooltip");
						var tooltipstr='';
						if(tooltip!=null && tooltip!="")
							 tooltipstr=' tooltip="'+tooltip+'" ';
						var stylecss=content.getAttribute("stylecss");
						var stylecssstr='';
						if(stylecss!=null && stylecss!="")
							 stylecssstr=' style="'+stylecss+'" ';
						var restriction=content.getAttribute("restriction");
						var restrictionstr='';
						if(restriction!=null && restriction!="")
							 restrictionstr=' restriction="'+restriction+'" ';
						var defaulttype=content.getAttribute("default-type");
						var defaulttypestr='';
						if(defaulttype!=null && defaulttype!="")
							 defaulttypestr=' default-type="'+defaulttype+'" ';
						else
							defaulttypestr=' default-type="none" ';
						var fieldtype=content.getAttribute("fieldtype");
						var defaultvalue=content.getAttribute("default-value");
						var defaultvaluestr='';
						if(defaultvalue!=null && defaultvalue!="")
							 defaultvaluestr=' default-value="'+defaultvalue+'" ';
						var reserveKey=content.getAttribute("reserveKey");
						var reserveKeystr='';
						if(reserveKey!=null && reserveKey!="")
							 reserveKeystr=' reserveKey="'+reserveKey+'" ';
						var datatype=content.getAttribute("datatype");
						if(datatype==null)
							datatype="String";
						//���㹫ʽ���
						var sumfieldstr='';
						if(content.getAttribute("sumField")!=null && content.getAttribute("sumField")!="")
							{
							sumfieldstr=' sumField="'+content.getAttribute("sumField")+'" ';
							}
						var funstr='';
						if(content.getAttribute("FUNC")!=null && content.getAttribute("FUNC")!="")
							{
							funstr=' FUNC="'+content.getAttribute("FUNC")+'" ';
							}
						var funargstr='';
						if(content.getAttribute("FUNARG")!=null && content.getAttribute("FUNARG")!="")
							{
							funargstr=' FUNARG="'+content.getAttribute("FUNARG")+'" ';
							}
						var fieldnamestr='tab'+ii+'defr'+i+'c'+j+subtabname;
					//alert(checkName(content,fieldnamestr));

							if(content.id==null || content.id=="")
							{
								var hasname=checkName(content,fieldnamestr);
								while(hasname)
									{
									var ind=hasname.toUpperCase().lastIndexOf("Z");
									if(ind>0)
										{
										var num=hasname.substring(ind+1);
										if(num!=null)
											num=parseInt(num)+1;
										fieldnamestr=hasname.substring(0,ind)+"Z"+num;
										}
									else
										{
										fieldnamestr=hasname+"Z"+1;
										}
									hasname=checkName(content,fieldnamestr);
									//alert("fieldnamestr="+fieldnamestr);

									}
							}
							else
							{
							fieldnamestr=content.id;
							}
							
							if(charType=="1")
							{
								content.id=fieldnamestr.toUpperCase();
								fieldnamestr=fieldnamestr.toUpperCase();
							}
							else
							{
								content.id=fieldnamestr.toLowerCase();
								fieldnamestr=fieldnamestr.toLowerCase();
							}
						if(otable.type=="sub")
							{
							FieldStr+='<field  field-name="'+fieldnamestr+'"  name="'+fieldnamestr+'" '+defaulttypestr+defaultvaluestr+' '+reserveKeystr+restrictionstr+' tab-index="'+(ii+1)+'"'+titlestr1+tooltipstr+' type="'+datatype+'"'+sumfieldstr+funstr+funargstr+'  >';
							}
						else
							{
							FieldStr+='<field  field-name="'+fieldnamestr+'"  name="'+fieldnamestr+'" '+defaulttypestr+defaultvaluestr+' notnull-when="'+notnullwhen.replace('${name}',fieldnamestr)+'"  readonly-when="'+readonlywhen.replace('${name}',fieldnamestr)+'" use-when="'+usewhen.replace('${name}',fieldnamestr)+'"   '+reserveKeystr+restrictionstr+' tab-index="'+(ii+1)+'"'+titlestr1+tooltipstr+' type="'+datatype+'"'+sumfieldstr+funstr+funargstr+' >';
							}
							switch(fieldtype)
							{
							case "hidden":
										FieldStr+='<hidden/>';
										break;
							case "textarea":
										var cols=content.getAttribute("cols");
										var rows=content.getAttribute("rows");
										var colsstr='';
										if(cols!=null && cols!="")
											 colsstr=' cols="'+cols+'" ';
										var rowsstr='';
										if(rows!=null && rows!="")
											 rowsstr=' rows="'+rows+'" ';
										FieldStr+='<textarea  '+colsstr+rowsstr+stylecssstr+' />';
										break;
							case "date-time":
										var datetype=content.getAttribute("datetype");
										var datetypestr='';
										if(datetype!=null && datetype!="")
											 datetypestr=' type="'+datetype+'" ';
										var size=content.style.width;
										var sizestr='';
										if(size!=null && size!="")
											 sizestr=' size="'+parseInt(size)+'" ';
										FieldStr+='<date-time '+datetypestr+sizestr+'  />';
										break;
							case "calculate":
										FieldStr+='<calculate '+stylecssstr+'/>';
										break;
							case "check":
										var checkstr="";
										for(var ic=0;ic<otd.children.length;ic++)
										{
										var oobj=otd.children[ic];
										if(oobj.type=="checkbox")
											{
											var selectstr='';
											if(oobj.checked)
												selectstr=' selected="true" ';
											checkstr+='<option  key="'+oobj.key+'" description="'+oobj.description+'" '+selectstr+'/>';
											}
										}
										FieldStr+='<check '+stylecssstr+'>'+checkstr+'</check>';
										break;
							case "radio":
										var radiostr="";
										var checkstr="false";
										for(var ir=0;ir<otd.children.length;ir++)
										{
										var oobj=otd.children[ir];
										if(oobj.type=="radio")
											{
											if(oobj.checked)
												checkstr="true";
											var selectstr='';
											if(oobj.checked)
												selectstr=' selected="true" ';
											radiostr+='<option key="'+oobj.key+'" description="'+oobj.description+'" '+selectstr+'/>';
											}
										}
										
										FieldStr+='<radio  no-current-selected-key="'+checkstr+'" '+stylecssstr+'>'+radiostr+'</radio>';
										break;
							case "drop-down":
										
										var dropdownstr="";
										for(var id=0;id<content.options.length;id++)
										{
										var opt=content.options[id];
										var selectstr='';
											if(opt.selected)
												selectstr=' selected="true" ';
											dropdownstr+='<option  key="'+opt.value+'" description="'+opt.innerText+'" '+selectstr+'/>';
										}
										var size=content.style.width;
										var sizestr='';
										if(size!=null && size!="")
											 sizestr=' size="'+parseInt(size)+'" ';
										FieldStr+='<drop-down '+sizestr+stylecssstr+'>'+dropdownstr+'</drop-down>';
										break;
							case "hyperlink":
										var target=content.getAttribute("target");
										var description=content.getAttribute("description");
										var targetwindow=content.getAttribute("target-window");
										var targetstr='';
										if(target!=null && target!="")
											 targetstr=' target="'+target+'" ';
										var descriptionstr='';
										if(description!=null && description!="")
											 descriptionstr=' description="'+description+'" ';
										var targetwindowstr='';
										if(targetwindow!=null && targetwindow!="")
											 targetwindowstr=' target-window="'+targetwindow+'" ';
										FieldStr+='<hyperlink '+targetstr+descriptionstr+targetwindowstr+stylecssstr+' />';
										break;
							case "image":
										var imgheight=content.getAttribute("imgheight");
										var imgwidth=content.getAttribute("imgwidth");
										var imgsrc=content.getAttribute("imgsrc");
										var imgborder=content.getAttribute("imgborder");
										var imgheightstr='';
										if(imgheight!=null && imgheight!="")
											 imgheightstr=' height="'+imgheight+'" ';
										var imgwidthstr='';
										if(imgwidth!=null && imgwidth!="")
											 imgwidthstr=' width="'+imgwidth+'" ';
										var imgsrcstr='';
										if(imgsrc!=null && imgsrc!="")
											 imgsrcstr=' value="'+imgsrc+'" ';
										var imgborderstr='';
										if(imgborder!=null && imgborder!="")
											 imgborderstr=' border="'+imgborder+'" ';
										FieldStr+='<image  '+imgheightstr+imgwidthstr+imgsrcstr+imgborderstr+stylecssstr+'/>';
										break;
							case "file":
										FieldStr+='<file '+stylecssstr+' />';
										break;
							case "display":
										FieldStr+='<display/>';
										break;
							case "select-field":
										var editurl=content.getAttribute("edit-url");
										var editurlstr='';
										if(editurl!=null && editurl!="")
											 editurlstr=' edit-url="'+editurl+'" ';
										var permissionid=content.getAttribute("permission-id");
										var permissionidstr='';
										if(permissionid!=null && permissionid!="")
											 permissionidstr=' permission-id="'+permissionid+'" ';
										var key=content.getAttribute("key");
										var keystr='';
										if(key!=null && key!="")
											 keystr=' key="'+key+'" ';
										FieldStr+='<select-field '+keystr+' />';
										break;
							case "edit-field":
										var editurl=content.getAttribute("edit-url");
										var editurlstr='';
										if(editurl!=null && editurl!="")
											 editurlstr=' edit-url="'+editurl+'" ';
										var permissionid=content.getAttribute("permission-id");
										var permissionidstr='';
										if(permissionid!=null && permissionid!="")
											 permissionidstr=' permission-id="'+permissionid+'" ';
										var key=content.getAttribute("key");
										var keystr='';
										if(key!=null && key!="")
											 keystr=' key="'+key+'" ';
										FieldStr+='<edit-field  '+keystr+stylecssstr+' />';
										break;
							case "special-edit":
										var editurl=content.getAttribute("edit-url");
										var editurlstr='';
										if(editurl!=null && editurl!="")
											 editurlstr=' edit-url="'+editurl+'" ';
										var showclass=content.getAttribute("show-class");
										var showclassstr='';
										if(showclass!=null && showclass!="")
											 showclassstr=' show-class="'+showclass+'" ';
										var key=content.getAttribute("key");
										var keystr='';
										if(key!=null && key!="")
											 keystr=' key="'+key+'" ';
										FieldStr+='<special-edit  '+keystr+stylecssstr+' />';
										break;
							default:
										var maxlength=content.getAttribute("maxlength");
										var maxlengthstr='';
										if(maxlength!=null && maxlength!="")
											 maxlengthstr=' maxlength="'+maxlength+'" ';
										var size=content.style.width;
										var sizestr='';
										if(size!=null && size!="")
											 sizestr=' size="'+parseInt(size)+'" ';
										else
											sizestr=' size="20" ';
										FieldStr+='<text  '+maxlengthstr+sizestr+stylecssstr+' />';
										break;

								}
								FieldStr+='</field>';
						}
					}
					}
				if(otable.type=="sub")
				FieldStr+='</sub-fields-entity>';
				}
			}
		}
return FieldStr;
	}
//�����������HTML
this.getFormTemplate=getFormTemplate;
function getFormTemplate()
	{
getFormXml();
//tabҳ��
var tabStr='';
var formtitlestr='';
var titlediv=document.all("titledesign");
var tabtab=document.all("tabpage");
if(tabtab!=null&&titlediv!=null && tabtab.rows[0].cells[0].tabtitle!=null)
	titlediv.innerHTML=tabtab.rows[0].cells[0].tabtitle;
var tabletitle=document.all("tabletitle");
if(tabletitle!=null)
	formtitlestr='<table width="100%" border=0>'+tabletitle.innerHTML+'</table>';
if(formtitlestr!=null)
	tabStr+=formtitlestr;

if(tabtab!=null)
		{
	if(tabtab.rows[0].cells.length>1)
			{
		var tabtdss='';
		tabtab.rows[0].cells[0].className="taboncss";
		for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
		{
			var otd=tabtab.rows[0].cells[jj];
			if(jj>0)
			otd.className="taboffcss";
			otd.innerHTML=otd.innerText;
			tabtdss+='<#if tabHidden_'+otd.index+'>'+otd.outerHTML+'</#if>';
		}
		tabStr+='<table  border=0 id="tabpage" onclick="doTabpageClick();"><tr>'+tabtdss+'</tr></table>';
		//tabStr+='<script language="javascript">if(document.all("tabpage")!=null) document.all("tabpage").rows[0].cells[0].fireEvent("onclick");</script>';
			}
		
		}
		tabStr+='<div id="pages"  unselectable=on  style="border:1 solid #707070;">';

var FieldStr='';
//����ҳ��ı�,�ӱ�
var divAll=document.all("pages");
var hasborder=divAll.hasborder;
if(hasborder==null)
	hasborder=1;
for(var ii=0;ii<divAll.children.length;ii++)
		{
		var odiv=divAll.children[ii];
		var divhidStyle='';
		if(ii!=0)
			divhidStyle=' style="display:none" ';
		FieldStr+='<#if tabHidden_'+odiv.id.substring(4)+'>';
		FieldStr+='<div id="'+odiv.id+'" '+divhidStyle+' unselectable=on  >';
		for(var kk=0;kk<odiv.children.length;kk++)
			{
			var otable=odiv.children[kk];
			if(otable.tagName=="FIELDSET")
				otable=otable.children[1];
			if(otable!=null && otable.tagName=="TABLE")
				{
			var subtabname="_field";
			var subname="";
			var hidStyle="";
			var trstr="";
			var trend='';
			var scriptstr='';
			var linecount='';
			var tabtoucss='';
			var subtabstr='';
			var subformname=otable.id;
			if(otable.formid!=null && otable.formid!="")
				subformname=otable.formid;
				if(charType=="1")
							{
								subformname=subformname.toUpperCase();
							}
							else
							{
								subformname=subformname.toLowerCase();
							}
			if(otable.type=="sub")
					{
				FieldStr+='<#if subDisplay_'+otable.id+'><#if subWrite_'+otable.id+'>';
				FieldStr+='<div align="right"><button onclick=\'addRow("'+otable.id+'")\' >������</button>&nbsp;<button onclick=\'delRow("'+otable.id+'")\' >ɾ����</button></div>';
				FieldStr+='</#if>';
				subtabname="";//otable.id;//�ڸ�ֵidʱ�����
				subname="sub.";
				hidStyle=' style="display:none" ';
				trstr='<#list subForm_'+otable.id+' as sub>';
				trend='</#list>';
				scriptstr='<script language="javascript">rename("'+otable.id+'");countsum("'+otable.id+'");</script>';
				linecount='<input type="hidden" name="'+otable.id+'_count" value="${'+otable.id+'_count}">';
				tabtoucss=' class="tabtoucss" ';
				subtabstr=' class="subtabcss" onclick="doTabSelect(\''+otable.id+'\')"';
					}
				var borderwidth=otable.borderwidth;
				if(borderwidth==null)
					borderwidth=1;
				FieldStr+='<table id="'+otable.id+'" type="'+otable.type+'" cellspacing="0" border="'+borderwidth+'" bgcolor="'+otable.bgColor+'" style="border-left:'+otable.style.borderLeft+';border-right:'+otable.style.borderRight+';border-top:'+otable.style.borderTop+';border-bottom:'+otable.style.borderBottom+';" width="'+otable.width+'" '+subtabstr+'>';
			var sumtr='<tr class="tabsumcss">';
			for(var i=0;i<otable.rows.length;i++)
					{
					if(i==1)
					FieldStr+=trstr+'<tr '+hidStyle+'>';
					else
					FieldStr+='<tr '+tabtoucss+'>';
					for(var j=0;j<otable.rows[i].cells.length;j++)
					{
						var otd=otable.rows[i].cells[j];
						if(otd==null) continue;
						var css='';
						if(otd.className!=null && otd.className!="")
							css=' class="'+otd.className+'" ';
						var wrapstr='';
						if(otd.noWrap)
							wrapstr=' noWrap ';
						var content=otd.getElementsByTagName("INPUT");
						if(content.length<1)
							content=otd.getElementsByTagName("SELECT");
						if(content.length<1)
							content=otd.getElementsByTagName("TEXTAREA");
						if(content.length>0)
							content=content[0];
					
						if(content!=null && (content.tagName=="INPUT" || content.tagName=="SELECT" ||  content.tagName=="TEXTAREA" ) && content.type!="pl")
						{
						var fildnamstr=content.id;
						if(charType=="1")
							{
								fildnamstr=subname+fildnamstr.toUpperCase()+subtabname;
							}
							else
							{
								fildnamstr=subname+fildnamstr.toLowerCase()+subtabname;
							}
							if(content.getAttribute("sumField")!=null && otable.type=="sub")
								FieldStr+='<td colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'" '+css+wrapstr+'  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.offsetHeight+';"><input readonly name="'+'tab'+ii+'defr'+i+'c'+j+otable.id+'" sumField="'+content.getAttribute("sumField")+'"  FUNC="'+content.getAttribute("FUNC")+'"  parentField="'+content.getAttribute("parentField")+'"  FUNARG="'+content.getAttribute("FUNARG")+'"></td>';
							else
								FieldStr+='<td colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+'  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.offsetHeight+';">${'+fildnamstr+'}</td>';
						if(otable.type=="sub" && i==1)
						sumtr+='<td  colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+'    style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.offsetHeight+';" sumtype="'+content.getAttribute("datatype")+'"></td>';

						}
						else if(content!=null && content.type=="pl")
						{
						FieldStr+='<td  colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+'  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.offsetHeight+';">${suggestContent}</td>';
						}
						else
						{
							var nexttd=otd.nextSibling;
							FieldStr+='<td  colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+'   width="'+otd.offsetWidth+'" style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.offsetHeight+';">';
							if(nexttd!=null)
							{
								var ncontent=nexttd.getElementsByTagName("INPUT");
								if(ncontent.length<1)
									ncontent=nexttd.getElementsByTagName("SELECT");
								if(ncontent.length<1)
									ncontent=nexttd.getElementsByTagName("TEXTAREA");
								if(ncontent.length>0)
									ncontent=ncontent[0];
								else
									ncontent=null;
								if(otable.type!="sub" && nexttd!=null && ncontent!=null && ncontent.id!=null && ncontent.id!="" && ncontent.type!="pl")
								{
									var divnamstr=subname+ncontent.id;
									if(charType=="1")
										{
											divnamstr=divnamstr.toUpperCase()+subtabname;
										}
										else
										{
											divnamstr=divnamstr.toLowerCase()+subtabname;
										}
								FieldStr+='<#if '+divnamstr+'_hidden>${'+divnamstr+'_notNull}';
								}
							}
							if(otd.children!=null && otd.getElementsByTagName("DIV").length>3)
							{
							var arrdiv=otd.getElementsByTagName("DIV");
							var ddivstr='';
							/*for(var ddiv=arrdiv.length-1;ddiv>=0;ddiv--)
								{
								var ooddiv=arrdiv[ddiv];
								ddivstr+=ooddiv.outerHTML;
								//ooddiv.removeNode();
								}
							var othertxt=otd.innerHTML;
							*/
							//otd.innerHTML='<div style="POSITION: absolute; ">'+ddivstr+'</div>'+othertxt;
							}
							FieldStr+=otd.innerHTML;
							if(otable.type!="sub" && nexttd!=null && ncontent!=null && ncontent.type!="pl")
								FieldStr+='</#if>';
							FieldStr+='</td>';
							if(otable.type=="sub" && i==1)
							sumtr+='<td  colspan="'+otd.colSpan+'"   '+css+wrapstr+'  rowspan="'+otd.rowSpan+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.height+';"></td>';
						}
					}
					if(i==1)	
					FieldStr+='</tr>'+trend;
					else
					FieldStr+='</tr>';
					
					}
					//if(otable.type=="sub" && sumtr!="")
						//FieldStr+=sumtr+'</tr>';
				FieldStr+='</table>';
				FieldStr+=linecount;
				FieldStr+=scriptstr;
				if(otable.type=="sub")
				FieldStr+='</#if>';

				}
			}
			FieldStr+='</div>';
			FieldStr+='</#if>';
		}
		//if(tabtab.rows[0].cells.length>1)
			FieldStr+='</div>';
	var runtab='<script language="javascript">if(document.all("tabpage")!=null) document.all("tabpage").rows[0].cells[0].fireEvent("onclick");initMainForm();</script>';
	return(tabStr+FieldStr+extendFieldHtml+runtab);
	//alert(FieldStr);

}
//������ǰ�������select
this.getTabSelect=getTabSelect;
function getTabSelect(type)
	{
var FieldStr='';
	//����ҳ��ı�,�ӱ�
var divAll=document.all("pages");
for(var ii=0;ii<divAll.children.length;ii++)
		{
		var odiv=divAll.children[ii];
		for(var kk=odiv.children.length-1;kk>=0;kk--)
			{
			var otable=odiv.children[kk];
			if(otable.tagName=="FIELDSET")
				otable=otable.children[1];
			if(otable!=null && otable.tagName=="TABLE")
				{
			var subtabname="";
			if(otable.type=="sub")
					{
				continue;
				subtabname=otable.id;
					}
			for(var i=0;i<otable.rows.length;i++)
					for(var j=0;j<otable.rows[i].cells.length;j++)
					{
						var otd=otable.rows[i].cells[j];
						if(otd==null) continue;
						var content=otd.getElementsByTagName("INPUT");
						if(content.length<1)
							content=otd.getElementsByTagName("SELECT");
						if(content.length<1)
							content=otd.getElementsByTagName("TEXTAREA");
						if(content.length>0)
							content=content[0];
						if(content!=null && (content.tagName=="INPUT" || content.tagName=="SELECT" || content.tagName=="TEXTAREA"))
						{
						if(type!=null && type!="" && content.getAttribute("datatype")!=type && content.getAttribute("datetype")!=type)
							continue;
						var titlestr=content.getAttribute("titlestr");
						if(titlestr==null)
							 titlestr="";
						var ofelname='tab'+ii+'defr'+i+'c'+j+subtabname;
						if(content.id!=null && content.id!="")
							{
							ofelname=content.id;
							}
						FieldStr+='<option  value="Ins_'+ofelname+'">'+titlestr+'</option>';
						}
						
					}
				}
			}
		}
	if(FieldStr!="")
		return('<select id="defMainfield"><option>--��--</option>'+FieldStr+'</select>');
	else
		return'<select id="defMainfield"><option>--��--</option></select>';
}
//������ǰ����ж�����ָ������
this.isHasFieldByKey=isHasFieldByKey;
function isHasFieldByKey(keystr,keytype,tdstr)
	{
if(keystr==null || keystr=="")
	return;
	//����ҳ��ı�,�ӱ�
var divAll=document.all("pages");
for(var ii=0;ii<divAll.children.length;ii++)
		{
		var odiv=divAll.children[ii];
		for(var kk=odiv.children.length-1;kk>=0;kk--)
			{
			var otable=odiv.children[kk];
			if(otable.tagName=="FIELDSET")
				otable=otable.children[1];
			if(otable!=null && otable.tagName=="TABLE")
				{
				for(var i=0;i<otable.rows.length;i++)
					for(var j=0;j<otable.rows[i].cells.length;j++)
					{
						var otd=otable.rows[i].cells[j];
						if(otd==null) continue;
						if(tdstr!=null && tdstr==otd)
							continue;
						var content=otd.getElementsByTagName("INPUT");
						if(content.length<1)
							content=otd.getElementsByTagName("SELECT");
						if(content.length<1)
							content=otd.getElementsByTagName("TEXTAREA");
						if(content.length>0)
							content=content[0];
						if(content!=null && (content.tagName=="INPUT" || content.tagName=="SELECT" || content.tagName=="TEXTAREA"))
						{
						if(content.getAttribute(keytype)==keystr)
							return true;
						}
					}
				}
			}
		}
	return false;
}

//����TabAll
this.getTabAll=getTabAll;
function getTabAll()
	{
	return TabAll;
	}
//����body������HTML
this.getFormHtml=getFormHtml;
function getFormHtml()
	{
	getFormXml();
	var restr=/</g;
	var str= document.all("biaodan").innerHTML;
	str=str.replace(restr,"&lt;");
	restr=/>/g;
	str=str.replace(restr,"&gt;");

	return str;
	}
//set body��HTML
this.setFormHtml=setFormHtml;
function setFormHtml(str)
	{
	var restr=/&lt;/g;
	str=str.replace(restr,"<");
	restr=/&gt;/g;
	str=str.replace(restr,">");
	document.all("biaodan").innerHTML=str;
	}
//���ʱ�����б���name��ֵΪ�½�״̬
this.reSetFormName=reSetFormName;
function reSetFormName()
	{
		//����ҳ��ı�,�ӱ�
var divAll=document.all("pages");
divAll.formname="${pages}";
for(var ii=0;ii<divAll.children.length;ii++)
		{
		var odiv=divAll.children[ii];
		for(var kk=odiv.children.length-1;kk>=0;kk--)
			{
			var otable=odiv.children[kk];
			var legent='';
			if(otable.tagName=="FIELDSET")
				{
				legent=otable.children[0];
				otable=otable.children[1];
				}
			if(otable!=null && otable.tagName=="TABLE" && otable.type=="sub")
				{
			otable.formid="${"+otable.id+"}";
				}
			}
		}

	}
//�������ݵ�xml��url
this.getUrl=getUrl;
function getUrl()
	{
	return XmlPath;
	}
//xml��ȡ���ݣ���������һ��xml�ļ������������xml�ļ���textOverColor
function loadData (url,param) {
	var xmlDoc = new ActiveXObject("Msxml.DOMDocument");
	xmlDoc.async = false;
	xmlDoc.preserveWhiteSpace = true;
	if (param == null)
	{
		var restr=/>\s</g;
		url=url.replace(restr,"");
	  xmlDoc.loadXML(url);
	 }
	else
	  xmlDoc.load(window.location.protocol + "//" + window.location.host+url);
	if(xmlDoc.childNodes[1]!=null)
		return xmlDoc.childNodes[1];
}

//����extend-field��Xml�ļ�
this.parseExtendField=parseExtendField;
function parseExtendField()
	{
	var xmldoc=loadData(XmlPath);
	if(xmldoc==null) return;
	 var onode=xmldoc.getElementsByTagName("extend-fields-url")[0];
	 if(onode==null) return;
	 //var str='<?xml version="1.0" encoding="UTF-8"?><fields xsi:noNamespaceSchemaLocation="extend-fields.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><field name="fieldname" default-type="none" default-value="" reserveKey=""/><field name="fieldname" default-type="none" reserved="true" default-value=""/></fields>';
	var xmlroot=loadData(onode.text,1);
	 //var xmlroot=loadData(str);
	 	if(xmlroot==null) return;
	 for(var i=0;i<xmlroot.childNodes.length;i++)
		{
		var onode=xmlroot.childNodes[i];
		if(onode.nodeType!="1")
				continue;
		var oname=onode.getAttribute("name");
		var otitle=onode.getAttribute("title");
		var defaulttype=onode.getAttribute("default-type");
		var defaultvalue=onode.getAttribute("default-value");
		var reserved=onode.getAttribute("reserved");
		var reserveKey=onode.getAttribute("reserveKey");
		var onamestr='';
		if(oname!=null && oname!="")
			onamestr=' name="'+oname+'" ';
		var otitlestr='';
		if(otitle!=null && otitle!="")
			otitlestr=' title="'+otitle+'" ';
		var defaulttypestr='';
		if(defaulttype!=null && defaulttype!="")
			defaulttypestr=' default-type="'+defaulttype+'" ';
		var defaultvaluestr='';
		if(defaultvalue!=null && defaultvalue!="")
			defaultvaluestr=' default-value="'+defaultvalue+'" ';
		var reservedstr='';
		if(reserved!=null && reserved!="")
			reservedstr=' reserved="'+reserved+'" ';
		var reserveKeystr='';
		if(reserveKey!=null && reserveKey!="")
			reserveKeystr=' reserveKey="'+reserveKey+'" ';
		extendFieldXml+='<field '+onamestr+defaulttypestr+defaultvaluestr+otitlestr+reservedstr+reserveKeystr+'><hidden/></field>';
		extendFieldHtml+='${'+oname+'_field}';
		}
	}
//�õ��������ݵ�xml��url
this.setUrl=setUrl;
function setUrl(str)
	{
	XmlPath=str;
	//����xml,��չ������xml
	parseExtendField();
	}

//set��ӡģ��
this.setFormPrintTemplate=setFormPrintTemplate;
function setFormPrintTemplate(str)
	{

	}
//set����ģ��
this.setFormTextTemplate=setFormTextTemplate;
function setFormTextTemplate(str)
	{}
//get������0�½���1�޸�
this.getFormType=getFormType;
function getFormType()
	{
	return formType;
	}

//set������0�½���1�޸�
this.setFormType=setFormType;
function setFormType(val)
	{
	formType=val;
	}
//get��ǰTD
this.getFirstTd=getFirstTd;
function getFirstTd()
	{
	return(firstTd);
	}

//get��Сд����0Сд��1��д
this.getCharType=getCharType;
function getCharType()
	{
	return charType;
	}

//set��Сд����0Сд��1��д
this.setCharType=setCharType;
function setCharType(val)
	{
	charType=val;
	}
//get�ֶ���������ֻ������0��ֻ����1ֻ��
this.getReadonlyType=getReadonlyType;
function getReadonlyType()
	{
	return readonlyType;
	}

//set��Сд����0Сд��1��д
this.setReadonlyType=setReadonlyType;
function setReadonlyType(val)
	{
	readonlyType=val;
	}
//getѡ�еĿؼ�currentDiv
this.getCurrentDiv=getCurrentDiv;
function getCurrentDiv()
	{
	return(currentDiv);
	}


//�ⲿ���ã�ѡ�еĶ���ָ���ʽ
this.resetcurrentDiv=resetcurrentDiv;
function resetcurrentDiv()
{
	if(currentDiv!=null)
			currentDiv.className="";
 
}
this.checkRepeatField = checkRepeatField;
function checkRepeatField(column_id)
{
	var divall=document.all("designdiv");
	var tabtab=divall.children[0].children[0];
	if(tabtab!=null)
	{
		for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
		{
				var issamtab=0;//�Ƿ�ͬһtab
				var otd=tabtab.rows[0].cells[jj];
				var odiv=divall.children[0].children[jj+1];
				var tables=odiv.getElementsByTagName("TABLE");
				for(var kk=0;kk<tables.length;kk++)
				{
					var otab=tables[kk];
					for(var r=0;r<otab.rows.length;r++)
					{
		 
						for(var c=0;c<otab.rows[r].cells.length;c++)
						{
							var ootd=otab.rows[r].cells[c];
							var flds=ootd.getElementsByTagName("INPUT");
							for(var f=0;f<flds.length;f++)
							{
								var of=flds[f];
								if(of.MOF_COLUMN_ID==column_id)							
								{
									alert("ͬ�����в������ظ�����");
									return false;
								}
							}
						}
					}
		 
				}
			}
		 
		}
	return true;

}

}