/******************************************************************************************
*     DefMbTool 类1.0
*		company:			济南源创软件公司
*		 author:			戴林涛
*		 descript:			模板定制工具，生成XML格式的字符串
*	
*******************************************************************************************/

//DefMbTool 类
function DefMbTool()
{
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
//选择时鼠标按下时的TD和松开时的TD
var firstTd=null;
var secondTd=null;
//标志是否已经合并
var isDel=false;
//标志是否已经按下鼠标左键
var IsMouseDown=false;
var imgMouseDown=false;
var divMouseDown=false;

//记录拖动的图片
var curElement=null;
//记录图片的位置
var imgleft="-10px";
var imgtop="-10px";
//记录已经拖入控件的TD
var currentTd=null;
//记录选择的已经存在控件
var currentObj=null;
//记录选择的已经存在板块DIV
var currentDiv=null;

//记录最后的表单
var formstr="";
//记录SQL语句
var sqlstr="";
//产生的表单信息

//全局XML对象
var XmlDoc=null;
//总的表格
var TabAll=null;
//操作表格所在的窗口
var curWin=top.ff;
//初始化函数
this.init=init;
function init()
	{
	TabAll=document.all("tt");
	if(TabAll!=null)
		{
		TabAll.attachEvent("onmousedown",this.TabMouseDown);
		TabAll.attachEvent("onmousemove",this.TabMouseMove);
		TabAll.attachEvent("onmouseup",this.TabMouseUp);
		}
		firstTd=null;
		secondTd=null;
	}

//解析XML
this.parseXml=parseXml;
function parseXml(xmlstr)
	{
	if(xmlstr==null || xmlstr=="")
		return;
	var detailStr="";
//	try
//		{
	XmlDoc=new ActiveXObject("MSXML.DOMDocument");
	XmlDoc.loadXML(xmlstr);
	if(XmlDoc.documentElement.tagName!="table")
	{
		
		alert("取数据失败!");
		return;
	}
	var detailNode=XmlDoc.documentElement;

	if(detailNode.childNodes.length>0)
		{
		for(j=0;j<detailNode.childNodes.length;j++)
			{
			detailStr+="<tr>";
			var otr=detailNode.childNodes[j];
			if(otr.childNodes.length>0)
				{
				for(var k=0;k<otr.childNodes.length;k++)
					{
					otd=otr.childNodes[k];
					var tdwidth=otd.getAttribute("width");
					var tdstyle=otd.getAttribute("style");
					detailStr+="<td";
					if(tdwidth!=null && tdwidth!="")
						detailStr+=" width=\""+tdwidth+"\" ";
					if(tdstyle!=null && tdstyle!="")
						detailStr+=" style=\""+tdstyle+"\" ";
					var rowspan=otd.getAttribute("rowspan");
					var colspan=otd.getAttribute("colspan");
					if(rowspan==null)
					rowspan=1;
					if(colspan==null)
					colspan=1;
					var phrow=otd.getAttribute("phrow");
					var phcol=otd.getAttribute("phcol");
					if(phrow==null)
					phrow=j+1;
					if(phcol==null)
					phcol=k+1;
					detailStr+=' colspan="'+colspan+'" rowspan="'+rowspan+'" phrow="'+phrow+'" phcol="'+phcol+'">';//+otd.text+"</td>";
					var blockstr="";
					if(otd.childNodes.length>0)
						{
						for(var ll=0;ll<otd.childNodes.length;ll++)
							{
							var obk=otd.childNodes[ll];
							if(obk.tagName!="block") continue;
							var bkobj=new Bankuai();
							var oob=bkobj.XmlToNode(obk);
							blockstr+=oob.outToHtml();
							}
						}
					detailStr+=blockstr+"&nbsp;</td>";
					
					}
				}
			detailStr+="</tr>";
			}
			alert(detailStr);
			return(detailStr);

		}
//		}catch(ex)
//		{
//		alert("创建XML对象失败!"+ex.description);
//		}

	}



//表格的ONMOUSEDOWN事件
this.TabMouseDown=TabMouseDown;
function TabMouseDown()
	{
	if(TabAll==null) return;
	var obj=event.srcElement;
	if(obj.tagName=="TD")
		{
		firstTd=obj;
		IsMouseDown=true;
		}
	//处理移动板块
	if(obj.tagName=="DIV" && TabAll.contains(obj))
			{
			divMouseDown=true;
			var divtop=obj.parentElement;
			currentDiv=divtop;
			}

	}
//表格的ONMOUSEMOVE事件
this.TabMouseMove=TabMouseMove;
function TabMouseMove()
	{
	document.selection.empty();
	var obj=event.srcElement;
	if(TabAll==null) return;
	if(firstTd==null || IsMouseDown==false) return;
	BackTdBg();
	if(obj.tagName=="TD")
		{
//		fcindex=firstTd.cellIndex;
//		frindex=firstTd.parentElement.rowIndex;
//		ocindex=obj.cellIndex;
//		orindex=obj.parentElement.rowIndex;

//		for(var i=frindex;i<=orindex;i++)
//			{
//			for(var j=fcindex;j<=ocindex;j++)
//				{
//				var otd=TabAll.rows[i].cells[j];
//				otd.style.backgroundColor="red";
//				}
//			}

		fphcindex=firstTd.phcol;
		fphrindex=firstTd.phrow;
		ophcindex=obj.phcol;
		ophrindex=obj.phrow;
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
				ophcol=otd.phcol;
				ophrow=otd.phrow;
				if(ophcol>fphcindex-1 && ophcol<=ophcindex && ophrow>fphrindex-1 && ophrow<=ophrindex)
					otd.style.backgroundColor="red";
			}
		}
	}
