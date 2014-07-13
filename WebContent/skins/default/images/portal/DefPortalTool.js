/******************************************************************************************
*     DefPortalTool 类1.0
*		company:			
*		 descript:			门户定制工具，生成XML格式的字符串
*	
*******************************************************************************************/

//DefFormTool 类
function DefPortalTool(name)
{
//外部变量
this.name=name;
this.CurControl=null;

//当前操作的XML节点
this.CurXmlNode=null;
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
this.CursorImg="SizeAll.ani";
this.imgPath="";
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
this.firstTd=null;
this.secondTd=null;
//标志是否已经合并
this.isDel=false;
//标志是否已经按下鼠标左键
this.IsMouseDown=false;
this.imgMouseDown=false;
this.divMouseDown=false;

//记录拖动的图片
this.curElement=null;
//记录图片的位置
this.imgleft="-10px";
this.imgtop="-10px";
//记录已经拖入控件的TD
this.currentTd=null;
//记录选择的已经存在控件
this.currentObj=null;
//记录选择的已经存在板块DIV
this.currentDiv=null;

//记录最后的表单
this.formstr="";
//记录SQL语句
this.sqlstr="";
//产生的表单信息

//全局XML对象
this.XmlDoc=new ActiveXObject("MSXML.DOMDocument");
//总的表格
this.TabAll=null;
//操作表格所在的窗口
this.curWin=document.frames.ff;
//表格列数，行数
this.TabRows=null;
this.TabCols=null;
//外部配置xml的路径
this.XmlPath="";
}
//初始化函数
DefPortalTool.prototype.init=function()
	{
	this.TabAll=document.all("tab1");
	if(this.TabAll!=null)
		{
		var funmousedown=new Function(this.name+".TabMouseDown()");
		var funmousemove=new Function(this.name+".TabMouseMove()");
		var funmouseup=new Function(this.name+".TabMouseUp()");
		var funclick=new Function(this.name+".TabClick()");
		var fundbclick=new Function(this.name+".TabdbClick()");
		var funmouseout=new Function(this.name+".TabMouseOut()");
		document.body.attachEvent("onmousedown",funmousedown);
		document.body.attachEvent("onmousemove",funmousemove);
		document.body.attachEvent("onmouseup",funmouseup);
		document.body.attachEvent("onclick",funclick);
		document.body.attachEvent("ondblclick",fundbclick);
		//document.body.attachEvent("onmouseout",funmouseout);
		}
		this.firstTd=null;
		this.secondTd=null;
		
	}
//表格的ONMOUSEDOWN事件
DefPortalTool.prototype.TabMouseDown=function()
	{
	var obj=event.srcElement;
	if(obj.tagName=="TD")
	this.TabAll=obj.offsetParent;
	if(this.TabAll==null) return;
	this.BackTdBg();
	if(obj.tagName=="TD")
		{
		this.firstTd=obj;
		//obj.style.backgroundColor="#9999FF";
		this.IsMouseDown=true;
		}
	//处理移动板块
	if(obj.tagName=="DIV" && this.TabAll.contains(obj) )
			{
			
			var divtop=obj.parentElement;
			var otd=divtop.parentElement;
			if(obj.type=="bktou")
				{
				if(divtop.isCanMove=="false")
				return;
				this.divMouseDown=true;
				this.currentDiv=divtop;
				}
			else
				{
				if(otd.tagName!="TD") return;
				this.firstTd=otd;
				otd.style.backgroundColor="#9999FF";
				this.IsMouseDown=true;
				}
			}

	}

//ondbclick事件
DefPortalTool.prototype.TabdbClick=function()
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
//表格的ONMOUSEOUT事件,处理选中板块
DefPortalTool.prototype.TabMouseOut=function()
	{
	this.IsMouseDown=false;
	}
//表格的ONCLICK事件,处理选中板块
DefPortalTool.prototype.TabClick=function()
	{
	if(this.TabAll==null) return;
	var obj=event.srcElement;

	//删除
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
			oxmlnode.removeChild(oldc);//删除
			//	alert(XmlDoc.xml);
		}
	//删除END
	//处理选中板块
	if(obj.tagName=="DIV" && this.TabAll.contains(obj) && obj.type=="bktou")
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

