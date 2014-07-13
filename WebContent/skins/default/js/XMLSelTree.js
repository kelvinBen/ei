/************************************************
** 文件名:
** Copyright (c) 2003 
** 创建人:	moonpiazza
** 日 期:	2003.6.29
** 修改人:
** 日 期:
** 描 述:	XML菜单树
**
** 版 本:	1.0


**修改:nature
**版本:2.0
************************************************/


function TreeConfig()
{


	this.ImgAsync			= true ;		// 点击图标的时候是否不选中该节点
											// true:  不选中该节点; 
											// false: 选中该节点

	this.ShowElseBranch	= true ;		// 是否只显示当前菜单分枝以外的菜单分枝
											// true:  显示已经展开的分枝 
											// false: 只显示当前1个分枝，隐藏其他分枝;

											// 当叶节点获得焦点，是否改变图标
	this.ChangeLeafImg	= false;				// true:  改变;              
											// false: 不改变                
		


	this.DataAsync			= true ;		// 异步读取数据(每次是否都从新读入数据)
											// true:  不是; 
											// false: 是


	this.CheckDataAsync	= true ;		// 异步读取数据(每次是否都从新读入数据)
											// true:  不是; 
											// false: 是


	this.UseCheck			= true ;		// 是否启用选择,启用后选父项自动选中所有隐藏的子项

	//this.sSelVal			= "" ;			// 选择的值
	this.oSrcDiv;//在后面赋值
	this.CheckKey			= "," ;			// checkdata 分隔符

	this.CheckAsync		= true;			// 当节点获得焦点，是否选中，点文字或图片自动勾选当前项
											// true:  不选中; 
											// false: 选中
	
	this.CheckShowBranch	= false;		// 当枝节点选中，是否展开子节点 点单复选展开节点
											// true:  展开; 
											// false: 不展开

											// 是否自动点击当前节点下第一个有'链接'的节点  
	this.IsAutoGoFisrtLeaf;//在后面赋值
											// false: 不自动                
		

	this.BranchImgSrc = "../../images/NodeImg1.gif";//带子节点的节点图片

	this.LeafImgSrc = "../../images/NodeImg0.gif";//叶子节点图片
	this.PackageImgSrc = "../../images/32.gif";//带子节点的节点开合图片后的属性图片


	this.AutoScroll		= false ;

	this.TreeCurrentNode		= "moonpiazza" ;				// 当前节点
	this.LoadingText		= "Loading..." ;					//正在加载的提示信息

	this.sClsMouseDown		= "clsMouseDown" ;					//鼠标按下时样式
	this.sClsMouseOver		= "clsMouseOver" ;					//鼠标滑过样式
	this.sClsCurrentFocus	= "clsCurrentFocus"					//当前节点样式



	this.oXSLDoc = new ActiveXObject("Microsoft.XMLDOM") ;	// xsl文档对象，显示xml数据
	this.oXSLDoc.async = false ;
	this.XSLFilePath;//在后面赋值
	this.TreeContainerDiv=null;//外面的div
	
}





/************************************************
** GTree()
初始化
************************************************/
function GTree(treeName,TreeXMLFile, TreeXSLPath, TreeContainerDiv, IsAutoGoFisrtLeaf,isXMLFile,treeConfig,goNodeList)
{
	if(treeName)	{
			var s='window.'+treeName+'=this';
			eval(s);
		}else	{
			return; 
		}
	this.loadRightMouseMenu();
	this.loadRightMouseMenuByNode();
	this.isxmlfile = isXMLFile;
	this.xmlfilename = TreeXMLFile;
	this.insttreename = treeName;
	this.oArray = new Array();//获取节点的所有子节点nodeId
	this.allxmlsrc = "";
	var fun=new Function(this.insttreename+".clearContextMenuOnBody()");
		document.body.attachEvent("onclick",fun);

	this.contextNodeMenu = null;//右键菜单
	this.contextLeafMenu = null;//右键菜单
	this.contextMenuByNode = null;//右键菜单
	this.xmlsrc = "";
	//多阶段时，判断XML是否有效，如有没有节点等等。
	this.IsXmlVolid = true;

	TreeContainerDiv.oncontextmenu = _select_start;//点击右键事件
	TreeContainerDiv.onselectstart = _select_start;//选中div事件

	//TreeContainerDiv.onkeydown = _do_Key_Down;
	//document.onmouseout = _select_start;
	var bIE	= (navigator.appName=="Microsoft Internet Explorer")?true:false ;

	if (!bIE) 
	{
		alert('你的浏览器不是IE浏览器,XMlSelTree不支持此浏览器，谢谢你的支持！');
		return false ;
	}
	var sXSLPath	= ("/" == (TreeXSLPath.charAt((TreeXSLPath.length-1))) ) ? TreeXSLPath:(TreeXSLPath + '/')
	var sXSLFile	= sXSLPath + this.GetXSLFileName() ;

	treeConfig.XSLFilePath = sXSLFile;
	treeConfig.oSrcDiv = TreeContainerDiv;
	treeConfig.IsAutoGoFisrtLeaf = IsAutoGoFisrtLeaf;
	treeConfig.oXSLDoc.load(treeConfig.XSLFilePath) ;
	
	this.TreeConfig	= treeConfig;
	this.TreeConfig.TreeContainerDiv=TreeContainerDiv;
	TreeContainerDiv.innerHTML = "<span class='clsCurrentFocus'>"+this.TreeConfig.LoadingText+"</span>";//显示加载字符

	var oXMLDom	= new ActiveXObject("Microsoft.XMLDOM") ;
		oXMLDom.async	= false ;
		if(isXMLFile)
			oXMLDom.load(TreeXMLFile) ;
		else
			oXMLDom.loadXML(TreeXMLFile);

	var attribute = oXMLDom.createAttribute("TreeName");
	attribute.text = this.insttreename;
	oXMLDom.childNodes[1].attributes.setNamedItem(attribute);

	attribute = oXMLDom.createAttribute("BranchImgSrc");
	attribute.text = this.TreeConfig.BranchImgSrc;
	oXMLDom.childNodes[1].attributes.setNamedItem(attribute);

	attribute = oXMLDom.createAttribute("LeafImgSrc");
	attribute.text = this.TreeConfig.LeafImgSrc;
	oXMLDom.childNodes[1].attributes.setNamedItem(attribute);

	attribute = oXMLDom.createAttribute("PackageImgSrc");
	attribute.text = this.TreeConfig.PackageImgSrc;
	oXMLDom.childNodes[1].attributes.setNamedItem(attribute);
		
	var sHtml	= oXMLDom.transformNode(this.TreeConfig.oXSLDoc) ;	
	TreeContainerDiv.innerHTML	= sHtml ;

	if(goNodeList!=null||typeof(goNodeList)!="undefined")
	{
//		var enti = oXMLDom.documentElement.selectSingleNode("//TreeNode[@NodeId='"+goNodeList+"']");
//		var ar = new Array();
//		while(enti.tagName!="Root")
//		{
//			ar[ar.length] = enti.getAttribute("NodeId");
//			enti = enti.parentNode;
//		}
		this.GoToNode(goNodeList);
	}
	

	if (this.TreeConfig.IsAutoGoFisrtLeaf)
	{
		this.GoFisrtLink( TreeContainerDiv.getElementsByTagName("DIV")[0] ) ;		
	}
}
GTree.prototype.loadRightMouseMenu=function()
{}
GTree.prototype.loadRightMouseMenuByNode=function()
{}
GTree.prototype.GoToNode=function(nodelist)
{
	var ar = nodelist.split(",");
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	var j = ar.length-1;
	for(var i=0;i<imgar.length;i++)
	{
		if(imgar[i].NodeId == ar[j])
		{
			imgar[i].click();//alert(imgar[i].NodeId);
			j--;
		}
		if(j<0)
			break;
	}
}
GTree.prototype.ImgClick=function(nodeid)
{
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	for(var i=0;i<imgar.length;i++)
	{
		if(imgar[i].NodeId == nodeid)
		{
			imgar[i].click();//alert(imgar[i].NodeId);
		}
	}
}
/*************************************************************************
** GetXSLFileName()
*************************************************************************/
GTree.prototype.GetXSLFileName=function()
{
	var sReturnVal ;
	var oAgent	= navigator.userAgent ;
	var fIEVersion	= parseFloat(oAgent.substring(oAgent.indexOf("MSIE ")+5, oAgent.indexOf(";",oAgent.indexOf("MSIE ")))) ;
	
	if (fIEVersion < 6)
	{
		sReturnVal	= "XMLSelTreeforIE5.xsl" ;
	}
	else
	{
		sReturnVal	= "XMLSelTree.xsl" ;
	}
	return sReturnVal ;
}
/*************************************************************************
** selectstart()
*************************************************************************/
function _select_start()
{
	window.event.cancelBubble = true;//取消事件
	window.event.returnValue = false;
	return false;
}

