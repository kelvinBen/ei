/******************************************************************************************
*     DefFormTool 类1.0
*		company:			
*		 author:			
*		 descript:			表单定制工具，生成XML格式的字符串
*	
*******************************************************************************************/
var path = "";
//-------与逻辑有关----------------
var mofWindowId;
var mofWindowPreXml;
var mofTableId;
//---------------------------------
//DefFormTool 类
function DefFormTool(name)
{
//外部变量
this.name=name;
this.CurControl=null;
this.FieldIdCount=1;//域名称全局序号
this.TabIdCount=1;//table名称全局序号
this.CardIdCount=1;//card名称全局序号
if(document.all("designdiv").FieldIdCount)
	this.FieldIdCount=document.all("designdiv").FieldIdCount;
if(document.all("designdiv").TabIdCount)
	this.TabIdCount=document.all("designdiv").TabIdCount;
if(document.all("designdiv").CardIdCount)
	this.CardIdCount=document.all("designdiv").CardIdCount;
//当前操作的XML节点
var CurXmlNode=null;
//选择时,记录起止单元的坐标
this.sTop="";
this.sLeft="";
this.sWidth="";
this.sHeight="";
this.eTop="";
this.eLeft="";
this.eWidth="";
this.eHeight="";
//记录选择时的起止单元格的物理位置
this.sRow="";
this.sCol="";
this.eRow="";
this.eCol="";
//兰色表格的长，宽
this.curwidth=0;
this.curheight=0;
//选择的区域中最大的单元格的width,height
this.maxwidth=0;
this.maxheight=0;
///选择的区域中右上的单元格
this.lastRTd=null;
///选择的区域中右下的单元格
//this.lastRbTd=null;
//表格的LEFT，TOP
this.tabTop=0;
this.tabLeft=0;

//能否合并
this.IsCanMar=true;
//排好序后的位置
this.sRowSort="";
this.sColSort="";
this.eRowSort="";
this.eColSort="";
//图片选择url
this.imagelisturl='';



//选择时鼠标按下时的TD和松开时的TD
var firstTd=null;
var secondTd=null;
//标志是否已经合并
var isDel=false;
//标志是否已经按下鼠标左键
var IsMouseDown=false;
var imgMouseDown=false;
var divMouseDown=false;
var oldtop,oldleft,isresizeheightdown,oldtdtop,oldtdleft,istdzydown;//拖动列框所用

//记录拖动的图片
var curElement=null;
//记录移动的控件
var curMoveElement=null;
//记录图片的位置
var imgleft="-10px";
var imgtop="-10px";
//记录已经拖入控件的TD
var currentTd=null;
//记录选择的已经存在控件
var currentObj=null;
//记录选择的已经存在板块DIV,用于删除等操作
var currentDiv=null;

//记录最后的表单
var formstr="";
//记录SQL语句
var sqlstr="";
//产生的表单信息

//全局XML对象
var XmlDoc=new ActiveXObject("MSXML.DOMDocument");
//总的表格
var TabAll=null;
//操作表格所在的窗口
var curWin=document.frames.ff;
//表格列数，行数
var TabRows=null;
var TabCols=null;
//外部配置xml的路径
var XmlPath="";
//由扩展隐藏域xml生成的xml
var extendFieldXml='';
var extendFieldHtml='';
//标识表单是0新建或1修改
var formType=0;
//大小写类型0为小，1为大写
var charType=0;
//是否要输入框只读
var readonlyType=0;
//已经选择的td的数组
var selectedTdArray=new Array();

//初始化函数
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
		document.all("desiangTr").attachEvent("onmousedown",frammousedown);
		document.all("desiangTr").attachEvent("onmousemove",frammousemove);
		document.all("desiangTr").attachEvent("onmouseup",frammouseup);
											//document.all("designdiv").attachEvent("ondrag",fundrag);
											//document.all("designdiv").attachEvent("ondragend",fundragend);
											//document.all("designdiv").attachEvent("onmouseout",funmouseout);
											//}
		firstTd=null;
		secondTd=null;
	
	}

//**通用函数区***
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



//表格的ONMOUSEDOWN事件
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
	if(obj.tagName=="TD")
		{
		TabAll=obj.offsetParent;
		}
	if(TabAll==null) return;

if(obj!=null && obj.tagName=="TD")
{	
	
	if(obj.canresizezy)//(obj.style.cursor=="e-resize")
	{
	istdzydown=true;
	var ocolw=TabAll.children[0].children[obj.cellIndex];
	currentTd=obj;
	obj.setCapture();
	return;
	}
	if(obj.canresizesx)
	{
	isresizeheightdown=true;
	currentTd=obj;
	obj.setCapture();
	return;

	}
}
//	else
	//	{
	//	while(obj.tagName!="TD"&& TabAll.contains(obj))
	//		obj=obj.parentElement;
	//	}
	BackTdBg();
	ClearTdSelectd();
	if(obj.tagName=="TD")
		{
		firstTd=obj;
		//obj.style.backgroundColor="#9999FF";
		IsMouseDown=true;
		}

	}

//ondbclick事件
this.TabdbClick=TabdbClick;
function TabdbClick()
	{
var obj=event.srcElement;
if(obj.tagName=="INPUT")
		{
		this.CurControl=obj;
		if(obj.fieldtype=="sumcol"){
			 
			showModalDialog(path+"sumcol.htm",window,"dialogWidth:450px;dialogHeight:300px;status:no");
		}
		else if(obj.fieldtype=="sumrow"){
			 
			showModalDialog(path+"sumrow.htm",window,"dialogWidth:450px;dialogHeight:300px;status:no");
		}
		else{
			showModalDialog(path+"TEXT_P.htm",window,"dialogWidth:550px;dialogHeight:600px;status:no");
		}
		}
if(obj.tagName=="TEXTAREA" && obj.type!="pl")
		{
		this.CurControl=obj;
	showModalDialog(path+"TEXT_P.htm",window,"dialogWidth:550px;dialogHeight:600px;status:no");
		}
if(obj.tagName=="SELECT")
		{
	this.CurControl=obj;
	showModalDialog(path+"TEXT_P.htm",window,"dialogWidth:550px;dialogHeight:600px;status:no");
		}
if(obj.tagName=="TD" && obj.card!=null)
		{
	this.CurControl=obj;
	
	showModalDialog(path+"card.htm",window,"dialogWidth:400px;dialogHeight:200px;status:no");
		}
if(obj.tagName=="SPAN" && obj.fixed==1)
		{
	this.CurControl=obj;
	
	showModalDialog(path+"split_attrib.htm",window,"dialogWidth:400px;dialogHeight:200px;status:no");
		}



	}
//表格的ONMOUSEOUT事件,处理选中板块
this.TabMouseOut=TabMouseOut;
function TabMouseOut()
	{
	IsMouseDown=false;
	}
