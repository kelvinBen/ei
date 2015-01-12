/******************************************************************************************
*                      xml tree 1.1
*       ��ѡ���û���ļ���ͼƬ��û�����ӽӵ�����ߣ�
*******************************************************************************************/

function node() {
	this.id			=	"";
	this.text		=	"";
	this.overColor		=	"";
	this.paddingLeft = "";//�������
	this.paddingTop="";  //�ϱ�����
	this.backgroundColor = "";
	this.type		=	"";
	this.spaceWidth="";    //ͼƬ��ͼƬ�Լ�������ͼƬ֮����
	this.underLine = null;    //����ƶ�������ʱ�������Ƿ���»���
	this.textOverColor = "";//����ƶ�������ʱ�����ֵ���ɫ
	this.fontSize="";
	this.open       =   "";
	this.openFlag   =   "";
	this.closeFlag  =   "";
	//this.openFolder =   "";
	//this.closeFolder=   "";
	this.urlImage="";
	this.autoRefresh =null; //�������¼����ⲿxml��
	this.subMenu	=	null;
	this.box="";         //��ѡ���ѡ
	this.menuNode = new Array();
	this.root = null;
	this.islast=false;
	this.value1="";
	this.isChecked=false;//checkbox�Ƿ�ѡ��
	this.newClass=null	;				//�µĽڵ���ʽ  
	this.chkDisabled=false;		//��ʶ��ѡ���Ƿ�disabled
}
//Ҷ�ӽӵ�
function leafnode() {
	this.id="";
	this.type="";
	this.backgroundColor = "";
	this.text = "";
	this.textColor = "";
	this.overColor="";
	this.fontSize = "";
	this.spaceWidth="";    //ͼƬ��ͼƬ�Լ�������ͼƬ֮����
	this.underLine = null;    //����ƶ�������ʱ�������Ƿ���»���
	this.textOverColor = "";//����ƶ�������ʱ�����ֵ���ɫ
	this.paddingLeft = "";//�������
	this.paddingTop="";  //�ϱ�����
	this.textOverColor="";
	this.urlImage="";
	this.box="";         //��ѡ���ѡ
	this.root = null;
	this.value1="";
	this.isChecked=false;
	this.newClass=null	;				//�µĽڵ���ʽ   
	this.chkDisabled=false;		//��ʶ��ѡ���Ƿ�disabled
	this.height="";//Ϊģ�嶨�����
	this.width="";//Ϊģ�嶨�����
}
//�亢�ӽڵ����Ϣ����һ��xml�ļ��ڵĽӵ�
function refnode() {
	this.id="";
	this.ref="";  //�ⲿXML�ļ�
	this.isLoadXml=false;//��ʾ�Ƿ��Ѿ�����XML
	this.subMenu	=	null;
	this.open="false";
	this.backgroundColor = "";
	this.overColor = "";
	this.spaceWidth="";    //ͼƬ��ͼƬ�Լ�������ͼƬ֮����
	this.underLine = null;    //����ƶ�������ʱ�������Ƿ���»���
	this.textOverColor = "";//����ƶ�������ʱ�����ֵ���ɫ
	this.textOverColor = "";
	this.fontSize = "";
	this.openFlag   =   "";
	this.closeFlag  =   "";
	//this.openFolder =   "";
	//this.closeFolder=   "";
	this.paddingLeft = "";//�������
	this.paddingTop="";  //�ϱ�����
	this.autoRefresh=null; //�������¼����ⲿxml��
	this.box="";         //��ѡ���ѡ
	this.menuNode = new Array();
	this.root = null;
	this.value1="";
	this.isChecked=false;
	this.newClass=null	;				//�µĽڵ���ʽ  
	this.chkDisabled=false;		//��ʶ��ѡ���Ƿ�disabled
}
//����
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
	this.root = null;		//�ⲿXML�ļ���root
	this.flag= "false";		//��־REF�ӵ��Ƿ�չ��
	this.lastNode=null;     //��һ�η��ʵĸ��ӵ�
	this.autoRefresh="true"; //�������¼����ⲿxml��
	this.open="false";		//"true"Ϊ�ӵ�չ����"false"Ϊ�ӵ�ر�, Ĭ��Ϊ"false"
	this.dblClick="true";    // "true"Ϊ������˫���¼���"false"Ϊ��������˫���¼���Ĭ��Ϊ"false"
	this.openAction="true";  //  �ӵ�չ��ʱ����չ���Ľӵ����Ϊ,"true"Ϊ��չ���Ľӵ�ȫ���رգ�"false"Ϊ��չ���Ľӵ�ȫ�����ֲ���.
	this.defClass="treespan";				//��ǰ�ڵ���ʽ    
	this.defMouseOverClass= "clsMouseOver" ;					//��껬����ʽ
	this.defMouseDownClass="clsMouseDown" ;					//��갴��ʱ��ʽ
	this.checkStyle="0";  //���checkbox�Ķ�����ʽ,Ĭ��Ϊ0,ѡ���ӽڵ㼰���ڵ�;1Ϊֻѡ��ǰ�ڵ�
	this.topindex=1;//ȫ�ֱ���������ͼƬ���DIV��top����
	this.isAdd=true;//ȫ�ֱ���,�������ߵı�ʶ
	//��ʽ����
	this.openFlag="images/openflag.gif";
	this.closeFlag="images/closeflag.gif";
	this.urlImage="images/url.gif";
	this.backgroundColor = "#ffffff";
	this.overColor = "#eeeeee";
	this.textColor = "#000000";
	this.spaceWidth="2px";    //ͼƬ��ͼƬ�Լ�������ͼƬ֮����
	this.underLine = "true";    //����ƶ�������ʱ�������Ƿ���»���
	this.fontSize = "12px";
	this.textOverColor = "red";//����ƶ�������ʱ�����ֵ���ɫ
	this.paddingLeft = "15px";//�������
	this.paddingTop="0px";  //�ϱ�����
	this.text=null;           //��¼XML�ӵ�
	this.box="";    //��ѡ���ѡ
	this.tuxian=null;		//��־ͻ�ԵĽӵ�
	this.ntuxian=null;		//��־��ͻ�ԵĽӵ�
	this.checkstr="";		//ѡ���IDֵ
	this.checkTextstr="";		//ѡ���TEXTֵ
	this.checkLaststr="";		//ѡ������һ���IDֵ
	this.checkLastTextstr="";		//ѡ������һ���TEXTֵ
	this.value1="";
	this.checkLastValue1str="";//ѡ������һ���value1ֵ
}
//��ӵ����һ���ӽӵ�
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
//��ӵ����һ��Ҷ�ӽӵ�
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
//��ӵ����һ���ⲿXML�ļ��ӵ�
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