//-------------------------------------------------------------------------------------------------
//					获得(设置)数据 GET (SET) FUNCTIONS		
//-------------------------------------------------------------------------------------------------


/*************************************************************************
** GetXML(p_sXMLSrc, p_oContainerElement, p_sContainerElementState)
*************************************************************************/
GTree.prototype.GetXML=function(p_sXMLSrc, p_oContainerElement,NodeId)//todo:nodeid实际应该取nodeid
{
	//if(!this.TreeConfig.DataAsync)
	//{
	    //modify by lixy没有子节点时,不显示这句话
		//p_oContainerElement.innerHTML = "<span class='clsCurrentFocus'>"+this.TreeConfig.LoadingText+"</span>";
		if(p_sXMLSrc==null || p_sXMLSrc=="") return;
		var sHtml	= "" ;

		var oXMLDom	= new ActiveXObject("Microsoft.XMLDOM");
			oXMLDom.async	= false;   
			if(!this.isxmlfile&&typeof(NodeId)!="undefined")//如果是xml串且nodeid不为空
				oXMLDom.loadXML(p_sXMLSrc); 
			else
				oXMLDom.load(p_sXMLSrc); 
//alert(oXMLDom.childNodes[1].hasChildNodes());
		if ( (oXMLDom != null) && (oXMLDom.xml != "") &&(oXMLDom.childNodes[1].hasChildNodes()))
		{
            //modify by lixy改到里面
            p_oContainerElement.innerHTML = "<span class='clsCurrentFocus'>"+this.TreeConfig.LoadingText+"</span>";
            
			if (this.TreeConfig.oXSLDoc.xml != "")
			{
				var attribute = oXMLDom.createAttribute("TreeName");
				attribute.text = this.insttreename;
				oXMLDom.childNodes[1].attributes.setNamedItem(attribute);

				attribute = oXMLDom.createAttribute("BranchImgSrc");
				attribute.text = this.TreeConfig.BranchImgSrc;
				oXMLDom.childNodes[1].attributes.setNamedItem(attribute);

				attribute = oXMLDom.createAttribute("LeafImgSrc");
				attribute.text = this.TreeConfig.LeafImgSrc;
				oXMLDom.childNodes[1].attributes.setNamedItem(attribute);

				attribute = oXMLDom.createAttribute("PackageImgSrc");
				attribute.text = this.TreeConfig.PackageImgSrc;
				oXMLDom.childNodes[1].attributes.setNamedItem(attribute);
				
				if(this.xmlfilename!=p_sXMLSrc)
				{
				
					var attributexmlsrc = oXMLDom.createAttribute("ParentXMLSrc");
					attributexmlsrc.text = p_sXMLSrc;
					oXMLDom.childNodes[1].attributes.setNamedItem(attributexmlsrc);
				}
				//alert(oXMLDom.xml);
				////////////////////////////
				//oXMLDom.childNodes[1].removeChild();
				//alert(NodeId);
				if(typeof(NodeId)!="undefined")
				{
					var sNode = oXMLDom.selectNodes("//TreeNode[@NodeId='"+NodeId+"']");
					if(sNode.length>1)
						alert("xml数据源中存在相同关键字！");
					if(sNode.length==0)
					{
						alert("无效的NodeId!");
						return;
					}

					
					
					var childlength = sNode[0].childNodes.length;
					if(childlength==0) return;
//					alert(sNode[0].childNodes.xml);
					var insXML = "";
					for(var h=0;h<childlength;h++)
					{
						insXML+=sNode[0].childNodes[h].xml;
					}
					
					var oXMLDom1	= new ActiveXObject("Microsoft.XMLDOM");
					oXMLDom1.async	= false ; 

					var prtxml = "";
					if(this.xmlfilename!=p_sXMLSrc)//如果是外部数据源
					{
						prtxml = "ParentXMLSrc='"+p_sXMLSrc+"'";
					}				
					
					oXMLDom1.loadXML("<?xml version='1.0' encoding='gb2312'?><Root "+ prtxml +" BranchImgSrc='"+this.TreeConfig.BranchImgSrc+"' LeafImgSrc='"+this.TreeConfig.LeafImgSrc+"' PackageImgSrc='"+this.TreeConfig.PackageImgSrc+"' TreeName='"+this.insttreename+"'>"+insXML+"</Root>"); 
					sHtml	= oXMLDom1.transformNode(this.TreeConfig.oXSLDoc) ;
				}
				else
				sHtml	= oXMLDom.transformNode(this.TreeConfig.oXSLDoc) ;
				//alert(sHtml);

			} 

			if ( (sHtml != null) && (sHtml != "") )
			{
				p_oContainerElement.innerHTML	= sHtml ;				
				p_oContainerElement.className	= "shown" ;
			}
			this.IsXmlVolid=true;
		}
		else
		{
			this.IsXmlVolid=false;
			window.event.cancelBubble=true;
			return false;
		}
	//}
}




/************************************************
** GetChildElement(p_oSrcElement, p_sType) 
** 功能：定位某节点中子节点对象(子节点类型唯一:type)
************************************************/
GTree.prototype.GetChildElement=function(p_oSrcElement, p_sType)
{
	var i	= 0 ;
	var oReturnValue	= null ;
	var oChildren		= null ;

	if(p_oSrcElement!=null)
	{
		oChildren	= p_oSrcElement.children ;
	}

	if (oChildren != null)
	{
		for (i=0; i < oChildren.length; i++)
		{
			if ( (oChildren[i].type==p_sType) || (p_sType == null) )
			{
			    //alert(oChildren[i]);
				oReturnValue	= oChildren[i] ;
				break ;
			}
		}	
	}

	return oReturnValue ;
}


/************************************************
** GetParentElement(p_oSrcElement)
************************************************/
GTree.prototype.GetParentElement=function(p_oSrcElement)
{
	var oReturnValue	= null ;

	if ( (p_oSrcElement!=null) && (p_oSrcElement.parentElement != null) )
	{
		oReturnValue	= p_oSrcElement.parentElement.parentElement ;
	}

	if ( (oReturnValue != null) && (oReturnValue.type!="branch") )
	{
		oReturnValue	= null ;
	}
	
	return oReturnValue ;
}


/************************************************
** GetImgSrc(p_sImgSrc, p_sType)
** 功能：获得图标路径
************************************************/
GTree.prototype.GetImgSrc=function(p_sImgSrc, p_sType)
{
	var sReturnVal ;
	var aImgSrcInfo ;
	var sImgPath, sImgType ;
	
	aImgSrcInfo	= p_sImgSrc.split(".") ;
	sImgType	= aImgSrcInfo[ (aImgSrcInfo.length-1) ] ;

	sImgPath	= p_sImgSrc.substring(0, (p_sImgSrc.length - (sImgType.length + 2) ) ) ;

	sReturnVal	= sImgPath + p_sType + "." + sImgType ;

	return sReturnVal ;
}

/************************************************
** GoFisrtLink(p_oSrcElement)
************************************************/
GTree.prototype.GoFisrtLink=function(p_oSrcElement)
{
	if (null == p_oSrcElement) return ;

	if (this.TreeConfig.TreeCurrentNode != "moonpiazza")
	{
		var oTag	= this.TreeConfig.TreeCurrentNode.getElementsByTagName("SPAN")[0];
		var oLink	= this.GetChildElement(oTag, "link") ;
		if (null != oLink) 	return ;
	}

	var oTag	= p_oSrcElement.getElementsByTagName("SPAN")[0];
	var oLink	= this.GetChildElement(oTag, "link") ;
	this.ShowHideNode(p_oSrcElement) ;
	this.SelectNode(p_oSrcElement) ;
	
	if (null != oLink) 
	{		
		return ;
	}
	else
	{
		oTag		= oTag.parentElement.getElementsByTagName("DIV")[1] ;
		this.GoFisrtLink(oTag);
	}
}


