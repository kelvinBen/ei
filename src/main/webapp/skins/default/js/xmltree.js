/******************************************************************************************
*                      xml tree 1.1
*       有选择框，没有文件夹图片，没有连接接点的连线，
*******************************************************************************************/

function node() {
	this.id			=	"";
	this.text		=	"";
	this.overColor		=	"";
	this.paddingLeft = "";//左边缩进
	this.paddingTop="";  //上边缩进
	this.backgroundColor = "";
	this.type		=	"";
	this.spaceWidth="";    //图片和图片以及文字与图片之间间距
	this.underLine = null;    //鼠标移动到字上时，文字是否带下划线
	this.textOverColor = "";//鼠标移动到字上时，文字的颜色
	this.fontSize="";
	this.open       =   "";
	this.openFlag   =   "";
	this.closeFlag  =   "";
	//this.openFolder =   "";
	//this.closeFolder=   "";
	this.urlImage="";
	this.autoRefresh =null; //总是重新加载外部xml。
	this.subMenu	=	null;
	this.box="";         //单选或多选
	this.menuNode = new Array();
	this.root = null;
	this.islast=false;
	this.value1="";
	this.isChecked=false;//checkbox是否选中
	this.newClass=null	;				//新的节点样式  
	this.chkDisabled=false;		//标识复选框是否disabled
}
//叶子接点
function leafnode() {
	this.id="";
	this.type="";
	this.backgroundColor = "";
	this.text = "";
	this.textColor = "";
	this.overColor="";
	this.fontSize = "";
	this.spaceWidth="";    //图片和图片以及文字与图片之间间距
	this.underLine = null;    //鼠标移动到字上时，文字是否带下划线
	this.textOverColor = "";//鼠标移动到字上时，文字的颜色
	this.paddingLeft = "";//左边缩进
	this.paddingTop="";  //上边缩进
	this.textOverColor="";
	this.urlImage="";
	this.box="";         //单选或多选
	this.root = null;
	this.value1="";
	this.isChecked=false;
	this.newClass=null	;				//新的节点样式   
	this.chkDisabled=false;		//标识复选框是否disabled
	this.height="";//为模板定制添加
	this.width="";//为模板定制添加
}
//其孩子节点的信息在另一个xml文件内的接点
function refnode() {
	this.id="";
	this.ref="";  //外部XML文件
	this.isLoadXml=false;//表示是否已经加载XML
	this.subMenu	=	null;
	this.open="false";
	this.backgroundColor = "";
	this.overColor = "";
	this.spaceWidth="";    //图片和图片以及文字与图片之间间距
	this.underLine = null;    //鼠标移动到字上时，文字是否带下划线
	this.textOverColor = "";//鼠标移动到字上时，文字的颜色
	this.textOverColor = "";
	this.fontSize = "";
	this.openFlag   =   "";
	this.closeFlag  =   "";
	//this.openFolder =   "";
	//this.closeFolder=   "";
	this.paddingLeft = "";//左边缩进
	this.paddingTop="";  //上边缩进
	this.autoRefresh=null; //总是重新加载外部xml。
	this.box="";         //单选或多选
	this.menuNode = new Array();
	this.root = null;
	this.value1="";
	this.isChecked=false;
	this.newClass=null	;				//新的节点样式  
	this.chkDisabled=false;		//标识复选框是否disabled
}
//树根
function XMLTree(menuName) {

	 if(menuName)	{
			var s='window.'+menuName+'=this';
			eval(s);
		}else	{
			return; 
		}
	this.id="";
	this.xmlDoc = null;
	this.xmlRoot=null;
	this.subMenu = null;
	this.menuName = menuName;
	this.root = null;		//外部XML文件的root
	this.flag= "false";		//标志REF接点是否展开
	this.lastNode=null;     //上一次访问的父接点
	this.autoRefresh="true"; //总是重新加载外部xml。
	this.open="false";		//"true"为接点展开，"false"为接点关闭, 默认为"false"
	this.dblClick="true";    // "true"为允许有双击事件，"false"为不允许有双击事件，默认为"false"
	this.openAction="true";  //  接点展开时，已展开的接点的行为,"true"为已展开的接点全部关闭，"false"为已展开的接点全部保持不变.
	this.defClass="treespan";				//当前节点样式    
	this.defMouseOverClass= "clsMouseOver" ;					//鼠标滑过样式
	this.defMouseDownClass="clsMouseDown" ;					//鼠标按下时样式
	this.checkStyle="0";  //点击checkbox的动作样式,默认为0,选中子节点及父节点;1为只选当前节点
	this.topindex=1;//全局变量，控制图片相对DIV的top缩进
	this.isAdd=true;//全局变量,增加竖线的标识
	//样式属性
	this.openFlag="images/openflag.gif";
	this.closeFlag="images/closeflag.gif";
	this.urlImage="images/url.gif";
	this.backgroundColor = "#ffffff";
	this.overColor = "#eeeeee";
	this.textColor = "#000000";
	this.spaceWidth="2px";    //图片和图片以及文字与图片之间间距
	this.underLine = "true";    //鼠标移动到字上时，文字是否带下划线
	this.fontSize = "12px";
	this.textOverColor = "red";//鼠标移动到字上时，文字的颜色
	this.paddingLeft = "15px";//左边缩进
	this.paddingTop="0px";  //上边缩进
	this.text=null;           //记录XML接点
	this.box="";    //单选或多选
	this.tuxian=null;		//标志突显的接点
	this.ntuxian=null;		//标志不突显的接点
	this.checkstr="";		//选择的ID值
	this.checkTextstr="";		//选择的TEXT值
	this.checkLaststr="";		//选择的最后一层的ID值
	this.checkLastTextstr="";		//选择的最后一层的TEXT值
	this.value1="";
	this.checkLastValue1str="";//选择的最后一层的value1值
}
//向接点添加一个子接点
node.prototype.addNode = function (id,type,text,url,newClass,autoRefresh,openFlag,closeFlag,open,box,value1,isChecked,chkDisabled)
	{
	this.menuNode[this.menuNode.length] = new node();
	this.menuNode[this.menuNode.length-1].id = (id == null) ? "" : id;
	this.menuNode[this.menuNode.length-1].type = (type == null) ? "" : type;
	this.menuNode[this.menuNode.length-1].text = (text == null) ? "" :text;
	this.menuNode[this.menuNode.length-1].url = (url == null) ? "" : url;
	this.menuNode[this.menuNode.length-1].newClass = (newClass == null) ? this.defClass: newClass;
	this.menuNode[this.menuNode.length-1].autoRefresh = (autoRefresh == null) ? "" : autoRefresh;
	this.menuNode[this.menuNode.length-1].openFlag = (openFlag == null) ? "" : openFlag;
	this.menuNode[this.menuNode.length-1].closeFlag = (closeFlag == null) ? "" : closeFlag;
	this.menuNode[this.menuNode.length-1].open = (open == null) ? "" : open;
	this.menuNode[this.menuNode.length-1].box = (box == null) ? "" : box;
	this.menuNode[this.menuNode.length-1].value1 = (value1 == null) ? "" : value1;
	this.menuNode[this.menuNode.length-1].isChecked = (isChecked == null) ? "" : isChecked;
	this.menuNode[this.menuNode.length-1].chkDisabled = (chkDisabled == null) ? false : chkDisabled;
	this.menuNode[this.menuNode.length-1].root = this;
}
//向接点添加一个叶子接点
node.prototype.addleafNode = function (id,type,text,url,newClass,urlImage,box,value1,isChecked,chkDisabled,height,width) {
	this.menuNode[this.menuNode.length] = new leafnode();
	this.menuNode[this.menuNode.length-1].id = (id == null) ? "" : id;
	this.menuNode[this.menuNode.length-1].type = (type == null) ? "" : type;
	this.menuNode[this.menuNode.length-1].text = (text == null) ? "" :text;
	this.menuNode[this.menuNode.length-1].url = (url == null) ? "" : url;
	this.menuNode[this.menuNode.length-1].newClass = (newClass == null) ? "" : newClass;
	this.menuNode[this.menuNode.length-1].urlImage = (urlImage == null) ? "" : urlImage;
	this.menuNode[this.menuNode.length-1].box = (box == null) ? "" : box;
	this.menuNode[this.menuNode.length-1].value1 = (value1 == null) ? "" : value1;
	this.menuNode[this.menuNode.length-1].isChecked = (isChecked == null) ? "" : isChecked;
	this.menuNode[this.menuNode.length-1].chkDisabled = (chkDisabled == null) ? false : chkDisabled;
	this.menuNode[this.menuNode.length-1].height = (height == null) ? "" : height;
	this.menuNode[this.menuNode.length-1].width = (width == null) ? "" : width;
	this.menuNode[this.menuNode.length-1].root = this;
}
//向接点添加一个外部XML文件接点
node.prototype.addrefNode = function (id,type,text,ref,url,newClass,openFlag,closeFlag,autoRefresh,box,value1,isChecked,chkDisabled) {

	this.menuNode[this.menuNode.length] = new refnode();
	this.menuNode[this.menuNode.length-1].id = (id == null) ? "" : id;
	this.menuNode[this.menuNode.length-1].type = (type == null) ? "" : type;
	this.menuNode[this.menuNode.length-1].text = (text == null) ? "" :text;
	this.menuNode[this.menuNode.length-1].ref = (ref == null) ? "" : ref;
	this.menuNode[this.menuNode.length-1].isLoadXml =false;
	this.menuNode[this.menuNode.length-1].url = (url == null) ? "" : url;
	this.menuNode[this.menuNode.length-1].newClass = (newClass == null) ? "" : newClass;
	this.menuNode[this.menuNode.length-1].openFlag = (openFlag == null) ? "" : openFlag;
	this.menuNode[this.menuNode.length-1].closeFlag = (closeFlag == null) ? "" : closeFlag;
	this.menuNode[this.menuNode.length-1].autoRefresh = (autoRefresh == null) ? "" : autoRefresh;
	this.menuNode[this.menuNode.length-1].box = (box == null) ? "" : box;
	this.menuNode[this.menuNode.length-1].value1 = (value1 == null) ? "" : value1;
	this.menuNode[this.menuNode.length-1].isChecked = (isChecked == null) ? "" : isChecked;
	this.menuNode[this.menuNode.length-1].chkDisabled = (chkDisabled == null) ? false : chkDisabled;
	this.menuNode[this.menuNode.length-1].root = this;
	this.menuNode[this.menuNode.length-1].subMenu =null;
}