//���ݲ˵���id���Ҳ˵������ӵ�д�id�Ĳ˵���
node.prototype.getMenuItem = function (id) {
	for (var i=0;i<this.menuNode.length;i++) {
		if (this.menuNode[i].id == id)
			return this.menuNode[i];
		else {
			if (this.menuNode[i].subMenu != null) {		//�������˵����л������Ӳ˵�
				var result = this.menuNode[i].subMenu.getMenuItem(id);	//�ݹ����Ӳ˵��в���
				if (result != null)		//����ҵ�
					return result;
			}
		}
	}
	return null;
}

//xml��ȡ���ݣ���������һ��xml�ļ������������xml�ļ���textOverColor
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

//��ʼ��
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
    if (root == this) {		//����Ǹ��˵����������ɫ��ֵ
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
		//���в˵������ʽ��ֵ
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
			else //���û�����ͣ�����û��url,��Ĭ��Ϊnode;����Ϊleaf
			{
				if(xmlDoc.childNodes[i].getAttribute("url")!=null){
					oNode.addleafNode(oid,"leaf",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),newClass,urlImage,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled,xmlDoc.childNodes[i].getAttribute("height"),xmlDoc.childNodes[i].getAttribute("width"));
				}else{
					oNode.addNode(oid,"node",xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),newClass,autoRefresh,openFlag,closeFlag,open,xmlDoc.childNodes[i].getAttribute("box"),xmlDoc.childNodes[i].getAttribute("value1"),xmlDoc.childNodes[i].getAttribute("isChecked"),chkDisabled);
				}
			}
			this.initMenu(xmlDoc.childNodes[i],oNode.menuNode[i]);	//�ݹ����
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
//�����Ӳ˵����󣬲�����Щ����ȫ��attach��document��
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
			{	//���һ���˵���
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
			this.attachSubMenu(subMenu.menuNode[i].subMenu,oDiv);		//�ݹ����
			
		}	
	}
		
}