/************************************************
** GetAllCheckData()
** 功能：获得节点返回值:CheckData
************************************************/

GTree.prototype.GetAllCheckData=function(oflag)
{
	var sReturnVal	= "";
	var i ;
	var sTmpVal ; 
	var bEnsData ;

	var oCheck	= this.TreeConfig.oSrcDiv.getElementsByTagName("INPUT") ;
	var nLen	= oCheck.length ;	
var splitflag=this.TreeConfig.CheckKey;
	if(oflag!=null && oflag!="")
		splitflag=oflag;
	for (i=0; i<nLen; i++)
	{
		if (oCheck[i].checked)
		{
			sTmpVal		= oCheck[i].value;
			if (('0' == oCheck[i].read) && ('' != oCheck[i].src) )
			{
				sTmpVal	= this.GetCheckUrlData(oCheck[i].src);
			}

			bEnsData	= ((splitflag + sReturnVal + splitflag).indexOf((splitflag + sTmpVal + splitflag)) > 0 ) ;

			if (!bEnsData)
			{
				sReturnVal += splitflag + sTmpVal ;
			}
		}
	}
	sReturnVal	= sReturnVal.replace(splitflag, '');
	return sReturnVal ;
}
GTree.prototype.CleanAllCheckNodes=function(){
	var oCheck	= this.TreeConfig.oSrcDiv.getElementsByTagName("INPUT") ;
	var nLen	= oCheck.length ;
	for(var i=0;i<nLen;i++)
		oCheck[i].checked=false;
}
GTree.prototype.GetNodeById=function(id)
{
if(this.TreeConfig.TreeContainerDiv==null) return ;
var arrobj=this.TreeConfig.TreeContainerDiv.getElementsByTagName("IMG");
for(var i=0;i<arrobj.length;i++)
	{
	var obj=arrobj[i];
	if(obj.NodeId==id){
		return obj.parentElement;
	}
}
return null;
}
GTree.prototype.GetNodeByValue=function(id)
{
if(this.TreeConfig.TreeContainerDiv==null) return ;
var arrobj=this.TreeConfig.TreeContainerDiv.getElementsByTagName("SPAN");
var returnArr=new Array();
for(var i=0;i<arrobj.length;i++)
	{
	var obj=arrobj[i];
	if(obj.NodeValue==id){
		returnArr[returnArr.length]=obj.parentElement;
	}
}
return returnArr;
}

GTree.prototype.GetAllCheckText=function(oflag)
{
	var sReturnVal	= "";
	var i ;
	var sTmpVal ; 
	var bEnsData ;

	var oCheck	= this.TreeConfig.oSrcDiv.getElementsByTagName("INPUT") ;
	var nLen	= oCheck.length ;	
	var splitflag=this.TreeConfig.CheckKey;
	if(oflag!=null && oflag!="")
		splitflag=oflag;
	for (i=0; i<nLen; i++)
	{
		if (oCheck[i].checked)
		{
			if(oCheck[i].nextSibling.nodeType==3)
			{
				sTmpVal		= oCheck[i].nextSibling.nextSibling.caption;
				if(sTmpVal==null || sTmpVal=="")
					sTmpVal		= oCheck[i].nextSibling.nextSibling.innerText;
			}
			else
			{
				sTmpVal		= oCheck[i].nextSibling.caption;  //如果静态html结构发生改变这里也要注意
				if(sTmpVal==null || sTmpVal=="")
					sTmpVal		= oCheck[i].nextSibling.innerText;
			}
			//alert(oCheck[i].nextSibling.nextSibling.nodeType);
			if (('0' == oCheck[i].read) && ('' != oCheck[i].src) )
			{
				sTmpVal	= this.GetCheckUrlData(oCheck[i].src);
			}

			bEnsData	= ((splitflag + sReturnVal + splitflag).indexOf((splitflag + sTmpVal +splitflag)) > 0 ) ;

		//	if (!bEnsData)           //重复的文本时
			{
				sReturnVal +=splitflag + sTmpVal ;
			}
		}
	}
	sReturnVal	= sReturnVal.replace(splitflag, '');
	return sReturnVal ;
}
GTree.prototype.GetAllCheckNodeId=function(oflag)
{
	var sReturnVal	= "";
	var i ;
	var sTmpVal ; 
	var bEnsData ;

	var oCheck	= this.TreeConfig.oSrcDiv.getElementsByTagName("INPUT") ;
	var nLen	= oCheck.length ;	
	var splitflag=this.TreeConfig.CheckKey;
	if(oflag!=null && oflag!="")
		splitflag=oflag;
	for (i=0; i<nLen; i++)
	{
		if (oCheck[i].checked)
		{
			if(oCheck[i].nextSibling.nodeType==3)
				sTmpVal		= oCheck[i].nextSibling.nextSibling.NodeId;
			else
				sTmpVal		= oCheck[i].nextSibling.NodeId;  //如果静态html结构发生改变这里也要注意
			//alert(oCheck[i].nextSibling.nextSibling.nodeType);
			if (('0' == oCheck[i].read) && ('' != oCheck[i].src) )
			{
				sTmpVal	= this.GetCheckUrlData(oCheck[i].src);
			}

			bEnsData	= ((splitflag + sReturnVal + splitflag).indexOf((splitflag + sTmpVal + splitflag)) > 0 ) ;

			if (!bEnsData)
			{
				sReturnVal += splitflag + sTmpVal ;
			}
		}
	}
	sReturnVal	= sReturnVal.replace(splitflag, '');
	return sReturnVal ;
}

GTree.prototype.GetAllCheckNodeValue=function(oflag)
{
	var sReturnVal	= "";
	var i ;
	var sTmpVal ; 
	var bEnsData ;

	var oCheck	= this.TreeConfig.oSrcDiv.getElementsByTagName("INPUT") ;
	var nLen	= oCheck.length ;	
	var splitflag=this.TreeConfig.CheckKey;
	if(oflag!=null && oflag!="")
		splitflag=oflag;
	for (i=0; i<nLen; i++)
	{
		if (oCheck[i].checked)
		{
			if(oCheck[i].nextSibling.nodeType==3)
				sTmpVal		= oCheck[i].nextSibling.nextSibling.NodeValue;
			else
				sTmpVal		= oCheck[i].nextSibling.NodeValue;  //如果静态html结构发生改变这里也要注意
			//alert(oCheck[i].nextSibling.nextSibling.nodeType);
			if (('0' == oCheck[i].read) && ('' != oCheck[i].src) )
			{
				sTmpVal	= this.GetCheckUrlData(oCheck[i].src);
			}

			//bEnsData	= ((splitflag + sReturnVal + splitflag).indexOf((splitflag + sTmpVal + splitflag)) > 0 ) ;

			//if (!bEnsData)//是否有重复的值
			{
				sReturnVal += splitflag + sTmpVal ;
			}
		}
	}
	sReturnVal	= sReturnVal.replace(splitflag, '');
	return sReturnVal ;
}


/************************************************
** SetCheck(p_oSrcElement, p_bAsync)
** 功能：
************************************************/
GTree.prototype.SetCheck=function(p_oSrcElement, p_bAsync)
{
	if (null == p_oSrcElement) return  ;
	var ochildnodes=this.GetChildElement(p_oSrcElement.parentElement, "container") ;
	//alert(ochildnodes);
	if(ochildnodes!=null && ochildnodes.className == "shown")
	this.SetChildrenCheck(p_oSrcElement, p_bAsync) ;
	//this.SetParentElementCheck(p_oSrcElement) ;
	return  ;
}