//表格的ONCLICK事件,处理选中板块
this.TabClick=TabClick;
function TabClick()
	{
	var obj=event.srcElement;
	if(currentDiv!=null)
		currentDiv.className="";
	if((obj.tagName=="SPAN" || obj.tagName=="INPUT" || obj.tagName=="TEXTAREA" || obj.tagName=="SELECT" || obj.tagName=="TD" ) && obj.id!="designdiv" && !obj.card)
		{
		this.CurControl=obj;
		obj.className="selectspancss";
		currentDiv=obj;
		if(!obj.fixed)
		obj.canmove=true;
		//alert(currentDiv);

		}
	if(obj.tagName=="DIV" && obj.parentElement.id!="designdiv"&& obj.id!="designdiv")
		{
		obj.className="selectspancss";
		currentDiv=obj;
		obj.canmove=true;

		}
	if(obj.tagName=="SELECT")
		{
		this.CurControl=obj;
		showModalDialog(path+"TEXT_P.htm",window,"dialogWidth:550px;dialogHeight:600px;status:no");
		}
	//处理选中板块

	}

//表格的ONMOUSEMOVE事件
this.TabMouseMove=TabMouseMove;
function TabMouseMove()
	{
		var obj=event.srcElement;
		//拖动列宽
		if(obj!=null && obj.tagName=="TD" && obj.id!="designdiv" && !obj.card!=null)
		{
		var cc="";
		var x=getRealLeft(obj);
		var y=getRealTop(obj);
		var w=parseInt(obj.offsetWidth);
		var h=parseInt(obj.offsetHeight);
		//if(event.clientY-y<5)cc+="n";
		if(y+h-event.clientY<2)cc="s";
		//if(event.clientX-x<5)cc+="w";
		if(x+w-event.clientX<2)cc="e";
		if(cc=="e" && !IsMouseDown){
			obj.style.cursor=cc+"-resize";
			obj.canresizezy=true;
			//alert(cc);
			return(true);
			}
		else if(cc=="s" && !IsMouseDown){
			obj.style.cursor=cc+"-resize";
			obj.canresizesx=true;
			//alert(cc);
			return(true);
			}
		else
			{
			obj.style.cursor="default";
			obj.canresizezy=false;
			obj.canresizesx=false;
			}

}

//选中单元格
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
//表格的ONMOUSEOUT事件
this.TabMouseUp=TabMouseUp;
function TabMouseUp()
	{
	
	var obj=event.srcElement;
	
	//if(obj.card) return;
	if(istdzydown)
	{
	var ocell=currentTd.cellIndex;
	var colgroup=currentTd.offsetParent.children[0].children[ocell];
	if(colgroup==null || colgroup.tagName!="COL") return;
	var newwid=parseInt(colgroup.offsetWidth)-parseInt(oldtdleft-event.clientX);
	if(newwid<1)
	newwid=2;
	colgroup.width=newwid;
	currentTd.style.width=currentTd.offsetWidth;
	istdzydown=false;
	currentTd.canresizezy=false;
	currentTd.releaseCapture();
	for(zz=0;zz<=currentTd.offsetParent.cells.length-1;zz++)
	{
		if(currentTd.offsetParent.cells[zz].getElementsByTagName("DIV").length>5){
			for(var i=currentTd.offsetParent.cells[zz].getElementsByTagName("DIV").length-1;i>=0;i--)
			{
				//删除线
				currentTd.offsetParent.cells[zz].getElementsByTagName("DIV")[i].removeNode();
				
					
		}
		//添加线
		if(linedraw==null)
	{
		lineobj=document.all("line");
		linedraw=Line;
	}
	var x1=0;//otd.offsetLeft;
	var y1=0;//otd.offsetTop;
	var x2=x1+currentTd.offsetParent.cells[zz].offsetWidth-1;
	var y2=y1+currentTd.offsetParent.cells[zz].offsetHeight-1;
	linedraw.drawLine(x1, y1, x2, y2); 
	//alert(x1+","+y1+","+x2+","+y2);
	linedraw.paint(); 
	currentTd.offsetParent.cells[zz].vAlign="top";
	currentTd.offsetParent.cells[zz].insertAdjacentHTML("afterBegin","<div style='position:absolute;' unselectable=on>"+lineobj.innerHTML+"</div>");
	linedraw.clear();	
	}
			}
			
	

	return;
//TabAll.width=parseInt(TabAll.width)-parseInt(oldtdleft-event.clientX);
	//if(TabAll.style.tableLayout=="fixed")
	//TabAll.style.tableLayout="auto";
//alert(TabAll.style.tableLayout);
	}
	if(isresizeheightdown)
	{
	var newwid=parseInt(currentTd.offsetHeight)-parseInt(oldtdtop-event.clientY);

	if(newwid<1)
	newwid=2;
	currentTd.style.height=newwid;
	for(var i=0;i<currentTd.parentElement.cells.length;i++)
		{
		var octd=currentTd.parentElement.cells[i];
		//alert(octd.style.height+","+parseInt(oldtdtop-event.clientY));
		var nowh=parseInt(octd.style.height)-parseInt(oldtdtop-event.clientY);
		if(nowh<25) nowh=25;
		if(octd!=currentTd && octd.style.height!=null &&octd.style.height!="")
		octd.style.height=nowh;
		}

	isresizeheightdown=false;
	currentTd.canresizesx=false;
	currentTd.releaseCapture();
	for(zz=0;zz<=currentTd.offsetParent.cells.length-1;zz++)
	{
		if(currentTd.offsetParent.cells[zz].getElementsByTagName("DIV").length>5){
			for(var i=currentTd.offsetParent.cells[zz].getElementsByTagName("DIV").length-1;i>=0;i--)
			{
				//删除线
				currentTd.offsetParent.cells[zz].getElementsByTagName("DIV")[i].removeNode();
				
					
		}
		//添加线
		if(linedraw==null)
	{
		lineobj=document.all("line");
		linedraw=Line;
	}
	var x1=0;//otd.offsetLeft;
	var y1=0;//otd.offsetTop;
	var x2=x1+currentTd.offsetParent.cells[zz].offsetWidth-1;
	var y2=y1+currentTd.offsetParent.cells[zz].offsetHeight-1;
	linedraw.drawLine(x1, y1, x2, y2); 
	//alert(x1+","+y1+","+x2+","+y2);
	linedraw.paint(); 
	currentTd.offsetParent.cells[zz].vAlign="top";
	currentTd.offsetParent.cells[zz].insertAdjacentHTML("afterBegin","<div style='position:absolute;' unselectable=on>"+lineobj.innerHTML+"</div>");
	linedraw.clear();	
	}
			}
	return;
	}

	if(curMoveElement)
	{
	if(obj.tagName=="INPUT" || obj.tagName=="SELECT" || obj.tagName=="SPAN")
		{
		obj=obj.parentElement;
		}
	if(!obj.children.length>0 && obj.offsetParent==curMoveElement.parentElement.offsetParent)
	obj.appendChild(curMoveElement);
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
		obj.releaseCapture();//释放鼠标焦点
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
			if(!TabAll.contains(obj)&& selectedTdArray!=null)//鼠标在第一个表格中选择了几个td,然后在第二个table中释放鼠标
			{
			secondTd=selectedTdArray[selectedTdArray.length-1];
			}

	}
//移动控件
this.TabDrag=TabDrag;
function TabDrag()
	{
	
	}
//移动控件
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
//获得准确坐标
function getInfo(o){//取得坐标
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

//清空选择的td
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
//合并单元格中
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
//判断能否合并

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
// END 判断能否合并

		var arrChild=new Array();
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
						for(var kk=0;kk<onode.children.length;kk++)
							{
							arrChild[arrChild.length]=onode.children[kk].outerHTML;
							}
					
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
			//alert(firstTd.innerHTML);
		}
firstTd.colSpan=totalCol;

//完全合并多行时出现
if(totalCol==cellCount)
		{
	//firstTd.rowSpan=1;
	firstTd.rowSpan=totalRow;
	firstTd.style.height=parseInt(totalRow)*25;
	BackTdBg();

	return;
		}
else
		{
	firstTd.rowSpan=totalRow;
	firstTd.style.height=parseInt(totalRow)*25;
		}
//并列合并多行，使一行中的所有单元格的rowspan大于1
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
		var maxrowspan=eval("Math.max("+rowspanarr+");");
		if(minrowspan==maxrowspan)
			{
			changeRowPhRow(oftdInTr.rowIndex,1);	
			BackTdBg();
			return;
			}
		for(var i=0;i<tdarr.length;i++)
			{
			//alert(tdarr[i].rowSpan-minrowspan+1);
			tdarr[i].rowSpan=tdarr[i].rowSpan-minrowspan+1;
			//tdarr[i].style.height=parseInt(tdarr[i].rowSpan)*25;
			}
		}
//删除没有td的tr，完全合并多行时出现
for(var i=TabAll.rows.length-1;i>-1;i--)
	{
	var otr=TabAll.rows[i];
	if(otr.cells.length==0)
		;//otr.removeNode(true);
}
changeRowPhRow(oftdInTr.rowIndex,1);	
BackTdBg();
//alert(XmlDoc.xml);
return (XmlDoc.xml);
	}