//表格的ONMOUSEOUT事件
this.TabMouseUp=TabMouseUp;
function TabMouseUp()
	{
	var obj=event.srcElement;
	if(firstTd==null || IsMouseDown==false) return;
	if(obj.tagName=="TD")
		{
		secondTd=obj;
		IsMouseDown=false;
		}
	}

//合并单元格中
this.Merge=Merge;
function Merge()
	{	
	if(firstTd==null || secondTd==null) return;
	if(XmlDoc==null) return;
		var fcindex=firstTd.cellIndex;
		var frindex=firstTd.parentElement.rowIndex;
		var scindex=secondTd.cellIndex;
		var srindex=secondTd.parentElement.rowIndex;
		var fTd=XmlDoc.documentElement.childNodes[frindex].childNodes[fcindex];
		var totalRow=parseInt(secondTd.phrow)-parseInt(firstTd.phrow)+secondTd.rowSpan;
		var totalCol=parseInt(secondTd.phcol)-parseInt(firstTd.phcol)+secondTd.colSpan;
		//alert(totalRow+","+totalCol+","+fcindex+","+scindex+","+frindex+","+srindex);
		var fphrow=firstTd.phrow;
		var fphcol=firstTd.phcol;
		var sphrow=parseInt(secondTd.phrow)+secondTd.rowSpan-1;
		var sphcol=parseInt(secondTd.phcol)+secondTd.colSpan-1;
		var countTd=0;
//判断能否合并

//for(var ii=frindex;ii<=srindex;ii++)
//	for(var jj=fcindex;jj<=scindex;jj++)
//		{
//		var otd=TabAll.rows[ii].cells[jj];
//		alert(otd.innerText);
//		alert(otd.colSpan+","+otd.rowSpan);
//		countTd+=(otd.colSpan*otd.rowSpan);
//		}
for(var i=0;i<TabAll.rows.length;i++)
	for(var j=0;j<TabAll.rows[i].cells.length;j++)
			{
				var otd=TabAll.rows[i].cells[j];
				var ophcol=otd.phcol;
				var ophrow=otd.phrow;
				if(ophcol>fphcindex-1 && ophcol<=ophcindex && ophrow>fphrindex-1 && ophrow<=ophrindex)
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

		var totalWid="";
		for(var i=XmlDoc.documentElement.childNodes.length-1;i>=0;i--)
			{
			for(var j=XmlDoc.documentElement.childNodes[i].childNodes.length-1;j>=0;j--)
				{
				var onode=XmlDoc.documentElement.childNodes[i].childNodes[j];
				var otr=XmlDoc.documentElement.childNodes[i];
				var ophrow=onode.getAttribute("phrow");
				var ophcol=onode.getAttribute("phcol");
				if(ophrow>fphrow && ophrow<=sphrow && ophcol>=fphcol && ophcol<=sphcol)
				otr.removeChild(onode);
				if(ophrow==fphrow && ophcol>fphcol && ophcol<=sphcol)
					{
					if(onode.getAttribute("width")!=null)
						totalWid=totalWid+parseInt(onode.getAttribute("width"));
					otr.removeChild(onode);
					}

				}
			}
		fTd.setAttribute("rowspan",totalRow);
		fTd.setAttribute("colspan",totalCol);
		if(totalWid!="" && fTd.getAttribute("width")!=null)
			totalWid=parseInt(totalWid)+parseInt(fTd.getAttribute("width"));
		fTd.setAttribute("width",totalWid);

//		for(var k=scindex;k>fcindex;k--)
//				{
//				var otrnode=XmlDoc.documentElement.childNodes[frindex];
//				otrnode.removeChild(otrnode.childNodes[k]);
//				}
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
				otd.style.border="1 solid #eeeeee";
			}
	}
//拆分
this.Split=Split;
function Split()
	{
	if(firstTd==null || secondTd==null) return;
	if(XmlDoc==null) return;
	if(firstTd!=secondTd) return;
	var fcindex=firstTd.cellIndex;
	var frindex=firstTd.parentElement.rowIndex;
	var fTd=XmlDoc.documentElement.childNodes[frindex].childNodes[fcindex];
	var totalRow=firstTd.rowSpan;
	var totalCol=firstTd.colSpan;
	if(totalRow==1 && totalCol==1)
		return;
	for(var i=frindex+1;i<frindex+totalRow;i++)
		for(var j=0;j<totalCol;j++)
		{
		var newnode=XmlDoc.createNode("1","td","");
		var otr=XmlDoc.documentElement.childNodes[i];
		var otd=otr.insertBefore(newnode,otr.childNodes[fcindex]);
		otd.setAttribute("width",100);
		otd.text=" ";
		}
	for(var k=1;k<totalCol;k++)
		{
		var newnode=XmlDoc.createNode("1","td","");
		var otr=XmlDoc.documentElement.childNodes[frindex];
		var otd=otr.insertBefore(newnode,otr.childNodes[fcindex+1]);
		otd.text=" ";
		}
	fTd.setAttribute("rowspan",1);
	fTd.setAttribute("colspan",1);
	return XmlDoc.xml;
//alert(XmlDoc.xml);

	}