/************************************************
** SetParentElementCheck(p_oSrcElement) 
** 功能：
************************************************/
GTree.prototype.SetParentElementCheck=function(p_oSrcElement) 
{
	var bChecked	= p_oSrcElement.checked ;
	var oTargetNode	= p_oSrcElement.parentElement.parentElement ;

	if (bChecked)
	{
		
		var oCheck		= oTargetNode.getElementsByTagName("INPUT") ;
		var nLen		= oCheck.length ;	
		var i ;

		for (i=0; i<nLen; i++)
		{
			if (!oCheck[i].checked)
			{
				return ;
			}
		}
	}

	var oTargetNode		= this.GetChildElement(p_oSrcElement.parentElement.parentElement.parentElement, "checkbox") ;
		
	if (null != oTargetNode)
	{
		oTargetNode.checked	= bChecked ;
		this.SetParentElementCheck(oTargetNode) ;
	}

	return  ;
}
/************************************************
** SetChildrenCheck(p_oSrcElement, p_bAsync)
** 功能：***
************************************************/
GTree.prototype.SetChildrenCheck=function(p_oSrcElement, p_bAsync)
{

	var oContainerElement	= this.GetChildElement(p_oSrcElement.parentElement, "container") ;
	if (null == oContainerElement) return  ;

	var i ;
	var bChecked	= p_oSrcElement.checked ;
	var oCheck		= oContainerElement.getElementsByTagName("INPUT") ;
	var nLen		= oCheck.length ;		
	///////////////////////////////////////////////
	if ( (p_bAsync) && (bChecked) )
	{
		for (i=0; i<nLen; i++)
		{
			if(oCheck[i].disabled==true)//
			continue;//
			oCheck[i].checked = true; 
		}		
	}
	else
	{		
		for (i=0; i<nLen; i++)
		{
			if(oCheck[i].disabled==true)//
			continue;//
			oCheck[i].checked = bChecked; 
		}		
	}

	return  ;
}


/************************************************
** SetOneCheckData(p_oSrcElement)
** 功能：获得当前节点返回值:CheckData
************************************************/
GTree.prototype.SetOneCheckData=function(p_oSrcElement)
{
	var sReturnVal		= "";
	var sVal			= p_oSrcElement.value ;
	var sCheckDataSrc	= p_oSrcElement.src ;
	
	if ( (sVal.length < 1) || (!this.TreeConfig.CheckDataAsync) )
	{
		sReturnVal	= this.GetCheckUrlData(sCheckDataSrc) ;
			
		p_oSrcElement.value	= sReturnVal ;
	}

	return  ;
}

/************************************************
** GetCheckUrlData(p_sURL)
** 功能：获得URL返回值:CheckData
************************************************/
GTree.prototype.GetCheckUrlData=function(p_sURL)
{
	var sReturnVal	= "";
	var oXMLHttp	= new ActiveXObject ("Microsoft.XMLHTTP");
		oXMLHttp.Open("get", p_sURL, false);
		oXMLHttp.Send("");

	sReturnVal	= oXMLHttp.responseText;

	return sReturnVal ;
}

//-------------------------------------------------------------------------------------------------
//					节点事件 (自身状态改变)
//-------------------------------------------------------------------------------------------------

/************************************************
** SelectNode(p_oSrcElement)
************************************************/
GTree.prototype.SelectNode=function(p_oSrcElement)
{
	this.UpdateMessages(p_oSrcElement) ;
	this.HighlightNode(p_oSrcElement) ;
	this.LoadNodeContent(p_oSrcElement) ;    //点击事件
    this.ScrollIntoView(p_oSrcElement) ;  
	
	if ( (this.TreeConfig.UseCheck) && (!this.TreeConfig.CheckAsync) )
	{
		var oTargetNode	= this.GetChildElement(p_oSrcElement, "checkbox") ;
		if (null != oTargetNode)
		{			
			oTargetNode.click();
		}
	}
}


/************************************************
** HighlightNode(p_oSrcElement)
************************************************/
GTree.prototype.HighlightNode=function(p_oSrcElement)
{
    var oNewLabel ;
	var oOldLabel ;
	oNewLabel	= this.GetChildElement(p_oSrcElement, "label") ;
	if (this.TreeConfig.ChangeLeafImg)
	{
		var cType	= p_oSrcElement.type;		

		if (cType == "leaf")
		{
			oImg		= this.GetChildElement(p_oSrcElement, "img") ;
			oImg.src	= this.GetImgSrc(oImg.src,3) ;	// 改变图标
		}
		if ( (this.TreeConfig.TreeCurrentNode != "moonpiazza") && (p_oSrcElement != this.TreeConfig.TreeCurrentNode) )
		{
			if (this.TreeConfig.TreeCurrentNode.type == "leaf")
			{
				oImg		= this.GetChildElement(this.TreeConfig.TreeCurrentNode, "img") ;
				oImg.src	= this.GetImgSrc(oImg.src,0) ;	// 改变图标	
			}		
		}
	}
	if (oNewLabel != null)
    {
		oNewLabel.className	= this.TreeConfig.sClsCurrentFocus ;
		oNewLabel.classType	= this.TreeConfig.sClsCurrentFocus ;
		if ( (this.TreeConfig.TreeCurrentNode != "moonpiazza") && (p_oSrcElement != this.TreeConfig.TreeCurrentNode) )
		{
				oOldLabel	= this.GetChildElement(this.TreeConfig.TreeCurrentNode, "label") ;

				if (oOldLabel != null)
				{
					oOldLabel.className	= "treespan" ;
					oOldLabel.classType	= "treespan" ;
				}
		}
		//this.TreeConfig.TreeCurrentNode	= p_oSrcElement ;
	}
		//alert("aAA"+p_oSrcElement.type);
	if(p_oSrcElement.type=="container")
		this.TreeConfig.TreeCurrentNode=p_oSrcElement.children[0] ;
	else
		this.TreeConfig.TreeCurrentNode	= p_oSrcElement ;
}


/************************************************
** UpdateMessages(p_oSrcElement)
************************************************/
GTree.prototype.UpdateMessages=function(p_oSrcElement)
{
    oLabel	= this.GetChildElement(p_oSrcElement, "label") ;
    if(oLabel != null)
    {
       // window.defaultStatus	= oLabel.caption ;
        //top.document.caption	= oLabel.caption ;
    }
}


/************************************************
** LoadNodeContent(p_oSrcElement)
**执行点击事件
************************************************/
GTree.prototype.LoadNodeContent=function(p_oSrcElement)
{
    var oLabel ;
    var oLink ;

    oLabel = this.GetChildElement(p_oSrcElement, "label") ;

    if (oLabel != null)
    {
        oLink	= this.GetChildElement(oLabel, "link")
        if (oLink != null)
        {

            var sHref		= String(oLink.href) ;

			if(oLink.target)
            {
				this.GoLink(sHref, oLink.target) ;
            }
        }
    }
}

GTree.prototype.GoLink = function(h,t)
{}
/************************************************
** ScrollIntoView(p_oSrcElement)
************************************************/
GTree.prototype.ScrollIntoView=function(p_oSrcElement)
{
	if (this.TreeConfig.AutoScroll)
	{
		var nY = p_oSrcElement.offsetTop - (window.document.body.clientHeight / 2) ;
		var nX = p_oSrcElement.offsetLeft - 15 ;
		window.scrollTo(nX, nY) ;
	}
}



//-------------------------------------------------------------------------------------------------
//						节点事件 (子孙节点数据读取、显示、隐藏)
//-------------------------------------------------------------------------------------------------

/************************************************
** FoldElseBranch(p_oSrcElement)
************************************************/
GTree.prototype.FoldElseBranch=function(p_oSrcElement)
{
	//alert(this.TreeConfig.TreeCurrentNode);
	if (this.TreeConfig.TreeCurrentNode == p_oSrcElement)
	{
		return ;
	}

	if (this.TreeConfig.TreeCurrentNode != "moonpiazza")
	{
		var bIsAncestorNode		= false;
		var bIsOffspringNode	= false;

			bIsAncestorNode		= this.IsAncestorNode(this.TreeConfig.TreeCurrentNode, p_oSrcElement) ;

		if ( !bIsAncestorNode )
		{
			bIsOffspringNode	= this.IsAncestorNode(p_oSrcElement, this.TreeConfig.TreeCurrentNode) ;

			if ( !bIsOffspringNode )
			{
				this.FoldOffspringNode(p_oSrcElement.parentElement) ;			// 隐藏子孙节点

				this.FoldNode(this.TreeConfig.TreeCurrentNode) ;							// 隐藏自身

				this.FoldAncestorNode(p_oSrcElement, this.TreeConfig.TreeCurrentNode);		// 隐藏祖先节点		
			}
		}

	}	
}