//根据菜单项id查找菜单项，返回拥有此id的菜单项
node.prototype.getMenuItem = function (id) {
	for (var i=0;i<this.menuNode.length;i++) {
		if (this.menuNode[i].id == id)
			return this.menuNode[i];
		else {
			if (this.menuNode[i].subMenu != null) {		//如果这个菜单项中还含有子菜单
				var result = this.menuNode[i].subMenu.getMenuItem(id);	//递归在子菜单中查找
				if (result != null)		//如果找到
					return result;
			}
		}
	}
	return null;
}

//xml读取数据，数据来自一个xml文件，参数是这个xml文件的textOverColor
XMLTree.prototype.loadData = function (url,param) {
	var xmlDoc = new ActiveXObject("Msxml.DOMDocument");
	xmlDoc.async = false;
	if (param == null)
	  xmlDoc.loadXML(url);
	else
	  xmlDoc.load(url);
	this.xmlDoc = xmlDoc.childNodes[1];
	if(this.xmlRoot==null)
		this.xmlRoot=this.xmlDoc;
}

//初始化
XMLTree.prototype.initMenu=function (xmlDoc,root)
{ 	
	if(xmlDoc==null) return;
	if(root==null)
		return;
	//alert(xmlDoc.childNodes.length);
if(xmlDoc.childNodes.length>0){
	var oNode=null;
	oNode=new node();
	oNode.root=root;
	/*
    if (root == this) {		//如果是根菜单，则进行颜色赋值
			if (xmlDoc.getAttribute("backgroundColor") != null)
				this.backgroundColor = xmlDoc.getAttribute("backgroundColor");
			if (xmlDoc.getAttribute("overColor") != null)
				this.overColor = xmlDoc.getAttribute("overColor");
			if (xmlDoc.getAttribute("textColor") != null)
				this.textColor = xmlDoc.getAttribute("textColor");
			if (xmlDoc.getAttribute("fontSize") != null)
				this.fontSize = xmlDoc.getAttribute("fontSize");
			if (xmlDoc.getAttribute("textOverColor") != null)
				this.textOverColor = xmlDoc.getAttribute("textOverColor");
			if (xmlDoc.getAttribute("paddingLeft") != null)
				this.paddingLeft = xmlDoc.getAttribute("paddingLeft");
			if (xmlDoc.getAttribute("paddingTop") != null)
				this.paddingTop = xmlDoc.getAttribute("paddingTop");
			if (xmlDoc.getAttribute("underLine") != null)
				this.underLine = xmlDoc.getAttribute("underLine");
			if (xmlDoc.getAttribute("spaceWidth") != null)
				this.spaceWidth = xmlDoc.getAttribute("spaceWidth");
			if (xmlDoc.getAttribute("openFlag") != null)
				this.openFlag=xmlDoc.getAttribute("openFlag");
			if (xmlDoc.getAttribute("closeFlag") != null)
				this.closeFlag=xmlDoc.getAttribute("closeFlag");
			//if (xmlDoc.getAttribute("openFolder") != null)
				//this.openFolder=xmlDoc.getAttribute("openFolder");
			//if (xmlDoc.getAttribute("closeFolder") != null)
				//this.closeFolder=xmlDoc.getAttribute("closeFolder");
			if (xmlDoc.getAttribute("urlImage") != null)
				this.urlImage=xmlDoc.getAttribute("urlImage");
			if (xmlDoc.getAttribute("openAction") != null)	
				this.openAction = xmlDoc.getAttribute("openAction");
			if (xmlDoc.getAttribute("dblClick") != null)
				this.dblClick = xmlDoc.getAttribute("dblClick");
			if (xmlDoc.getAttribute("box") != null)
				this.box = xmlDoc.getAttribute("box");
				
			if (xmlDoc.getAttribute("value1") != null)
			{
					this.value1 = xmlDoc.getAttribute("value1");
			}
			if (xmlDoc.getAttribute("isChecked") != null)
			{
					this.isChecked = xmlDoc.getAttribute("isChecked");
			}

		}
	*/
		//进行菜单项的样式赋值
		if (oNode != null) {
			oNode.newClass = (xmlDoc.getAttribute("newClass") == null) ? this.defClass : xmlDoc.getAttribute("newClass");
			oNode.autoRefresh = (xmlDoc.getAttribute("autoRefresh") == null) ? "" : xmlDoc.getAttribute("autoRefresh");
		    oNode.openFlag = (xmlDoc.getAttribute("openFlag") == null) ? this.openFlag : xmlDoc.getAttribute("openFlag");
			oNode.closeFlag = (xmlDoc.getAttribute("closeFlag") == null) ? this.closeFlag : xmlDoc.getAttribute("closeFlag");
			oNode.urlImage = (xmlDoc.getAttribute("urlImage") == null) ? "" : xmlDoc.getAttribute("urlImage");
			oNode.open = (xmlDoc.getAttribute("open") == null) ? "" : xmlDoc.getAttribute("open");
			oNode.chkDisabled = (xmlDoc.getAttribute("chkDisabled") == null) ? "" : xmlDoc.getAttribute("chkDisabled");
			//oNode.value1
		}
		root.subMenu = oNode;
		for (var i=0;i<xmlDoc.childNodes.length;i++) {
			oid=xmlDoc.childNodes[i].getAttribute("id");
			var newClass = (xmlDoc.childNodes[i].getAttribute("newClass") == null) ? "" : xmlDoc.childNodes[i].getAttribute("backgroundColor");
			var autoRefresh = (xmlDoc.childNodes[i].getAttribute("autoRefresh") == null) ? "" : xmlDoc.childNodes[i].getAttribute("autoRefresh");
		    var openFlag = (xmlDoc.childNodes[i].getAttribute("openFlag") == null) ? this.openFlag : xmlDoc.childNodes[i].getAttribute("openFlag");
			var closeFlag = (xmlDoc.childNodes[i].getAttribute("closeFlag") == null) ? this.closeFlag : xmlDoc.childNodes[i].getAttribute("closeFlag");
			//var value1 = (xmlDoc.childNodes[i].getAttribute("value1") == null) ? oNode.value : xmlDoc.childNodes[i].getAttribute("value1");
			var urlImage = (xmlDoc.childNodes[i].getAttribute("urlImage") == null) ? "" : xmlDoc.childNodes[i].getAttribute("urlImage");
			var open = (xmlDoc.childNodes[i].getAttribute("open") == null) ? "" : xmlDoc.childNodes[i].getAttribute("open");
			var chkDisabled = (xmlDoc.childNodes[i].getAttribute("chkDisabled") == null) ? "" : xmlDoc.childNodes[i].getAttribute("chkDisabled");
			var nodeType = xmlDoc.childNodes[i].getAttribute("nodeType");
			if ( nodeType== "node")
				oNode.addNode(oid,"node",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),newClass,autoRefresh,openFlag,closeFlag,open,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled);
			else if (nodeType == "leaf")
				oNode.addleafNode(oid,"leaf",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),newClass,urlImage,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled,xmlDoc.childNodes[i].getAttribute("height"),xmlDoc.childNodes[i].getAttribute("width"));
			else if (nodeType == "ref")
				oNode.addrefNode(oid,"ref",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("ref"),xmlDoc.childNodes[i].getAttribute("url"),newClass,openFlag,closeFlag,autoRefresh,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled);
			else //如果没有类型，并且没有url,则默认为node;否则为leaf
			{
				if(xmlDoc.childNodes[i].getAttribute("url")!=null){
					oNode.addleafNode(oid,"leaf",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),newClass,urlImage,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled,xmlDoc.childNodes[i].getAttribute("height"),xmlDoc.childNodes[i].getAttribute("width"));
				}else{
					oNode.addNode(oid,"node",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),newClass,autoRefresh,openFlag,closeFlag,open,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled);
				}
			}
			this.initMenu(xmlDoc.childNodes[i],oNode.menuNode[i]);	//递归调用
		}
		return;
}
}
XMLTree.prototype.show = function (container,root) {
	
	if(container==null) return; 
	if(root==null) root=this;
	if(this.xmlDoc==null) return;
	this.initMenu(this.xmlDoc,root);
	if(this.xmlDoc.childNodes.length<=0) root.subMenu=null;
	var oContainer = document.all(container);
	//var oDiv = document.createElement("DIV");
	//oContainer.appendChild(oDiv);
				//oDiv.innerHTML += "";
	//alert(root.subMenu.menuNode.length);
	
	if(root.subMenu!=null)
	{
		this.attachSubMenu(root.subMenu,oContainer);
		for(var i=0;i<root.subMenu.menuNode.length;i++)
		{
			if(this.openNode(root.subMenu.menuNode[i])=="true")
				this.openAllNode(root.subMenu.menuNode[i]);
			this.displayNode(root.subMenu.menuNode[i]);
		}
	}
	if(root!=this)
	{
		root.open="true";
		this.tuxian=root;
		this.changeImg(root);
		//this.tuXian(root);
	}
}
//生成子菜单对象，并且这些对象将全部attach到document上
XMLTree.prototype.attachSubMenu = function (subMenu,div) {
	if (subMenu == null) return;
	for (var i = 0;i<subMenu.menuNode.length;i++) {
		var oDiv=null;
		 oDiv = document.createElement("DIV");
		div.appendChild(oDiv);
	with (oDiv.style) {
		display = "none";
		paddingLeft="15px";
	}
	with (oDiv){
		width="100%";
		id=subMenu.menuNode[i].id;
		//type=subMenu.menuNode[i].type;
		onclick='"'+this.menuName+'.doClick(this)"';
	}
	oDiv.type=subMenu.menuNode[i].type;
	oDiv.value1=subMenu.menuNode[i].value1;
	//alert(subMenu.menuNode[i].type);
			if (subMenu.menuNode[i].text != "") 
			{	//添加一个菜单项
				if(subMenu.menuNode[i].box!=null && subMenu.menuNode[i].box!="")
				{
					var checkedStr="";
					var disabledStr="";
					if(subMenu.menuNode[i].isChecked=="true")
						checkedStr="checked";
					if(subMenu.menuNode[i].chkDisabled=="true")
						disabledStr=" disabled ";
					oDiv.innerHTML='<input type="'+subMenu.menuNode[i].box+'" '+checkedStr+disabledStr+' onclick="'+this.menuName+'.checked(this)" >';

				}
			if (subMenu.menuNode[i].type=="node")
			{			
				if (subMenu.menuNode[i].closeFlag != null && subMenu.menuNode[i].closeFlag != "")
					oDiv.innerHTML += '<img src="'+subMenu.menuNode[i].closeFlag+'" align="center"  onclick="'+this.menuName+'.doClick1(this)"> ';
				else
				{
					oDiv.innerHTML += '<img src="'+this.closeFlag+'" align="center"  onclick="'+this.menuName+'.doClick1(this)">';
				}
			}
			else if (subMenu.menuNode[i].type=="ref")
			{
				if (subMenu.menuNode[i].closeFlag != null && subMenu.menuNode[i].closeFlag != "")
					oDiv.innerHTML += '<img src="'+subMenu.menuNode[i].closeFlag+'" align="center" onclick="'+this.menuName+'.doClick1(this)"> ';
				else
					oDiv.innerHTML += '<img src="'+this.closeFlag+'" align="center" onclick="'+this.menuName+'.doClick1(this)"> ';

			}
			else if(subMenu.menuNode[i].type=="leaf")
			{
				if (subMenu.menuNode[i].urlImage != null && subMenu.menuNode[i].urlImage != "")
					oDiv.innerHTML += '<img  src="'+subMenu.menuNode[i].urlImage+'" align="center" onclick="'+this.menuName+'.doClick1(this)">';
				else
					oDiv.innerHTML += '<img  src="'+this.urlImage+'" align="center" onclick="'+this.menuName+'.doClick1(this)">';
			}
			var oClass="";
			if(subMenu.menuNode[i].newClass!=null && subMenu.menuNode[i].newClass!="")
				oClass=subMenu.menuNode[i].newClass;
			else
				oClass=this.defClass;
			oDiv.innerHTML +='<span class="'+oClass+'"   nodetype="'+subMenu.menuNode[i].type+'"  url="'+subMenu.menuNode[i].url+'"   sid="'+subMenu.menuNode[i].id+'"  svalue="'+subMenu.menuNode[i].value1+'" sheight="'+subMenu.menuNode[i].height+'"  swidth="'+subMenu.menuNode[i].width+'"  onclick="'+this.menuName+'.doClick(this)"  ondblclick="'+this.menuName+'.dodblClick(this)" onmouseover="'+this.menuName+'.domouseover(\''+this.defMouseOverClass+'\')"  onmouseout="'+this.menuName+'.domouseout(\''+oClass+'\')" >' + subMenu.menuNode[i].text + '</span>';
			if(subMenu.menuNode[i].subMenu==null)
			{
				oDiv=document.all(subMenu.menuNode[i].root.id);
			}
			this.attachSubMenu(subMenu.menuNode[i].subMenu,oDiv);		//递归调用
			
		}	
	}
		
}