//表格的ONMOUSEMOVE事件
DefPortalTool.prototype.TabMouseMove=function()
	{
	if(this.IsMouseDown==true)
	
	//document.selection.empty();
	var obj=event.srcElement;
	if(obj!=null && obj.tagName=="TD")
	this.TabAll=obj.offsetParent;
	if(this.TabAll==null) return;
	if(this.firstTd==null || this.IsMouseDown==false) return;
		this.BackTdBg();

	if(obj==this.firstTd)
		{
		this.secondTd=otd;
		return;
		}
	if(obj.tagName=="DIV") obj=obj.parentElement.parentElement;
	if(obj.tagName=="TD")
		{
		fphcindex=this.firstTd.phcol;
		fphrindex=this.firstTd.phrow;
		ophcindex=obj.phcol;
		ophrindex=obj.phrow;
		if(obj.rowSpan!=1 || obj.colSpan!=1)
			{
			ophrindex=parseInt(ophrindex)+obj.rowSpan-1;
			ophcindex=parseInt(ophcindex)+obj.colSpan-1;
			}
		//alert(ophrindex+","+ophcindex);
		for(var i=0;i<this.TabAll.rows.length;i++)
			for(var j=0;j<this.TabAll.rows[i].cells.length;j++)
					{
						var otd=this.TabAll.rows[i].cells[j];
						ophcol=otd.phcol;
						ophrow=otd.phrow;
						if(ophcol>fphcindex-1 && ophcol<=ophcindex && ophrow>fphrindex-1 && ophrow<=ophrindex)
						{
							otd.style.backgroundColor="#9999FF";
							this.secondTd=otd;
						}
					}
				}
	}
//表格的ONMOUSEOUT事件
DefPortalTool.prototype.TabMouseUp=function()
	{
	
	var obj=event.srcElement;
	if(this.firstTd==null || this.IsMouseDown==false) return;
	if(obj.tagName=="DIV") obj=obj.parentElement.parentElement;
	if(obj.tagName=="TD")
		{
		this.secondTd=obj;
		if(this.firstTd!=this.secondTd) document.selection.empty();;
		this.IsMouseDown=false;
		}
	}

//合并单元格中
DefPortalTool.prototype.Merge=function()
	{	
	if(this.TabAll==null || this.TabAll.type=="sub") return;
	if(this.firstTd==null || this.secondTd==null) return;
		var fcindex=this.firstTd.cellIndex;
		var frindex=this.firstTd.parentElement.rowIndex;
		var scindex=this.secondTd.cellIndex;
		var srindex=this.secondTd.parentElement.rowIndex;
		//var fTd=XmlDoc.documentElement.selectNodes("//tr")[frindex].childNodes[fcindex];
		var totalRow=parseInt(this.secondTd.phrow)-parseInt(this.firstTd.phrow)+this.secondTd.rowSpan;
		var totalCol=parseInt(this.secondTd.phcol)-parseInt(this.firstTd.phcol)+this.secondTd.colSpan;
		//alert(totalRow+","+totalCol+","+fcindex+","+scindex+","+frindex+","+srindex);
		var fphrow=this.firstTd.phrow;
		var fphcol=this.firstTd.phcol;
		var sphrow=parseInt(this.secondTd.phrow)+this.secondTd.rowSpan-1;
		var sphcol=parseInt(this.secondTd.phcol)+this.secondTd.colSpan-1;
		var countTd=0;
		fphcindex=this.firstTd.phcol;
		fphrindex=this.firstTd.phrow;
//判断能否合并

for(var i=0;i<this.TabAll.rows.length;i++)
	for(var j=0;j<this.TabAll.rows[i].cells.length;j++)
			{
				var otd=this.TabAll.rows[i].cells[j];
				var ophcol=otd.phcol;
				var ophrow=otd.phrow;
				if(ophcol>fphcindex-1 && ophcol<=sphcol && ophrow>fphrindex-1 && ophrow<=sphrow)
					countTd+=(otd.colSpan*otd.rowSpan);
			}

if(countTd!=totalRow*totalCol)
		{
		this.BackTdBg();
		this.firstTd=null;
		this.secondTd=null;
		return;
		}
// END 判断能否合并

		var arrChild=new Array();
		for(var i=this.TabAll.rows.length-1;i>=0;i--)
			{
			for(var j=this.TabAll.rows[i].cells.length-1;j>=0;j--)
				{
				var onode=this.TabAll.rows[i].cells[j];
				var otr=this.TabAll.rows[i];
				var ophrow=onode.getAttribute("phrow");
				var ophcol=onode.getAttribute("phcol");
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
			this.firstTd.appendChild(arrChild[jj]);
			}
		}
		//this.firstTd.setAttribute("rowspan",totalRow);
		//this.firstTd.setAttribute("colspan",totalCol);
this.firstTd.rowSpan=totalRow;
this.firstTd.colSpan=totalCol;
//

	

	}