/************************************************
** FoldOffspringNode(p_oSrcElement)
************************************************/
GTree.prototype.FoldOffspringNode=function(p_oSrcElement)
{				
	var i	= 0 ;
	var oChildren ;
	oChildren	= p_oSrcElement.children ;

	if (oChildren != null)
	{
		for (i=0; i < oChildren.length; i++)
		{
			this.FoldNode( oChildren[i] ) ;
			if (oChildren[i].type == "branch")
			{
				var oContainerElement = this.GetChildElement(oChildren[i], "container") ;

				this.FoldOffspringNode(oContainerElement) ;
			}

		}
	}
}


/*************************************************************************
** FoldAncestorNode(p_oSrcElement, p_oTargetNode)
*************************************************************************/
GTree.prototype.FoldAncestorNode=function(p_oSrcElement, p_oTargetNode)
{				
	var oSrcParentNode	= this.GetParentElement(p_oSrcElement) ;
	var oTargetNode		= this.GetParentElement(p_oTargetNode) ;
		
	while (oTargetNode != null)
	{
		if (oTargetNode == oSrcParentNode) 
		{
			break ;
		}
		this.FoldNode(oTargetNode) ;
		
		oTargetNode	= this.GetParentElement(oTargetNode) ;
	}		
}



/************************************************
** ShowHideNode(p_oSrcElement)
************************************************/
GTree.prototype.ShowHideNode=function(p_oSrcElement,isLabel)
{

    //如果没有这个属性,则为undefined,叶子节点和没有展开的树枝节点都为undefined或hidden
    if (p_oSrcElement.state == "shown")
	{
		if(!isLabel)
			this.FoldNode(p_oSrcElement) ;
	}
	else
	{
		if (!this.TreeConfig.ShowElseBranch)
		{
			this.FoldElseBranch(p_oSrcElement) ;
		}

		this.OutspreadNode(p_oSrcElement) ;//展开节点
	}

}


/************************************************
** FoldNode(p_oSrcElement)
************************************************/
GTree.prototype.FoldNode=function(p_oSrcElement)
{
	var oContainerElement ;
	var oImg ;

	oContainerElement = this.GetChildElement(p_oSrcElement, "container") ;

	if (oContainerElement != null)
	{
		oImg	= this.GetChildElement(p_oSrcElement, "img") ;

		p_oSrcElement.state			= "hidden" ;

		oContainerElement.className	= "hide" ;

		oImg.src	= this.GetImgSrc(oImg.src,1) ;	// 改变图标
		
	 
//		if (this.IsAncestorNode(this.TreeConfig.TreeCurrentNode, p_oSrcElement)==true)避免关闭两层以上节点多触发一次golink
//		{
//			//this.SelectNode(p_oSrcElement) ;
//		}
	}
}


/************************************************
** IsAncestorNode(p_oSrcElement, p_oTargetNode)
************************************************/
GTree.prototype.IsAncestorNode=function(p_oSrcElement, p_oTargetNode)
{
	var oTmpElement ;
	var bReturnValue	= false ;

	oTmpElement	= this.GetParentElement(p_oSrcElement) ;

	while (oTmpElement != null)
	{
		if (oTmpElement == p_oTargetNode)
		{
			bReturnValue	= true ;
			break ;
		}

		oTmpElement	= this.GetParentElement(oTmpElement) ;
	}

	return bReturnValue ;
}


/************************************************
** OutspreadNode(p_oSrcElement)
************************************************/
GTree.prototype.OutspreadNode=function(p_oSrcElement)
{
	var oContainerElement ;
	var oImg ;
	var oLabel ;
    //找到container节点,如果为叶子节点,则为null
	oContainerElement	= this.GetChildElement(p_oSrcElement, "container") ;
	if (oContainerElement != null)
	{
		oImg	= this.GetChildElement(p_oSrcElement, "img") ;

		if (oImg != null)
		{
			oImg.src	= this.GetImgSrc(oImg.src,2) ;	// 改变图标

			
			p_oSrcElement.state			= "shown" ;

			oContainerElement.className	= "shown" ;

			if (!this.TreeConfig.DataAsync)
			{
				var i;
				//每一个div为一个子节点			
				var oDivContainer	= oContainerElement.getElementsByTagName("Div") ;
				var nLen	= oDivContainer.length;
				for (i=0; i<nLen; i++)
				{
					if ('shown' == oDivContainer[i].state)
					{
						//oDivContainer[i].parentElement.state	= "hidden" ;//?who
						this.FoldNode(oDivContainer[i]);
					}
				}
			}
				this.LoadChildren(p_oSrcElement) ;
			if(!this.IsXmlVolid && oContainerElement.innerHTML=="") //如果XML加载的不合法，就返回
			{
				p_oSrcElement.state			= "hidden" ;
				oContainerElement.className	= "hide" ;
			}

		}
	}
}


/************************************************
** LoadChildren(p_oSrcElement)
**加载子节点
************************************************/
GTree.prototype.LoadChildren=function(p_oSrcElement)
{
    var cXMLSrc ;
    var oLabel ;
    var oContainerElement	= this.GetChildElement(p_oSrcElement, "container") ;
    if (oContainerElement != null)
    {
        //取到为树枝节点label
		oLabel = this.GetChildElement(p_oSrcElement, "label");
		if ( (oContainerElement.children.length == 0) || ( (!this.TreeConfig.DataAsync) && (oContainerElement.children.length > 0) ) )
	    //if(!this.TreeConfig.DataAsync)
        {       
		  if (oLabel != null)
            {
                
                cXMLSrc	= oLabel.xmlsrc ;
                if(cXMLSrc==""&&!this.TreeConfig.DataAsync)
				{
				///////////////////////////////////////如果cXMLSrc为空则为根数据源
						cXMLSrc = this.xmlfilename;
					
					if(oLabel.parentxmlsrc!="")
						cXMLSrc = oLabel.parentxmlsrc;
					if(typeof(oLabel.NodeId)=="undefined" )
					{
						alert("错误：xml数据源定义中存在没有NodeId属性的节点，更新失败！");
						return;
					}
					
					this.GetXML(cXMLSrc, oContainerElement,oLabel.NodeId) ;
				}
				else
				{
					this.GetXML(cXMLSrc, oContainerElement) ;
				}
				//alert(cXMLSrc);
            }            
        }
//////////////////////////////////////////////////注释一下
//		if (this.TreeConfig.UseCheck)
//		{
//			var oTargetNode	= this.GetChildElement(p_oSrcElement, "checkbox") ;
//			if (null != oTargetNode)
//			{
//				this.SetChildrenCheck(oTargetNode, false) ;
//			}
//		}
    }
    return  ;
}



//-------------------------------------------------------------------------------------------------
//					Mouse 事件 (Click) and (Down, Over, Out)
//-------------------------------------------------------------------------------------------------