//只展开/关闭下面一层,图片变换，文字不突显
XMLTree.prototype.oClick=function (node){
var flag=(node.root==this.subMenu);        //判断node的ROOT是否为根
	if(node==null) return;
	if(node.subMenu==null)  return;
	var len=node.subMenu.menuNode.length;
	if(node.root==this.subMenu && node.type!="ref"&& this.openAction=="true")
	{if(node!=this.lastNode)
		this.hiddenchild(this.lastNode);
		this.lastNode=node;
		}
	for(var i=0;i<len;i++)
	{var id=node.subMenu.menuNode[i].id;
		oDiv=document.all(id);
		if(oDiv.style.display=="none")
		{oDiv.style.display="block";
		node.open="true";
		this.changeImg(node);
		this.hiddenchild(node.subMenu.menuNode[i]);}
		else
		{oDiv.style.display="none";
			node.open="false";
			this.changeImg(node);
			}
	}
}
//只展开不关闭下面一层,图片变换，文字不突显
XMLTree.prototype.onlyClick=function (node){
var flag=(node.root==this.subMenu);        //判断node的ROOT是否为根
	if(node==null) return;
	if(node.subMenu==null)  return;
	var len=node.subMenu.menuNode.length;
	if(node.root==this.subMenu && node.type!="ref"&& this.openAction=="true")
	{if(node!=this.lastNode)
		this.hiddenchild(this.lastNode);
		this.lastNode=node;
		}
	for(var i=0;i<len;i++)
	{var id=node.subMenu.menuNode[i].id;
		oDiv=document.all(id);
		//if(oDiv.style.display=="none")
		//{
			oDiv.style.display="block";
		node.open="true";
		this.changeImg(node);
		this.hiddenchild(node.subMenu.menuNode[i]);
		//}
		
	}
}