//判断是否可以合并
DefPortalTool.prototype.IsCanMerge=function()
	{
	if(this.firstTd==null || this.secondTd==null) return;
	if(this.firstTd==this.secondTd) return;
	if(XmlDoc==null) return;
	}

//使表格单元格的背景色恢复
DefPortalTool.prototype.BackTdBg=function()
	{
	if(this.TabAll==null) return;
	for(var i=0;i<this.TabAll.rows.length;i++)
	for(var j=0;j<this.TabAll.rows[i].cells.length;j++)
			{
				var otd=this.TabAll.rows[i].cells[j];
				otd.style.backgroundColor="";
			}
	}
//取消边框颜色
DefPortalTool.prototype.BackTdBorder=function()
	{
	if(this.TabAll==null) return;
	for(var i=0;i<this.TabAll.rows.length;i++)
	for(var j=0;j<this.TabAll.rows[i].cells.length;j++)
			{
				var otd=this.TabAll.rows[i].cells[j];
				otd.style.borderColor="";
			}
	}
//拆分
DefPortalTool.prototype.Split=function()
	{
	if(this.TabAll==null || this.TabAll.type=="sub") return;
	if(this.firstTd==null || this.secondTd==null) return;
	if(this.firstTd!=this.secondTd) return;
	var fcindex=this.firstTd.cellIndex;
	var frindex=this.firstTd.parentElement.rowIndex;
	//alert(fcindex+" "+frindex);
	var totalRow=this.firstTd.rowSpan;
	var totalCol=this.firstTd.colSpan;
	if(totalRow==1 && totalCol==1)
		return;
for(var i=frindex+1;i<frindex+totalRow;i++)
		for(var j=0;j<totalCol;j++)
		{
		var newnode=this.TabAll.rows[i].insertCell(fcindex+j);
		var otr=this.TabAll.rows[i];
		newnode.setAttribute("phrow",parseInt(this.firstTd.getAttribute("phrow"))+i-frindex);
		newnode.setAttribute("phcol",parseInt(this.firstTd.getAttribute("phcol"))+j);
		if(this.TabAll.tdbordercolor!=null && this.TabAll.tdbordercolor!="")
		newnode.style.borderColor=this.TabAll.tdbordercolor;
		//otd.setAttribute("width",100);
		}
	for(var k=1;k<totalCol;k++)
		{
		var newnode=this.TabAll.rows[frindex].insertCell(fcindex+k);
		var otr=this.TabAll.rows[frindex];
		newnode.setAttribute("phrow",this.firstTd.getAttribute("phrow"));
		newnode.setAttribute("phcol",parseInt(this.firstTd.getAttribute("phcol"))+k);
		if(this.TabAll.tdbordercolor!=null && this.TabAll.tdbordercolor!="")
		newnode.style.borderColor=this.TabAll.tdbordercolor;
		}
	//this.firstTd.setAttribute("rowspan",1);
	//this.firstTd.setAttribute("colspan",1);
	this.firstTd.rowSpan=1;
	this.firstTd.colSpan=1;

	}
//判断当前行单元格数量是否完整
DefPortalTool.prototype.checkRowCount=function (otr)
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
DefPortalTool.prototype.getCompleteRow=function(otr)
	{
if(otr==null || otr.tagName!="TR")
	return;
var cellCount=this.checkRowCount(this.TabAll.rows[0]);
for(var i=otr.rowIndex-1;i>=0;i--)
		{
		var ntr=this.TabAll.rows[i];
		if(this.checkRowCount(ntr)==cellCount)
			{
			return ntr;
			}
		}
return null;
	}
	//得到单元格数量不完整的当前行上面相应phcol单元格
