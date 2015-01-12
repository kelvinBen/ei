/******************************************************************************************
*     DefMbTool ��1.0
*		company:			����Դ�������˾
*		 author:			������
*		 descript:			ģ�嶨�ƹ��ߣ�����XML��ʽ���ַ���
*	
*******************************************************************************************/

//DefMbTool ��
function DefMbTool()
{
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
//ѡ��ʱ��갴��ʱ��TD���ɿ�ʱ��TD
var firstTd=null;
var secondTd=null;
//��־�Ƿ��Ѿ��ϲ�
var isDel=false;
//��־�Ƿ��Ѿ�����������
var IsMouseDown=false;
var imgMouseDown=false;
var divMouseDown=false;

//��¼�϶���ͼƬ
var curElement=null;
//��¼ͼƬ��λ��
var imgleft="-10px";
var imgtop="-10px";
//��¼�Ѿ�����ؼ���TD
var currentTd=null;
//��¼ѡ����Ѿ����ڿؼ�
var currentObj=null;
//��¼ѡ����Ѿ����ڰ��DIV
var currentDiv=null;

//��¼���ı�
var formstr="";
//��¼SQL���
var sqlstr="";
//�����ı���Ϣ

//ȫ��XML����
var XmlDoc=null;
//�ܵı��
var TabAll=null;
//����������ڵĴ���
var curWin=top.ff;
//��ʼ������
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

//����XML
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
		
		alert("ȡ����ʧ��!");
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
//		alert("����XML����ʧ��!"+ex.description);
//		}

	}



//����ONMOUSEDOWN�¼�
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
	//�����ƶ����
	if(obj.tagName=="DIV" && TabAll.contains(obj))
			{
			divMouseDown=true;
			var divtop=obj.parentElement;
			currentDiv=divtop;
			}

	}
//����ONMOUSEMOVE�¼�
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
//����ONMOUSEOUT�¼�
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

//�ϲ���Ԫ����
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
//�ж��ܷ�ϲ�

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
// END �ж��ܷ�ϲ�

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
				otd.style.border="1 solid #eeeeee";
			}
	}
//���
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
//IFRAME��ONMOUSEDOWN�¼�
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
		if(otext!=null && otext!="")//������ڵ������
		curElement.text=otext;
		if(oid!=null && oid!="")
		curElement.id=oid;
		}
	}
////�����ƶ����ONMOUSEDOWN�¼�
//IFRAME��ONMOUSEMOVE�¼�
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

//IFRAME��ONMOUSEUP�¼�
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
//�����
function Bankuai()
{
var bkid="";	//���ID
var bkName="";//�������
var bkType="";//������
var isCanDel="true";//�Ƿ����ɾ��
var isCanMove="true";//�Ƿ�����ƶ�
var skin=""; //���SKIN
var height="200";//���߶ȣ�Ĭ��200
var width="100%";//����ȣ�Ĭ��100��

//����HTML
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
//����XML
this.outToXml=outToXml;
function outToXml()
	{
	var xmlstr='<block width="'+width+'" height="'+height+'" id="'+bkid+'" name="'+bkName+'" type="'+bkType+'" isCanDel="'+isCanDel+'" isCanMove="'+isCanMove+'" skin="'+skin+'" />';
	return xmlstr;
	}
//��XML�ڵ�ת��Ϊ�����ʵ��
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