//只展开/关闭下面一层,图片变换，文字突显
XMLTree.prototype.zhanKai=function (node) {
	var flag=(node.root==this.subMenu);        //判断node的ROOT是否为根
	this.tuxian=node;
	if(node==null) return;
	if(node.subMenu==null)
	{
		this.tuXian();
		return;
	}
	var len=node.subMenu.menuNode.length;
	if(node.root==this.subMenu && node.type!="ref"&& this.openAction=="true")
	{
		if(node!=this.lastNode)
		this.hiddenchild(this.lastNode);
		this.lastNode=node;
	}
	for(var i=0;i<len;i++)
	{
		var id=node.subMenu.menuNode[i].id;
		oDiv=document.all(id);
		if(oDiv.style.display=="none")
		{
			oDiv.style.display="block";
			node.open="true";		
			this.changeImg(node);
			this.hiddenchild(node.subMenu.menuNode[i]);
		}
		else
		{
			oDiv.style.display="none";
			node.open="false";
			this.changeImg(node);
		}
	}
			this.tuXian();
}

//只展开/关闭下面一层,图片变换，文字突显
XMLTree.prototype.onlyzhanKai=function (node) {
	var flag=(node.root==this.subMenu);        //判断node的ROOT是否为根
	this.tuxian=node;
	if(node==null) return;
	if(node.subMenu==null)
	{
		this.tuXian();
		return;
	}
	var len=node.subMenu.menuNode.length;
	if(node.root==this.subMenu && node.type!="ref"&& this.openAction=="true")
	{
		if(node!=this.lastNode)
		this.hiddenchild(this.lastNode);
		this.lastNode=node;
	}
	for(var i=0;i<len;i++)
	{
		var id=node.subMenu.menuNode[i].id;
		oDiv=document.all(id);
			oDiv.style.display="block";
			node.open="true";		
			this.changeImg(node);
			this.hiddenchild(node.subMenu.menuNode[i]);
	
	}
			this.tuXian();
}

//单击+-号事件
XMLTree.prototype.doClick1 = function (oThis) {
	window.event.cancelBubble =true;
	window.event.returnValue =false;
	var oE=window.event.srcElement;
	if(oE.tagName=="IMG")
		oE=oE.parentElement;
	if(oE.tagName=="SPAN")
		oE=oE.parentElement;
	if (oE == null) return;
	var menu = this.subMenu.getMenuItem(oE.id);
	if (menu == null)
	{
		return;
	}
	if(menu.type=="ref")
	{
		this.clickimg(menu);
		this.refClick(menu);
	}
	else
		this.oClick(menu);
	
}