DefPortalTool.prototype.getColByPh=function (otr,phcol)
	{
if(otr==null || otr.tagName!="TR")
	return;
for(var i=otr.rowIndex-1;i>=0;i--)
		{
		var ntr=this.TabAll.rows[i];
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
DefPortalTool.prototype.changeRowPhRow=function (trindex,val)
	{
		if(this.TabAll==null)
		return;
	for(var i=trindex+1;i<this.TabAll.rows.length;i++)
		{
		var otr=this.TabAll.rows[i];
		for(var j=0;j<otr.cells.length;j++)
			{
			var otd=otr.cells[j];
			otd.phrow=parseInt(otd.phrow)+val;
			}
		}
	}
//改变列的phcol
DefPortalTool.prototype.changeColPhCol=function (row,col,val)
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
DefPortalTool.prototype.addRow=function ()
	{
if(this.TabAll==null || this.TabAll.type=="sub") return;
if(this.firstTd==null) return;
	var otr=this.firstTd.parentElement;
	var cellCount=this.checkRowCount(this.TabAll.rows[0]);
	//alert(cellCount+","+checkRowCount(otr));
	if(this.checkRowCount(otr)!=cellCount)
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
					var fcol=this.getColByPh(otr,k);
					//alert(fcol);
					if(fcol!=null && fcol.rowSpan>1)
						fcol.rowSpan+=1;
					}
				}
			
				//ftr=getCompleteRow(otr);
		}
				var newTr=this.TabAll.insertRow(otr.rowIndex+1);
				for(var i=0;i<otr.cells.length;i++)
					{
					var otd=otr.cells[i];
					if(otd.rowSpan>1)
						otd.rowSpan+=1;
					else
						{
						var newtd=newTr.insertCell();
						newtd.colSpan=otd.colSpan;
						newtd.innerHTML="";
						newtd.phrow=otr.rowIndex+2;
						newtd.phcol=otd.phcol;
						if(this.TabAll.tdbordercolor!=null && this.TabAll.tdbordercolor!="")
						newtd.style.borderColor=this.TabAll.tdbordercolor;
						}


					}
			
this.changeRowPhRow(otr.rowIndex+1,1);
	}
