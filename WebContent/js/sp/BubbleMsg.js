function BubbleMsg() {
	var div;
}

BubbleMsg.prototype.getInstance = function (id, msg, w, h) {
	if (this.div != null)
		return this.div;
	var nWidth = document.documentElement.clientWidth;
	var nHeight = document.documentElement.clientHeight;
	var bordercolor = "#CDDEEE"; // 提示窗口的边框颜色 
	var bgcolor = "#000000"; // 提示内容的背景色

	var objMsg = document.createElement("div");
	objMsg.id = id;
	objMsg.style.cssText = "position:absolute;font:11px '宋体';top:"
			+ (nHeight - h)
			/ 2
			+ "px;"
			+ "left:"
			+ (nWidth - w)
			/ 2
			+ "px;width:"
			+ w
			+ "px;height:"
			+ h
			+ "px;px;filter:Alpha(Opacity=60);text-align:center;border:5px solid "
			+ bordercolor + ";background-color:" + bgcolor
			+ ";padding:1px;line-height:22px;z-index:102;";
	$(objMsg)
			.html("<font color=#15428B><h2 align=absmiddle vertical-align=center><pre>"
					+ msg + "</pre></h2></font>");
	document.body.appendChild(objMsg);
	this.div = objMsg;
	$(objMsg).hide();
	return objMsg
};
BubbleMsg.prototype.show = function () {
	$(this.div).slideDown(1000);
	$(this.div).click(function() {
				$(this).hide(500);
			});
};