XMLTree.prototype.clickimg = function (oThis)
{}
//单击文件夹图片或文字图片
XMLTree.prototype.doClick = function (oThis) {
	window.event.cancelBubble =true;
	window.event.returnValue =false;
	var oE=window.event.srcElement;
	if(oE.tagName=="IMG")
	{oE=oE.parentElement;}
	if(oE.tagName=="SPAN")
		oE=oE.parentElement;
	if (oE == null) return;
	var menu = this.subMenu.getMenuItem(oE.id);
	this.doClick1();
		this.clicktext(menu);
	this.lastNode=menu;
	this.tuXian(menu);

//	if(this.dblClick=="false")
//	{
//		if(menu.type=="ref")
//		{
//			this.refClick(menu);
//			return;
//		}
//		else
//			this.zhanKai(menu);
//	}
//	if(menu.url!="") 
//		self.location.href = menu.url;
}
XMLTree.prototype.clicktext = function (oThis)
{}
//------------------------------------------------------------------------------------------------单击REF接点
XMLTree.prototype.refClick= function (node)
{
	if (node==null) return;
	if(node.type!="ref") return;
	var oE=document.all(node.id);
	if(node.autoRefresh=="true")
	{
		if(node.root==this.subMenu && this.openAction=="true" && this.lastNode!=null && this.lastNode.open=="true")
		{
			if(node!=this.lastNode)
			this.hiddenchild(this.lastNode);
			//this.lastNode=node;
		}
		if(!node.isLoadXml)
		{
			this.delChild(oE);
			this.loadData(node.ref,0);
			this.show(oE.id,node);
			node.isLoadXml=true;
		}
		else
		{
			this.zhanKai(node);
		}
		//this.lastNode=node;
	}
	else
	{
		if(node.root==this.subMenu && this.openAction=="true" && this.lastNode!=null && this.lastNode.open=="true")
		{
			if(node!=this.lastNode)
			this.hiddenchild(this.lastNode);
			//this.lastNode=node;
		}
		if(!node.isLoadXml)
		{
			this.loadData(node.ref,0);
			this.show(oE.id,node);
			node.isLoadXml=true;
		}
		else
		{
			this.zhanKai(node);
		}
		//this.lastNode=node;
	}
}

XMLTree.prototype.onlyrefClick= function (node)
{
	if (node==null) return;
	if(node.type!="ref") return;
	var oE=document.all(node.id);
	if(node.autoRefresh=="true")
	{
		if(node.root==this.subMenu && this.openAction=="true" && this.lastNode!=null && this.lastNode.open=="true")
		{
			if(node!=this.lastNode)
			this.hiddenchild(this.lastNode);
			//this.lastNode=node;
		}
		if(!node.isLoadXml)
		{	
			//this.delChild(oE);
			this.loadData(node.ref,0);
			this.show(oE.id,node);
			node.isLoadXml=true;
		}
		else
		{
			this.onlyzhanKai(node);
		}
		//this.lastNode=node;
	}

}

//删除REF接点的孩子
XMLTree.prototype.delChild=function(oDiv){
	if(oDiv==null) return;
	var len=0;
	if(oDiv.children!=null)
	len=oDiv.children.length;
	if(this.box=="")
		var k=3;
	else
		k=4;
	for(var i=len-1;i>k;i--)
	{
		oDiv.children[i].removeNode("true");
	}
}
//删除REF接点的孩子
XMLTree.prototype.delChildById=function(id){
	if(id==null||id=="") return;
	var oDiv=document.all(id);
	if(oDiv==null) return;
	var len=0;
	if(oDiv.children!=null)
	len=oDiv.children.length;
	if(this.box=="")
		var k=3;
	else
		k=4;
	for(var i=len-1;i>k;i--)
	{
		oDiv.children[i].removeNode("true");
	}
}

//双击事件
XMLTree.prototype.dodblClick=function(oThis){
	if(this.dblClick=="false") return;
	window.event.cancelBubble = "true";
	window.event.returnValue = "false";
	var oE=window.event.srcElement;
	if(oE.tagName=="IMG")
		oE=oE.parentElement;
	if(oE.tagName=="SPAN")
		oE=oE.parentElement;
	if (oE == null) return;
	var menu = this.subMenu.getMenuItem(oE.id);
	this.dbclicktext(menu);
	this.tuXian(menu);
//	if(menu.type=="ref")
//		this.refClick(menu);
//	else
//		this.zhanKai(menu);
//	if(menu.url=="")  return;
//	self.location.href = menu.url;
}
XMLTree.prototype.dbclicktext = function (oThis)
{}
//变换图片
XMLTree.prototype.changeImg= function (node){
if(node==null) return;
var oDiv=document.all(node.id);
//alert(node.id+","+typeof(oDiv.tagName));
if(oDiv==null || typeof(oDiv.tagName)=="undefined" || oDiv.children[0]==null) return;
if(oDiv.children[0].tagName=="IMG")
{
	if(node.open=="false")
	{
		oDiv.children[0].src=node.closeFlag;
	}
	else
	{
		oDiv.children[0].src=node.openFlag;
	}
}
else
	{
		if(node.open=="false")
		{
			oDiv.children[1].src=node.closeFlag;
		}
		else
		{
			oDiv.children[1].src=node.openFlag;
		}
	}
}
//文字突显
XMLTree.prototype.tuXian=function (oThis){
		if(this.ntuxian!=null)
		{
			nDiv=document.all(this.ntuxian.id);
			try
			{
			if(nDiv.children[1].tagName!="SPAN")
				nDiv.children[2].className=this.ntuxian.newClass;
			else
				nDiv.children[1].className=this.ntuxian.newClass;
			}catch(e)
			{}
		}
		if(oThis==null) return;
		var oDiv=document.all(oThis.id);
		try
		{
		if(oDiv.children[1].tagName!="SPAN")
			oDiv.children[2].className=this.defMouseDownClass;
		else
			oDiv.children[1].className=this.defMouseDownClass;
		}catch(e)
		{}
		this.ntuxian=oThis;
}
//显示指定的DIV接点
XMLTree.prototype.displayNode= function (node){
	if(node==null) return;
var oDiv=document.all(node.id);
if (oDiv==null || oDiv.tagName!="DIV") return;
oDiv.style.display="block";
}

//隐藏DIV接点的所有孩子
XMLTree.prototype.hiddenchild = function (node) {
	if(node==null) return;
	if(node.subMenu==null) return;
	node.open="false";
	var oNode=this.subMenu.getMenuItem(node.id);
	var oDiv=document.all(node.id);
	
	var len=oNode.subMenu.menuNode.length;
	for(var i=0;i<len;i++)
	{var sId=oNode.subMenu.menuNode[i];
	var sdiv=document.all(sId.id);
	if (sdiv==null) return;
		sdiv.style.display="none";
	}
	this.changeImg(node);
}

