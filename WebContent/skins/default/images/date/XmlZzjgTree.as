class XmlZzjgTree {
	var menuXml;
	//= '<?xml version="1.0" encoding="GB2312" ?><xmlmenu ><menu empnum="1"  text="执法考核" link="&lt;a href=&quot;http://hremployee.cmd?method=detail&primaryKey=1&quot;&gt;部门&lt;/a&gt;&nbsp;&nbsp;&lt;a href=&quot;http://hremployee.cmd?method=detail&primaryKey=1&quot;&gt;人力资源&lt;/a&gt;"><menu id="11"  link="&lt;a href=&quot;http://hremployee.cmd?method=detail&primaryKey=1&quot;&gt;部门1&lt;/a&gt;&nbsp;&nbsp;&lt;a href=&quot;http://hremployee.cmd?method=detail&primaryKey=1&quot;&gt;人力资源1&lt;/a&gt;" text="执法监控" title=""><menu id="111"  targetframe="_tree" title="title" text="管理服务"><menu id="11231"   text="考核查询"></menu><menu id="132"   text="追究查询"><menu id="132"   text="追究查询"></menu></menu></menu><menu id="112"  targetframe="_tree" title="title" text="征收监控"></menu><menu id="112"  targetframe="_tree" title="title" text="征收监控"></menu><menu id="112"  targetframe="_tree" title="title" text="征收监控"></menu></menu><menu id="12" text="考核追究" title=""><menu id="121"  targetframe="_tree" title="title" text="执法考核"><menu id="132"   text="追究查询"></menu><menu id="132"   text="追究查询"></menu><menu id="132"   text="追究查询"></menu></menu></menu><menu id="13" text="个人查询" title=""><menu id="131"   text="考核查询"></menu><menu id="132"   text="追究查询"></menu><menu id="132"   text="统计查询"></menu></menu></menu></xmlmenu>';
	private var Container:MovieClip;
	var xmlroot:XML;
	var mcroot;
	private static var nameindex:Number = 3;
	//为mc取名用的
	private var paddingTop:Number = 100;
	//树的上面空白区
	private var paddingNode:Number = 30;
	//两个节点间的空白区
	private var totalLeft:Number = 0;
	//左边已经利用的空间
	private var totalTop:Number = 150;
	//上边已经利用的空间
	private var tooltip:MovieClip;
	public function XmlZzjgTree(container:MovieClip, menuxml) {
		Container = container;
		menuXml = menuxml;
		xmlroot = new XML(menuXml);
	}
	public function xmlload(url:String) {
		xmlroot.ignoreWhite = true;
		//xmlroot.load(url);
		trace(Container._name);
		tooltip = Container.createEmptyMovieClip(Container._name+"_tooltip", 10000);
		with (tooltip) {
			beginFill(0xFFFF99, 100);
			lineStyle(1, 0x252525, 150);
			moveTo(0, 0);
			lineTo(150, 0);
			lineTo(150, 50);
			lineTo(0, 50);
			lineTo(0, 0);
			endFill();
		}
		tooltip.createTextField(tooltip._name+"_title_num", 1, 0, 0, 35, 30);
		var otxt = eval(tooltip._parent+"."+tooltip._name+"."+tooltip._name+"_title_num");
		trace(otxt);
		otxt.text = "人员:";
		tooltip.createTextField(tooltip._name+"_val_num", 2, 30, 0, 30, 30);
		var otxt1 = eval(tooltip._parent+"."+tooltip._name+"."+tooltip._name+"_val_num");
		otxt1.autoSize = "center";
		tooltip.createTextField(tooltip._name+"_title_link", 3, 0, 20, 35, 20);
		var otxt2 = eval(tooltip._parent+"."+tooltip._name+"."+tooltip._name+"_title_link");
		otxt2.text = "链接:";
		tooltip.createTextField(tooltip._name+"_val_link1", 4, 35, 20, 100, 20);
		//tooltip.createTextField(tooltip._name+"_val_link2", 5, 65, 20, 60, 20);
		tooltip.onRollOut = function() {
			this._visible = false;
		};
		appendnode(xmlroot.firstChild.firstChild, null);
		appendLine(mcroot);
		tooltip._x = totalLeft+150;
		tooltip._y = Container._height+Container._y+150;
		tooltip._visible = false;
		//xmlroot.onLoad = pasexml(this, xmlroot);
		/* {
																																																																																																																																																							if (success) {
																																																																																																																																																								appendnode(xmlroot.firstChild.firstChild);
																																																																																																																																																							}
																																																																																																																																																						};*/
	}
	public function pasexml(clsobj, xmlobj) {
		trace(clsobj.xmlroot);
		trace(xmlobj.firstChild);
		if (xmlobj) {
		}
		//appendnode(this.firstChild.firstChild);
	}
	function appendnode(xmlnode, ofmc) {
		if (xmlnode == null) {
			return;
		}
		nameindex = nameindex+1;
		if (ofmc == null) {
			ofmc = Container.createEmptyMovieClip("mc_in_zzjgs"+nameindex, nameindex);
			mcroot = ofmc;
			var txt = xmlnode.attributes.text;
			var empnum = xmlnode.attributes.empnum;
			var linkstr = xmlnode.attributes.link;
			ofmc.mem_num = empnum;
			ofmc.tooltipobj = tooltip;
			ofmc.mem_tooltip = linkstr;
			//trace(txt+"lllllllllllllllllll");
			var newnode:Node = new Node(txt, empnum, linkstr, tooltip);
			newnode.drawNode(ofmc);
		}
		//ofmc._width = 83;
		//ofmc._height = 32;
		 //trace("ofmc._height"+":"+ofmc._height);
		totalTop = totalTop+ofmc._height+20;
		var childnum = 0;
		if (xmlnode.hasChildNodes()) {
			childnum = xmlnode.childNodes.length;
		}
		var oarr = new Array();
		for (var i = 0; i<childnum; i++) {
			var onode = xmlnode.childNodes[i];
			nameindex = nameindex+1;
			var osmc = Container.createEmptyMovieClip("mc_in_zzjgs"+nameindex, nameindex);
			var txts = onode.attributes.text;
			var empnums = onode.attributes.empnum;
			var linkstrs = onode.attributes.link;
			osmc.mem_num = empnums;
			osmc.tooltipobj = tooltip;
			osmc.mem_tooltip = linkstrs;
			//trace(txts+"dai");
			var newnodes:Node = new Node(txts, "1");
			newnodes.drawNode(osmc);
			osmc.root = ofmc;
			oarr[oarr.length] = osmc;
			//osmc._width = 83;
			//osmc._height = 32;
			if (!onode.hasChildNodes()) {
				drawNode(onode, osmc, ofmc, i, childnum);
			} else {
				appendnode(onode, osmc);
				drawNode(onode, osmc, ofmc, i, childnum);
			}
		}
		ofmc.submenu = oarr;
		totalTop = totalTop-ofmc._height-20;
	}
	function appendLine(ofmc) {
		if (ofmc == null) {
			return;
		}
		var childnum = 0;
		if (ofmc.submenu != null) {
			childnum = ofmc.submenu.length;
		}
		for (var i = 0; i<childnum; i++) {
			var onode = ofmc.submenu[i];
			if (onode.submenu == undefined) {
				drawLine(null, onode, ofmc, i, childnum);
			} else {
				appendLine(onode);
				drawLine(null, onode, ofmc, i, childnum);
			}
		}
	}
	//定位
	function drawNode(onode, osmc:MovieClip, ofmc:MovieClip, oindex:Number, cnum:Number) {
		if (osmc._x == 0 && osmc._y == 0) {
			osmc._x = totalLeft+paddingNode+osmc._width;
			osmc._y = totalTop;
			//trace(totalTop+":"+totalTop);
			totalLeft = totalLeft+paddingNode+osmc._width;
		}
		//trace(Math.ceil(cnum/2) == oindex);
		if (cnum%2 == 1) {
			if (Math.ceil(cnum/2) == oindex+1) {
				ofmc._x = osmc._x;
				ofmc._y = osmc._y-20-ofmc._height;
			}
		} else {
			if ((cnum/2) == oindex+1) {
				ofmc._x = osmc._x+osmc._width+paddingNode/2-ofmc._width/2;
				ofmc._y = osmc._y-20-ofmc._height;
			}
		}
		//totalLeft = totalLeft+paddingNode+osmc._width;
		trace(totalLeft);
		//drawLine(onode, osmc, ofmc, oindex, cnum);
		//画线
	}
	//画线
	function drawLine(onode, osmc:MovieClip, ofmc:MovieClip, oindex:Number, cnum:Number) {
		Container.lineStyle(2, 0x000000, 100);
		if (cnum%2 == 1) {
			if (Math.ceil(cnum/2) == oindex+1) {
				Container.moveTo(osmc._x+osmc._width/2, osmc._y);
				Container.lineTo(osmc._x+osmc._width/2, osmc._y-22);
			} else {
				Container.moveTo(osmc._x+osmc._width/2, osmc._y);
				Container.lineTo(osmc._x+osmc._width/2, osmc._y-10);
			}
		} else {
			Container.moveTo(osmc._x+osmc._width/2, osmc._y);
			Container.lineTo(osmc._x+osmc._width/2, osmc._y-10);
			if ((cnum/2) == oindex+1) {
				Container.moveTo(osmc._x+osmc._width+paddingNode/2, osmc._y-10);
				Container.lineTo(osmc._x+osmc._width+paddingNode/2, osmc._y-22);
			}
		}
		trace(ofmc._y+"sssssssss"+osmc._y);
		if (ofmc._x != 0) {
			//if (cnum != oindex+1) {
			Container.moveTo(osmc._x+osmc._width/2, osmc._y-10);
			Container.lineTo(ofmc._x+ofmc._width/2, osmc._y-10);
			//}
		}
	}
}