/************************************************
** MouseClick(p_oSrcElement)
************************************************/
GTree.prototype.MouseClick=function(p_oSrcElement)
{
	var sSrcElementType	= p_oSrcElement.type ;
	var oTargetNode		= p_oSrcElement.parentElement ;
    //点击文本时执行
    if (sSrcElementType == "label")
	{
		this.clickText(p_oSrcElement);
		if(oTargetNode.type=="branch"&&this.xmlsrc!="")
		{
			oTargetNode.lastChild.previousSibling.xmlsrc=this.xmlsrc;
		}
		this.ShowHideNode(oTargetNode,true) ;//true是点击文本节点
		this.SelectNode(oTargetNode) ;	
		if (this.TreeConfig.IsAutoGoFisrtLeaf)
		{
			var	oParentElement		= this.GetParentElement(p_oSrcElement) ;
			var oContainerElement	= this.GetChildElement(p_oSrcElement.parentElement, "container") ;
			if (null != oContainerElement)
				this.GoFisrtLink(oContainerElement.getElementsByTagName("DIV")[0]) ;
		}
		this.loadRightMouseMenuByNode();
		return ;
	}
	//点击图片时执行
    else if(sSrcElementType == "img")
    {	
		//this.TreeConfig.TreeCurrentNode = oTargetNode;
		this.clickImg(oTargetNode.lastChild.previousSibling);
		if (oTargetNode.type == "leaf")
		{
			//ShowHideNode(oTargetNode) ;
			this.SelectNode(oTargetNode) ;
		}
		else
		{
			if (this.TreeConfig.ImgAsync) 
			{
				this.ScrollIntoView(oTargetNode) ;
				this.HighlightNode(oTargetNode) ;//modi nature 用于点图片关闭其它分支
				//ShowHideNode(oTargetNode) ;
			}
			else
			{				
				this.SelectNode(oTargetNode) ;
			}
			if(this.xmlsrc!="")
			{
				oTargetNode.lastChild.previousSibling.xmlsrc=this.xmlsrc;
			}
		}
		//不管是否叶子节点,都调用该节点
		this.ShowHideNode(oTargetNode) ;//原来在else if的后边  展开收缩节点
		this.loadRightMouseMenuByNode();
		return ;
	}
    else if(sSrcElementType == "checkbox")
    {
		if (this.TreeConfig.CheckShowBranch)
		{
			this.MouseClick(this.GetChildElement(p_oSrcElement.parentElement, "label"));
		}

		if (!this.TreeConfig.CheckAsync)
		{
			oTargetNode	= p_oSrcElement.parentElement ;
			this.SelectNode(oTargetNode) ;
		}

		if ("" != p_oSrcElement.src)
		{
			this.SetOneCheckData(p_oSrcElement);	
		}

		this.SetCheck(p_oSrcElement, true) ;
		this.loadRightMouseMenuByNode();
		return ;
	}

}
GTree.prototype.clickImg=function(node)
{
}
GTree.prototype.clickText=function(node)
{
	//alert("txt;"+title+":"+id);
	this.clickImg(node);
}


/************************************************
** MouseDblClick(p_oSrcElement)
************************************************/

GTree.prototype.MouseDblClick = function(p_oSrcElement){
	//alert(p_oSrcElement.previousSibling.type);
	if(p_oSrcElement.previousSibling!=null&&(p_oSrcElement.previousSibling.type=="checkbox"||p_oSrcElement.previousSibling.type=="radio")){
		p_oSrcElement.previousSibling.checked=true;
	}
	this.dblclickText(p_oSrcElement);
}
GTree.prototype.dblclickText = function(node){

}

/************************************************
** Mouse 事件 (Down, Over, Out)
** NodeMouseDown(p_oSrcElement)
** NodeMouseOver(p_oSrcElement)
** NodeMouseOut(p_oSrcElement)
** ChangeNodeCls(p_oSrcElement, p_sClassName)
************************************************/
GTree.prototype.NodeMouseDown=function(p_oSrcElement)
{
	this.clearContextMenu();
	return this.ChangeNodeCls(p_oSrcElement, this.TreeConfig.sClsMouseDown) ;
}

GTree.prototype.NodeMouseOver=function(p_oSrcElement)
{
	return this.ChangeNodeCls(p_oSrcElement, this.TreeConfig.sClsMouseOver) ;
}

GTree.prototype.NodeMouseOut=function(p_oSrcElement)
{
	return this.ChangeNodeCls(p_oSrcElement, "") ;
}

GTree.prototype.ChangeNodeCls=function(p_oSrcElement, p_sClassName)
{
	if (p_sClassName == "")
	{//alert(p_oSrcElement.classType);
		if(p_oSrcElement.classType!=null && p_oSrcElement.classType!="")
			p_oSrcElement.className	= p_oSrcElement.classType ;
		else
			p_oSrcElement.className	="treespan";
	}
	else
	{
		p_oSrcElement.className	= p_sClassName ;
	}			
//alert(p_oSrcElement.className);
	return true ;
}
GTree.prototype.getValue=function(oTarget)
{
	if(this.TreeConfig.TreeCurrentNode=="moonpiazza")
	{
		alert("请选择节点！");
		return "";
	}
	return eval("this.TreeConfig.TreeCurrentNode.getElementsByTagName('span')[0]."+oTarget);
}
GTree.prototype.insertNodeMenu=function(txt,fun,des)
{
	var hd = '<div  style="display:none;position:absolute;" class="rightmenu-div" onselectstart="return false" ondragstart="return false"><TABLE  border="0" cellspacing="0" cellpadding="0">';
	for(var i=0;i<txt.length;i++)
	{
		hd += '<TR>';
		hd +='<TD onclick="'+fun[i]+';'+this.insttreename+'.clearContextMenu()" nowrap onmouseover="this.className=\'rightmenu-over\'" onmouseout="this.className=\'rightMenu-right\'"   class="rightMenu-right" title="'+des[i]+'">'+txt[i]+'</TD></TR>';
	}
	hd += '</TABLE></div>';
	this.initContextMenu(hd,0);
}

GTree.prototype.insertLeafMenu=function(txt,fun,des)
{
	var hd = '<div  style="display:none;position:absolute;border:1px solid #99ccff;" onselectstart="return false" ondragstart="return false"><TABLE  border="0" cellspacing="0" cellpadding="0">';
	for(var i=0;i<txt.length;i++)
	{
		hd += '<TR>';
		hd +='<TD onclick="'+fun[i]+';'+this.insttreename+'.clearContextMenu()" nowrap onmouseover="this.className=\'rightmenu-over\'" onmouseout="this.className=\'rightMenu-right\'" class="rightMenu-right"  title="'+des[i]+'">'+txt[i]+'</TD></TR>';
	}
	hd += '</TABLE></div>';

	this.initContextMenu(hd,1);
}
GTree.prototype.insertMenuByNode=function(nodeId,txt,fun,des)
{
	//获取当前节点对象所在的div
	var divObject = this.GetNodeById(nodeId);
	if(divObject!=null){
	var nodeType = divObject.type;
	//判断节点的类型是leaf还是branch，获取到div
	if(divObject.initmenu!="true"){
		if(nodeType=="branch"){
			var hd = '<div class="rightmenu-div" onselectstart="return false" ondragstart="return false"><TABLE  border="0" cellspacing="0" cellpadding="0">';
			for(var i=0;i<txt.length;i++)
			{
				hd += '<TR>';
				hd +='<TD onclick="'+fun[i]+';'+this.insttreename+'.clearContextMenu()" nowrap onmouseover="this.className=\'rightmenu-over\'" onmouseout="this.className=\'rightMenu-right\'"   class="rightMenu-right" title="'+des[i]+'">'+txt[i]+'</TD></TR>';
			}
				hd += '</TABLE></div>';
				var ospan=divObject.getElementsByTagName("span");
					ospan[0].menu=hd;
					ospan[0].initmenu="true";
				this.initContextMenu("<div id="+nodeId+" style='display:none;position:absolute;'></div>",2);				
			}else{
			   var hd = '<div onselectstart="return false" ondragstart="return false"><TABLE  border="0" cellspacing="0" cellpadding="0">';
			   for(var i=0;i<txt.length;i++)
		    {
					hd += '<TR>';
					hd +='<TD onclick="'+fun[i]+';'+this.insttreename+'.clearContextMenu()" nowrap onmouseover="this.className=\'rightmenu-over\'" onmouseout="this.className=\'rightMenu-right\'" class="rightMenu-right"  title="'+des[i]+'">'+txt[i]+'</TD></TR>';
				}
					hd += '</TABLE></div>';
					var ospan=divObject.getElementsByTagName("span");
					ospan[0].menu=hd;
					ospan[0].initmenu="true";
					//this.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
			}
		}
		}
}
//根据nodeValue定制右键菜单
GTree.prototype.insertMenuByNodeValue=function(nodeId,txt,fun,des)
{
	//获取当前节点对象所在的div
	var divObjectArr = this.GetNodeByValue(nodeId);
	for(var jj=0;jj<divObjectArr.length;jj++)
	{
		var divObject=divObjectArr[jj];
	if(divObject!=null){
	var nodeType = divObject.type;
	//alert(nodeType);
	//判断节点的类型是leaf还是branch，获取到div
	if(divObject.initmenu!="true"){
		if(nodeType=="branch"){
			var hd = '<div class="rightmenu-div" onselectstart="return false" ondragstart="return false"><TABLE  border="0" cellspacing="0" cellpadding="0">';
			for(var i=0;i<txt.length;i++)
			{
				hd += '<TR>';
				hd +='<TD onclick="'+fun[i]+';'+this.insttreename+'.clearContextMenu()" nowrap onmouseover="this.className=\'rightmenu-over\'" onmouseout="this.className=\'rightMenu-right\'"   class="rightMenu-right" title="'+des[i]+'">'+txt[i]+'</TD></TR>';
			}
				hd += '</TABLE></div>';
				var ospan=divObject.getElementsByTagName("span");
				
					ospan[0].menu=hd;
					//alert(ospan[0].outerHTML);
					//alert(hd);
					ospan[0].initmenu="true";
				//this.initContextMenu("<div id="+nodeId+" style='display:none;position:absolute;'></div>",2);				
			}else{
			   var hd = '<div onselectstart="return false" ondragstart="return false"><TABLE  border="0" cellspacing="0" cellpadding="0">';
			   for(var i=0;i<txt.length;i++)
		    {
					hd += '<TR>';
					hd +='<TD onclick="'+fun[i]+';'+this.insttreename+'.clearContextMenu()" nowrap onmouseover="this.className=\'rightmenu-over\'" onmouseout="this.className=\'rightMenu-right\'" class="rightMenu-right"  title="'+des[i]+'">'+txt[i]+'</TD></TR>';
				}
					hd += '</TABLE></div>';
					var ospan=divObject.getElementsByTagName("span");

					ospan[0].menu=hd;
					//alert(ospan[0].outerHTML);
					//alert(hd);
					ospan[0].initmenu="true";
					//this.initContextMenu("<div style='display:none;position:absolute;'></div>",2);
			}
		}
		}
	}
}