//鼠标移到文字上，变样式
XMLTree.prototype.domouseover=function (ocss){
var oSpan=window.event.srcElement;
if(oSpan.tagName!="SPAN")
	return;
var oDiv=oSpan.parentElement;
if(oDiv.id!=null && this.ntuxian!=null && oDiv.id==this.ntuxian.id)
	return;
 oSpan.className=ocss;
}
//鼠标移出文字上，变样式
XMLTree.prototype.domouseout=function (ocss){
var oSpan=window.event.srcElement;
if(oSpan.tagName!="SPAN")
	return;
var oDiv=oSpan.parentElement;
if(oDiv.id!=null && this.ntuxian!=null && oDiv.id==this.ntuxian.id)
	return;
 oSpan.className=ocss;
}
//标识出接点或其孩子的OPEN==TRUE
XMLTree.prototype.openNode=function (node){
if(node==null) return;
if(node.subMenu==null) return;
if(node.open=="true")
	return "true"; 
else
for(var i=0;i<node.subMenu.menuNode.length;i++)
	{var reValue=this.openNode(node.subMenu.menuNode[i]);
	 return reValue;} 
}
//展开接点的所有父亲及孩子,从上向下
XMLTree.prototype.openAllNode=function (node){
	if(node==null) return;
	var flag=(node.root==this.subMenu);        //判断node的ROOT是否为根
	this.tuxian=node;
	if(node==null) return;
	if(node.subMenu==null)
	{
		if(node.type=="ref")
		{
			this.clickimg(node);
			this.refClick(node);
			if(node.subMenu!=null)
			this.openAllNode(node);
		}
		else
		{
		this.tuXian();
		return;
		}
	 }
	else
	{
		var len=0;
		if(node.subMenu.menuNode!=null)
			len=node.subMenu.menuNode.length;
		if(node.root==this.subMenu && this.openAction=="true")
		{if(node!=this.lastNode)
			this.hiddenchild(this.lastNode);
			this.lastNode=node;}
		for(var i=0;i<len;i++)
		{var id=node.subMenu.menuNode[i].id;
			oDiv=document.all(id);
				if(oDiv!=null)
				{
				oDiv.style.display="block";
				node.open="true";
				this.changeImg(node);
				this.openAllNode(node.subMenu.menuNode[i]);
				}
		}	
				this.tuXian();
	}
}
//在XML中根据ID查找XML的接点
XMLTree.prototype.findpid=function (id,node){
if(id=="") return;
if(node==null) return;
if(node.childNodes.length<0) return;
if(node.getAttribute("id")==id)  
	this.text=node;

for(var i=0;i<node.childNodes.length;i++)
	{if(node.childNodes[i].getAttribute("id")==id)
		this.text=node.childNodes[i];
	else
	this.findpid(id,node.childNodes[i]);}
return this.text;
}
//使单选或多选框选中，不选中
XMLTree.prototype.checked=function (oThis){
window.event.cancelBubble = "true";
window.event.returnValue = "false";
var oE=window.event.srcElement;
var oDiv=oE.parentElement;
var node=this.subMenu.getMenuItem(oDiv.id);
if (node == null)
	{
	return;
	}
//if(node.subMenu==null&&node.type=="ref")//如果接点为REF，且没有展开，则展开所有接点
	//{
		this.openAllNode(node);
	//}
if(node.subMenu!=null)
	if(oE.type=="checkbox" && oE.checked==true && node.subMenu.menuNode[0].box=="checkbox" )//&& node.type!="ref")
		this.checkedAllChild(node);
if(oE.type=="checkbox" && oE.checked==true)
	{
	this.parentChecked(node);
	}
if(oE.type=="checkbox" && oE.checked==false)
	{
	this.parentCheckedNo(node);
	this.checkedNoChild(node);
	}
else{
		if(oE.type=="radio")
		{
			this.checkedOne(oE);
			if(oE.disabled==false)
			{
			if(oE.checked==true)
				oE.checked=false;
			else
				oE.checked=true;
			}
		this.radioDis(oE);
		}
	this.parentChecked(node);
	}
	if(oE.type=="checkbox" && oE.checked==true)
	{
	//附加动作
	if(this.checkStyle=="1")
		{//alert(oDiv.id);
		this.cancelNodeCheckedById(oDiv.id);
		this.cancelPNodeCheckedById(oDiv.id);
		}
	}
}
//同一级上单选框只有一个可以checked.
XMLTree.prototype.checkedOne=function (radio){
if(radio==null) return;
var oDiv=radio.parentElement;
var node=this.subMenu.getMenuItem(oDiv.id);
var len=node.root.menuNode.length;
for(var i=0;i<len;i++)
	{
	var id=node.root.menuNode[i].id;
	var div=document.all(id);
	if(div!=null && div.children[0].disabled==false)
	div.children[0].checked=false;
	}
}
//单击一单选框，同一级上其它单选框的disabled.
XMLTree.prototype.radioDis=function (radio)
{
	if(radio==null) return;
	var oDiv=radio.parentElement;
	var node=this.subMenu.getMenuItem(oDiv.id);
	var len=node.root.menuNode.length;
	for(var i=0;i<len;i++)
	{
		var id=node.root.menuNode[i].id;
		var div=document.all(id);
		if(div.children[0]!=radio)
		this.disabledChild(node.root.menuNode[i]);
	}
	this.abledChild(node);
}
//使单选框的所有孩子的单选框或多选框disabled.
XMLTree.prototype.disabledChild=function (node)
{
	if(node==null) return;
	if(node.subMenu==null) return;
	for(var i=0;i<node.subMenu.menuNode.length;i++)
	{
		var div=document.all(node.subMenu.menuNode[i].id);
		div.children[0].disabled=true;
		div.children[0].checked=false;
		this.disabledChild(node.subMenu.menuNode[i]);
	}
}
//使单选框的所有孩子的单选框或多选框非disabled.
XMLTree.prototype.abledChild=function (node){
if(node==null) return;
if(node.subMenu==null) return;
for(var i=0;i<node.subMenu.menuNode.length;i++)
	{
	var div=document.all(node.subMenu.menuNode[i].id);
	div.children[0].disabled=false;
	this.abledChild(node.subMenu.menuNode[i]);
	}
}
//选中一单选框或多选框，则其所有父亲选中，且若其所有父亲为多选，使其选中且disabled.
XMLTree.prototype.parentChecked=function (node){
if(node==null) return;
var pnode=node.root;
if(pnode==this.subMenu || pnode==null) return;
if(pnode.id=="") pnode=pnode.root;

var nbox=document.all(node.id);
if(nbox==null)
	return ;
else
	nbox=nbox.children[0];
var oDiv=document.all(pnode.id);
if(oDiv==null) return;
var box=oDiv.children[0];
if(box!=null && box.disabled==false)
box.checked=true;
//if(box.type=="checkbox")
	//box.disabled=true;
if(nbox.type=="radio")
	this.radioDis(nbox);
//if(pnode.type=="ref") return;
this.parentChecked(pnode);
}
//使多选框的子多选框全部选中
XMLTree.prototype.checkedAllChild=function (node){
	if(node==null) return;
	if(node.subMenu==null) return;
	if(node.box!="checkbox") return;
	for(var i=0;i<node.subMenu.menuNode.length;i++)
	{
		var oDiv=document.all(node.subMenu.menuNode[i].id);
		if(oDiv!=null && oDiv.children[0].disabled==false)
		oDiv.children[0].checked=true;
		this.checkedAllChild(node.subMenu.menuNode[i]);
	}
}
//使多选框的孩子全部不选中
XMLTree.prototype.checkedNoChild=function (node){
if(node==null) return;
if(node.subMenu==null) return;
for(var i=0;i<node.subMenu.menuNode.length;i++)
	{
	var oDiv=document.all(node.subMenu.menuNode[i].id);
	if(oDiv!=null && oDiv.children[0].disabled==false)
	oDiv.children[0].checked=false;
	this.checkedNoChild(node.subMenu.menuNode[i]);
	}
}
//判断多选框的子多选框是否有选中的
XMLTree.prototype.returnChecked=function (node){
if(node==null) return;
if(node.subMenu==null) return;
for(var i=0;i<node.subMenu.menuNode.length;i++)
	{var oDiv=document.all(node.subMenu.menuNode[i].id);
	if(oDiv.children[0].checked==true)
		return true;}
return false;
}
/*
//单击选中的多选框，则其所有父亲不选中，且disabled=false.
XMLTree.prototype.parentCheckedNo=function (node){
if(node==null) return;
var pnode=node.root;
var rnode=this.subMenu.getMenuItem(pnode.id);
if(pnode==this.subMenu) return;
if(pnode.id=="") pnode=pnode.root;
alert(this.returnChecked(rnode));
if(this.returnChecked(rnode)==false)
{
	var nbox=document.all(node.id).children[0];
	var oDiv=document.all(pnode.id);
	var box=oDiv.children[0];
	if(box.type=="radio") return;
	box.checked=false;
	if(pnode.type=="ref") return;
	this.parentCheckedNo(node.root);
}
}
*/
//单击选中的多选框，则其所有父亲不选中，且disabled=false.
XMLTree.prototype.parentCheckedNo=function (node){
if(node==null) return;
var pnode=node.root;
var rnode=this.subMenu.getMenuItem(pnode.id);
if(pnode==this.subMenu) return;
if(pnode.id=="") pnode=pnode.root;
	if(this.returnChecked(pnode)==false  || this.checkStyle=="1")
	{

	//var nbox=document.all(node.id);
	//alert(node.id);
	//if(nbox==null)
	//	return;
	//nbox=nbox.children[0];
	//if(nbox==null || nbox.tagName!="INPUT") return;
	var oDiv=document.all(pnode.id);
	if(oDiv==null) return;
	var box=oDiv.children[0];
	if(box.type=="radio") return;
	if(box!=null && box.disabled==false)
	box.checked=false;
	if(box.type=="checkbox")
	if(box!=null && box.disabled==false)
	box.checked=false;
	if(node.root==null)
		return;
	//if(pnode.type=="ref") return;
	this.parentCheckedNo(node.root);
	}
}

