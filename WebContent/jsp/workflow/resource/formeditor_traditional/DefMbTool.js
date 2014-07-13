/******************************************************************************************
*     DefFormTool ��1.0
*		 descript:			�����ƹ��ߣ�����XML��ʽ���ַ���
*	
*******************************************************************************************/

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
//��ʼ������
this.init=init;
function init()
	{
	TabAll=document.all("tab1");
	if(TabAll!=null)
		{
		var funmousedown=new Function(this.name+".TabMouseDown()");
		var funmousemove=new Function(this.name+".TabMouseMove()");
		var funmouseup=new Function(this.name+".TabMouseUp()");
		var funclick=new Function(this.name+".TabClick()");
		var fundbclick=new Function(this.name+".TabdbClick()");
		var funmouseout=new Function(this.name+".TabMouseOut()");
		document.all("pages").attachEvent("onmousedown",funmousedown);
		document.all("pages").attachEvent("onmousemove",funmousemove);
		document.all("pages").attachEvent("onmouseup",funmouseup);
		document.all("pages").attachEvent("onclick",funclick);
		document.all("pages").attachEvent("ondblclick",fundbclick);
		//document.all("pages").attachEvent("onmouseout",funmouseout);
		}
		firstTd=null;
		secondTd=null;
			//����condition.xml
	var xmlDoc2 = new ActiveXObject("Msxml.DOMDocument");
	xmlDoc2.async = false;
	xmlDoc2.preserveWhiteSpace = true;
	xmlDoc2.load("condition.xml");
	this.imagelisturl=xmlDoc2.getElementsByTagName("imagelisturl");
	if(this.imagelisturl.length!=0)
		this.imagelisturl=this.imagelisturl[0].text;
	
	}