//IFRAME的ONMOUSEDOWN事件
this.FrameMouseDown=FrameMouseDown;
function FrameMouseDown()
	{
	var pobj=parent.event.srcElement;
	if(pobj.tagName=="SPAN" && parent.document.all("treetd").contains(pobj))
		{
		imgMouseDown=true;
		document.body.style.cursor="SizeAll.ani";
		parent.document.all("treetd").style.cursor="SizeAll.ani";
		var otext=pobj.innerText;
		var oid=pobj.id;
		curElement=new Object();
		if(otext!=null && otext!="")//获得树节点的属性
		curElement.text=otext;
		if(oid!=null && oid!="")
		curElement.id=oid;
		}
	}
////处理移动板块ONMOUSEDOWN事件
//IFRAME的ONMOUSEMOVE事件
this.FrameMouseMove=FrameMouseMove;
function FrameMouseMove()
	{
	if(TabAll==null) return;
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
		}
	}

//IFRAME的ONMOUSEUP事件
this.FrameMouseUp=FrameMouseUp;
function FrameMouseUp()
	{
	if(TabAll==null) return;
	if(imgMouseDown)
		{
		var obj=window.event.srcElement;
		if(obj.tagName!="TD") return;
		if(TabAll.contains(obj))
			{
			obj.innerHTML+="<div style='width:100%;border:1 solid #6600FF;height:200'><div style='background:#3333CC;height:20'>&nbsp;</div><div style='background:#00FFFF;height:100%'>"+curElement.text+"</div></div>";
			imgMouseDown=false;
			BackTdBorder();
			curElement=null;
			}
		else
			{
			imgMouseDown=false;
			BackTdBorder();
			curElement=null;
			}
		document.body.style.cursor="default";
		parent.document.all("treetd").style.cursor="default";
		}
	if(divMouseDown && currentDiv!=null)
		{
		var obj=window.event.srcElement;
		if(!TabAll.contains(obj)) return;
		if(obj.tagName=="TD")
			{
			obj.innerHTML+=currentDiv.outerHTML;
			divMouseDown=false;
			BackTdBorder();
			currentDiv=null;
			}
		else
			{
			divMouseDown=false;
			BackTdBorder();
			currentDiv=null;
			}
		}
	}


}
//板块类
function Bankuai()
{
var bkid="";	//板块ID
var bkName="";//板块名称
var bkType="";//板块类别
var isCanDel="true";//是否可以删除
var isCanMove="true";//是否可以移动
var skin=""; //板块SKIN
var height="200";//板块高度，默认200
var width="100%";//板块宽度，默认100％

//生成HTML
this.outToHtml=outToHtml;
function outToHtml()
	{
	var delstr="";
	var movestr="";
	if(isCanDel)
		delstr="<img src='images/del.gif'>";
	if(!isCanMove)
		movestr="<img src='images/suoding.gif'>";
	var str="<div style='width:"+width+";border:1 solid #6600FF;height:"+height+"'><div style='background:#3333CC;height:20'>"+bkName+movestr+delstr+"</div><div style='background:#00FFFF;height:100%'>"+bkType+"</div></div>";
	return str;
	}
//生成XML
this.outToXml=outToXml;
function outToXml()
	{
	var xmlstr='<block width="'+width+'" height="'+height+'" id="'+bkid+'" name="'+bkName+'" type="'+bkType+'" isCanDel="'+isCanDel+'" isCanMove="'+isCanMove+'" skin="'+skin+'" />';
	return xmlstr;
	}
//从XML节点转化为此类的实例
this.XmlToNode=XmlToNode;
function XmlToNode(xmlnode)
	{
	if(xmlnode==null) return null;
	var wid=xmlnode.getAttribute("width");
	if(wid!=null)
		this.width=wid;
	var hei=xmlnode.getAttribute("height");
	if(hei!=null)
		this.height=hei;
	var nid=xmlnode.getAttribute("id");
	if(nid!=null)
		this.bkid=nid;
	var oname=xmlnode.getAttribute("name");
	if(oname!=null)
		this.bkName=oname;
	var ntype=xmlnode.getAttribute("type");
	if(ntype!=null)
		this.bkType=ntype;
	var candel=xmlnode.getAttribute("isCanDel");
	if(candel!=null)
		this.isCanDel=candel;
	var canmove=xmlnode.getAttribute("isCanMove");
	if(canmove!=null)
		this.isCanMove=canmove;
	var oskin=xmlnode.getAttribute("skin");
	if(oskin!=null)
		this.skin=oskin;
	return this;
	}
}