//判断是否可以合并
this.IsCanMerge=IsCanMerge;
function IsCanMerge()
	{
	if(firstTd==null || secondTd==null) return;
	if(firstTd==secondTd) return;
	if(XmlDoc==null) return;
	}

//使表格单元格的背景色恢复
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
//取消边框颜色
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
//拆分
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
		var ci=fcindex+j;
		if(fcindex+j>TabAll.rows[i].cells.length)
			ci=TabAll.rows[i].cells.length;
		var newnode=TabAll.rows[i].insertCell(ci);
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
	firstTd.style.height=25;
	//return XmlDoc.xml;


	}
//IFRAME的ONMOUSEDOWN事件
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
////处理移动板块ONMOUSEDOWN事件
//IFRAME的ONMOUSEMOVE事件
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
//重画
this.reDraw=reDraw;
function reDraw(str,otype)
	{
	var str=parseXml(str,otype);
	document.all("page1").innerHTML=str;
	this.init();
	}


//IFRAME的ONMOUSEUP事件
this.FrameMouseUp=FrameMouseUp;
function FrameMouseUp()
	{
	if(!imgMouseDown ||curElement==null) return;
	var odiv=window.event.srcElement;
	if(odiv.tagName=="INPUT")
		odiv=odiv.parentElement;
		var designdiv=document.all("designdiv");
	if(odiv.tagName=="SPAN")
		{
			document.body.style.cursor="default";
			designdiv.releaseCapture();
			imgMouseDown=false;
			curElement=null;
			IsMouseDown=false;
			return;
		}
	if(curElement!=null  && designdiv.contains(odiv))
		{
			if(curElement.tagName=="TD")
				curElement.parentElement.className="";
			if(curElement.tagName=="IMG")
				curElement.parentElement.parentElement.className="";
			var pname="";
			if(odiv.tagName=="TD")
			{
			var ptd=odiv.offsetParent;
			if(ptd.id==null)
				ptd.id="deftab"+(this.TabIdCount++);
			var cardid=ptd.parentElement.CARDINDEX;
			if(cardid==null)
				cardid=1;
			var tableid=ptd.TABCOUNTINDEX;
			if(tableid==null)
				tableid=1;
			pname="card"+cardid+"tab"+tableid+"r"+odiv.parentElement.rowIndex+"c"+odiv.cellIndex;
			}
			//else if(odiv.id!=null && odiv.id!="designdiv")
				//pname=odiv.id;
			document.body.style.cursor="default";
			if(curElement.banshitype=="deftable")
			{
				if(odiv.card!="2"){
						alert("表格只能放到选项卡内！");
						document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
					}
			showDefTable(odiv);
			}
			if(curElement.banshitype=="defdiv")
			{
				if(odiv.tagName!="TD" || odiv.card){
					alert("标签只能拖到单元格内！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				if(odiv.tagName=="TD" && odiv.children.length>0){
					alert("单元格内只能放一个标签！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				odiv.insertAdjacentHTML("beforeEnd",'<span contenteditable=true   style="width:95%;"></span>');
			}
			if(curElement.banshitype=="defsplitdiv")
			{
				if(odiv.card!="2"){
					alert("分隔栏只能拖到选项卡内！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				odiv.insertAdjacentHTML("beforeEnd",'<div><span fixed=1 contenteditable=true align=center  style="text-align:center;background-color:#eeeeee;height:20;width:100%;"></span></div>');
			}
			if(curElement.banshitype=="text")
			{
				if(odiv.tagName!="TD" || odiv.card ){
					
					alert("域只能拖到单元格内！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				if(odiv.tagName=="TD" && odiv.children.length>0 ){
					alert("单元格内只能放一个域！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				if(odiv.offsetParent.type=="sub" && odiv.parentElement.rowIndex==0){
					alert("域不能拖到子表单的标题行内！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				var ofeildname=pname+"Field"+(this.FieldIdCount++);
				switch(curElement.type)
				{
				case "hidden":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "textarea":
							odiv.insertAdjacentHTML("beforeEnd",'<textarea value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="height:20px;border:1 solid ;width:80%" readonly>'+curElement.parentElement.innerText+'</textarea>');
							break;
				case "date-time":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "calculate":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "check":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'" type="checkbox"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'"  readonly>');
							break;
				case "radio":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'" type="radio"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'"  readonly>');
							break;
				case "drop-down":
							
							odiv.insertAdjacentHTML("beforeEnd",'<select   id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly></select>');
							break;
				case "hyperlink":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "image":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "file":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "display":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "select-field":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "edit-field":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "special-edit":
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "sumrow":
							if(odiv.offsetParent.type!="sub")
								{
								alert("合计行只能插到子表单内!");
								document.body.style.cursor="default";
								designdiv.releaseCapture();
								imgMouseDown=false;
								curElement=null;
								IsMouseDown=false;
								return;
								}
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "sumcol":
							if(odiv.offsetParent.type!="sub")
								{
								alert("合计列只能插到子表单内!");
								document.body.style.cursor="default";
								designdiv.releaseCapture();
								imgMouseDown=false;
								curElement=null;
								IsMouseDown=false;
								return;
								}
							odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
							break;
				case "pinglun":
							var pls=1;

							for(var pp=0;pp<document.body.getElementsByTagName("TEXTAREA").length;pp++)
							{
							var opl=document.body.getElementsByTagName("TEXTAREA")[pp];
							if(opl.type=="pl")
								pls++;
							}
							if(odiv.offsetParent.type=="sub")
								{
								alert("评论域只能插到主表单内!");
								document.body.style.cursor="default";
								designdiv.releaseCapture();
								imgMouseDown=false;
								curElement=null;
								IsMouseDown=false;
								return;
								}
							if(pls>1)
								{
								alert("表单只能插入一个评论域!");
								document.body.style.cursor="default";
								designdiv.releaseCapture();
								imgMouseDown=false;
								curElement=null;
								IsMouseDown=false;
								return;
								}
							odiv.insertAdjacentHTML("beforeEnd",'<textarea   id="'+ofeildname+'"  type="pl" style="border:1 solid ;width:80%" readonly>评论域</textarea>');
							break;

				default:
				odiv.insertAdjacentHTML("beforeEnd",'<input value="'+curElement.parentElement.innerText+'"  id="'+ofeildname+'"  fieldtype="'+curElement.type+'" style="border:1 solid ;width:80%" readonly>');
				}
			}
			if(curElement.banshitype=="deftab")
			{
				//if(odiv!=null && odiv.tagName=="DIV" && odiv.type=="tab")
				if(designdiv.children[0]!=null && designdiv.children[0].type=="tab")
				{
					var ocardtab=designdiv.children[0].children[0];
					var titletd=document.all("titledesign");
					var subtitletd=document.all("subtitledesign");

					for(var jj=0;jj<ocardtab.rows[0].cells.length;jj++)
					{
						var otd=ocardtab.rows[0].cells[jj];
						if(otd.className=="taboncss")
						{
						otd.tabtitle=titletd.innerHTML;
						otd.tabtitlexml=titletd.innerText;
						otd.className="taboffcss";
						designdiv.children[0].children[jj+1].style.display="none";
							if(subtitletd!=null)
							{
							otd.subtabtitle=subtitletd.innerHTML;
							otd.subtabtitlexml=subtitletd.innerText;
							}
						}
					}
				titletd.innerHTML="表单标题";
				subtitletd.innerHTML="";
				var ntd=ocardtab.rows[0].insertCell();
				ntd.innerText="第"+(parseInt(ntd.previousSibling.index)+1)+"页";
				ntd.index=parseInt(ntd.previousSibling.index)+1;
				ntd.className="taboncss";
				ntd.unselectable=true;
				ntd.card=1;
				var cardstr='';
				for(var i=0;i<ocardtab.rows[0].cells.length;i++)
					{
					var otd=ocardtab.rows[0].cells[i];
					if(otd.CARDINDEX!=null)
						cardstr+=otd.CARDINDEX+',';
					}
					if(cardstr!="")
						cardstr=cardstr.substring(0,cardstr.length-1);
				var maxcardind=parseInt(eval("Math.max("+cardstr+")"))+1;
				ntd.CARDINDEX=maxcardind;
				var pid=ntd.previousSibling.id;
				var re=/[0-9]*$/g;
				var ind=pid.search(re);
				var id1=pid.substring(0,ind);
				var id2=pid.substring(ind);
				ntd.id=id1+(parseInt(id2)+1);
				tabdiv=ocardtab.parentElement;
				tabdiv.insertAdjacentHTML("beforeEnd","<div index='"+(parseInt(ntd.previousSibling.index)+1)+"' id='"+id1+(parseInt(id2)+1)+"' CARDINDEX='"+maxcardind+"' style='height:100%;border:1 solid;' card=2></div>");
				//ntd.fireEvent("onclick");
				}
//				else if(odiv!=null && odiv.tagName=="TD" && odiv.card=="1")
//				{
//				var ocardtab=odiv.offsetParent;
//					for(var jj=0;jj<ocardtab.rows[0].cells.length;jj++)
//					{
//						var otd=ocardtab.rows[0].cells[jj];
//						if(otd.className=="taboncss")
//						{
//						otd.tabtitle=titletd.innerHTML;
//						otd.tabtitlexml=titletd.innerText;
//						if(subtitletd!=null)
//						{
//						otd.subtabtitle=subtitletd.innerHTML;
//						otd.subtabtitlexml=subtitletd.innerText;
//						}
//						}
//					}
//				var ntd=ocardtab.rows[0].insertCell();
//				ntd.innerText="第"+(ntd.cellIndex+1)+"页";
//				ntd.className="taboncss";
//				ntd.unselectable=true;
//				ntd.card=1;
//				var pid=ntd.previousSibling.id;
//				var re=/[0-9]*$/g;
//				var ind=pid.search(re);
//				var id1=pid.substring(0,ind);
//				var id2=pid.substring(ind);
//				ntd.id=id1+(parseInt(id2)+1);
//				this.CardIdCount++;
//				tabdiv=ocardtab.parentElement;
//				tabdiv.insertAdjacentHTML("beforeEnd","<div id='"+id1+(parseInt(id2)+1)+"' style='height:100%;border:1 solid;'></div>");
//				ntd.fireEvent("onclick");
//				var titletd=document.all("titledesign");
//				var subtitletd=document.all("subtitledesign");
//				var ptd=ntd.previousSibling;
//				
//
//				}
				else
				{
				tabcardstr='<div style="height:200;" type="tab" id="tabpage"><table onclick="doTabpageClick()"><tr><td class="taboncss" unselectable=on card="1" index=1  id="tab'+(pname+(this.CardIdCount++))+'" CARDINDEX="1">第1页</td></tr></table><div  card=2 index=1  CARDINDEX="1" id="tab'+(pname+(this.CardIdCount++))+'" style="height:100%;border:1 solid ;"></div></div>';
				odiv.insertAdjacentHTML("beforeEnd",tabcardstr);
				}
			}
			if(curElement.banshitype=="defsubtab")
			{
				if(odiv.card!="2"){
					alert("表格只能放到选项卡内！");
					document.body.style.cursor="default";
						designdiv.releaseCapture();
						imgMouseDown=false;
						curElement=null;
						IsMouseDown=false;
						return;
				}
				var tabindexstr='';
				for(var i=0;i<odiv.getElementsByTagName("TABLE").length;i++)
				{
				var otab=odiv.getElementsByTagName("TABLE")[i];
				if(otab.TABCOUNTINDEX!=null)
					tabindexstr+=otab.TABCOUNTINDEX+',';
				}
				var maxind=1;
				if(tabindexstr!="")
				{
				tabindexstr=tabindexstr.substring(0,tabindexstr.length-1);
				maxind=parseInt(eval('Math.max('+tabindexstr+')'))+1;
				}
				var cols=6;
				var otabid=pname+(this.TabIdCount++);
				var tablestr='<TABLE type="sub" formtitle="子表单" index="'+odiv.index+'" TABCOUNTINDEX="'+maxind+'" id="defcard'+odiv.CARDINDEX+'tab'+maxind+'" formid="${defcard'+odiv.CARDINDEX+'tab'+maxind+'}"  height=70  width="840"  class="designtablecss"  borderColor=#000000 cellSpacing=0 cellPadding=2  border=1>';
				var tabstr='';
				var cosgroupstr='';
				var colwid=Math.round(840/6);

				for(var i=0;i<3;i++)
				{
					if(i==0)
						tabstr+='<tr class="tabtoucss">';
					else if(i==2)
						tabstr+='<tr class="tabsumcss">';
					else
						tabstr+="<tr>";
					for(var j=0;j<cols;j++)
					{
					tabstr+='<td phcol="'+(j+1)+'" phrow="'+(i+1)+'" >' ;
					if(i==0)
						{
						//if(j==5)
						//	cosgroupstr+='<col>';
						//else
							cosgroupstr+='<col width="'+colwid+'">';

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
//判断当前行单元格数量是否完整
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
	//得到单元格数量不完整的当前行上面单元格数量完整的一行
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
	//得到单元格数量不完整的当前行上面相应phcol单元格
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

//改变行的phrow
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
//改变列的phcol
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
//增加一行
this.addRow=addRow;
function addRow()
	{
if(TabAll==null || TabAll.type=="sub") return;
if(firstTd==null) return;
	var otr=firstTd.parentElement;
	var cellCount=checkRowCount(TabAll.rows[0]);
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
				if(otr.cells.length==1 && otr.cells[0].colSpan==cellCount)//全部合并一行
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
								if(otd.rowSpan>1)
										{otd.rowSpan+=1;}
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
//删除一行
this.delRow=delRow;
function delRow()
{
	if(TabAll==null || TabAll.type=="sub") return;
	if(firstTd==null) return;

	if(!confirm("此行中包含的内容都将被删除，您确定吗？"))
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
						if(otd.nextSibling==null)
							otr.nextSibling.cells[i-1].insertAdjacentElement("afterEnd",otd);
						else
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
//重新排列下面行的phrow
firstTd=null;
}
//增加一列
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
								
								}
								else if(otd.nextSibling==null)
								{
									var ntd=ntr.insertCell();
									ntd.phcol=parseInt(oldphcol)+1;
									ntd.phrow=ntr.rowIndex+1;
									if(TabAll.tdbordercolor!=null && TabAll.tdbordercolor!="")
										ntd.style.borderColor=TabAll.tdbordercolor;
									//alert(ntr.innerHTML);
									break;
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
//删除一列
this.delCol=delCol;
function delCol()
{
	if(TabAll==null)
		return;
	if(firstTd==null) return;
	if(!confirm("此列中包含的内容都将被删除，您确定吗？"))
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
				//alert(hascol);
				if(hascol!=null)
					{
					//var fcol=getColByPh(ntr,k);
					//alert(fcol);
					if(hascol.colSpan>1 && hascol.rowSpan<TabAll.rows.length)
						{
						hascol.colSpan-=1;
						changeColPhCol(ntr,hascol.cellIndex,-1);
						}
					else if(hascol.colSpan>1 && hascol.rowSpan==TabAll.rows.length)
						{
						changeColPhCol(ntr,hascol.cellIndex,-1);
						hascol.removeNode(true);
						var cos=hascol.colSpan;
						for(var cc=1;cc<cos;cc++)
							{
							TabAll.children[0].children[parseInt(cc)+parseInt(oldcellindex)].removeNode(true);
							}
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
//撤消
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
//重做
this.repertDo=repertDo;
function repertDo()
	{
	var str=stock.reVerseOut();
	return str;
//	parseXml(str,1);
//	document.all("tab1").innerHTML=str;
//	this.init();
	}

//外部函数
//返回全局对象CurXmlNode
this.getCurXmlNode=getCurXmlNode;
function getCurXmlNode()
	{
	return CurXmlNode;
	}

//返回全局对象firstTd
this.getFirstTd=getFirstTd;
function getFirstTd()
	{
	return firstTd;
	}
//返回全局对象firstTd
this.getSelectedTdArray=getSelectedTdArray;
function getSelectedTdArray()
	{
	return selectedTdArray;
	}

//返回全局对象XmlDoc
this.getXmlDoc=getXmlDoc;
function getXmlDoc(str)
	{
	return XmlDoc;
	}
//返回全局对象TabRows
this.getTabRows=getTabRows;
function getTabRows()
	{
	return TabRows;
	}
//SET全局对象TabRows
this.setTabRows=setTabRows;
function setTabRows(obj)
	{
	TabRows=obj;
	}
//返回全局对象TabCols
this.getTabCols=getTabCols;
function getTabCols()
	{
	return TabCols;
	}
//SET全局对象TabCols
this.setTabCols=setTabCols;
function setTabCols(obj)
	{
	TabCols=obj;
	}
//判断有没有重复的name,obj为input
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
				if(content!=obj && content.parentElement!=obj.parentElement && content.id!=null && content.id.toUpperCase()==oname.toUpperCase())
					return content.id;
				}
			}
		}
		return false;
	}
//遍历表格，生成XML
this.getFormXml=getFormXml;
function getFormXml()
	{
	var inputs=document.all("designdiv").getElementsByTagName("INPUT");
	var selects=document.all("designdiv").getElementsByTagName("SELECT");
	var txtareas=document.all("designdiv").getElementsByTagName("TEXTAREA");
	if(inputs.length<1 && selects.length<1 && txtareas.length<1)
		{
		//alert("表单中必须有一个域");
		return "";
		}
	//为当前tab页添加标题
	var tabtab=document.all("designdiv").children[0].children[0];
	tabtab.rows[0].cells[0].fireEvent("onclick");
	var titletd=document.all("titledesign");
	var subtitletd=document.all("subtitledesign");
	for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
	{
	var otd=tabtab.rows[0].cells[jj];
	if(otd.className=="taboncss")
		{
		otd.tabtitle=titletd.innerHTML;
		otd.tabtitlexml=titletd.innerText;
		if(subtitletd!=null)
			{
		otd.subtabtitle=subtitletd.innerHTML;
		otd.subtabtitlexml=subtitletd.innerText;
			}
		}
	}

//tab页数
var tabStr='<tabs default-select-index="1" off-style="taboffcss" on-style="taboncss">';
var formtitlestr="";
if(tabtab!=null)
		{
		for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
		{
			var otd=tabtab.rows[0].cells[jj];
			var otabtitle=otd.tabtitlexml;
			var osubtabtitle=otd.subtabtitlexml;
			var securityIdstr='';
			if(otd.securityId!=null && otd.securityId!="")
			{
			securityIdstr=' securityId="'+otd.securityId+'" ';
			}
			var securityClassstr='';
			if(otd.securityClass!=null && otd.securityClass!="")
			{
			securityClassstr=' securityClass="'+otd.securityClass+'" ';
			}
			if(otabtitle==null) otabtitle="";
			if(osubtabtitle==null) osubtabtitle="";
			/*
			var restr=/</g;
			otabtitle=otabtitle.replace(restr,"&lt;");
			osubtabtitle=osubtabtitle.replace(restr,"&lt;");
			var restr=/>/g;
			otabtitle=otabtitle.replace(restr,"&gt;");
			osubtabtitle=osubtabtitle.replace(restr,"&gt;");
			*/
			if(formtitlestr=="")
				formtitlestr=otabtitle;
			//tabStr+='<tab index="'+(otd.cellIndex+1)+'" title="'+otd.innerText+'"  form-title="'+otabtitle+'" form-subtitle="'+osubtabtitle+'"/>';
			tabStr+='<tab index="'+(otd.index)+'" title="第'+otd.index+'页"  form-title="'+otabtitle+'" form-subtitle="'+osubtabtitle+'" '+securityClassstr+securityIdstr+'/>';

//			if(otd.className=="taboncss")
//			{
//			obody=document.all("page"+(jj+1));
//			}
		}
tabStr+='</tabs>';
		}
var SubFormstr=getFormxmlByType("sub");
var FieldStr=getFormxmlByType();
		var formname=document.all("designdiv").formname;
		var formnamestr=document.all("designdiv").formid;
		
		if(formname==null || formname=="")
		formname="${pages}";
		if(formname!="${pages}")
		{
		if(charType=="1")
			formname=formname.toUpperCase();
		else
			formname=formname.toLowerCase();

		}
		if(formnamestr==null)
			formnamestr="";
	//var ostr= '<forms  xmlns="http://definition.bean.manager.workform.ntmast.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://definition.bean.manager.workform.ntmast.com formXMLSchema.xsd "><form default-entity-name="'+formname+'" name="'+formnamestr+'" title="'+formtitlestr+'"  type="single" form-version="workform_version_3.2.1">'+tabStr+SubFormstr+FieldStr+extendFieldXml+'</form></forms>';
	var ostr= '<forms><form default-entity-name="'+formname+'" name="'+formnamestr+'" title="'+formtitlestr+'"  type="single" form-version="workform_version_3.2.1">'+tabStr+SubFormstr+FieldStr+extendFieldXml+'</form></forms>';
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
	return ostr;
	//alert(FieldStr);

}
//遍历所有表格,根据参数生成各个类型表格的xml
this.getFormxmlByType=getFormxmlByType;
function getFormxmlByType(type)
	{
	//if(type==null) type="";
		var xmlDoc = new ActiveXObject("Msxml.DOMDocument");
		xmlDoc.async = false;
		xmlDoc.preserveWhiteSpace = true;
		xmlDoc.load("condition.xml");

	if(charType=="1")//大小写有关
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

	//所有页面的表单,子表单
var divAll=document.all("designdiv");
		for(var kk=divAll.getElementsByTagName("TABLE").length-1;kk>=0;kk--)
			{
			var otable=divAll.getElementsByTagName("TABLE")[kk];
			var legent='';
			if(otable!=null && otable.type==type)
				{
			var subtabname="";
			var subformname=""+otable.id+"";
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
					//替换一下
				var res=/\$\{subEntityName\}/g;
				FieldStr+='<sub-fields-entity entity-name="'+subformname+'" sub-name="'+otable.id+'" title="'+otable.formtitle+'" readonly-when="'+subreadonlywhen.replace(res,otable.id)+'"  use-when="'+subusewhen.replace(res,otable.id)+'"  tab-index="'+(otable.index)+'" >';
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
						//事件相关
						var clickevent=content.getAttribute("clickevent");
						var clickeventstr='';
						if(clickevent!=null && clickevent!="")
							 clickeventstr=' onclick="'+clickevent+'" ';
						var changeevent=content.getAttribute("changeevent");
						var changeeventstr='';
						if(changeevent!=null && changeevent!="")
							 changeeventstr=' onchange="'+changeevent+'" ';
						var datatype=content.getAttribute("datatype");
						if(datatype==null)
							datatype="String";
						//计算公式相关
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
						var securityIdstr='';
						if(content.securityId!=null && content.securityId!="")
						{
						securityIdstr=' securityId="'+content.securityId+'" ';
						}
						var securityClassstr='';
						if(content.securityClass!=null && content.securityClass!="")
						{
						securityClassstr=' securityClass="'+content.securityClass+'" ';
						}
						var fieldnamestr=content.id;
					//alert(checkName(content,fieldnamestr));
//检测id重复
							var hasname=checkName(content, content.id);
							if(hasname)
							{
								while(hasname)
									{
									var ind=hasname.toUpperCase().lastIndexOf("FIELD");
									if(ind>0)
										{
										var num=hasname.substring(ind+1);
										if(num!=null)
											num=parseInt(num)+1;
										fieldnamestr=hasname.substring(0,ind)+"FIELD"+num;
										}
									else
										{
										fieldnamestr=hasname+"FIELD"+1;
										}
									hasname=checkName(content,fieldnamestr);
									//alert("fieldnamestr="+fieldnamestr);

									}
									content.id=hasname;
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
							FieldStr+='<field  field-name="'+fieldnamestr+'"  name="'+fieldnamestr+'" '+defaulttypestr+defaultvaluestr+' '+reserveKeystr+restrictionstr+' tab-index="'+(otable.index)+'"'+titlestr1+tooltipstr+' type="'+datatype+'"'+sumfieldstr+funstr+funargstr+clickeventstr+changeeventstr+securityClassstr+securityIdstr+'  >';
							}
						else
							{
							FieldStr+='<field  field-name="'+fieldnamestr+'"  name="'+fieldnamestr+'" '+defaulttypestr+defaultvaluestr+' notnull-when="'+notnullwhen.replace('${name}',fieldnamestr)+'"  readonly-when="'+readonlywhen.replace('${name}',fieldnamestr)+'" use-when="'+usewhen.replace('${name}',fieldnamestr)+'"   '+reserveKeystr+restrictionstr+' tab-index="'+otable.index+'"'+titlestr1+tooltipstr+' type="'+datatype+'"'+sumfieldstr+funstr+funargstr+clickeventstr+changeeventstr+securityClassstr+securityIdstr+' >';
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
return FieldStr;
	}
//遍历表格，生成HTML
this.getFormTemplate=getFormTemplate;
function getFormTemplate()
	{
	var inputs=document.all("designdiv").getElementsByTagName("INPUT");
	var selects=document.all("designdiv").getElementsByTagName("SELECT");
	var txtareas=document.all("designdiv").getElementsByTagName("TEXTAREA");
	if(inputs.length<1 && selects.length<1 && txtareas.length<1)

		{
		//alert("表单中必须有一个域");
		return "";
		}
getFormXml();
//tab页数
var tabStr='';
var formtitlestr='';
var titlediv=document.all("titledesign");
var subtitletd=document.all("subtitledesign");
titlediv.contentEditable =false;
subtitletd.contentEditable =false;
var spans=document.all("designdiv").getElementsByTagName("SPAN");
for(var ss=0;ss<spans.length;ss++)
		{
	spans[ss].contentEditable =false;
	//if(spans[ss].style.width=="90%")
	spans[ss].style.width="100%";
}
var tabtab=document.all("designdiv").children[0].children[0];
if(tabtab!=null&&titlediv!=null && tabtab.rows[0].cells[0].tabtitle!=null)
	titlediv.innerHTML=tabtab.rows[0].cells[0].tabtitle;
var tabletitle=document.all("tabletitle");
if(tabletitle!=null)
	formtitlestr='<table width="100%" border=0 >'+tabletitle.innerHTML+'</table>';
//if(formtitlestr!=null)
	//tabStr+=formtitlestr;
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
		//tabStr+='<div id="tabpage">';
		tabStr+='<table  border=0  onclick="doTabpageClick();"><tr>'+tabtdss+'</tr></table>';
		//tabStr+='<script language="javascript">if(document.all("tabpage")!=null) document.all("tabpage").rows[0].cells[0].fireEvent("onclick");</script>';
			}
		
		}
		//tabStr+='<div   unselectable=on  style="border:0 solid #707070;">';

var FieldStr='';
//所有页面的表单,子表单
var divAll=document.all("designdiv").children[0];
var hasborder=divAll.hasborder;
if(hasborder==null)
	hasborder=1;
for(var ii=1;ii<divAll.children.length;ii++)
		{
		var odiv=divAll.children[ii];
		if(odiv.style.display=="none")
			odiv.style.display=="block";
		var divhidStyle='';
			divhidStyle=' style="display:'+odiv.style.display+'" ';
		FieldStr+='<#if tabHidden_'+odiv.index+'>';
		FieldStr+='<div id="'+odiv.id+'" '+divhidStyle+' unselectable=on  >';
		for(var kk=0;kk<odiv.children.length;kk++)
			{
			var otable=odiv.children[kk];
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
				FieldStr+='<div align="left"><button onclick=\'addRow("'+otable.id+'")\' class="advbutton"> 增加行 </button>&nbsp;<button onclick=\'delRow("'+otable.id+'")\'  class="advbutton"> 删除行 </button></div>';
				FieldStr+='</#if>';
				subtabname="";//otable.id;//在赋值id时候加了
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
				var ishidtabstr='';
				var ishidtab=otable.ishidtab;
				if(ishidtab=="1")
					ishidtabstr=' style="display:none" ';
				else
					ishidtabstr=' style="display:block" ';

				FieldStr+='<table id="'+otable.id+'" class="defformcss" align="center" type="'+otable.type+'" cellspacing="0" '+ishidtabstr+' border="'+borderwidth+'" bordercolor="'+otable.otable+'" bgcolor="'+otable.bgColor+'" style="table-layout:fixed;border-left:'+otable.style.borderLeft+';border-right:'+otable.style.borderRight+';border-top:'+otable.style.borderTop+';border-bottom:'+otable.style.borderBottom+';" width="'+otable.width+'" '+subtabstr+'>';
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
						var colwidth=otable.children[0].children[j].width;
						if(colwidth==null)
							colwidth="";
						if(otd==null) continue;
						var css='';
						if(otd.defClassName!=null && otd.defClassName!="")
							css=' STYLE="'+otd.defClassName+'" ';
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
						var tdheight=otd.style.height;
						if(tdheight==null || tdheight==0)
							tdheight=25;
						var tdwidth=otd.style.width;
						if(tdwidth==null || tdwidth==0)
						{
							if(otd.colSpan>1) tdwidth="";
							else tdwidth=colwidth;
						}
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
								FieldStr+='<td colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'" '+css+wrapstr+'  width="'+tdwidth+'"   height="'+tdheight+'"  valign="'+otd.vAlign+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';"><input readonly name="'+content.id+'" sumField="'+content.getAttribute("sumField")+'"  FUNC="'+content.getAttribute("FUNC")+'"  parentField="'+content.getAttribute("parentField")+'"  FUNARG="'+content.getAttribute("FUNARG")+'"></td>';
							else
								FieldStr+='<td colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+' width="'+tdwidth+'"   height="'+tdheight+'"   valign="'+otd.vAlign+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';">${'+fildnamstr+'}</td>';
						if(otable.type=="sub" && i==1)
						sumtr+='<td  colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+'   width="'+tdwidth+'"   height="'+tdheight+'"   valign="'+otd.vAlign+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';" sumtype="'+content.getAttribute("datatype")+'"></td>';

						}
						else if(content!=null && content.type=="pl")
						{
						FieldStr+='<td  colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  width="'+tdwidth+'"   height="'+tdheight+'"  '+css+wrapstr+'  valign="'+otd.vAlign+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';">${suggestContent}</td>';
						}
						else
						{
							var nexttd=otd.nextSibling;
							FieldStr+='<td  colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+'   width="'+tdwidth+'"   height="'+tdheight+'"  valign="'+otd.vAlign+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';;">';
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
							sumtr+='<td  colspan="'+otd.colSpan+'"   '+css+wrapstr+'  rowspan="'+otd.rowSpan+'"  width="'+tdwidth+'"   height="'+tdheight+'"  style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';"></td>';
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
				else
				{
				FieldStr+=otable.outerHTML;
				}

			}

			FieldStr+='</div>';
			FieldStr+='</#if>';
		}
	//	if(tabtab.rows[0].cells.length>1)
	//		FieldStr+='</div>';
	var runtab='<script language="javascript">if(document.all("tabpage")!=null && document.all("tabpage").children[0]!=null && document.all("tabpage").children[0].tagName=="TABLE") document.all("tabpage").children[0].rows[0].cells[0].fireEvent("onclick");</script>';
	return(formtitlestr+'<div id="tabpage">'+tabStr+FieldStr+extendFieldHtml+'</div>'+runtab);
	//alert(FieldStr);

}
//遍历当前表格，生成select
this.getTabSelect=getTabSelect;
function getTabSelect(type)
	{
var ii=0;
var FieldStr='';
	//所有页面的表单,子表单
var tabtab=document.all("designdiv").children[0].children[0];
for(var i=0;i<tabtab.rows[0].cells.length;i++)
{
	if(tabtab.rows[0].cells[i].className="taboncss")
	{
	ii=i;
	break;
	}
}
var odivall=document.all("designdiv").children[0].children[ii+1];
var seltedstr='';
for(var i=0;i<odivall.getElementsByTagName("TABLE").length;i++)
{
	var otab=odivall.getElementsByTagName("TABLE")[i];
	if(otab.type=="sub")	continue;
	for(var j=0;j<otab.getElementsByTagName("INPUT").length;j++)
	{
	var oinput=otab.getElementsByTagName("INPUT")[j];
	if(oinput.fieldtype=="sumrow" || oinput.fieldtype=="sumcol") continue;
	if(type!=null && type!="" && oinput.getAttribute("datatype")!=type && oinput.getAttribute("datetype")!=type)
	continue;
	FieldStr+='<option '+seltedstr+' value="Ins_'+oinput.id+'">'+oinput.titlestr+'</option>';
	}
	for(var j=0;j<otab.getElementsByTagName("TEXTAREA").length;j++)
	{
	var oinput=otab.getElementsByTagName("TEXTAREA")[j];
	if(oinput.type=="pl") continue;
	if(type!=null && type!="" && oinput.getAttribute("datatype")!=type && oinput.getAttribute("datetype")!=type)
	continue;
	
	FieldStr+='<option '+seltedstr+' value="Ins_'+oinput.id+'">'+oinput.titlestr+'</option>';
	}
	for(var j=0;j<otab.getElementsByTagName("SELECT").length;j++)
	{
	var oinput=otab.getElementsByTagName("SELECT")[j];
	if(type!=null && type!="" && oinput.getAttribute("datatype")!=type && oinput.getAttribute("datetype")!=type)
	continue;
	FieldStr+='<option '+seltedstr+' value="Ins_'+oinput.id+'">'+oinput.titlestr+'</option>';
	}
}
//alert(FieldStr);	
					
	if(FieldStr!="")
		return('<select id="defMainfield"><option>--无--</option>'+FieldStr+'</select>');
	else
		return'<select id="defMainfield"><option>--无--</option></select>';
}
//遍历当前表格，判断有无指定的域
this.isHasFieldByKey=isHasFieldByKey;
function isHasFieldByKey(keystr,keytype,tdstr)
	{
if(keystr==null || keystr=="")
	return;
	//所有页面的表单,子表单
var divAll=document.all("designdiv");

						var content=divAll.getElementsByTagName("INPUT");
						
						var content2=divAll.getElementsByTagName("SELECT");
						
						var	content3=divAll.getElementsByTagName("TEXTAREA");
						for(var i=0;i<content.length;i++)
						{
						if(tdstr!=null &&content[i].parentElement==tdstr)
							continue;
						if(content[i].getAttribute(keytype)==keystr)
							return true;
						}
						for(var i=0;i<content2.length;i++)
						{
						if(tdstr!=null &&content2[i].parentElement==tdstr)
							continue;
						if(content2[i].getAttribute(keytype)==keystr)
							return true;
						}
						for(var i=0;i<content3.length;i++)
						{
						if(tdstr!=null &&content3[i].parentElement==tdstr)
							continue;
						if(content3[i].getAttribute(keytype)==keystr)
							return true;
						}
			
	return false;
}

//返回TabAll
this.getTabAll=getTabAll;
function getTabAll()
	{
	return TabAll;
	}
//遍历body，生成HTML
this.getFormHtml=getFormHtml;
function getFormHtml()
	{
	getFormXml();
	var divall=	document.all("designdiv");
	divall.FieldIdCount=this.FieldIdCount;
	divall.TabIdCount=this.TabIdCount;
	divall.CardIdCount=this.CardIdCount;
/*	
	var odivall=document.all("designdiv");
	for(var i=0;i<odivall.getElementsByTagName("TABLE").length;i++)
	{
		var otab=odivall.getElementsByTagName("TABLE")[i];
		if(otab.type=="sub")
		{
		var otabid=otab.id;
		if(otabid.indexOf("${")<0)
		otab.id="${"+otabid+"}";
		}
	}
	*/
	var restr=/</g;
	var str= document.all("biaodan").innerHTML;
	str=str.replace(restr,"&lt;");
	restr=/>/g;
	str=str.replace(restr,"&gt;");
	return str;
	}
//set body的HTML
this.setFormHtml=setFormHtml;
function setFormHtml(str)
	{
	var divall=	document.all("biaodan");
	var restr=/&lt;/g;
	str=str.replace(restr,"<");
	restr=/&gt;/g;
	str=str.replace(restr,">");
	document.all("biaodan").innerHTML=str;
	document.all("designdiv").style.width=document.body.clientWidth-132;
	if(document.all("designdiv").FieldIdCount)
	this.FieldIdCount=document.all("designdiv").FieldIdCount;
	if(document.all("designdiv").TabIdCount)
	this.TabIdCount=document.all("designdiv").TabIdCount;
	if(document.all("designdiv").CardIdCount)
	this.CardIdCount=document.all("designdiv").CardIdCount;

	//document.all("designdiv").style.height=document.all('biaodan').clientHeight-document.all('tabletitle').offsetHeight;
	}
//另存时把所有表单的name赋值为新建状态
this.reSetFormName=reSetFormName;
function reSetFormName()
	{
		//所有页面的表单,子表单
var divAll=document.all("designdiv");
divAll.formname="${pages}";
for(var ii=0;ii<divAll.getElementsByTagName("TABLE").length;ii++)
		{
			var otable=divAll.getElementsByTagName("TABLE")[ii];
			if(otable!=null && otable.tagName=="TABLE" && otable.type=="sub")
				{
			otable.formid="${"+otable.id+"}";
				}
		}

	}
//配置数据的xml的url
this.getUrl=getUrl;
function getUrl()
	{
	return XmlPath;
	}
//xml读取数据，数据来自一个xml文件，参数是这个xml文件的textOverColor
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

//解析extend-field的Xml文件
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
//得到配置数据的xml的url
this.setUrl=setUrl;
function setUrl(str)
	{
	XmlPath=str;
	//解析xml,扩展隐藏域xml
	parseExtendField();
	}

//set打印模板
this.setFormPrintTemplate=setFormPrintTemplate;
function setFormPrintTemplate(str)
	{

	}
//set正文模板
this.setFormTextTemplate=setFormTextTemplate;
function setFormTextTemplate(str)
	{}
//get表单类型0新建，1修改
this.getFormType=getFormType;
function getFormType()
	{
	return formType;
	}

//set表单类型0新建，1修改
this.setFormType=setFormType;
function setFormType(val)
	{
	formType=val;
	}
//get当前TD
this.getFirstTd=getFirstTd;
function getFirstTd()
	{
	return(firstTd);
	}

//get大小写类型0小写，1大写
this.getCharType=getCharType;
function getCharType()
	{
	return charType;
	}

//set大小写类型0小写，1大写
this.setCharType=setCharType;
function setCharType(val)
	{
	charType=val;
	}
//get字段名，表名只读类型0不只读，1只读
this.getReadonlyType=getReadonlyType;
function getReadonlyType()
	{
	return readonlyType;
	}

//set大小写类型0小写，1大写
this.setReadonlyType=setReadonlyType;
function setReadonlyType(val)
	{
	readonlyType=val;
	}
//get选中的控件currentDiv
this.getCurrentDiv=getCurrentDiv;
function getCurrentDiv()
	{
	return(currentDiv);
	}
//清空选中的控件
this.clearCurrentObj=clearCurrentObj;
function clearCurrentObj()
	{
	currentDiv=null;
	TabAll=null;
	firstTd=null;
	}

}