//����XML
this.parseXml=parseXml;
function parseXml(xmlstr,otype)
	{
	if(xmlstr==null || xmlstr=="")
		xmlstr=XmlDoc.xml;
	if(otype!=1)
		{
		stock.putIn(xmlstr);
		}
	var detailStr="";
//	try
//		{
	XmlDoc.loadXML(xmlstr);
	if(XmlDoc.documentElement.tagName!="table")
	{
		
		alert("ȡ����ʧ��!");
		return;
	}
	var detailNode=XmlDoc.documentElement;
	var TabNode=detailNode.cloneNode(true);
	var trnode=TabNode.selectNodes("//tr");
	trnode.removeAll();
	var regstr=new RegExp("/>","g");
var tabStr=TabNode.xml.replace(regstr,">");
tabStr=tabStr.substring(0,tabStr.length-8);
var TrNodes=detailNode.selectNodes("//tr");
if(TabRows==null)
TabRows=TrNodes.length;
if(TabCols==null)
	{
	var colcount=0;
	for(var iii=0;iii<TrNodes[0].childNodes.length;iii++)
		{
		var ocol=TrNodes[0].childNodes[iii];
		var colspan=ocol.getAttribute("colspan");
		if(colspan==null || colspan=="")
			colspan=1;
		colcount+=parseInt(colspan);
		}
	TabCols=colcount;
	}
//alert(TabRows+","+TabCols);
	var ised=new Array();
	function viewinsert(a){
		for(t=0;t<ised.length;t++){
		
			if((phrow+"-"+a)==ised[t]){
			a++;
			}
		}
		return a;
	}
	if(TrNodes.length>0)
		{
		for(j=0;j<TrNodes.length;j++)
			{
			
			detailStr+="<tr>";
			var otr=TrNodes[j];
			if(otr.childNodes.length>0)
				{
				for(var k=0;k<otr.childNodes.length;k++)
					{
					otd=otr.childNodes[k];
					var tdbg=otd.getAttribute("bgcolor");
					var tdstyle=otd.getAttribute("style");
					detailStr+="<td";
					if(tdbg!=null && tdbg!="")
						detailStr+=" bgcolor=\""+tdbg+"\" ";
					if(tdstyle!=null && tdstyle!="")
						detailStr+=" style=\""+tdstyle+"\" ";
					var rowspan=otd.getAttribute("rowspan");
					var colspan=otd.getAttribute("colspan");
					if(rowspan==null)
					rowspan=1;
					if(colspan==null)
					colspan=1;
					
					var phrow=parseInt(otd.getAttribute("phrow"));
					//var phcol=otd.getAttribute("phcol");
					var phcol=null;
					if(phrow==null)
						{
						phrow=j+1;
						otd.setAttribute("phrow",j+1);
						}
					if(phcol==null)
						{
						phcol=k+1;
						phcol=viewinsert(phcol);
						otd.setAttribute("phcol",phcol);
						}
					for (c=0; c<Number(rowspan); c++) {
						for (d=0; d<Number(colspan); d++) {
							ised.push((Number(phrow)+c)+"-"+(phcol+d));
						}
					}
					detailStr+=' phrow="'+phrow+'" phcol="'+phcol+'" style="padding:3">';//+otd.text+"</td>";
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
					detailStr+=blockstr+"</td>";
					
					}
				}
			detailStr+="</tr>";
			}
			return(tabStr+detailStr+"</table>");

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
	var obj=event.srcElement;
	if(obj.tagName=="INPUT" || obj.tagName=="SELECT")
		{
		return;
		}
	else
		{
		while(obj.tagName!="TD"&& TabAll.contains(obj))
			obj=obj.parentElement;
		}
	if(obj.tagName=="TD")
	TabAll=obj.offsetParent;
	if(TabAll==null) return;
	BackTdBg();
	if(obj.tagName=="TD")
		{
		firstTd=obj;
		//obj.style.backgroundColor="#9999FF";
		IsMouseDown=true;
		}
	//�����ƶ����
	if(obj.tagName=="DIV" && TabAll.contains(obj) )
			{
			
			var divtop=obj.parentElement;
			var otd=divtop.parentElement;
			if(obj.type=="bktou")
				{
				if(divtop.isCanMove=="false")
				return;
				divMouseDown=true;
				currentDiv=divtop;
				}
			else
				{
				if(otd.tagName!="TD") return;
				firstTd=otd;
				if(otd.style.backgroundColor==null||otd.style.backgroundColor=="" || otd.style.backgroundColor=="#ffffff")
				otd.style.backgroundColor="#9999FF";
				IsMouseDown=true;
				}
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
		if(obj.sumtype=="col")
		showModalDialog("sumcol.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		else if(obj.sumtype=="row")
		showModalDialog("sumrow.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		else
		showModalDialog("TEXT_P.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		}
if(obj.tagName=="TEXTAREA" && obj.type!="pl")
		{
		this.CurControl=obj;
	showModalDialog("TEXT_P.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
		}
if(obj.tagName=="SELECT")
		{
	this.CurControl=obj;
	showModalDialog("TEXT_P.htm",window,"dialogWidth:450px;dialogHeight:500px;status:no");
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
	if(TabAll==null) return;
	var obj=event.srcElement;

	//ɾ��
	if(obj.tagName=="IMG" && obj.type=="del")
		{
			var divtop=obj.parentElement.parentElement;
			var otd=divtop.parentElement;
			var fcindex=otd.cellIndex;
			var frindex=otd.parentElement.rowIndex;
			var objindex=0;
			for(var i=0;i<otd.children.length;i++)
				{
				if(otd.children[i]==divtop)
					{
					objindex=i;
					break;
					}
				}
			var TrNodes=XmlDoc.documentElement.selectNodes("//tr");
			var oxmlnode=TrNodes[frindex].childNodes[fcindex];
			var oldc=oxmlnode.childNodes[objindex];
			oxmlnode.removeChild(oldc);//ɾ��
			//	alert(XmlDoc.xml);
			this.reDraw();
			return;
		}
	//ɾ��END
	//����ѡ�а��
	if(obj.tagName=="DIV" && TabAll.contains(obj) && obj.type=="bktou")
			{
			var divtop=obj.parentElement;
			var otd=divtop.parentElement;
			var fcindex=otd.cellIndex;
			var frindex=otd.parentElement.rowIndex;
			var objindex=0;
			for(var i=0;i<otd.children.length;i++)
				{
				if(otd.children[i]==divtop)
					{
					objindex=i;
					break;
					}
				}
			var TrNodes=XmlDoc.documentElement.selectNodes("//tr");
			var oxmlnode=TrNodes[frindex].childNodes[fcindex];
			var oldc=oxmlnode.childNodes[objindex];
			if(oldc!=null)
				CurXmlNode=oldc;
			//alert(CurXmlNode.getAttribute("type"));
			}

	}

//����ONMOUSEMOVE�¼�
this.TabMouseMove=TabMouseMove;
function TabMouseMove()
	{
	if(IsMouseDown==true)
	
	//document.selection.empty();
	var obj=event.srcElement;
	if(obj==null) return;
	while(obj.tagName!="TD"&& TabAll.contains(obj))
		obj=obj.parentElement;
	if(obj.tagName=="INPUT" || obj.tagName=="SELECT")
		{
		obj=obj.parentElement;
		}
	if(obj!=null && obj.tagName=="TD")
	TabAll=obj.offsetParent;
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
							if(otd.style.backgroundColor==null||otd.style.backgroundColor=="" || otd.style.backgroundColor=="#ffffff")
							otd.style.backgroundColor="#9999FF";
							secondTd=otd;
						}
					}
				}
	}
//����ONMOUSEOUT�¼�
this.TabMouseUp=TabMouseUp;
function TabMouseUp()
	{
	
	var obj=event.srcElement;
	if(firstTd==null || IsMouseDown==false) return;
	while(obj.tagName!="TD"&& TabAll.contains(obj))
		obj=obj.parentElement;
	if(obj.tagName=="INPUT" || obj.tagName=="SELECT")
		{
		obj=obj.parentElement;
		}
	if(obj.tagName=="DIV") obj=obj.parentElement.parentElement;
	if(obj.tagName=="TD")
		{
		secondTd=obj;
		if(firstTd!=secondTd) document.selection.empty();
		IsMouseDown=false;
		}
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
		//var fTd=XmlDoc.documentElement.selectNodes("//tr")[frindex].childNodes[fcindex];
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
							arrChild[arrChild.length]=onode.children[kk];
							}
					
					otr.deleteCell(j);
					}
				if(ophrow==fphrow && ophcol>fphcol && ophcol<=sphcol)
					{
					
						for(var kk=0;kk<onode.children.length;kk++)
							{
							arrChild[arrChild.length]=onode.children[kk];
							}
					
					otr.deleteCell(j);
					}

				}
			}
		if(arrChild.length>0)
		{
		for(var jj=0;jj<arrChild.length;jj++)
			{
			firstTd.appendChild(arrChild[jj]);
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
				if(otd.style.backgroundColor.toUpperCase()=="#9999FF")
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
	var pobj=parent.event.srcElement;
	if(pobj.tagName=="SPAN" && parent.document.all("treetd").contains(pobj))
		{
		imgMouseDown=true;
		document.body.style.cursor="SizeAll.ani";
		parent.document.all("treetd").style.cursor="SizeAll.ani";
		var otext=pobj.innerText;
		var oid=pobj.id;
		curElement=new Bankuai();
		if(otext!=null && otext!="")//������ڵ������
		curElement.bkType=otext;
		if(oid!=null && oid!="")
		curElement.bkid=oid;
		}
	}
////�����ƶ����ONMOUSEDOWN�¼�
//IFRAME��ONMOUSEMOVE�¼�
this.FrameMouseMove=FrameMouseMove;
function FrameMouseMove()
	{
	if(TabAll==null) return;
	var odiv=window.event.srcElement;
	if(odiv.tagName=="DIV" && odiv.type=="bktou")
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
		}
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
	if(TabAll==null) return;
	var obj=window.event.srcElement;
	if(!TabAll.contains(obj))
		{
			imgMouseDown=false;
			BackTdBorder();
			curElement=null;
			IsMouseDown=false;
			return;
		}
	if(imgMouseDown && curElement!=null)
		{
			if(obj.tagName!="TD") return;
			var fcindex=obj.cellIndex;
			var frindex=obj.parentElement.rowIndex;
			var oxmlnode=XmlDoc.documentElement.selectNodes("//tr")[frindex].childNodes[fcindex];
			var newnode=curElement.outToXml(XmlDoc);
			//alert(newnode.xml);
			if(newnode==null)
				{
				imgMouseDown=false;
				BackTdBorder();
				curElement=null;
				return;
				}
			oxmlnode.appendChild(newnode);
			//obj.innerHTML+="<div style='width:100%;border:1 solid #6600FF;height:200'><div style='background:#3333CC;height:20'>&nbsp;</div><div style='background:#00FFFF;height:100%'>"+curElement.text+"</div></div>";
			var xmlstr=XmlDoc.xml;
			var str="";
			if(xmlstr!="" && xmlstr!=null)
			{
			str=parseXml(xmlstr);
			document.all("page1").innerHTML=str;
			this.init();
			}
			imgMouseDown=false;
			BackTdBorder();
			curElement=null;
	
		document.body.style.cursor="default";
		parent.document.all("treetd").style.cursor="default";
		}
//�����ƶ����
	if(divMouseDown && currentDiv!=null)
		{
		var objmove=window.event.srcElement;
		if(objmove.tagName=="TD")
			{
			var firsttd=currentDiv.parentElement;
			var fcindex=firsttd.cellIndex;
			var frindex=firsttd.parentElement.rowIndex;
			var scindex=objmove.cellIndex;
			var srindex=objmove.parentElement.rowIndex;
			var objindex=0;
			for(var i=0;i<firsttd.children.length;i++)
				{
				if(firsttd.children[i]==currentDiv)
					{
					objindex=i;
					break;
					}
				}
			var oxmlnode=XmlDoc.documentElement.selectNodes("//tr")[frindex].childNodes[fcindex];
			var oldc=oxmlnode.removeChild(oxmlnode.childNodes[objindex]);
			var nxmlnode=XmlDoc.documentElement.selectNodes("//tr")[srindex].childNodes[scindex];
			nxmlnode.appendChild(oldc);
			//alert(XmlDoc.xml);
			var xmlstr=XmlDoc.xml;
			var str="";
			if(xmlstr!="" && xmlstr!=null)
			{
			str=parseXml(xmlstr);
			//alert(str);
			document.all("page1").innerHTML=str;
			this.init();
			}
			//objmove.innerHTML+=currentDiv.outerHTML;
			divMouseDown=false;
			//BackTdBorder();
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
	if(TabAll==null) return;
	//Ϊ��ǰtabҳ��ӱ���
	var tabtab=document.all("tabpage");
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

//tabҳ��
var tabStr='<tabs default-select-index="1" off-style="taboffcss" on-style="taboncss">';
var formtitlestr="";
if(tabtab!=null)
		{
		for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
		{
			var otd=tabtab.rows[0].cells[jj];
			var otabtitle=otd.tabtitlexml;
			var osubtabtitle=otd.subtabtitlexml;
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
			
		tabStr+='<tab index="'+(otd.index)+'" title="'+otd.innerText+'"  form-title="'+otabtitle+'" form-subtitle="'+osubtabtitle+'"/>';
//			if(otd.className=="taboncss")
//			{
//			obody=document.all("page"+(jj+1));
//			}
		}
tabStr+='</tabs>';
		}
var SubFormstr=getFormxmlByType("sub");
var FieldStr=getFormxmlByType();
		var formname=document.all("pages").formname;
		var formnamestr=document.all("pages").formid;
		
		if(formname==null || formname=="")
		formname="${pages}";
		if(formname!="${pages}")
		{
		if(charType=="1")
			formname=formname.toUpperCase();
		else
			formname=formname.toLowerCase();

		}
		
	var ostr= '<forms><form default-entity-name="'+formname+'" name="'+formnamestr+'" title="'+formtitlestr+'"  type="single">'+tabStr+SubFormstr+FieldStr+extendFieldXml+'</form></forms>';
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
				FieldStr+='<table id="'+otable.id+'" align="center" type="'+otable.type+'" cellspacing="0" border="'+borderwidth+'" bgcolor="'+otable.bgColor+'" style="border-left:'+otable.style.borderLeft+';border-right:'+otable.style.borderRight+';border-top:'+otable.style.borderTop+';border-bottom:'+otable.style.borderBottom+';" width="'+otable.width+'" '+subtabstr+'>';
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
								FieldStr+='<td colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"  '+css+wrapstr+' width="'+otd.offsetWidth+'" style="border-color:'+otd.style.borderColor+';background-color:'+otd.style.backgroundColor+';height:'+otd.offsetHeight+';">${'+fildnamstr+'}</td>';
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


}