//外部函数，展开树直到参数所在的接点,参数为XML中的ID
XMLTree.prototype.nodeOpenTo=function(id){
if(id=="") return;
var xmlnode=null;
var xmlpnode=null;
xmlnode=this.findpid(id,this.xmlRoot);
xmlpnode=this.findpid(id,this.xmlRoot);
var pid=xmlnode.parentNode.getAttribute("id");
if(pid==null) pid="";
//var nodeid=this.menuName+pid+"_"+xmlnode.getAttribute("id");
var nodeid=xmlnode.getAttribute("id");
var node=this.subMenu.getMenuItem(nodeid);
while(xmlpnode.parentNode!=this.xmlRoot)
	xmlpnode=xmlpnode.parentNode;
var rootid=this.xmlRoot.getAttribute("id");
if(rootid==null)  rootid="";
//var pnode=this.subMenu.getMenuItem(this.menuName+rootid+"_"+xmlpnode.getAttribute("id"));
var pnode=this.subMenu.getMenuItem(xmlpnode.getAttribute("id"));
this.openAllNode(pnode);
this.hiddenchild(node);
}
//外部函数，展开接点的下一层接点，参数为XML中的ID
XMLTree.prototype.nodeOpenNext=function(id){
if(id=="") return;
var xmlnode=this.findpid(id,this.xmlRoot);
var pid=xmlnode.parentNode.getAttribute("id");
if(pid==null) pid="";
//var nodeid=this.menuName+pid+"_"+xmlnode.getAttribute("id");
var nodeid=xmlnode.getAttribute("id");
var node=this.subMenu.getMenuItem(nodeid);
for(var i=0;i<node.subMenu.menuNode.length;i++)
	this.displayNode(node.subMenu.menuNode[i]);
}
//外部函数，关闭接点的所有接点，参数为XML中的ID
XMLTree.prototype.nodeClose=function (id){
if(id=="") return;
var xmlnode=this.findpid(id,this.xmlRoot);
var pid=xmlnode.parentNode.getAttribute("id");
if(pid==null) pid="";
//var nodeid=this.menuName+pid+"_"+xmlnode.getAttribute("id");
var nodeid=xmlnode.getAttribute("id");
var node=this.subMenu.getMenuItem(nodeid);
this.hiddenchild(node);
this.changeImg(node);
}
//外部函数,记录选择的值，返回XML中ID的字符串，用“,”分隔
XMLTree.prototype.getValue=function (){
if(this.subMenu==null) return ;
this.checkstr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setValue(this.subMenu.menuNode[j]);
return this.checkstr;
}
//setValue()方法
XMLTree.prototype.setValue=function(node){
if(node==null) return;
var str="";
str=node.id;
var oDiv=document.all(node.id);
if(oDiv.children[0].checked==true)
	this.checkstr+=str+",";
if(node.subMenu==null) return;
for(var i=0;i<node.subMenu.menuNode.length;i++)
this.setValue(node.subMenu.menuNode[i]);
}
//外部函数,记录选择的文本，返回XML中TEXT的字符串，用“,”分隔
XMLTree.prototype.getText=function (){
if(this.subMenu==null) return ;
this.checkTextstr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setText(this.subMenu.menuNode[j]);
return this.checkTextstr;
}
//setValue()方法
XMLTree.prototype.setText=function(node){
if(node==null) return;
var str="";
str=node.text;
var oDiv=document.all(node.id);
if(oDiv.children[0].checked==true)
	this.checkTextstr+=str+",";
if(node.subMenu==null) return;
for(var i=0;i<node.subMenu.menuNode.length;i++)
this.setText(node.subMenu.menuNode[i]);
}
//外部函数,记录选择的值，返回XML中最后一层的ID的字符串，用“,”分隔
XMLTree.prototype.getLastValue=function (){
if(this.subMenu==null) return ;
this.checkLaststr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setLastValue(this.subMenu.menuNode[j]);
return this.checkLaststr;
}
//setLastValue()方法
XMLTree.prototype.setLastValue=function(node){
if(node==null) return;
//if(this.box=="") return;
var str="";
if(node.subMenu==null)
	{
	str=node.id;
	str=str.substring(str.indexOf("_")+1,str.length);
	var oDiv=document.all(node.id);
	if(oDiv.children[0].checked==true)
		this.checkLaststr+=str+",";
	}
	if(node.subMenu==null) return;
	for(var i=0;i<node.subMenu.menuNode.length;i++)
	this.setLastValue(node.subMenu.menuNode[i]);
}
//外部函数,记录选择的文本，返回XML中最后一层的TEXT的字符串，用“,”分隔
XMLTree.prototype.getLastText=function (){
if(this.subMenu==null) return ;
this.checkLastTextstr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setLastText(this.subMenu.menuNode[j]);
return this.checkLastTextstr;
}
//setLastValue()方法
XMLTree.prototype.setLastText=function(node){
if(node==null) return;
//if(this.box=="") return;
var str="";
if(node.subMenu==null)
	{str=node.text;
	var oDiv=document.all(node.id);
	if(oDiv.children[0].checked==true)
		this.checkLastTextstr+=str+",";
	}
	if(node.subMenu==null) return;
	for(var i=0;i<node.subMenu.menuNode.length;i++)
	this.setLastText(node.subMenu.menuNode[i]);
}
//外部函数,记录选择的value1，返回XML中最后一层的value1的字符串，用“,”分隔
XMLTree.prototype.getLastValue1=function (){
if(this.subMenu==null) return ;
this.checkLastValue1str="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setLastValue1(this.subMenu.menuNode[j]);
return this.checkLastValue1str;
}
//setLastValue1()方法
XMLTree.prototype.setLastValue1=function(node){
if(node==null) return;
//if(this.box=="") return;
var str="";
if(node.subMenu==null)
	{str=node.value1;
	var oDiv=document.all(node.id);
	if(oDiv.children[0].checked==true)
		this.checkLastValue1str+=str+",";
	}
	if(node.subMenu==null) return;
	for(var i=0;i<node.subMenu.menuNode.length;i++)
	this.setLastValue1(node.subMenu.menuNode[i]);
}
//外部函数,记录选择的value1，返回XML中所有层的value1的字符串，用“,”分隔
XMLTree.prototype.getValue1=function (){
if(this.subMenu==null) return ;
this.value1="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setValue1(this.subMenu.menuNode[j]);
return this.value1;
}
//setLastValue1()方法
XMLTree.prototype.setValue1=function(node){
	if(node==null) return;
	var str="";
	str=node.value1;
	var oDiv=document.all(node.id);
	if(oDiv.children[0].checked==true)
		this.value1+=str+",";
	if(node.subMenu==null) return;
	for(var i=0;i<node.subMenu.menuNode.length;i++)
	this.setValue1(node.subMenu.menuNode[i]);
}

