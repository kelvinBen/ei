/******************************************************************************************
*                      XmlTreeMenu 1.1
*     功能:主体风格模仿outlook 2003菜单，由第一级菜单和下级树组成,可以拖拉收缩菜单,有快捷菜单图标,支持页面缩放
*******************************************************************************************/
function XmlTreeMenu(menuName,urlroot,imgroot)
{
	var xmlDoc = null;
	var xmlRoot=null;
	var subMenu = null;
	var menuName = menuName;
	var baseUrl=urlroot;//url路径
	var ImgRoot=imgroot;//图片路径
	var TabAll=null;
	var TabName='treemenu';
	var htmlStr='';//解析xml生成的html
	var treeHtmlStr='';
	var closeFlag='closeflag.gif';
	var openFlag='openflag.gif';
	var nodeImg='node.gif';
	var urlImg='39.gif';
	var canMove=false;
	var isMouseDown=false;
	var oldHeight=0;
	var imgBar=null;//图片所在的单元格
	var secTdHeight=0;//第二层的表格单元格高度
	var isImgFull=false;//body的resize事件
	var oldClkSpan=null;//
//xml读取数据，数据来自一个xml文件，参数是这个xml文件
this.loadData=loadData;
function loadData(url,param,cind) {
	var isLoaded=false;
	xmlDoc = new ActiveXObject("Msxml.DOMDocument");
	xmlDoc.async = false;
	if (param == null)
	  isLoaded=xmlDoc.loadXML(url);
	else
	  isLoaded=xmlDoc.load(url);
	if(!isLoaded)
		return false;	
	xmlDoc = xmlDoc.childNodes[1];
	if(cind!=null)
		xmlDoc=xmlDoc.selectNodes("menu")[cind];
	
 // 	alert(xmlDoc.xml);
//	if(xmlDoc!=null)
//	{
//		if(xmlDoc.childNodes[0].getAttribute("pos")=="left")
//		xmlDoc = xmlDoc.childNodes[0];
//		else
//		xmlDoc = xmlDoc.childNodes[1];
//	}
		xmlRoot=xmlDoc;
		return true;
	}
//初始化
this.initMenu=initMenu;
function initMenu(xmlDoc,isportal)
{ 	
	if(xmlDoc==null) xmlDoc=xmlRoot;
	var FnodesArr=new Array();
	var FirstTrStr='<table class="FirstTab"  unselectable=on   width="100%"  height="100%">';
	for(var i=0;i<xmlDoc.childNodes.length;i++)
	{
	var onode=xmlDoc.childNodes[i];
	if(onode.nodeType!=1)
		continue;
	FnodesArr[FnodesArr.length]=onode;
	var displaystr='';
	if(i!=0)
		displaystr=' style="display:none" ';
	FirstTrStr+='<tr '+displaystr+'><td  unselectable=on height="100%">';
	FirstTrStr+='<table  unselectable=on cellpadding=0 cellspacing=0 height="100%"><tr><td  class="ftrCss" style="background-image:url(\''+ImgRoot+'yanse.gif\');"   unselectable=on  >'+onode.getAttribute("text")+'</td></tr>';
	FirstTrStr+='<tr><td  unselectable=on ><div   unselectable=on   class="fDivCss">';
	var attRef=onode.getAttribute("ref");
	if(attRef!=null && attRef!="")
		{
		
		//FirstTrStr+='<iframe class="frameCss" src="'+attRef+'"></iframe>';
		var refXmlDoc = new ActiveXObject("Msxml.DOMDocument");
		refXmlDoc.async = false;
		 refXmlDoc.load(attRef);
		refXmlDoc = refXmlDoc.childNodes[1];
		if(refXmlDoc!=null)
			{
			
			treeHtmlStr='';
			attachSubMenu(refXmlDoc);
			FirstTrStr+=''+treeHtmlStr+'';
			}
		}
	else
		{
		   
		treeHtmlStr='';
		attachSubMenu(onode);
		FirstTrStr+=''+treeHtmlStr+'';
		}
	FirstTrStr+='</div></td></tr></table></td></tr>';
	}
	FirstTrStr+='</table>';
	var SecTrStr='<table class="SecTab"  style="table-layout:fixed;" unselectable=on >';
	
	for(var j=0;j<FnodesArr.length;j++)
	{
	var ofnode=FnodesArr[j];
	var trcss='strCss';
	if(j==0)
		trcss='sFocusTrCss';
//	SecTrStr+='<tr><td valign=middle class="'+trcss+'" link="'+ofnode.getAttribute("url")+'" style="background-image:url(\''+ImgRoot+'dh_02.gif\'); cursor:hand;" url="'+ofnode.getAttribute("url")+'" targetframe="'+ofnode.getAttribute("targetframe")+'" unselectable=on  onclick="'+menuName+'.doClick2(this)" ><img style="margin-right:20px;" src="'+ImgRoot+'bt.gif">'+ofnode.getAttribute("text")+'</td></tr>';
	SecTrStr+='<tr><td valign=middle class="'+trcss+'" link="'+ofnode.getAttribute("url")+'" style="border:1px #7698bf solid;background-image:url(\''+ImgRoot+'yanse.gif\'); cursor:hand;" url="'+ofnode.getAttribute("url")+'" targetframe="'+ofnode.getAttribute("targetframe")+'" unselectable=on  onclick="'+menuName+'.doClick2(this)" >&nbsp;<img style="margin-right:20px;" src="'+ImgRoot+'bt.gif">'+ofnode.getAttribute("text")+'</td></tr>';
	}

	SecTrStr+='</table>';
	var ImgTrStr='';
	for(var k=0;k<FnodesArr.length;k++)
	{
	var oonode=FnodesArr[k];
	ImgTrStr+='<img class="threeImgCss"    unselectable=on   style="display:none" onclick="'+menuName+'.doThreeImgClick()"  onmouseover="'+menuName+'.doThreeImgMouseover(this)" onmouseout="'+menuName+'.doThreeImgMouseout(this)" src="'+ImgRoot+oonode.getAttribute("icon")+'" title="'+oonode.getAttribute("text")+'" str="'+k+'">';
	}

	var threeTrStr='<table  class="threeTab"  unselectable=on  ondragstart="return false;">';
	threeTrStr+='<tr><td  background="'+ImgRoot+'dh_03.jpg"  unselectable=on  ondragstart="return false;"  nowrap>'+'</td><td background="'+ImgRoot+'dh_03.jpg"  unselectable=on width="40" nowrap  onmouseout="this.style.backgroundColor=\'\'"  ><img style="cursor:hand;" title="向上翻页" onclick="'+menuName+'.prePage()" src="'+ImgRoot+'up.jpg">&nbsp;<img style="cursor:hand;" title="向下翻页" onclick="'+menuName+'.nextPage()" src="'+ImgRoot+'down.jpg"></td></tr>';
	threeTrStr+='</table>';
	htmlStr+='<table   height="100%" style="table-layout:fixed;" id="'+TabName+'" cellpadding="0"  cellspacing=0   unselectable=on    onmousedown="'+menuName+'.doTabMousedown()"   onmousemove="'+menuName+'.doTabMousemove()"  onmouseup="'+menuName+'.doTabMouseup()"><tr ><td  valign="top"  unselectable=on height="100%"  >';
	htmlStr+=FirstTrStr;
	htmlStr+='</td></tr>';
	htmlStr+='<tr height=10 style="display:none"><td  valign="top"  unselectable=on  title="上下拖动"  align=center height=7 style="display:none;background-repeat:no-repeat;background-image:url(\''+ImgRoot+'menuline.gif\');background-position-x:center;background-position-y:center;background-attachment:scroll;background-color:#D6DFEF"   >&nbsp;</td></tr>';
	htmlStr+='<tr><td valign="top"   unselectable=on>';
	htmlStr+=SecTrStr;
	htmlStr+='</td></tr>';
	htmlStr+='<tr><td valign="bottom" height="24"  unselectable=on style="border-width:1px 0px;border-color:gray;border-style:solid;">';
	htmlStr+=threeTrStr;
	htmlStr+='</td></tr>';
	//gaochuanji修改，除去菜单下面的一段空白。
	htmlStr+='<tr style="display:none;"><td valign="bottom" style="display:none;"  unselectable=on  ><div style="display:none;position:absolute;"   unselectable=on   class="fourImgDivCss" >';
	//htmlStr+=ImgTrStr;
	htmlStr+='</div></td></tr>';
	htmlStr+='</table>';
	return(htmlStr);
}

//生成子菜单对象，并且这些对象将全部attach到document上
this.attachSubMenu=attachSubMenu;
function attachSubMenu(subMenu,div) {
	if (subMenu == null) return;
	for (var i = 0;i<subMenu.childNodes.length;i++) {
	var onode=subMenu.childNodes[i];
	if(onode.nodeType!=1)
		continue;
	var displaystr='';
	if(div!=null)
		displaystr='display:none;';
	treeHtmlStr+='<div valign=top nowrap style="padding-left:10px;width:100%;text-align:center;'+displaystr+'"';
	treeHtmlStr+=' type="'+onode.getAttribute("type")+'" >';
	//if(onode.childNodes.length==0 && div!=null)
	if(onode.childNodes.length==0)
		{
		var urlimg=(onode.getAttribute("icon")==null?urlImg:onode.getAttribute("icon"));
	
		treeHtmlStr+='<img src="'+ImgRoot+urlimg+'" vspace="5" url="'+onode.getAttribute("url")+'" targetframe="'+onode.getAttribute("targetframe")+'"  onmouseover="'+menuName+'.domouseoverspan()"  onmouseout="'+menuName+'.domouseoutspan()" onclick="'+menuName+'.doClick(this)"><br>';
	
		}
	else
		{
		treeHtmlStr+='<img src="'+ImgRoot+closeFlag+'"  onclick="'+menuName+'.doClick1(this)">';
		var nodeimg=(onode.getAttribute("icon")==null?nodeImg:onode.getAttribute("icon"));
		treeHtmlStr+='<img src="'+ImgRoot+nodeimg+'">';
		}
	var urlstr='';
//	if(onode.getAttribute("url")!=null && onode.getAttribute("url")!="")
	//	{
		urlstr=' url="'+onode.getAttribute("url")+'" ';
	//	}
	
		var framestr='';
	if(onode.getAttribute("targetframe")!=null && onode.getAttribute("targetframe")!="")
		{
		framestr=' targetframe="'+onode.getAttribute("targetframe")+'" ';
		}
	treeHtmlStr+='<span class="treemenuspanCss" '+urlstr+framestr+'   onclick="'+menuName+'.doClick(this)"   onmouseover="'+menuName+'.domouseoverspan()"  onmouseout="'+menuName+'.domouseoutspan()">' + onode.getAttribute("text") + '<br/><br/></span>';
			if(onode.childNodes.length>0)
			attachSubMenu(onode,1);		//递归调用
			treeHtmlStr+='</div>';
	}
}
//显示菜单
this.show=show;
function show(xmlurl,cell,isportal)
	{
htmlStr='';
//if(tabName!=null)
	//TabName=tabName;
if(!loadData(xmlurl,1,cell)){
	top.location=baseUrl+"/menu.cmd";
	return;
}
document.all("menudiv").innerHTML=initMenu(xmlDoc,isportal);



TabAll=document.all(TabName);
imgBar=TabAll.rows[1].cells[0];
var secTab=TabAll.rows[2].cells[0].children[0];
if(secTab.rows[0]!=null)
secTdHeight=secTab.rows[0].cells[0].clientHeight;
if(secTdHeight==0)
	secTdHeight=27;
changDivHeight();
var fun=new Function(menuName+".bodyClick()");
document.body.attachEvent("onmousedown",fun);
	var fun1=new Function(menuName+".bodyResize()");
	document.body.onresize=fun1;
//初始时候,如果所有菜单都没有下级，则隐藏第一层和imgtr
var sdivs=TabAll.rows[0].cells[0].getElementsByTagName("DIV");
var hassummenu=0;
for(var i=0;i<sdivs.length;i++)
		{
		var odiv=sdivs[i];
		if(odiv.className=="fDivCss" && odiv.innerHTML!="")
			{
			hassummenu=1;
			break;
			}
		}
if(!hassummenu)
		{
		TabAll.rows[0].style.display="none";
		TabAll.rows[1].style.display="none";

		}
//初始时候隐藏sectab高出的部分tr
//var stdheight=document.body.clientHeight-TabAll.rows[0].offsetHeight-TabAll.rows[1].offsetHeight-TabAll.rows[3].offsetHeight-TabAll.rows[4].offsetHeight;
//alert(stdheight+","+document.body.clientHeight/2);
//if(stdheight>document.body.clientHeight/2)
//	secTab.parentElement.height=document.body.clientHeight/2;
//else
//	secTab.parentElement.height=stdheight;
var sectabheight=secTab.clientHeight;
if(sectabheight>document.body.clientHeight/2){
var sectrheight=secTab.rows[0].offsetHeight;
//alert(sectrheight);
var hidtrs=Math.ceil((sectabheight-document.body.clientHeight/2)/sectrheight);
//if(hidtrs>0)
secTab.showrows=secTab.rows.length-hidtrs;
//初始时候隐藏多出的行
for(var i=secTab.rows.length-1;i>=parseInt(secTab.rows.length-hidtrs);i--)
		{
		hidSecTr();
		}
	}
}
//链接
this.doClick=doClick;
function doClick()
	{
	doClick1();
	var obj=event.srcElement;
	if(oldClkSpan!=null)
		oldClkSpan.className="treemenuspanCss";
	obj.className="treeSpanClk";
	oldClkSpan=obj;
	var targetframe=obj.targetframe;
	var urls=obj.url;
	if(urls!=null && urls!="")
			{
		var restr=/\|/g;
		urls=urls.replace(restr,"&");

			}
	if(urls!=null && urls!="" && urls!="null" &&urls.substring(0,4).toUpperCase()!="HTTP"){
		urls = baseUrl+"/"+urls;
	}
	if(targetframe=="_tree")
		{
		//top.main.location.href="frames1.htm";
		//alert(top.main.document.all("framestree"));
		if(urls!=null && urls!="" && urls!="null")
			{
			if(top._tree){
			top.fraContent.cols="8,170,170,*,8";
			top._tree.location.href=urls;
			}else{
			top.contents.new_date.location.href=urls;
			top.contents.document.all("new_date").style.display="block";
			top.contents.document.all("new_menu").style.display="none";
			}
		
		//top.content.treebar.location.href="treebar.jsp";
		//top.content.main.location.href="content.jsp";
			}
		return;
		}else{
		  if(top._tree){
			top.fraContent.cols="8,170,0,*,8"; 
			}
		}
	//top.content.document.all("framestree").cols='0,*';
	if(urls!=null && urls!="" && urls!="null"){
			if(targetframe==""||targetframe=="main"){
				top.main.location.href=urls;
				if(top._tree){
				top.fraContent.cols="8,170,0,*,8"; 
				}else{
				top.contents.document.all("new_date").style.display="none";
				top.contents.document.all("new_menu").style.display="block";
				return ;
				}
			}
			if(targetframe=="_blank"){
				window.open(urls,"","");
				return ;
			}
			if(targetframe=="_top"){
				top.location.href=urls;
				return ;
			}
		}
	}
	
//单击事件
this.doClick1=doClick1;
function doClick1()
	{
	var obj=window.event.srcElement;
	var oDiv=null;
	if(obj.tagName=="IMG" || obj.tagName=="SPAN" )
		oDiv=obj.parentElement;
	else
		return;
	if(oDiv.children.length<=3)
		return;
	if(oDiv.open!=1)
		{
		for(var i=2;i<oDiv.children.length;i++)
			{
			var onode=oDiv.children[i];
			if(onode.tagName=="DIV")
				onode.style.display="block";
			}
			oDiv.open=1;
		}
	else
		{
		for(var i=2;i<oDiv.children.length;i++)
			{
			var onode=oDiv.children[i];
			if(onode.tagName=="DIV")
				onode.style.display="none";
			}
			oDiv.open=0;
		}
	
	changeImg(oDiv);
	}
this.domouseoutspan=domouseoutspan;
function domouseoutspan()
	{
	var obj=window.event.srcElement;
	if(obj!=oldClkSpan)
	obj.className="treemenuspanCss";
	}
this.domouseoverspan=domouseoverspan;
function domouseoverspan()
	{
	var obj=window.event.srcElement;
	if(obj!=oldClkSpan)
	obj.className="treeSpanFocus";
	}
//拖动图片
this.doimgmouseout=domouseout;
function domouseout()
	{
	if(!isMouseDown)
		{
		canMove=false;
		TabAll.style.cursor="default";
		}
	}
this.doimgmouseover=domouseover;
function domouseover()
	{
		try
		{
		TabAll.style.cursor="s-resize";
		canMove=true;
		}catch(ex)
		{
			TabAll.style.cursor="move";
		}
	}
//拖动事件
this.doTabMousedown=doTabMousedown;
function doTabMousedown()
	{
	var imgTab=TabAll.rows[3].cells[0].children[0];
	var obj=window.event.srcElement;
	if(imgTab.contains(obj))
		return;
	if(canMove)
		isMouseDown=true;
	}
this.doTabMousemove=doTabMousemove;
function doTabMousemove()
	{
	document.selection.empty();
	if(isMouseDown)
		{
		var top1=imgBar.offsetTop+imgBar.offsetHeight;
		var top2=window.event.clientY;
			try
			{
				TabAll.style.cursor="s-resize";
			}catch(ex)
			{
				TabAll.style.cursor="move";
			}
		//alert(top1+","+top2+","+secTdHeight);
		if((top2-top1)>parseInt(secTdHeight))
			{
			hidSecTr();
			}
		if((top1-top2)>parseInt(secTdHeight))
			{	
			showSecTr();
			}

		}
	}
this.doTabMouseup=doTabMouseup;
function doTabMouseup()
	{
	isMouseDown=false;
	canMove=false;
	TabAll.style.cursor="default";
	}
//实现拖动效果,隐藏第二层的一行,
this.hidSecTr=hidSecTr;
function hidSecTr()
	{
	if(TabAll==null)
		return;
	var secTab=TabAll.rows[2].cells[0].children[0];
	for(var i=secTab.rows.length-1;i>=0;i--)
		{
		var otr=secTab.rows[i];
		var oimg=otr.cells[0].children[0];
		if(otr.style.display!="none")
			{
				otr.style.display="none";
				showImgTr(oimg.src);
				changDivHeight();
				break;
			}
		}

	}
//实现拖动效果,显示第二层的一行,
this.showSecTr=showSecTr;
function showSecTr()
	{
	if(TabAll==null)
		return;
	var secTab=TabAll.rows[2].cells[0].children[0];
	for(var i=0;i<secTab.rows.length;i++)
		{
		var otr=secTab.rows[i];
		var oimg=otr.cells[0].children[0];
		if(otr.style.display=="none")
			{
				otr.style.display="block";
				hidImgTr(oimg.src);
				lowDivHeight(otr.offsetHeight);
				break;
			}
		}

	}
//显示第三层图片工具栏的一个,
this.showImgTr=showImgTr;
function showImgTr(imgname)
	{
	if(TabAll==null)
		return;
	var imgTab=TabAll.rows[3].cells[0].children[0];
	var imgTr=imgTab.rows[0].cells[0];
	var totalImgwidth=0;
	for(var ii=0;ii<imgTr.children.length;ii++)
		{
		//alert(imgTr.children[ii].clientWidth);
		totalImgwidth+=parseInt(imgTr.children[ii].offsetWidth);
		}
	//alert(imgTr.clientWidth+","+totalImgwidth);
	for(var i=0;i<imgTr.children.length;i++)
		{
		var oimg=imgTr.children[i];
		if(oimg.src==imgname)
			{
				if(imgTr.clientWidth>totalImgwidth+18)
					oimg.style.display="inline";
				else
					showImgDivTr(imgname);
				break;
			}
		}

	}
//隐藏第三层图片工具栏的一个,
this.hidImgTr=hidImgTr;
function hidImgTr(imgname)
	{
	if(TabAll==null)
		return;
	var imgTab=TabAll.rows[3].cells[0].children[0];
	var imgTr=imgTab.rows[0].cells[0];
	var totalImgwidth=0;
	for(var ii=0;ii<imgTr.children.length;ii++)
		totalImgwidth+=parseInt(imgTr.children[ii].offsetWidth);
	//alert(imgTr.clientWidth+","+totalImgwidth);
	for(var i=0;i<imgTr.children.length;i++)
		{
		var oimg=imgTr.children[i];
		if(oimg.src==imgname && oimg.style.display!="none")
			{
					oimg.style.display="none";
					return;
			}
		}
	hidImgDivTr(imgname);
	}
//向前翻页
this.prePage=prePage;
function prePage()
	{
	var secTab=TabAll.rows[2].cells[0].children[0];
	if(secTab==null) return;
	var pageindex=secTab.pageindex;
	if(pageindex==null) pageindex=1;
	if(pageindex==1) return;
	var showrows=secTab.showrows;
	//alert(showrows+","+pageindex);
	if(showrows==null) return;
	/*
	var strind=-1;
	for(var i=0;i<secTab.rows.length;i++)
		{
		var otr=secTab.rows[i];
		if(strind==-1&&otr.style.display!="none")
			strind=otr.rowIndex;
		if(otr.style.display!="none")
			otr.style.display="none";
		}
	if(strind<=0) return;
	if(strind>=showrows)
		{
		for(var i=strind;i>strind-showrows;i--)
			{
			var otr=secTab.rows[i];
			otr.style.display="";
			}
		}
		*/
	
//	for(var i=0;i<secTab.rows.length;i++)
//		{
//		var otr=secTab.rows[i];
//		if(i<parseInt(pageindex-1)*parseInt(showrows))
//			{
//			otr.style.display="";
//			}
//		else 
//			{
//			otr.style.display="none";
//			}
//		}
//隐藏当前页
	var len=Math.min(secTab.rows.length,showrows*pageindex);
	for(var i=showrows*(pageindex-1);i<len;i++)
		secTab.rows[i].style.display="none";
//显示前一页
	pageindex--;
	len=showrows*pageindex;
	var len=Math.min(secTab.rows.length,showrows*pageindex);
	for(var j=showrows*(pageindex-1);j<len;j++)
		secTab.rows[j].style.display="";
	secTab.pageindex=pageindex;
	}
//向后翻页
this.nextPage=nextPage;
function nextPage()
	{
	var secTab=TabAll.rows[2].cells[0].children[0];
	if(secTab==null) return;
	var pageindex=secTab.pageindex;
	if(pageindex==null) pageindex=1;
	var showrows=secTab.showrows;
	if(showrows==null) return;
	if(showrows*pageindex>=secTab.rows.length)return;
	//alert(pageindex+","+secTab.rows.length+","+showrows);
	//alert(parseInt(pageindex+1)+","+Math.ceil(secTab.rows.length/showrows));
//	if(parseInt(pageindex+1)>Math.ceil(secTab.rows.length/showrows)) return;
//	var strind=-1;
//	for(var i=0;i<secTab.rows.length;i++)
//		{
//		var otr=secTab.rows[i];
//		if(i>=parseInt(pageindex)*parseInt(showrows)&& i<parseInt(pageindex+1)*parseInt(showrows))
//			{
//			otr.style.display="";
//			}
//		else 
//			{
//			otr.style.display="none";
//			}
//		}
	//alert(strind);
	/*if(strind<=0) return;
	if(secTab.rows.length-strind+1>0)
		{
		for(var i=strind+1;i<strind+showrows+1;i++)
			{
			if(i==secTab.rows.length) break;
			var otr=secTab.rows[i];
			otr.style.display="";
			}
		}
		*/
//隐藏当前页
	var len=showrows*pageindex;
	for(var i=showrows*(pageindex-1);i<len;i++)
		secTab.rows[i].style.display="none";
//显示下一页
	pageindex++;
	len=Math.min(secTab.rows.length,showrows*pageindex);
	for(var j=showrows*(pageindex-1);j<len;j++)
		secTab.rows[j].style.display="";
	secTab.pageindex=pageindex;
	}

//显示第4层浮动图片工具栏的一个,
this.showImgDivTr=showImgDivTr;
function showImgDivTr(imgname)
	{
	if(TabAll==null)
		return;
	var imgTr=TabAll.rows[4].cells[0].children[0];
	for(var i=0;i<imgTr.children.length;i++)
		{
		var oimg=imgTr.children[i];
		if(oimg.src==imgname)
			{
				oimg.style.display="block";
				break;
			}
		}

	}
//隐藏第4层浮动图片工具栏的一个,
this.hidImgDivTr=hidImgDivTr;
function hidImgDivTr(imgname)
	{
	if(TabAll==null)
		return;
	var imgTr=TabAll.rows[4].cells[0].children[0];
	for(var i=0;i<imgTr.children.length;i++)
		{
		var oimg=imgTr.children[i];
		if(oimg.src==imgname)
			{
				oimg.style.display="none";
				break;
			}
		}

	}

//图片工具栏事件
this.doThreeImgClick=doThreeImgClick;
function doThreeImgClick()
	{
		if(TabAll==null)
		return;
	var obj=event.srcElement;
	if(obj.tagName!="IMG")
		return;
	var attStr=obj.str;
	var secTab=TabAll.rows[2].cells[0].children[0];
	var FirTab=TabAll.rows[0].cells[0].children[0];
	for(var j=0;j<FirTab.rows.length;j++)
				{
				FirTab.rows[j].style.display="none";
				}
	for(var i=0;i<secTab.rows.length;i++)
		{
		var otd=secTab.rows[i].cells[0];
		if(otd.className=="sFocusTrCss")
			{
			otd.className="strCss";
			FirTab.rows[i].style.display="none";
			}
		if(attStr==i)
			{
				FirTab.rows[i].style.display="block";
				secTab.rows[i].cells[0].className="sFocusTrCss"
			}
		}
var imgdivTr=TabAll.rows[4].cells[0].children[0];
imgdivTr.style.display="none";
	}
this.doThreeImgMouseover=doThreeImgMouseover;
function doThreeImgMouseover(onode)
	{
	//var obj=window.event.srcElement;
	onode.className="threeImgOnCss";
	}
this.doThreeImgMouseout=doThreeImgMouseout;
function doThreeImgMouseout(onode)
	{
	//var obj=window.event.srcElement;
	onode.className="threeImgCss";
	}

//变换图片
this.changeImg=changeImg;
function changeImg (oDiv){
if(oDiv==null) return;
if(oDiv==null || typeof(oDiv.tagName)=="undefined" || oDiv.children[0]==null) return;
	if(oDiv.children[0].tagName=="IMG")
	{
		if(oDiv.open!="1")
		{
			oDiv.children[0].src=ImgRoot+closeFlag;
		}
		else
		{
			oDiv.children[0].src=ImgRoot+openFlag;
		}
	}
}
//点击第二层的td
this.doClick2=doClick2;
function doClick2()
	{
	if(TabAll==null)
		return;
	var obj=event.srcElement;
	if(obj.tagName=="IMG")
		obj=obj.parentElement;
	var secTab=TabAll.rows[2].cells[0].children[0];
	var FirTab=TabAll.rows[0].cells[0].children[0];
	for(var j=0;j<FirTab.rows.length;j++)
				{
				FirTab.rows[j].style.display="none";
				}
	for(var i=0;i<secTab.rows.length;i++)
		{
		var otd=secTab.rows[i].cells[0];
		if(otd.className=="sFocusTrCss")
			{
			otd.className="strCss";
			FirTab.rows[i].style.display="none";
			}
		if(otd==obj)
			{
				obj.className="sFocusTrCss";
				FirTab.rows[i].style.display="block";
			}
		}

	var targetframe=obj.targetframe;
	var urls=obj.link;
	if(urls!=null && urls!="")
			{
		var restr=/\|/g;
		urls=urls.replace(restr,"&");

			}
	if(urls!=null && urls!="" && urls!="null" &&urls.substring(0,4).toUpperCase()!="HTTP"){
		urls = baseUrl+"/"+urls;
	}		
	if(targetframe=="_tree")
		{
		//top.main.location.href="frames1.htm";
		//alert(top.main.document.all("framestree"));
		if(urls!=null && urls!=""&& urls!="null")
			{
			if(top._tree){
			top.fraContent.cols="8,170,170,*,8";
			top._tree.location.href=urls;
			}else{
			top.contents.new_date.location.href=urls;
			top.contents.document.all("new_date").style.display="block";
			top.contents.document.all("new_menu").style.display="none";
			}
		//top.content.treebar.location.href="treebar.jsp";
		//top.content.main.location.href="content.jsp";
			}
		return;
		}else if(top._tree){
			top.fraContent.cols="8,170,0,*,8";
		}
	if(urls!=null && urls!=""&& urls!="null"){
			if(targetframe==""||targetframe=="main"){
				top.main.location.href=urls;
				if(top._tree){
				top.fraContent.cols="8,170,0,*,8";
				}else{
				top.contents.document.all("new_date").style.display="none";
				top.contents.document.all("new_menu").style.display="block";
				}
				return ;
			}
			if(targetframe=="_blank"){
				window.open(urls,"","");
				return ;
			}
			if(targetframe=="_top"){
				top.location.href=urls;
				return ;
			}
	
  }
	}
//鼠标滑过第二层td
this.doMouseover2=doMouseover2;
function doMouseover2(othis)
	{
	othis.oldclass=othis.className;
	othis.className="strMouseoverCss";
	}

//鼠标滑过第二层td
this.doMouseout2=doMouseout2;
function doMouseout2(othis)
	{
	if(othis.oldclass!=null && othis.oldclass!="")
	othis.className=othis.oldclass;
	else
	othis.className="strCss";
	}


//鼠标滑过第二层td 2006-06-25北京农商行专用
function doMouseover2New(othis)
	{
	othis.oldclass=othis.className;
	othis.className="strMouseoverCss";
	}

//鼠标滑过第二层td 2006-06-25北京农商行专用
function doMouseout2New(othis)
	{
	if(othis.oldclass!=null && othis.oldclass!="")
	othis.className=othis.oldclass;
	else
	othis.className="strCss";
	}


//增加第一层树div的高度
this.changDivHeight=changDivHeight;
function changDivHeight()
	{
	//if(TabAll==null)
		return;
	var fTd=TabAll.rows[0].cells[0];
	var ftable=fTd.children[0];
	for(var i=0;i<ftable.rows.length;i++)
		{
		var otd=ftable.rows[i].cells[0];
		var odiv=otd.children[0].rows[1].cells[0].children[0];
		if(odiv==null && odiv.tagName!="DIV")
			continue;
		alert(fTd.offsetHeight);
		odiv.style.height=fTd.offsetHeight-25;
		}
	}
//减小第一层树div的高度
this.lowDivHeight=lowDivHeight;
function lowDivHeight(hh)
	{
	//if(TabAll==null)
		return;
	var fTd=TabAll.rows[0].cells[0];
	var ftable=fTd.children[0];
	for(var i=0;i<ftable.rows.length;i++)
		{
		var otd=ftable.rows[i].cells[0];
		var odiv=otd.children[0].rows[1].cells[0].children[0];
		if(odiv==null && odiv.tagName!="DIV")
			continue;
		odiv.style.height=parseInt(odiv.style.height)-parseInt(hh);
		}
	}
//点击更多按钮
this.doImgDivClick=doImgDivClick;
function doImgDivClick()
	{
	if(TabAll==null)
		return;
	var canshowdiv=false;
	var imgdivTr=TabAll.rows[4].cells[0].children[0];
	for(var i=0;i<imgdivTr.children.length;i++)
		{
		var oimg=imgdivTr.children[i];
		if(oimg.style.display!="none")
			{
			canshowdiv=true;
			break;
			}
		}
	if(!canshowdiv) return;
	imgdivTr.style.display="block";
	var top=TabAll.rows[3].cells[0].offsetTop;
	var left=TabAll.offsetWidth-imgdivTr.offsetWidth;
	//alert(top+","+left);
	//alert(imgdivTr.outerHTML);
	imgdivTr.style.top=top-parseInt(imgdivTr.offsetHeight);
	imgdivTr.style.left=left;
	}
//点击body,隐藏浮动div菜单
this.bodyClick=bodyClick;
function bodyClick()
	{
		if(TabAll==null)
		return;
		var imgTr=TabAll.rows[4].cells[0].children[0];
		var obj=event.srcElement;
		if(!imgTr.contains(obj))
			imgTr.style.display="none";

	}
//调整body宽度,隐藏/显示图标
this.bodyResize=bodyResize;
function bodyResize()
	{
		var secTab=TabAll.rows[2].cells[0].children[0];
		var len=secTab.rows.length;
		var sectabheight=secTab.clientHeight;
		if(sectabheight>document.body.clientHeight/2){
			if(secTab.pageindex==null) secTab.pageindex=1;
			var len1=Math.min(secTab.rows.length,(secTab.showrows)*(secTab.pageindex));
			var sectrheight=secTab.rows[len1-1].offsetHeight;
			//alert(sectrheight);
			var hidtrs =0;
			if(sectrheight!=0){
			hidtrs =Math.ceil((sectabheight-document.body.clientHeight/2)/sectrheight);
			}
			if(hidtrs>0&&secTab.pageindex>1){
				for(var i=0;i<len;i++)
					secTab.rows[i].style.display="";
				secTab.pageindex=1;
				secTab.showrows=secTab.showrows-hidtrs;
				for(var i=secTab.showrows;i<parseInt(secTab.rows.length);i++)
				{
					secTab.rows[i].style.display="none";
				}
			}else if(hidtrs>0){
				for(var i=secTab.showrows-hidtrs;i<parseInt(secTab.showrows);i++)
				{
					secTab.rows[i].style.display="none";
				}
				secTab.showrows=secTab.showrows-hidtrs;
			}
			
		}	

	}
}