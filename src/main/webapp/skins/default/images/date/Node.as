class Node {
	private var text:String = "";
	//节点文本
	private var mem_num:String = "";
	//该部门所含人数
	private var mem_tooltip:String = "";
	//该部门所含链接信息
	var tooltipobj;
	var _x;
	var _y;
	var _width, _height;
	public function Node(txt:String, mem:String, tolstr:String, tolobj:MovieClip) {
		this.text = txt;
		//this.mem_num = mem;
		//this.mem_tooltip = tolstr;
		this.tooltipobj = new MovieClip();
	}
	public function drawNode(mc) {
		if (mc == null) {
			return;
		}
		with (mc) {
			beginFill(0x749CBA, 50);
			lineStyle(2, 0x252525, 100);
			moveTo(0, 5);
			curveTo(0, 0, 5, 0);
			lineTo(75, 0);
			curveTo(80, 0, 80, 5);
			lineTo(80, 25);
			curveTo(80, 30, 75, 30);
			lineTo(5, 30);
			curveTo(0, 30, 0, 25);
			lineTo(0, 5);
			endFill();
		}
		mc.createTextField(mc._name+"text", 1, 0, 0, mc._width, mc._height);
		var otxt = eval(mc._parent+"."+mc._name+"."+mc._name+"text");
		otxt.text = this.text;
		otxt.autoSize = "center";
		mc.onRollOver = doRollOver;
	}
	function doRollOver() {
		trace(this+","+this.mem_num+","+this.tooltipobj+","+this.mem_tooltip);
		this.tooltipobj._visible = true;
		var otxt1 = eval(this.tooltipobj._parent+"."+this.tooltipobj._name+"."+this.tooltipobj._name+"_val_num");
		if (this.mem_num == null) {
			this.mem_num = "";
		}
		otxt1.text = this.mem_num;
		var otxt3 = eval(this.tooltipobj._parent+"."+this.tooltipobj._name+"."+this.tooltipobj._name+"_val_link1");
		otxt3.html = true;
		if (this.mem_tooltip == null) {
			this.mem_tooltip = "";
		}
		otxt3.htmlText = this.mem_tooltip;
		var txtfmt_fmt = new TextFormat();
		//txtfmt_fmt.underline = true;
		txtfmt_fmt.color = 0x6699FF;
		otxt3.setTextFormat(txtfmt_fmt);
		/*var otxt4 = eval("_root."+this.tooltipobj._parent._name+"."+this.tooltipobj._name+"."+this.tooltipobj._name+"_val_link2");
																												otxt4.text = arrlink2[1];
																												var txtfmt_fmt1 = new TextFormat();
																												txtfmt_fmt1.url = arrlink2[0];
																												txtfmt_fmt1.target = "_self";
																												//txtfmt_fmt1.underline = true;
																												txtfmt_fmt1.color = 0x6699FF;
																												otxt4.setTextFormat(txtfmt_fmt1);
																												*/
		var omc:MovieClip = MovieClip(this.tooltipobj);
		omc._x = this._x+this._width-2;
		omc._y = this._y+this._height-2;
	}
	//提示信息
	public function makeTooltip(mc, num:String, linkstr:String) {
		trace("dfasdfasfasfasdf");
		if (mc == null) {
			return;
		}
		var arr = linkstr.split('|');
		var arrlink1 = arr[0].split(',');
		var arrlink2 = arr[1].split(',');
		mc.createTextField(mc._name+"_title_num", 1, 0, 0, 20, 20);
		var otxt = eval(mc._parent+"."+mc._name+"."+mc._name+"_title_num");
		otxt.text = "人员:";
		mc.createTextField(mc._name+"_val_num", 1, 20, 0, 30, 20);
		var otxt1 = eval(mc._parent+"."+mc._name+"."+mc._name+"_val_num");
		otxt1.autoSize = "center";
		mc.createTextField(mc._name+"_title_link", 1, 0, 20, 20, 20);
		var otxt2 = eval(mc._parent+"."+mc._name+"."+mc._name+"_title_link");
		otxt2.text = "链接";
		mc.createTextField(mc._name+"_val_link1", 1, 0, 20, 20, 20);
		var otxt3 = eval(mc._parent+"."+mc._name+"."+mc._name+"_val_link1");
		otxt3.text = arrlink1[1];
		var txtfmt_fmt = new TextFormat();
		txtfmt_fmt.underline = true;
		txtfmt_fmt.url = arrlink1[0];
		otxt3.setTextFormat(txtfmt_fmt);
		mc.createTextField(mc._name+"_val_link2", 1, 20, 20, 20, 20);
		var otxt4 = eval(mc._parent+"."+mc._name+"."+mc._name+"_val_link2");
		otxt4.text = arrlink2[1];
		var txtfmt_fmt1 = new TextFormat();
		txtfmt_fmt1.url = arrlink2[0];
		txtfmt_fmt1.underline = true;
		otxt4.setTextFormat(txtfmt_fmt1);
	}
}