//用户最后点击节点的id
XMLTree.prototype.getCurrentNodeId=function()
{
	if(this.lastNode==null)
		return null;
	return this.lastNode.id;
}
//用户最后点击节点的value1
XMLTree.prototype.getCurrentNodeValue=function()
{
	if(this.lastNode==null)
		return null;
	return this.lastNode.value1;
}
//用户最后点击节点的id
XMLTree.prototype.getParentNodeId=function()
{
	if(this.lastNode==null)
		return null;
	var pOb=document.all(this.lastNode.id);
	var ppOb=pOb.parentElement;
	return ppOb.id;
}
//用户最后点击节点的value1.如果节点为根节点则返回  undefined
XMLTree.prototype.getParentNodeValue=function()
{
	if(this.lastNode==null)
		return null;
	var pOb=document.all(this.lastNode.id);
	var ppOb=pOb.parentElement;
	return ppOb.value1;
}
//把当前节点的所有父节点ID组成一个字符串,无参数
XMLTree.prototype.makeNodePId=function ()
{
	if(this.lastNode==null)
		return ;
	var node=this.lastNode;
	var str="";
	while(!(node==this.subMenu))
	{
		if(node.id!="")
		str=node.id+","+str;
	if(node.root!=null)
			node=node.root;
	}
	if(str.substring(str.length-1,str.length)==",")
		str=str.substring(0,str.length-1);
	return(str);
}
//把当前节点的所有父节点ID组成一个字符串
XMLTree.prototype.makeNodePIdS=function (oid)
{
	if(oid==null || oid=="")
		return ;
	var node=this.subMenu.getMenuItem(oid);
	if(this.lastNode==null)
		return "";
	if(node==null) node=this.lastNode;
	var str="";
	while(!(node==this.subMenu))
	{
		if(node.id!="")
		str=node.id+","+str;
	if(node.root!=null)
			node=node.root;
	}
	if(str.substring(str.length-1,str.length)==",")
		str=str.substring(0,str.length-1);
	//反序
	
	/*if(str!="")
	{
		var newstr="";
	for(var i=str.length-1;i>-1;i--)
		{
		var c=str.charAt(i);
		newstr+=c;
		}
	}*/
	return(str);
}

//根据ID字符串展开节点
XMLTree.prototype.openNodeById=function (parentIds)
{
if(parentIds=="" || parentIds==null) return;
parentIds=parentIds.toString();
if(parentIds.indexOf(",")<0) return;
var arrId=parentIds.split(",");
var lenArr=arrId.length;
for(var i=0;i<lenArr;i++)
	{
	var node=this.subMenu.getMenuItem(arrId[i]);
	if(node==null)
		continue;
	//alert(node.type);
	switch(node.type)
		{
		case "node":
			this.onlyClick(node);
			break;
		case "ref":
			this.clickimg(node);
			this.onlyrefClick(node);
			break;
		case "leaf":
			return;
		}
	}
}
//刷新节点
XMLTree.prototype.refreshNodeById= function (id)
{
	if (id==null||id=="") return;
	var node=this.subMenu.getMenuItem(id);
	var oE=document.all(node.id);
var len=oE.children.length;
for(var i=len-1;i>1;i--)
	{
	oE.children[i].removeNode(true);
	}
//alert(oE.innerHTML);
this.clickimg(node);
this.loadData(node.ref,0);
this.show(oE.id,node);
			//node.isLoadXml=true;
			//this.onlyzhanKai(node);
			//this.onlyrefClick(node);
}
//外部方法,使当前节点的所有子节点的复选框不选中
XMLTree.prototype.cancelNodeCheckedById=function(id)
{
var node=this.subMenu.getMenuItem(id);
if(node!=null)
	this.checkedNoChild(node);
}
//选中一多选框，则其所有父亲不选中
XMLTree.prototype.cancelPNodeCheckedById=function (id){
var node=this.subMenu.getMenuItem(id);
if(node==null) return;
var pnode=node.root;
if(pnode==this.subMenu || pnode==null) return;
if(pnode.id=="") pnode=pnode.root;

var nbox=document.all(node.id);
if(nbox==null)
	return ;
else
	nbox=nbox.children[0];
var oDiv=document.all(pnode.id);
if(oDiv==null) return;
var box=oDiv.children[0];
if(box!=null && box.disabled==false)
box.checked=false;
//if(nbox.type=="radio")
	//this.radioDis(nbox);
this.parentCheckedNo(pnode);
}