GTree.prototype.loadContextMenu =function()
{
	//this.TreeConfig.TreeCurrentNode=window.event.srcElement;

	
	if(window.event.srcElement.parentElement.parentElement.type=="branch")
	{
	this.HighlightNode(window.event.srcElement.parentElement.parentElement);
	}
else
		this.HighlightNode(window.event.srcElement.parentElement);
/////////////////////////////////////////////右键使所点节点成为当前节点
	
	
	window.event.cancelBubble = true;
	window.event.returnValue = false;
	//alert("pp"+window.event.srcElement.parentElement.parentElement);
	//alert(window.event.srcElement.parentElement.parentElement.type);
	if(window.event.srcElement.parentElement.parentElement.type=="branch")
	{
		if(window.event.srcElement.parentElement.menu!=null && window.event.srcElement.parentElement.menu!="")
		{//alert(this.contextMenuByNode);
			if(this.contextMenuByNode==null)
			return;
			this.contextMenuByNode.innerHTML=	window.event.srcElement.parentElement.menu;
			this.contextMenuByNode.style.left = window.event.clientX-5+document.body.scrollLeft;

			//this.contextMenuByNode.style.top = window.event.clientY-5+document.body.scrollTop;
			this.contextMenuByNode.style.display = "block";
			if(parseInt(this.contextMenuByNode.offsetHeight)+window.event.clientY > document.body.clientHeight)
				this.contextMenuByNode.style.top = window.event.clientY+document.body.scrollTop-parseInt(this.contextMenuByNode.offsetHeight);
			else
				this.contextMenuByNode.style.top = window.event.clientY-5+document.body.scrollTop;
			this.contextMenuByNode.style.display = "block";
			//alert(2);
			//window.scrollTo(0,window.event.clientY-5);
		}
		else
		{
		if(this.contextNodeMenu==null)
			return;
		this.contextNodeMenu.style.left = window.event.clientX-5+document.body.scrollLeft ;
		//this.contextNodeMenu.style.top = window.event.clientY-5+document.body.scrollTop;
		this.contextNodeMenu.style.display = "block";
		//alert(parseInt(this.contextNodeMenu.offsetHeight)+","+window.event.clientY +","+ document.body.clientHeight);
		if(parseInt(this.contextNodeMenu.offsetHeight)+window.event.clientY > document.body.clientHeight)
				this.contextNodeMenu.style.top = window.event.clientY+document.body.scrollTop-parseInt(this.contextNodeMenu.offsetHeight);
			else
				this.contextNodeMenu.style.top = window.event.clientY-5+document.body.scrollTop;
		this.contextNodeMenu.style.display = "block";
		//alert(this.contextNodeMenu.style.top);
		//window.scrollTo(0,window.event.clientY-5);
		}
	}
	else
	{
		if(window.event.srcElement.menu!=null&& window.event.srcElement.menu!="")
		{
			if(this.contextMenuByNode==null)
			return;
			this.contextMenuByNode.innerHTML=	window.event.srcElement.menu;
			this.contextMenuByNode.style.display = "block";
			var top1=(parseInt(window.event.clientY)+parseInt(this.contextMenuByNode.offsetHeight));
			if((parseInt(window.event.clientY)+parseInt(this.contextMenuByNode.offsetHeight))>=document.body.clientHeight)
				this.contextMenuByNode.style.top = window.event.clientY-5+parseInt(top1-document.body.clientHeight)+document.body.scrollTop;
			this.contextMenuByNode.style.left = window.event.clientX-5+document.body.scrollLeft;
			this.contextMenuByNode.style.top = window.event.clientY-5+document.body.scrollTop;
			
			this.contextMenuByNode.style.display = "block";
			//alert(1);
			//window.scrollTo(0,window.event.clientY-5);
		}
		else
		{
		if(this.contextLeafMenu==null)
			return;
		this.contextLeafMenu.style.display = "block";
		if(parseInt(this.contextLeafMenu.offsetHeight)+window.event.clientY > document.body.clientHeight)
				this.contextLeafMenu.style.top = window.event.clientY+document.body.scrollTop-parseInt(this.contextLeafMenu.offsetHeight);
			else
				this.contextLeafMenu.style.top = window.event.clientY-5+document.body.scrollTop;

		this.contextLeafMenu.style.left = window.event.clientX-5+document.body.scrollLeft ;
	
		this.contextLeafMenu.style.display = "block";
		//alert(1);
			//window.scrollTo(0,window.event.clientY-5);
		}
	}
}
GTree.prototype.initContextMenu=function(ob,flag)
{
	document.body.insertAdjacentHTML("beforeEnd",ob);
	if(flag==0)
	{
		if(this.contextNodeMenu != null)
		{
		this.contextNodeMenu.style.display = "none";}
		this.contextNodeMenu = document.body.childNodes(document.body.childNodes.length-1);	
	}
	else if(flag==1)
	{
		if(this.contextLeafMenu!=null)
		{
			this.contextLeafMenu.style.display = "none";
		}
		this.contextLeafMenu = document.body.childNodes(document.body.childNodes.length-1);	
	}else{
		if(this.contextMenuByNode!=null)
		{
			this.contextMenuByNode.style.display = "none";
			
		}
		this.contextMenuByNode = document.body.childNodes(document.body.childNodes.length-1);	
		}
}
GTree.prototype.clearContextMenu=function(t)
{
		if(this.contextNodeMenu!=null)
		{
			var obj=event.srcElement;
			//if(!this.contextNodeMenu.contains(obj))
			this.contextNodeMenu.style.display = "none";
		}
		if(this.contextLeafMenu!=null)
		{
			var obj=event.srcElement;
			//if(!this.contextNodeMenu.contains(obj))
			this.contextLeafMenu.style.display = "none";
		}
		if(this.contextMenuByNode!=null)
		{
			var obj=event.srcElement;
			//if(!this.contextMenuByNode.contains(obj))
			this.contextMenuByNode.style.display = "none";
		}
}
GTree.prototype.clearContextMenuOnBody=function(t)
{//alert(event.srcElement.tagName);
//document.all("tt").value=this.contextNodeMenu;
	//if(event.srcElement.tagName!="TD"||t==true)
	{
		if(this.contextNodeMenu!=null)
		{
			var obj=event.srcElement;
			if(!this.contextNodeMenu.contains(obj))
			this.contextNodeMenu.style.display = "none";
		}
		if(this.contextLeafMenu!=null)
		{
			var obj=event.srcElement;
			if(!this.contextLeafMenu.contains(obj))
			this.contextLeafMenu.style.display = "none";
		}
				if(this.contextMenuByNode!=null)
		{
			var obj=event.srcElement;
			if(!this.contextMenuByNode.contains(obj))
			this.contextMenuByNode.style.display = "none";
		}
	}
}