//ֻչ��/�ر�����һ��,ͼƬ�任�����ֲ�ͻ��
XMLTree.prototype.oClick=function (node){
var flag=(node.root==this.subMenu);        //�ж�node��ROOT�Ƿ�Ϊ��
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
//ֻչ�����ر�����һ��,ͼƬ�任�����ֲ�ͻ��
XMLTree.prototype.onlyClick=function (node){
var flag=(node.root==this.subMenu);        //�ж�node��ROOT�Ƿ�Ϊ��
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

//ֻչ��/�ر�����һ��,ͼƬ�任������ͻ��
XMLTree.prototype.zhanKai=function (node) {
	var flag=(node.root==this.subMenu);        //�ж�node��ROOT�Ƿ�Ϊ��
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

//ֻչ��/�ر�����һ��,ͼƬ�任������ͻ��
XMLTree.prototype.onlyzhanKai=function (node) {
	var flag=(node.root==this.subMenu);        //�ж�node��ROOT�Ƿ�Ϊ��
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

//����+-���¼�
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
//�����ļ���ͼƬ������ͼƬ
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
//------------------------------------------------------------------------------------------------����REF�ӵ�
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

//ɾ��REF�ӵ�ĺ���
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
//ɾ��REF�ӵ�ĺ���
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

//˫���¼�
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
//�任ͼƬ
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
//����ͻ��
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
//��ʾָ����DIV�ӵ�
XMLTree.prototype.displayNode= function (node){
	if(node==null) return;
var oDiv=document.all(node.id);
if (oDiv==null || oDiv.tagName!="DIV") return;
oDiv.style.display="block";
}

//����DIV�ӵ�����к���
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

//����Ƶ������ϣ�����ʽ
XMLTree.prototype.domouseover=function (ocss){
var oSpan=window.event.srcElement;
if(oSpan.tagName!="SPAN")
	return;
var oDiv=oSpan.parentElement;
if(oDiv.id!=null && this.ntuxian!=null && oDiv.id==this.ntuxian.id)
	return;
 oSpan.className=ocss;
}
//����Ƴ������ϣ�����ʽ
XMLTree.prototype.domouseout=function (ocss){
var oSpan=window.event.srcElement;
if(oSpan.tagName!="SPAN")
	return;
var oDiv=oSpan.parentElement;
if(oDiv.id!=null && this.ntuxian!=null && oDiv.id==this.ntuxian.id)
	return;
 oSpan.className=ocss;
}
//��ʶ���ӵ���亢�ӵ�OPEN==TRUE
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
//չ���ӵ�����и��׼�����,��������
XMLTree.prototype.openAllNode=function (node){
	if(node==null) return;
	var flag=(node.root==this.subMenu);        //�ж�node��ROOT�Ƿ�Ϊ��
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
//��XML�и���ID����XML�Ľӵ�
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
//ʹ��ѡ���ѡ��ѡ�У���ѡ��
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
//if(node.subMenu==null&&node.type=="ref")//����ӵ�ΪREF����û��չ������չ�����нӵ�
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
	//���Ӷ���
	if(this.checkStyle=="1")
		{//alert(oDiv.id);
		this.cancelNodeCheckedById(oDiv.id);
		this.cancelPNodeCheckedById(oDiv.id);
		}
	}
}
//ͬһ���ϵ�ѡ��ֻ��һ������checked.
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
//����һ��ѡ��ͬһ����������ѡ���disabled.
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
//ʹ��ѡ������к��ӵĵ�ѡ����ѡ��disabled.
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
//ʹ��ѡ������к��ӵĵ�ѡ����ѡ���disabled.
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
//ѡ��һ��ѡ����ѡ���������и���ѡ�У����������и���Ϊ��ѡ��ʹ��ѡ����disabled.
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
//ʹ��ѡ����Ӷ�ѡ��ȫ��ѡ��
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
//ʹ��ѡ��ĺ���ȫ����ѡ��
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
//�ж϶�ѡ����Ӷ�ѡ���Ƿ���ѡ�е�
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
//����ѡ�еĶ�ѡ���������и��ײ�ѡ�У���disabled=false.
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
//����ѡ�еĶ�ѡ���������и��ײ�ѡ�У���disabled=false.
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

//�ⲿ������չ����ֱ���������ڵĽӵ�,����ΪXML�е�ID
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
//�ⲿ������չ���ӵ����һ��ӵ㣬����ΪXML�е�ID
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
//�ⲿ�������رսӵ�����нӵ㣬����ΪXML�е�ID
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
//�ⲿ����,��¼ѡ���ֵ������XML��ID���ַ������á�,���ָ�
XMLTree.prototype.getValue=function (){
if(this.subMenu==null) return ;
this.checkstr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setValue(this.subMenu.menuNode[j]);
return this.checkstr;
}
//setValue()����
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
//�ⲿ����,��¼ѡ����ı�������XML��TEXT���ַ������á�,���ָ�
XMLTree.prototype.getText=function (){
if(this.subMenu==null) return ;
this.checkTextstr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setText(this.subMenu.menuNode[j]);
return this.checkTextstr;
}
//setValue()����
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
//�ⲿ����,��¼ѡ���ֵ������XML�����һ���ID���ַ������á�,���ָ�
XMLTree.prototype.getLastValue=function (){
if(this.subMenu==null) return ;
this.checkLaststr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setLastValue(this.subMenu.menuNode[j]);
return this.checkLaststr;
}
//setLastValue()����
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
//�ⲿ����,��¼ѡ����ı�������XML�����һ���TEXT���ַ������á�,���ָ�
XMLTree.prototype.getLastText=function (){
if(this.subMenu==null) return ;
this.checkLastTextstr="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setLastText(this.subMenu.menuNode[j]);
return this.checkLastTextstr;
}
//setLastValue()����
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
//�ⲿ����,��¼ѡ���value1������XML�����һ���value1���ַ������á�,���ָ�
XMLTree.prototype.getLastValue1=function (){
if(this.subMenu==null) return ;
this.checkLastValue1str="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setLastValue1(this.subMenu.menuNode[j]);
return this.checkLastValue1str;
}
//setLastValue1()����
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
//�ⲿ����,��¼ѡ���value1������XML�����в��value1���ַ������á�,���ָ�
XMLTree.prototype.getValue1=function (){
if(this.subMenu==null) return ;
this.value1="";
for(var j=0;j<this.subMenu.menuNode.length;j++)
	this.setValue1(this.subMenu.menuNode[j]);
return this.value1;
}
//setLastValue1()����
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

//�û�������ڵ��id
XMLTree.prototype.getCurrentNodeId=function()
{
	if(this.lastNode==null)
		return null;
	return this.lastNode.id;
}
//�û�������ڵ��value1
XMLTree.prototype.getCurrentNodeValue=function()
{
	if(this.lastNode==null)
		return null;
	return this.lastNode.value1;
}
//�û�������ڵ��id
XMLTree.prototype.getParentNodeId=function()
{
	if(this.lastNode==null)
		return null;
	var pOb=document.all(this.lastNode.id);
	var ppOb=pOb.parentElement;
	return ppOb.id;
}
//�û�������ڵ��value1.����ڵ�Ϊ���ڵ��򷵻�  undefined
XMLTree.prototype.getParentNodeValue=function()
{
	if(this.lastNode==null)
		return null;
	var pOb=document.all(this.lastNode.id);
	var ppOb=pOb.parentElement;
	return ppOb.value1;
}
//�ѵ�ǰ�ڵ�����и��ڵ�ID���һ���ַ���,�޲���
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
//�ѵ�ǰ�ڵ�����и��ڵ�ID���һ���ַ���
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
	//����
	
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

//����ID�ַ���չ���ڵ�
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
//ˢ�½ڵ�
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
//�ⲿ����,ʹ��ǰ�ڵ�������ӽڵ�ĸ�ѡ��ѡ��
XMLTree.prototype.cancelNodeCheckedById=function(id)
{
var node=this.subMenu.getMenuItem(id);
if(node!=null)
	this.checkedNoChild(node);
}
//ѡ��һ��ѡ���������и��ײ�ѡ��
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