//
//删除一行
DefPortalTool.prototype.delRow=function ()
{
	if(this.TabAll==null || this.TabAll.type=="sub") return;
	if(this.firstTd==null) return;
	
	if(this.TabAll.rows.length==1)
	{
		alert("最后一行不能删除！");
		return;
	}
		

	if(!confirm("此行中包含的内容都将被删除，您确定吗？"))
		{
		return;
		}
	var otr=this.firstTd.parentElement;
	var cellCount=this.checkRowCount(this.TabAll.rows[0]);
	if(this.checkRowCount(otr)!=cellCount)
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
					var fcol=this.getColByPh(otr,k);
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
this.changeRowPhRow(oldtrindex,-1);
//重新排列下面行的phrow
this.firstTd=null;
}
//增加一列
DefPortalTool.prototype.addCol=function ()
	{
if(this.TabAll==null)
		return;
if(this.firstTd==null) return;
	var otr=this.firstTd.parentElement;
	//var cellCount=checkRowCount(this.TabAll.rows[0]);
	//alert(cellCount+","+checkRowCount(otr));
	//if(checkRowCount(otr)!=cellCount)
	//	{
			var oldphcol=this.firstTd.phcol;
			for(var k=0;k<this.TabAll.rows.length;k++)
				{
				var hascol=null;
				var ntr=this.TabAll.rows[k];
				var fcol=this.getColByPh(ntr,oldphcol);
				//alert(this.firstTd.outerHTML);
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
										this.changeColPhCol(ntr,otd.previousSibling.cellIndex,1);
										ntd.phcol=parseInt(oldcol)+2;
										ntd.phrow=ntr.rowIndex+1;
										if(this.TabAll.tdbordercolor!=null && this.TabAll.tdbordercolor!="")
										ntd.style.borderColor=this.TabAll.tdbordercolor;
										}
									else
										{
										this.changeColPhCol(ntr,otd.previousSibling.cellIndex,1);
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
										this.changeColPhCol(ntr,0,1);
										//alert(oldphcol);
										ntd.phcol=2;
										ntd.phrow=ntr.rowIndex+1;
										if(this.TabAll.tdbordercolor!=null && this.TabAll.tdbordercolor!="")
										ntd.style.borderColor=this.TabAll.tdbordercolor;
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
						this.changeColPhCol(ntr,hascol.cellIndex,1);
						}
					else
						{
						//var newtdstr="<td phrow='"+(ntr.rowIndex+1)+"' phcol='"+(this.firstTd.cellIndex+1)+"'>1</td>";
						//hascol.insertAdjacentHTML("afterEnd",newtdstr);
						var ntd=ntr.insertCell(hascol.cellIndex+1);
						this.changeColPhCol(ntr,hascol.cellIndex+1,1);

						ntd.phrow=ntr.rowIndex+1;
						if(this.TabAll.tdbordercolor!=null && this.TabAll.tdbordercolor!="")
						ntd.style.borderColor=this.TabAll.tdbordercolor;
						//alert(this.firstTd.phcol+","+this.firstTd.colSpan);
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
				
	}
//删除一列
DefPortalTool.prototype.delCol=function ()
{
	if(this.TabAll==null)
		return;
	if(this.firstTd==null) return;
	var flag=1;//1可以删除，0不可以删除
	for(var k=0;k<this.TabAll.rows.length;k++)
		{
			if(this.TabAll.rows[k].cells.length==1)
			{
				flag=0;
				break;
			}
		}
	if(flag==0)
	{
		alert("最后一列不能被删除！");
		return;
	}
	if(!confirm("此列中包含的内容都将被删除，您确定吗？"))
		{
		return;
		}
	var otr=this.firstTd.parentElement;
	//var cellCount=checkRowCount(this.TabAll.rows[0]);
	//alert(cellCount+","+checkRowCount(otr));
	//if(checkRowCount(otr)!=cellCount)
	//	{
			var oldphcol=this.firstTd.phcol;
			for(var k=0;k<this.TabAll.rows.length;k++)
				{
				var hascol=null;
				var ntr=this.TabAll.rows[k];
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
								this.changeColPhCol(ntr,otd.cellIndex-1,-1);
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
						this.changeColPhCol(ntr,hascol.cellIndex,-1);
						}
					else
						{
						//var newtdstr="<td phrow='"+(ntr.rowIndex+1)+"' phcol='"+(this.firstTd.cellIndex+1)+"'>1</td>";
						//hascol.insertAdjacentHTML("afterEnd",newtdstr);
						//var ntd=ntr.insertCell(hascol.cellIndex+1);
						
						this.changeColPhCol(ntr,hascol.cellIndex,-1);
						hascol.removeNode(true);
						/*ntd.phrow=ntr.rowIndex+1;
						//alert(this.firstTd.phcol+","+this.firstTd.colSpan);
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
					
					}
				}
			
				//ftr=getCompleteRow(otr);
		//}
				


this.firstTd=null;

}
//IFRAME的ONMOUSEDOWN事件
DefPortalTool.prototype.FrameMouseDown=function ()
	{
	var pobj=parent.event.srcElement;
	if(pobj.tagName=="SPAN" && parent.document.all("treetd").contains(pobj))
		{
		this.imgMouseDown=true;
		document.body.style.cursor="hand";
		parent.document.all("treetd").style.cursor="hand";
		var otext=pobj.innerText;
		var oid=pobj.id;
		var ourl=pobj.url;
		this.curElement=new Object();
		if(otext!=null && otext!="")//获得树节点的属性
		this.curElement.bkType=otext;
		if(oid!=null && oid!="")
		this.curElement.bkid=oid;
		if(ourl!=null && ourl!="")
		this.curElement.url=ourl;
		}
	}
////处理移动板块ONMOUSEDOWN事件
//IFRAME的ONMOUSEMOVE事件
DefPortalTool.prototype.FrameMouseMove=function ()
	{
	if(this.TabAll==null) return;
	var odiv=window.event.srcElement;
	if(odiv.tagName=="DIV")
		{
		var topdiv=odiv.parentElement;
		var otd=topdiv.parentElement;
		if(otd.tagName!="TD") return;
		if(topdiv.isCanMove=="true")
			odiv.style.cursor="move";
		}

	if(this.imgMouseDown)
		{
		var obj=window.event.srcElement;
		if(obj.tagName!="TD") return;
		if(!this.TabAll.contains(obj)) return;
		this.BackTdBorder();
		obj.style.border="1 solid red";
		}
	if(this.divMouseDown)
		{
		var obj=window.event.srcElement;
		if(obj.tagName!="TD") return;
		if(!this.TabAll.contains(obj)) return;
		this.BackTdBorder();
		obj.style.border="1 solid red";
		}
	}

//IFRAME的ONMOUSEUP事件
DefPortalTool.prototype.FrameMouseUp=function ()
	{
	if(this.TabAll==null) return;
	var obj=window.event.srcElement;
	if(!this.TabAll.contains(obj))
		{
			this.imgMouseDown=false;
			this.BackTdBorder();
			this.curElement=null;
			this.IsMouseDown=false;
			return;
		}	
		document.body.style.cursor="default";
		parent.document.all("treetd").style.cursor="default";
//处理移动板块
	if(this.imgMouseDown && this.curElement!=null)
		{
		if(obj.tagName=="DIV" && obj.type!="bktou")
				obj=obj.parentElement.parentElement;
			if(obj.tagName!="TD") return;
			var str='<div bkType="'+this.curElement.bkType+'" url="'+this.curElement.url+'" bkId="'+this.curElement.bdid+'" style="height:100%;border:2 solid #000000;background-color:#cccccc;"><div class=divcls align="center" unselectable=on  style="background-color:#424DA5;color:#ffffff;text-align:center;">'+this.curElement.bkType+'</div></div>';
			//<span   unselectable=on  style="height:10px;width:0px;background-color:menu;margin-left:50px;border:1 solid #000000;color:#000000;text-align:center;"  onclick="this.parentElement.parentElement.removeNode(true);">??</span>
			obj.innerHTML=str;
			this.imgMouseDown=false;
			this.BackTdBorder();
			this.curElement=null;
			this.IsMouseDown=false;
			return;
		
		}
	}

//遍历表格，生成HTML
DefPortalTool.prototype.getFormTemplate=function ()
	{
if(this.TabAll==null) return;
var FieldStr='';
				FieldStr+='<table  cellspacing="0" border="0" cellpadding=5  width="100%" height="100%">';

			for(var i=0;i<this.TabAll.rows.length;i++)
					{
					FieldStr+='<tr>';
					for(var j=0;j<this.TabAll.rows[i].cells.length;j++)
					{
						var otd=this.TabAll.rows[i].cells[j];
						if(otd==null) continue;
						var content=otd.children[0];
						if(content!=null && (content.tagName=="DIV") )
						{
						var urls=content.getAttribute("url");
						var arrurl=urls.split(';');
						var iframeurl='';
						var linkurl='';
						if(arrurl.length>1)
						{
							iframeurl=arrurl[0];
							linkurl='href="'+arrurl[1]+'"';
						}
						else
						iframeurl=urls;
							FieldStr+='<td colspan="'+otd.colSpan+'"  rowspan="'+otd.rowSpan+'"   valign=top><table width="100%" border=0  height="100%" cellpadding=0 cellspacing=0 class="portal_title_tab" ><tr  height="23" class="portaltd1bgimg" ><td width=40 nowrap class="portaltd2bgimg">&nbsp;</td><td width="99%" class="portal_title_td"><a '+linkurl+' >'+content.getAttribute("bkType")+'</a></td></tr><tr height="99%"><td colspan=2><iframe src="'+iframeurl+'" width="100%" height="100%" scrolling=auto frameborder=0></iframe></td></tr></table></td>';
						}
						
					}
					FieldStr+='</tr>';
					
					}
				FieldStr+='</table>';

			
	return(FieldStr);
	//alert(FieldStr);

}

//遍历body，生成HTML
DefPortalTool.prototype.getFormHtml=function ()
	{
	var str= document.body.innerHTML;
	return str;
	}
//set body的HTML
DefPortalTool.prototype.setFormHtml=function (str)
	{
	document.body.innerHTML=str;
	}