GTree.prototype.getCurrentNodePath=function()
{
	var cnode = this.TreeConfig.TreeCurrentNode;
	var cpath = new Array();
	var n;
	while(cnode.tagName=="IMG"||cnode.tagName=="DIV")
	{
		n = cnode.children[0];//alert(n.outerHTML);
		if(n.tagName=="IMG"&&n.type=="img")
		{
			cpath[cpath.length] = n.NodeId;
			
		}
		cnode = cnode.parentElement;
	}//alert(cpath);
	return cpath;
}
GTree.prototype.getCurrentNode=function()
{
	return this.TreeConfig.TreeCurrentNode;
}
GTree.prototype.refreshCurrNode=function()
{
	var cnode = this.TreeConfig.TreeCurrentNode;
	var n;
	while(cnode.tagName=="IMG"||cnode.tagName=="DIV")
	{
		n = cnode.children[0];//alert(n.outerHTML);
		if(n.tagName=="IMG"&&n.type=="img")
		{
			n.click();
			break;
			alert("刷新错误！");
		}
		cnode = cnode.parentElement;
	}
}
//根据ID刷新节点
GTree.prototype.refreshNodeById=function(nodeid)
{
	if(nodeid==null || nodeid=="") return;
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	for(var i=0;i<imgar.length;i++)
	{
		if(imgar[i].NodeId == nodeid)
		{
			var oNode=imgar[i].parentElement;
			if(oNode.type=="leaf")
			{
			var oop=this.GetParentElement(oNode);
			if(oop!=null)
				{
				var oimg=oop.getElementsByTagName("img")[0];
				var odelnode=oop.children[oop.children.length-1];
				odelnode.innerHTML='';
				odelnode.className="hide";
				oimg.click();
				oimg.click();
				return;
				}
			}
			//alert(oNode.children[oNode.children.length-1].outerHTML);
			var DelNode=oNode.children[oNode.children.length-1];
			//alert(oNode.outerHTML);
			//DelNode.removeNode(true);
			if(DelNode.children.length>0)
			DelNode.innerHTML="";
			DelNode.className="hide";
			//alert(oNode.outerHTML);
			imgar[i].click();
			//alert(imgar[i].NodeId);
			imgar[i].click();
			break;
		}
	}
}
/******************************
*
*  节点执行开闭  其中一个动作
*
********************************/
GTree.prototype.refreshNodeByIdOnce=function(nodeid)
{
	if(nodeid==null || nodeid==="") return;
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	for(var i=0;i<imgar.length;i++)
	{
		if(imgar[i].NodeId == nodeid)
		{
			var oNode=imgar[i].parentElement;
			//alert(oNode.children[oNode.children.length-1].outerHTML);
			var DelNode=oNode.children[oNode.children.length-1];
			//DelNode.removeNode(true);
			if(DelNode.children.length>0)
			DelNode.innerHTML="";
			DelNode.className="hide";			
			imgar[i].click();	
			break;
		}
	}
}
//根据ID展开节点
GTree.prototype.openNodeById=function(nodeid,flag)
{
	if(nodeid==null || nodeid==="") return;
	if(flag==null || flag=="") flag=",";
	var arrid=nodeid.toString().split(flag);
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	for(var j=0;j<arrid.length;j++)
	{
		for(var i=0;i<imgar.length;i++)
		{
			if(imgar[i].NodeId == arrid[j])
			{
				var oNode=imgar[i].parentElement;
				//alert(oNode.children[oNode.children.length-1].outerHTML);
				var DelNode=oNode.children[oNode.children.length-1];
				if(DelNode.className=="hide")
				{
				//DelNode.className="hide";
				//alert(oNode.outerHTML);
				imgar[i].click();//alert(imgar[i].NodeId);
				//imgar[i].click();
				}
				//alert(imgar[i].parentElement);
				this.HighlightNode(imgar[i].parentElement) ;
			}
		}
	}
}
//根据ID隐藏节点
GTree.prototype.hidNodeById=function(nodeid)
{
	if(nodeid==null || nodeid==="") return;
	var arrid=nodeid.toString().split(",");
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	for(var j=0;j<arrid.length;j++)
	{
		for(var i=0;i<imgar.length;i++)
		{
			if(imgar[i].NodeId == arrid[j])
			{
				var oNode=imgar[i].parentElement;
				oNode.style.display="none";
			}
		}
	}
}

//展开跟节点
GTree.prototype.openRootNode=function()
{
	var imgar = this.TreeConfig.oSrcDiv.getElementsByTagName("img");
	if(imgar.length>0)
	var oNode=imgar[0].parentElement;
	var DelNode=oNode.children[oNode.children.length-1];
	DelNode.className="hide";
	imgar[0].click();
}
//获取所选节点的所有下级节点(二维数组)
GTree.prototype.getMyNodes = function(p_sSrcElement)
{
    if(p_sSrcElement ==null || p_sSrcElement=="") return ;
    this.allxmlsrc = this.xmlsrc.substring(0,this.xmlsrc.lastIndexOf("=")+1);
    var oNodesId = p_sSrcElement.split(",");
    var oNodes = new Array();
    for(var i=0;i<oNodesId.length;i++){
        var sMiddeNodesId = "";
        oNodes[i] = this.GetNodeById(oNodesId[i]);
        var xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async="false";
        xmlDoc.loadXML(getXmlByXmlhttp(this.allxmlsrc+oNodesId[i]));
       if((xmlDoc != null) && (xmlDoc.xml != "") &&(xmlDoc.childNodes[1].hasChildNodes()))
       {
         var x=xmlDoc.getElementsByTagName("TreeNode");
         for(var j=0;j<x.length;j++)
         {
            tNodeId = x.item(j).getAttribute("NodeId");
            this.oArray.push({nodeId:x.item(j).getAttribute("NodeId"),text:x.item(j).getAttribute("Title"),nodeValue:x.item(j).getAttribute("NodeValue"),checkData:x.item(j).getAttribute("CheckData")});
            sMiddeNodesId = sMiddeNodesId +tNodeId+",";
          }
        
            sMiddeNodesId = sMiddeNodesId.substring(0,sMiddeNodesId.length-1);
            this.oArray.concat(this.getMyNodes(sMiddeNodesId)); 
       }      
     }  
     return  this.oArray;
}
GTree.prototype.getChildrenNodes=function(p_sSrcElement)
{ 
    if(this.oArray.length && this.oArray.length>0){
        this.oArray.length =0;
    }
   return this.getMyNodes(p_sSrcElement);
    }
function getXmlByXmlhttp(p_sUrl)
	{
	if(p_sUrl==null)
	{
	alert("传递的URL不能为空！");
	return;
	}
	try
		{
		var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlhttp==null)
		{
		alert("创建XMLHTTP对象失败!"+ex.description);
		return ;
		}
		xmlhttp.open("POST",p_sUrl,false);
		xmlhttp.send();
		return xmlhttp.responseText;
		}catch(ex)
		{
		alert("XMLHTTP对象传递数据失败!"+ex.description);
		return "";
		}
	}
//用于排序树，获取选中节点的所有子节点ID，不包括当前选中的节点(二维数组)
GTree.prototype.getSortedChildrenNodes =function(p_sSrcElement)
{
        if(p_sSrcElement ==null || p_sSrcElement=="") return ;
        var oNodesId = p_sSrcElement.split(",");
        var oChildrenNodes = new Array();
        var oNodes = new Array();
        for(var i=0;i<oNodesId.length;i++){
            var sMiddeNodesId = "";
            oNodes[i] = this.GetNodeById(oNodesId[i]);
                oContainerElement = oNodes[i].getElementsByTagName("DIV");
                for(var j=0;j<oContainerElement.length;j++){
                    if(oContainerElement[j].type =="branch"){
                        oChildrenNodes.push({nodeId:oContainerElement[j].lastChild.previousSibling.NodeId,text:oContainerElement[j].children[3].firstChild.innerHTML});
                        }
                        else if(oContainerElement[j].type =="leaf"){
                            oChildrenNodes.push({nodeId:oContainerElement[j].lastChild.NodeId,text:oContainerElement[j].lastChild.innerHTML});
                            }
                            else{
                                    continue;
                                }
                    }            
        }
        return oChildrenNodes;
}
