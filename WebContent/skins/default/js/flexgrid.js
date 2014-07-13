function GRID() {
	var gridObj = null;
	var treeObj = null;
	var divAll = null;
	var divTou = null;
	var divTi = null;
	var divSum = null;
	var divTiLeftCol = null;
	var divTouLeftCol = null;
	var divSumLeftCol = null;
	var inputSort = null;
	var inputSortName = null;
	var inputPk = null;
	var ctxMenu = null;
	var tabTou = null;
	var tabTi = null;
	var tabSum = null;
	var tableArray = new Array();
	var sortCol = 0;
	var currentLine = null;
	var isMouDown = false;
	var isCanSort = true;
	var OldPlace = null;
	var nowPlace = null;
	var curTd = null;
	var curHr = null;
	var fix = 0;
	var primaryKeyCol = -1;
	var deleteCol = -1;
	var indexCol = -1;
	var lastSortTd = null;
	var isSubmit = true;
	var outCanSort = true;
	var paddingLeft = 0;
	var xmlroot = null;
	var OpenImg = "open.gif";
	var CloseImg = "close.gif";
	var sortType = "1";
	var orderType = "1";
	this.format = "";
	this.name = null;
	this.outHtml = outHtml;
	function outHtml(jsonstr, cxtPath, gridname) {
		gridObj = jsonstr;
		var xmlHttp_Js = null;
		var xmlHttp_Template = null;
		if (window.ActiveXObject) {
			xmlHttp_Js = new ActiveXObject("Microsoft.XMLHTTP");
			xmlHttp_Template = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp_Js = new XMLHttpRequest();
			xmlHttp_Template = new XMLHttpRequest();
		};
		xmlHttp_Js.onreadystatechange = function() {
			if (xmlHttp_Js.readyState == 4)
				if (xmlHttp_Js.status == 200) {
					window.execScript(xmlHttp_Js.responseText, "JavaScript");
					delete xmlHttp_Js;
					xmlHttp_Js = null;
					CollectGarbage();
				};
		};
		xmlHttp_Js.open("GET", cxtPath + "/template.js", false);
		xmlHttp_Js.send();
		xmlHttp_Template.onreadystatechange = function() {
			if (xmlHttp_Template.readyState == 4)
				if (xmlHttp_Template.status == 200) {
					var template = TrimPath.parseTemplate(
							xmlHttp_Template.responseText, null);
					delete xmlHttp_Template;
					xmlHttp_Template = null;
					delete TrimPath;
					document.write(template.process(gridObj, null));
					template = null;
					CollectGarbage();
				};
		};
		xmlHttp_Template
				.open("GET", cxtPath + "/templates/flexgrid.jsp", false);
		xmlHttp_Template.send();
	};
	this.init = init;
	function init(odivid, Index, primaryKey, Delete, clickEvent, dblclickEvent) {
		this.name = odivid;
		divAll = document.all(odivid);
		if (divAll != null && divAll.tagName == "DIV") {
			divTou = divAll.children[0].children[0];
			divTi = divAll.children[1];
			divSum = divAll.children[2].children[0];
			divTouLeftCol = divAll.children[0].children[1];
			divSumLeftCol = divAll.children[2].children[1];
			divTiLeftCol = divAll.children[3];
			inputSort = divAll.children[4];
			inputSortName = divAll.children[5];
			inputPk = divAll.children[6];
			ctxMenu = divAll.children[8];
			if (divTou != null)
				tabTou = divTou.children[0];
			if (divTi != null)
				tabTi = divTi.children[0];
			if (divSum != null)
				tabSum = divSum.children[0];
			var touLast = tabTou.rows(tabTou.rows.length - 1);
			var tiFirst = tabTi.rows(0);
			if (touLast.cells.length == tiFirst.cells.length) {
				var sumFirst = tabSum.rows(0);
				var len = tiFirst.cells.length - 1;
				var cols = tabTou.getElementsByTagName("COLGROUP")[0];
				var r = 1;
				for (var i = 1; i < len; i++) {
					if (tiFirst.cells(i).style.display == "none") {
						touLast.cells(r).removeNode(true);
						cols.children[r].removeNode(true);
						sumFirst.cells(r).removeNode(true);
						r--;
					};
					r++;
				};
			};
			tabTi.attachEvent("onmousedown", this.doclick);
			tabTi.attachEvent("onkeydown", this.dokeydownTab);
			divTi.attachEvent("onscroll", this.doscroll);
			tabTou.attachEvent("onmousedown", this.domousedown);
			tabTou.attachEvent("onmouseup", this.domouseup);
			tabTou.attachEvent("onmousemove", this.domousemove);
			tabTou.attachEvent("onmouseout", this.domouseout);
			tabTou.attachEvent("onclick", this.doTabTouClick);
			divAll.attachEvent("onresize", this.doresize);
			divAll.attachEvent("oncontextmenu", this.showCtxMenu);
			ctxMenu.attachEvent("onmousedown", this.doCtxClick);
			if (clickEvent != "" && clickEvent != null)
				tabTi.attachEvent("onclick", clickEvent);
			tabTi.attachEvent("ondblclick", this.dblclickEvent);
			var sort = inputSort.value.toString();
			var sortname = inputSortName.value.toString();
			var tou = tabTou.tBodies[0].lastChild;
			for (var i = 1; i < tou.cells.length - 1; i++) {
				var obj = tou.cells[i];
				obj = obj.children[0];
				if (obj.tagName == "SPAN") {
					var attname = obj.getAttribute("sortName");
					if (attname == sortname) {
						lastSortTd = obj;
						if (sort.toUpperCase() == "DESC") {
							obj.children[0].innerText = "6";
							obj.children[0].style.display = "inline";
						} else {
							obj.children[0].innerText = "5";
							obj.children[0].style.display = "inline";
						};
					};
				};
			};
			this.showSum(gridObj.GRIDINFO.hasSum);
			this.showLeft(gridObj.GRIDINFO.hasLeft);
			addHr();
			divAll.fireEvent("onresize");
		};
	};
	this.showSum = showSum;
	function showSum(isShow) {
		var dis = null;
		if (isShow == "true") {
			dis = "";
			divTiLeftCol.style.height = 20;
		} else if (isShow == "false") {
			dis = "none";
			divTiLeftCol.style.height = divTi.clientHeight;
		} else
			return;
		divSum.style.display = dis;
		divSumLeftCol.style.display = dis;
		tabTi.nextSibling.style.display = dis;
	};
	this.showLeft = showLeft;
	function showLeft(isShow) {
		var dis = null;
		if (isShow == "true" && divTouLeftCol.style.display == "none") {
			dis = "";
			var col = document.createElement("COL");
			tabTou.children[0].insertAdjacentElement("afterBegin", col);
			col.width = "30px";
			divTiLeftCol.style.display = "";
			if (divSum.style.display != "none") {
				divSumLeftCol.style.display = "";
				tabSum.rows[0].cells[0].style.display = "";
			};
		} else if (isShow == "false" && divTouLeftCol.style.display != "none") {
			dis = "none";
			tabTou.children[0].children[0].removeNode();
			divSumLeftCol.style.display = "none";
			divTiLeftCol.style.display = "none";
			tabSum.rows[0].cells[0].style.display = "none";
		} else
			return;
		divTouLeftCol.style.display = dis;
		var i = 0;
		var tou = null;
		var ti = null;
		while (i < tabTou.rows.length && (tou = tabTou.rows[i++].cells[0]))
			tou.style.display = dis;
		i = 0;
		while (i < tabTi.rows.length && (ti = tabTi.rows[i++].cells[0]))
			ti.style.display = dis;
	};
	this.addHr = addHr;
	function addHr() {
		var ohr = document.createElement("DIV");
		ohr.className = "divHr";
		ohr.style.display = "none";
		divAll.appendChild(ohr);
		curHr = ohr;
	};
	this.showCtxMenu = showCtxMenu;
	function showCtxMenu() {
		var dtop = 0;
		var dleft = 0;
		var odiv = divAll;
		while (odiv.tagName != "BODY") {
			dtop += odiv.offsetTop;
			dleft += odiv.offsetLeft;
			odiv = odiv.offsetParent;
		};
		var xx = event.clientX;
		var yy = event.clientY;
		ctxMenu.style.display = "block";
		if (xx + ctxMenu.offsetWidth > document.body.offsetWidth)
			xx -= ctxMenu.offsetWidth;
		if (yy + ctxMenu.offsetHeight > document.body.offsetHeight)
			yy -= ctxMenu.offsetHeight;
		xx += document.body.scrollLeft - dleft;
		yy += document.body.scrollTop - dtop;
		if (xx + ctxMenu.offsetWidth > divAll.offsetWidth)
			xx -= ctxMenu.offsetWidth;
		if (yy + ctxMenu.offsetHeight > divAll.offsetHeight)
			yy -= ctxMenu.offsetHeight;
		ctxMenu.style.left = xx;
		ctxMenu.style.top = yy;
		ctxMenu.setCapture(false);
		window.event.cancelBubble = true;
		window.event.returnValue = false;
	};
	this.doCtxClick = doCtxClick;
	function doCtxClick() {
		var eEl = event.srcElement;
		var eTr = eEl;
		var rIndex = null;
		if (eEl.tagName == "SPAN" && ctxMenu.contains(eEl))
			while (eTr != null && (eTr = eTr.parentElement).tagName != "TR");
		if (eTr != null)
			rIndex = eTr.rowIndex;
		switch (rIndex) {
			case 0 :
				moveToFirstRow();
				break;
			case 1 :
				moveToLastRow();
				break;
			default :
				;
		};
		ctxMenu.style.display = "none";
		ctxMenu.releaseCapture();
		window.event.cancelBubble = false;
		window.event.returnValue = true;
	};
	this.moveToFirstRow = moveToFirstRow;
	function moveToFirstRow() {
		if (tabTi.rows.length > 1) {
			if (currentLine != null)
				delightLine(currentLine);
			currentLine = tabTi.rows[1];
			lightLine(currentLine);
			divTi.scrollTop = 0;
		};
	};
	this.moveToLastRow = moveToLastRow;
	function moveToLastRow() {
		if (tabTi.rows.length > 1) {
			if (currentLine != null)
				delightLine(currentLine);
			currentLine = tabTi.rows[tabTi.rows.length - 1];
			lightLine(currentLine);
			if (treeObj != null && currentLine.style.display == "none")
				OpenNode(null,
						currentLine.cells[1].children[0].children[0].nodeid);
			divTi.scrollTop = divTi.scrollHeight - divTi.clientHeight;
		};
	};
	this.showDetail = showDetail;
	function showDetail() {
	};
	this.lightLine = lightLine;
	function lightLine(otr) {
		if (otr.rowIndex == 0)
			return;
		if (otr != null && otr.tagName == "TR") {
			try {
				otr.className = "lightSkin";
			} catch (ex) {
				return;
			};
		};
	};
	this.delightLine = delightLine;
	function delightLine(otr) {
		if (otr != null && otr.tagName == "TR") {
			try {
				otr.className = "";
			} catch (ex) {
				return;
			};
		};
	};
	this.doclick = doclick;
	function doclick() {
		var obj = window.event.srcElement;
		if (obj == null)
			return;
		var oTr = null;
		switch (obj.tagName) {
			case "TR" :
				oTr = obj;
				break;
			case "TD" :
				oTr = obj.parentElement;
				break;
			case "SPAN" :
				oTr = obj.parentElement.parentElement;
				break;
			case "INPUT" :
				oTr = obj.parentElement.parentElement;
				if (obj.type == "checkbox" || obj.type == "radio")
					doCheck(obj);
				break;
			case "SELECT" :
				oTr = obj.parentElement.parentElement;
				break;
			default :
				return;
		};
		try {
			if (currentLine != null)
				delightLine(currentLine);
			if (oTr != null)
				lightLine(oTr);
			currentLine = oTr;
		} catch (ex) {
		};
	};
	this.dokeydownTab = function() {
		var obj = window.event.srcElement;
		var otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var tab = otr.parentElement.parentElement;
		if (tab == null || tab.tagName != "TABLE")
			return;
		if (obj == null)
			return;
		try {
			if (window.event.keyCode == 38 && tab == tabTi)
				moveFocus(obj, -1);
			if (window.event.keyCode == 40 && tab == tabTi)
				moveFocus(obj, 1);
			if (window.event.keyCode == 37 && tab == tabTi) {
				event.returnValue = false;
				event.cancelBubble = true;
			};
			if (window.event.keyCode == 39 && tab == tabTi) {
				event.returnValue = false;
				event.cancelBubble = true;
			};
		} catch (ex) {
		};
	};
	this.IsLast = IsLast;
	function IsLast(obj) {
		if (obj == null)
			return;
		var otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = tabTi.rows[tabTi.rows.length - 2];
		if (otr == null || otr.tagName != "TR")
			return false;
		if (otr.cells[otr.cells.length - 1] == otd)
			return true;
		else
			return false;
	};
	this.moveFocusUd = moveFocusUd;
	function moveFocusUd(obj, par) {
		if (obj == null)
			return;
		var otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var trindex = otr.rowIndex;
		var tdindex = countOT(otd);
		try {
			if (tdindex + par > otr.cells.length - 1 || tdindex + par < 0)
				return;
			var ntd = otr.cells[tdindex + par];
			if (ntd.children[0] != null)
				ntd.children[0].focus();
		} catch (ex) {
			alert(flexgrid_msg_1 + ex.description);
		};
	};
	this.movetToRight = movetToRight;
	function movetToRight(obj) {
		if (obj == null)
			return;
		var otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var index = parseInt(otd.getAttribute("index")) + parseInt(1);
		var objNext = null;
		var tdindex = countOT(otd);
		var trindex = otr.rowIndex;
		var i;
		for (i = tdindex; i < otr.cells.length; i++) {
			var objTemp = otr.cells[i];
			if (objTemp.display != "none"
					&& objTemp.getAttribute("index") == index) {
				objNext = otr.cells[i];
				break;
			};
		};
		if (otd == otr.cells[otr.cells.length - 2]) {
			if (trindex == tabTi.rows.length - 1) {
				addRow();
			};
			var nobj = findFTd(otr.nextSibling).children[0];
			if (nobj != null)
				nobj.focus();
			return;
		};
		objNext.children[0].focus();
	};
	this.movetToLeft = movetToLeft;
	function movetToLeft(obj) {
		if (obj == null)
			return;
		var otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var index = parseInt(otd.getAttribute("index")) - parseInt(1);
		var objNext = otr.cells[i];
		var tdindex = countOT(otd);
		var trindex = otr.rowIndex;
		var i;
		for (i = tdindex; i >= 0; i--) {
			var objTemp = otr.cells[i];
			if (parseInt(objTemp.getAttribute("index")) <= index) {
				objNext = otr.cells[i];
				break;
			};
		};
		if (i < 0) {
			if (trindex == 1) {
				return;
			};
			var nobjtr = otr.parentElement.rows[trindex - 1];
			var nobj = nobjtr.children[nobjtr.cells.length - 1].children[0];
			if (nobj != null)
				nobj.focus();
			return;
		};
		objNext.children[0].focus();
	};
	this.moveFocus = moveFocus;
	function moveFocus(obj, par) {
		if (obj == null)
			return;
		var otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var trindex = otr.rowIndex;
		var tdindex = otd.cellIndex;
		try {
			if (trindex + par >= tabTi.rows.length)
				return;
			var ntr = tabTi.rows[trindex + par];
			var ntd = ntr.cells[tdindex];
			if (trindex == 1 && par == -1) {
				tabTi.rows[1].cells[tdindex].children[0].focus();
				tabTi.rows[1].cells[tdindex].children[0].checked = true;
				delightLine(currentLine);
				lightLine(tabTi.rows[1]);
				currentLine = tabTi.rows[1];
				return;
			};
			delightLine(currentLine);
			lightLine(ntr);
			currentLine = ntr;
		} catch (ex) {
		};
	};
	this.countOT = countOT;
	function countOT(otd) {
		if (otd == null || otd.tagName != "TD")
			return;
		for (var i = 0; i < otd.parentElement.cells.length; i++) {
			var td = otd.parentElement.cells[i];
			if (td == otd)
				return i;
		};
	};
	this.findFTd = findFTd;
	function findFTd(otr) {
		if (otr == null || otr.tagName != "TR")
			return;
		for (var i = 0; i < otr.cells.length; i++) {
			var td = otr.cells[i];
			if (td == null)
				continue;
			if (td.style.display == "none")
				continue;
			else
				return td;
		};
	};
	this.addLine = addLine;
	function addLine() {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var tr = tabTi.rows[0];
		if (tr != null) {
			try {
				tabTi.rows[0].style.display = "block";
				var ntr = tabTi.insertRow();
				ntr.className = tabTi.rows[0].className;
				for (var i = 0; i < tabTi.rows[0].cells.length; i++) {
					var otd = ntr.insertCell();
					otd.innerHTML = tabTi.rows[0].cells[i].innerHTML;
					otd.width = tabTi.rows[0].cells[i].width;
					otd.index = tabTi.rows[0].cells[i].index;
					otd.style.display = tabTi.rows[0].cells[i].style.display;
					otd.setAttribute("style", tabTi.rows[0].cells[i]
							.getAttribute("style"));
				};
				ntr.lastChild.style.borderRight = "0";
				if (divTiLeftCol != null && divTiLeftCol.children[0] != null) {
					var tableft = divTiLeftCol.children[0];
					var row = tableft.insertRow();
					var otd = row.insertCell();
					var rowindex = row.rowIndex;
					otd.innerHTML = "<span>" + (rowindex + 1) + "</span>";
				};
				if (currentLine != null)
					delightLine(currentLine);
				currentLine = tabTi.rows[tabTi.rows.length - 1];
				latd2 = tabTi.rows[tabTi.rows.length - 1];
				lightLine(latd2);
				var fixView = currentLine.offsetTop + currentLine.offsetHeight
						- divTi.scrollTop - divTi.clientHeight
						+ divSum.offsetHeight;
				if (!isNaN(parseInt(divTi.style.paddingTop)))
					fixView += parseInt(divTi.style.paddingTop);
				if (fixView > 0)
					divTi.scrollTop += fixView;
				divAll.scrollTop = divAll.scrollHeight;
			} catch (ex) {
				alert(flexgrid_msg_2 + ex.description);
				return;
			};
		};
	};
	this.addHeight = addHeight;
	function addHeight() {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		try {
			curDivHeight = parseInt(curDivHeight) + parseInt(curTrHeight);
		} catch (ex) {
			alert(flexgrid_msg_3);
			return;
		};
	};
	this.delLine = function() {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		try {
			if (currentLine != null) {
				var oldTr = currentLine.rowIndex;
				var isdel = currentLine.removeNode(true);
				currentLine = null;
				if (divTiLeftCol != null && divTiLeftCol.children[0] != null) {
					var tableft = divTiLeftCol.children[0];
					if (tableft.rows.length > 0)
						tableft.rows[tableft.rows.length - 1].removeNode(true);
				};
				divTou.style.width = divTi.clientWidth;
				divSum.style.width = divTi.clientWidth;
			};
		} catch (ex) {
			alert(flexgrid_msg_4 + ex.description);
			return;
		};
	};
	this.arrangeRows = arrangeRows;
	function arrangeRows() {
		var j = 1;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var trow = tabTi.rows(i);
			if (trow.style.display != "none")
				trow.cells[0].children[0].innerText = j++;
		};
	};
	this.addRow = addRow;
	function addRow() {
		addLine();
		divTiLeftCol.style.height = divTi.clientHeight - 21;
		divTou.style.width = divTi.clientWidth;
		divSum.style.width = divTi.clientWidth;
	};
	this.delRow = delRow;
	function delRow() {
		try {
			if (tabTi == null && tabTi.tagName != "TABLE")
				return;
			if (tabTi.rows.length == 1)
				return;
			if (currentLine == null)
				return;
			this.delLine();
		} catch (ex) {
		};
		divTou.style.width = divTi.clientWidth;
		divSum.style.width = divTi.clientWidth;
	};
	this.doscroll = doscroll;
	function doscroll() {
		if (divTi == null)
			return;
		if (divTou == null)
			return;
		if (divSum == null)
			return;
		var disWid = divTi.scrollLeft;
		divTou.scrollLeft = disWid;
		divTiLeftCol.scrollTop = divTi.scrollTop;
		divSum.scrollLeft = disWid;
	};
	this.domousedown = domousedown;
	function domousedown() {
		var obj = window.event.srcElement;
		var nextTd = null;
		if (obj == null || (obj.tagName != "SPAN" && obj.tagName != "TD"))
			return;
		if (obj.tagName == "SPAN")
			obj = obj.parentElement;
		nextTd = obj.previousSibling;
		while (nextTd != null && nextTd.style.display == "none")
			nextTd = nextTd.previousSibling;
		var absLeft = 0;
		var odiv = divAll;
		while (odiv != document.body) {
			absLeft += odiv.offsetLeft;
			odiv = odiv.offsetParent;
		};
		if (window.event.clientX + document.body.scrollLeft + divTou.scrollLeft > absLeft
				+ obj.offsetLeft + obj.offsetWidth - 13) {
			curTd = obj;
			if (curTd.nextSibling == null)
				return;
			tabTou.setCapture(false);
			isMouDown = true;
			isCanSort = false;
			OldPlace = window.event.clientX;
		} else if (window.event.x + document.body.scrollLeft
				+ divTou.scrollLeft >= absLeft + obj.offsetLeft
				&& window.event.x + document.body.scrollLeft
						+ divTou.scrollLeft < absLeft + obj.offsetLeft + 13) {
			if (nextTd == null)
				return;
			else if (nextTd.cellIndex == 0
					&& divTouLeftCol.style.display != "none")
				return;
			tabTou.setCapture(false);
			curTd = nextTd;
			isMouDown = true;
			isCanSort = false;
			OldPlace = window.event.clientX;
		} else
			isCanSort = true;
		if (isMouDown) {
			var otp = curTd;
			var otl = curTd.offsetWidth;
			while (otp != divAll) {
				otl += otp.offsetLeft;
				otp = otp.offsetParent;
			};
			var odiv = divAll;
			var odl = 0;
			while (odiv.tagName != "BODY") {
				odl += odiv.offsetLeft;
				odiv = odiv.offsetParent;
			};
			fix = event.clientX + document.body.scrollLeft - odl - otl;
			curHr.style.height = divTi.clientHeight;
			curHr.style.left = otl - divTou.scrollLeft;
			curHr.style.display = "block";
		};
	};
	this.domousemove = domousemove;
	function domousemove() {
		var absLeft = 0;
		var odiv = divAll;
		while (odiv != document.body) {
			absLeft += odiv.offsetLeft;
			odiv = odiv.offsetParent;
		};
		if (isMouDown && curHr.style.display == "block") {
			var hrPos = event.clientX + document.body.scrollLeft - absLeft
					- fix - divTou.scrollLeft;
			if (hrPos > divTouLeftCol.offsetWidth)
				curHr.style.left = hrPos;
		};
		var obj = window.event.srcElement;
		if (obj == null || !tabTou.contains(obj)
				|| (obj.tagName != "SPAN" && obj.tagName != "TD"))
			return;
		if (obj.tagName == "SPAN") {
			obj = obj.parentElement;
		};
		if ((window.event.clientX + document.body.scrollLeft
				+ divTou.scrollLeft > absLeft + obj.offsetLeft
				+ obj.offsetWidth - 13 && obj.nextSibling != null)
				|| (window.event.clientX + document.body.scrollLeft
						+ divTou.scrollLeft >= absLeft + obj.offsetLeft && window.event.clientX
						+ document.body.scrollLeft + divTou.scrollLeft < absLeft
						+ obj.offsetLeft + 13) || isMouDown) {
			try {
				if ((!(divTouLeftCol.style.display != "none" && obj.cellIndex == 1))
						&& (!(divTouLeftCol.style.display == "none" && obj.cellIndex == 0)))
					divTou.style.cursor = "col-resize";
			} catch (ex) {
				divTou.style.cursor = "move";
			};
		} else {
			if ((obj.parentElement.rowIndex == tabTou.rows.length - 1)
					&& obj.nextSibling != null)
				divTou.style.cursor = "hand";
			else
				divTou.style.cursor = "default";
		};
	};
	this.domouseup = domouseup;
	function domouseup() {
		divTou.style.cursor = "default";
		if (isMouDown) {
			try {
				nowPlace = window.event.clientX;
				if (isNaN(OldPlace - nowPlace)) {
					isMouDown = false;
					return;
				};
				var ctr = curTd.parentElement;
				for (var i = 0, cel = ctr.cells[0].colSpan - 1; i < ctr.cells.length
						&& ctr.cells[i] != curTd; cel += ctr.cells[++i].colSpan);
				if (divTouLeftCol.style.display == "none")
					--cel;
				var tCol = tabTou.children[0].all(cel);
				var tWidth = tCol.offsetWidth - (OldPlace - nowPlace);
				if (tWidth < 1)
					tWidth = "1px";
				tCol.style.width = "";
				tCol.width = tWidth;
				isMouDown = false;
				var firstRow = tabTi.rows[0];
				for (var j = 0; firstRow.cells[j].cellIndex != cel; j++);
				for (var i = 0; i < tabTi.rows.length; i++) {
					var otd1 = tabTi.rows[i].cells[j];
					if (otd1 != null) {
						otd1.width = tWidth;
						otd1.style.width = "";
					};
				};
				var otd = tabSum.rows[0].cells[0];
				while (otd.cellIndex != cel)
					otd = otd.nextSibling;
				if (otd != null) {
					otd.width = tWidth;
					otd.style.width = "";
				};
				divAll.fireEvent("onresize");
				curHr.style.display = "none";
				isMouDown = false;
				tabTou.releaseCapture();
			} catch (ex) {
				isMouDown = false;
				tabTou.releaseCapture();
				alert(flexgrid_msg_5);
			};
		};
	};
	this.domouseout = domouseout;
	function domouseout() {
		document.body.style.cursor = "default";
	};
	this.setSubmit = setSubmit;
	function setSubmit(val) {
		isSubmit = val;
	};
	this.doTabTouClick = doTabTouClick;
	function doTabTouClick() {
		var obj = window.event.srcElement;
		if (obj.tagName != "SPAN")
			return;
		if (obj.parentElement.parentElement.rowIndex != tabTou.rows.length - 1)
			return;
		if (obj.innerText == "")
			return;
		var objcheckAll = obj.getAttribute("enableCheckAll");
		this.format = obj.getAttribute("format");
		if (objcheckAll == "true") {
			if (obj.children[0].innerText == "6") {
				doCheckAllLine(true, obj.parentElement.cellIndex);
				obj.children[0].innerText = "5";
				obj.children[0].style.display = "block";
			} else {
				doCheckAllLine(false, obj.parentElement.cellIndex);
				obj.children[0].innerText = "6";
				obj.children[0].style.display = "block";
			};
		} else {
			if (outCanSort != true)
				return;
			var objcansort = obj.getAttribute("CanSort");
			if (objcansort == "false")
				return;
			if (isSubmit) {
				if (!isCanSort)
					return;
				if (inputSort != null && inputSortName != null) {
					var sort = inputSort.value;
					var sortname = inputSortName.value;
					if (obj.tagName == "SPAN") {
						var attname = obj.getAttribute("sortName");
						if (attname == sortname) {
							if (sort.toUpperCase() == "DESC") {
								inputSort.value = "ASC";
								obj.children[0].innerText == "6";
								obj.children[0].style.display = "block";
							} else {
								inputSort.value = "DESC";
								obj.children[0].innerText == "5";
								obj.children[0].style.display = "block";
							};
						} else
							inputSortName.value = attname;
					};
					if (document.forms[0] != null)
						document.forms[0].submit();
				};
			} else {
				if (!isCanSort)
					return;
				if (obj.tagName == "SPAN") {
					if (lastSortTd != null)
						lastSortTd.children[0].style.display = "none";
					if (obj.children[0].innerText == "6") {
						obj.children[0].innerText = "5";
						obj.children[0].style.display = "inline";
						orderType = "0";
					} else {
						obj.children[0].innerText = "6";
						obj.children[0].style.display = "inline";
						orderType = "1";
					};
					lastSortTd = obj;
					obj = obj.parentElement;
				};
				if (obj.tagName == "LABEL") {
					if (obj.innerText == "6") {
						obj.innerText = "5";
						orderType = "0";
					} else {
						obj.innerText = "6";
						orderType = "1";
					};
					obj = obj.parentElement.parentElement;
				};
				if (obj.tagName != "TD")
					return;
				var colindex = countOT(obj);
				var firstRow = tabTi.rows[0];
				for (var j = 0; firstRow.cells[j].cellIndex != colindex; j++);
				if (tableArray[0] == null)
					makePlanar();
				sortArray(j - 1);
				fillData();
				this.format = "";
				arrangeRows();
			};
		};
	};
	this.doresize = doresize;
	function doresize() {
		divTi.style.height = divAll.clientHeight;
		divTou.style.width = parseInt(divTi.clientWidth, 10);
		divSum.style.width = parseInt(divTi.clientWidth, 10);
		if (gridObj.GRIDINFO.isWrap == "true") {
			var leftTable = divTiLeftCol.children[0];
			for (var i = 1; i < leftTable.rows.length; i++) {
				leftTable.rows[i].cells[0].style.height = tabTi.rows[i].cells[0].clientHeight
						+ 1;
			};
		};
		var fixt = 1;
		if (tabTi.scrollWidth == divTi.clientWidth)
			fixt = 2;
		var h = divTi.clientHeight - 20	;
		if (h>=0){
		divTiLeftCol.style.height = h;
			
		}
		
		divSum.parentElement.style.top = parseInt(divTi.offsetTop)
				+ parseInt(divTi.clientHeight)
				- (parseInt(divSum.clientHeight)) + 1;
	};
	this.dblclickEvent = dblclickEvent;
	function dblclickEvent() {
	};
	this.focus = focus;
	function focus(row, col) {
		delightLine(currentLine);
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		var otr = tabTi.rows[row];
		if (otr == null)
			return;
		if (otr.style.display != "none" && otr.rowIndex != 0
				&& otr.rowIndex != tabTi.rows.length) {
			lightLine(otr);
			currentLine = otr;
			try {
				var otd = otr.cells[col];
				if (otd != null && otd.children[0] != null)
					otd.children[0].focus();
			} catch (ex) {
				alert(flexgrid_msg_6);
			};
		};
	};
	this.setCellValue = setCellValue;
	function setCellValue(row, col, value) {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		var otr = tabTi.rows[row];
		if (otr == null)
			return;
		if (otr.style.display != "none") {
			try {
				var index = 0;
				for (var i = 1; i < otr.cells.length; i++) {
					var otd = otr.cells[i];
					if (i == col) {
						if (otd.children[0] != null
								&& otd.children[0].tagName == "INPUT")
							otd.children[0].value = value;
						else
							otd.innerText = value;
					};
				};
			} catch (ex) {
				return null;
			};
		};
	};
	this.getCellValue = getCellValue;
	function getCellValue(row, col) {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		var otr = tabTi.rows[row];
		if (otr == null)
			return;
		if (otr.style.display != "none") {
			try {
				var index = 0;
				for (var i = 1; i < otr.cells.length; i++) {
					var otd = otr.cells[i];
					if (i == col) {
						if (otd.children[0] != null
								&& otd.children[0].tagName == "INPUT")
							return otd.children[0].value;
						return otd.innerText;
					};
				};
			} catch (ex) {
				return null;
			};
		};
	};
	this.getCell = getCell;
	function getCell(row, col) {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		var otr = tabTi.rows[row];
		if (otr == null)
			return;
		if (otr.style.display != "none") {
			try {
				var index = 0;
				for (var i = 1; i < otr.cells.length; i++) {
					var otd = otr.cells[i];
					if (i == col) {
						return otd;
					};
				};
			} catch (ex) {
				return null;
			};
		};
	};
	this.returnRowCount = returnRowCount;
	function returnRowCount() {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		return tabTi.rows.length - 1;
	};
	this.sum = sum;
	function sum(col) {
		if (col == "")
			return;
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		var sum = 0;
		for (var i = 1; i < tabTi.rows.length; i++) {
			if (tabTi.rows[i].style.display == "none")
				continue;
			var otd = tabTi.rows[i].cells[col];
			if (otd != null && otd.children[0] != null) {
				var val = parseFloat(otd.children[0].value);
				if (isNaN(val))
					val = 0;
				sum += val;
			};
		};
		return sum;
	};
	this.setSumValue = setSumValue;
	function setSumValue() {
		if (tabSum == null && tabSum.tagName != "TABLE")
			return;
		if (tabTi == null && tabTi.tagName != "TABLE")
			return;
		try {
			for (var i = 1; i < tabTi.rows[0].cells.length; i++) {
				var sum = 0;
				for (var j = 1; j < tabTi.rows.length; j++) {
					var col = tabTi.rows[j].cells[i];
					if (col == null)
						continue;
					var val = col.innerText;
					var head_Cell = tabTou.rows[0].cells[i];
					if (head_Cell && head_Cell.children[0]
							&& head_Cell.children[0].format) {
						var num_foramt = head_Cell.children[0].format;
						if (num_foramt != "" && num_foramt.indexOf("#") != -1) {
							var num_separator = num_foramt.substring(num_foramt
									.indexOf("#")
									+ 1);
							var reg_Exp = new RegExp(num_separator, "g");
							val = val.replace(reg_Exp, "");
						};
					};
					if (isNaN(val))
						continue;
					sum += parseFloat(val);
				};
				if (sum != 0 && !isNaN(sum))
					tabSum.rows[0].cells[i].innerHTML = "<span>" + sum
							+ "</span>";
			};
		} catch (ex) {
			alert(flexgrid_msg_7);
		};
	};
	this.getSumFieldValue = getSumFieldValue;
	function getSumFieldValue(col) {
		col--;
		if (col > 0 && col < gridObj.TabSum.rows[0].cols.length)
			return gridObj.TabSum.rows[0].cols[col].text;
	};
	this.getCurrentLine = getCurrentLine;
	function getCurrentLine() {
		if (currentLine == null)
			return null;
		return currentLine.rowIndex;
	};
	this.doCheck = doCheck;
	function doCheck(obj) {
		if (obj != null && obj.type == "checkbox") {
			if (inputPk == null)
				return;
			var str = inputPk.value;
			if (obj.checked) {
				if (str.indexOf(obj.value) > -1) {
					restr = new RegExp("," + obj.value);
					str = str.replace(restr, "");
				};
			} else {
				str += "," + obj.value;
			};
			inputPk.value = str;
		};
		if (obj != null && obj.type == "radio") {
			if (inputPk == null)
				return;
			inputPk.value = obj.value;
		};
	};
	this.getCheckLine = getCheckLine;
	function getCheckLine(flag) {
		if (flag == null || flag == "")
			flag = ",";
		if (tabTi == null && tabTi.tagName != "TABLE")
			return "";
		try {
			var col = null;
			for (var i = 0; i < tabTi.rows[1].cells.length; i++) {
				var otd = tabTi.rows[1].cells[i].children[0];
				if (otd != null
						&& (otd.type == "checkbox" || otd.type == "radio")) {
					col = i;
					break;
				};
			};
			if (col == null || isNaN(col))
				return "";
			var str = "";
			for (var j = 1; j < tabTi.rows.length; j++) {
				if (tabTi.rows[j].cells[col].children[0].tagName == "INPUT") {
					if (tabTi.rows[j].cells[col].children[0].checked)
						str += tabTi.rows[j].cells[col].children[0].value
								+ flag;
				};
			};
			return str.substring(0, str.length - 1);
		} catch (ex) {
			return "";
		};
	};
	this.getCheckAll = getCheckAll;
	function getCheckAll(flag1, flag2) {
		if (flag1 == null || flag1 == "")
			flag1 = ",";
		if (flag2 == null || flag2 == "")
			flag2 = "|";
		if (tabTi == null && tabTi.tagName != "TABLE")
			return "";
		try {
			var col = null;
			for (var i = 0; i < tabTi.rows[1].cells.length; i++) {
				var otd = tabTi.rows[1].cells[i].children[0];
				if (otd != null
						&& (otd.type == "checkbox" || otd.type == "radio")) {
					col = i;
					break;
				};
			};
			if (col == null || isNaN(col))
				return "";
			var str = "";
			for (var j = 1; j < tabTi.rows.length; j++) {
				if (tabTi.rows[j].cells[col].children[0].tagName == "INPUT") {
					if (tabTi.rows[j].cells[col].children[0].checked) {
						for (var k = 1; k < tabTi.rows[j].cells.length; k++) {
							var ootd = tabTi.rows[j].cells[k];
							if (ootd.children[0] != null) {
								var val = "";
								if (ootd.children[0].tagName == "INPUT")
									val = ootd.children[0].value;
								else
									val = ootd.children[0].innerText;
								if (val == null)
									val = "";
								str += val + flag1;
							};
						};
						str += flag2;
					};
				};
			};
			return str.substring(0, str.length - 1);
		} catch (ex) {
			return "";
		};
	};
	this.getCheckLineNo = getCheckLineNo;
	function getCheckLineNo() {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return "";
		try {
			var col = null;
			for (var i = 0; i < tabTi.rows[1].cells.length; i++) {
				var otd = tabTi.rows[1].cells[i].children[0];
				if (otd != null
						&& (otd.type == "checkbox" || otd.type == "radio")) {
					col = i;
					break;
				};
			};
			if (col == null || isNaN(col))
				return "";
			var str = "";
			for (var j = 1; j < tabTi.rows.length; j++) {
				if (tabTi.rows[j].cells[col].children[0].checked)
					str += j + ",";
			};
			return str.substring(0, str.length - 1);
		} catch (ex) {
			return "";
		};
	};
	this.doCheckAllLine = doCheckAllLine;
	function doCheckAllLine(isCheck, colIndex) {
		var col = -1;
		if (tabTi == null && tabTi.tagName != "TABLE")
			return "";
		try {
			for (var i = 0; i < tabTi.rows[1].cells.length; i++) {
				var otd = tabTi.rows[1].cells[i];
				if (otd.style.display != "none") {
					col++;
				};
				if (col == colIndex) {
					col = i;
					break;
				};
			};
			if (col == null || isNaN(col))
				return false;
			var str = "";
			if (isCheck) {
				for (var j = 1; j < tabTi.rows.length; j++) {
					if (tabTi.rows[j].cells[col].children[0].disabled != true)
						tabTi.rows[j].cells[col].children[0].checked = true;
				};
				return true;
			} else {
				for (var j = 1; j < tabTi.rows.length; j++) {
					if (tabTi.rows[j].cells[col].children[0].disabled != true)
						tabTi.rows[j].cells[col].children[0].checked = false;
				};
				return true;
			};
		} catch (ex) {
			return false;
		};
	};
	this.makePlanar = makePlanar;
	function makePlanar() {
		if (tabTi == null)
			return;
		if (tableArray == null)
			tableArray = new Array();
		var rowArray;
		for (var i = 1; i < tabTi.rows.length; i++) {
			rowArray = new Array();
			for (var j = 0; j < tabTi.rows[0].cells.length; j++) {
				var otd = tabTi.rows[i].cells[j];
				var otxt = "";
				rowArray.push({
					text : otd.innerText,
					html : otd.innerHTML
				});
			};
			tableArray[i - 1] = rowArray;
		};
	};
	this.sortArray = sortArray;
	function sortArray(col) {
		if (tableArray[0] == null)
			return;
		if (typeof(col) != "number")
			return;
		if (col >= tableArray[0].length)
			return;
		sortCol = col;
		tableArray.sort(sortFun);
		if (orderType == "1")
			tableArray.reverse();
	};
	this.fillData = fillData;
	function fillData() {
		if (tableArray == null)
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			for (var j = 0; j < tabTi.rows[0].cells.length; j++) {
				if (tableArray[i - 1][j] != null && tableArray[i - 1][j] != "")
					tabTi.rows[i].cells[j].innerHTML = tableArray[i - 1][j].html;
			};
		};
	};
	this.sortFun = sortFun;
	function sortFun(par1, par2) {
		if (typeof(par1) == "object" && typeof(par1) == "object") {
			par1 = par1[sortCol + 1];
			par2 = par2[sortCol + 1];
		};
		par1 = par1.text;
		par2 = par2.text;
		if (sortType == "1") {
			if (this.format && this.format != ""
					&& this.format.indexOf("#") != -1) {
				var num_format = format.substring(format.indexOf("#") + 1);
				var reg_Exp = new RegExp(num_format, "g");
				par1 = par1.replace(reg_Exp, "");
				par2 = par2.replace(reg_Exp, "");
			};
			if (!isNaN(par1) && !isNaN(par2)) {
				if (parseFloat(par1) > parseFloat(par2))
					return 1;
				else if (parseFloat(par1) < parseFloat(par2))
					return -1;
				if (parseFloat(par1) == parseFloat(par2))
					return 0;
			};
			if (typeof(par1) == "string" && typeof(par1) == "string") {
				if (par1.substring(0, 1) == "��" && par2.substring(0, 1) == "��") {
					if (parseFloat(par1.substring(1, par1.length)) > parseFloat(par2
							.substring(1, par2.length)))
						return 1;
					else if (parseFloat(par1.substring(1, par1.length)) < parseFloat(par2
							.substring(1, par2.length)))
						return -1;
					if (parseFloat(par1.substring(1, par1.length)) == parseFloat(par2
							.substring(1, par2.length)))
						return 0;
				};
				if (par1.substr(par1.length - 1, 1) == "%"
						&& par2.substr(par2.length - 1, 1) == "%") {
					if (parseFloat(par1.substring(0, par1.length - 1)) > parseFloat(par2
							.substring(0, par2.length - 1)))
						return 1;
					else if (parseFloat(par1.substring(0, par1.length - 1)) < parseFloat(par2
							.substring(0, par2.length - 1)))
						return -1;
					if (parseFloat(par1.substring(0, par1.length - 1)) == parseFloat(par2
							.substring(0, par2.length - 1)))
						return 0;
				};
				par1 = par1.toString();
				par2 = par2.toString();
				if (par1 > par2)
					return 1;
				if (par1 < par2)
					return -1;
				if (par1 == par2)
					return 0;
			};
		} else {
			par1 = par1.toString();
			par2 = par2.toString();
			if (par1 > par2)
				return 1;
			if (par1 < par2)
				return -1;
			if (par1 == par2)
				return 0;
		};
		return 0;
	};
	this.setCanSort = setCanSort;
	function setCanSort(val) {
		outCanSort = val;
	};
	this.setTouText = setTouText;
	function setTouText(col, val) {
		if (tabTou == null)
			return;
		var otd = tabTou.rows[0].cells[col];
		var ospan = otd.children[0];
		var olabel = ospan.children[0];
		ospan.innerHTML = val + olabel.outerHTML;
	};
	this.setTouAlign = setTouAlign;
	function setTouAlign(col, val) {
		if (tabTou == null)
			return;
		if (col < 1 || col >= tabTou.rows[0].cells.length - 1)
			return;
		var otd = tabTou.rows[0].cells[col];
		var ospan = otd.children[0];
		ospan.style.textAlign = val;
	};
	this.setSumAlign = setSumAlign;
	function setSumAlign(col, val) {
		if (tabSum == null)
			return;
		var otd = tabSum.rows[0].cells[col];
		var ospan = otd.children[0];
		ospan.style.textAlign = val;
	};
	this.setSumCellText = setSumCellText;
	function setSumCellText(col, val) {
		if (tabSum == null)
			return;
		var otd = tabSum.rows[0].cells[col];
		var ospan = otd.children[0];
		ospan.innerHTML = val;
	};
	this.setTiValue = setTiValue;
	function setTiValue(row, col, val) {
		if (tabTi == null)
			return;
		var otdc = tabTi.rows[row].cells[col].children[0];
		if (otdc.tagName == "SPAN")
			otdc.innerText = val;
		else if (otdc.tagName == "INPUT")
			otdc.value = val;
		else
			return;
	};
	this.setSumText = setSumText;
	function setSumText(val) {
		if (divSum == null)
			return;
		var divsumnext = divSum.nextSibling.children[0];
		if (divsumnext == null)
			return;
		divsumnext.children[0].rows[0].cells[0].innerText = val;
	};
	this.setTabTiClick = setTabTiClick;
	function setTabTiClick(evevtstr) {
		if (tabTi == null)
			return;
		if (evevtstr == null || evevtstr == "")
			return;
		tabTi.attachEvent("onclick", evevtstr);
	};
	this.TreeInit = TreeInit;
	function TreeInit(jsonStr) {
		if (jsonStr == null || jsonStr == "")
			return;
		OpenImg = gridObj.GRIDINFO.openFlag;
		CloseImg = gridObj.GRIDINFO.closeFlag;
		treeObj = eval(jsonStr);
		for (var i = 0; i < treeObj.length; i++) {
			var onode = treeObj[i];
			paddingLeft = 0;
			InitTreeNode(onode);
		};
		AddImgEvent();
		arrangeRows();
		divAll.fireEvent("onresize");
	};
	this.InitTreeNode = InitTreeNode;
	function InitTreeNode(node) {
		if (node == null)
			return;
		paddingLeft += 15;
		for (var i = 0; i < node.branch.length; i++) {
			var onode = node.branch[i];
			var onodeid = onode.nodeId;
			PaddingRow(onodeid);
			HidRow(onodeid);
			if (onode.branch.length > 0)
				InitTreeNode(onode);
			else {
				closeImg(onodeid);
			};
		};
		paddingLeft -= 15;
	};
	this.AddImgEvent = AddImgEvent;
	function AddImgEvent() {
		if (tabTi == null)
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			var otd = otr.cells[1];
			var odiv = otd.children[0];
			var oimg = odiv.children[0];
			if (oimg != null && oimg.tagName == "IMG")
				oimg.attachEvent("onclick", doImgClick);
		};
	};
	this.ShowLeft = ShowLeft;
	function ShowLeft() {
		var tabLeft = divTiLeftCol.children[0];
		var Ltr = null;
		for (var j = 0; j < tabLeft.rows.length; j++) {
			var otr = tabLeft.rows[j];
			if (otr.style.display == "none") {
				Ltr = otr;
				break;
			};
		};
		if (Ltr != null)
			Ltr.style.display = "block";
	};
	this.HidLeft = HidLeft;
	function HidLeft() {
		var tabLeft = divTiLeftCol.children[0];
		var Ltr = null;
		for (var j = tabLeft.rows.length - 1; j >= 0; j--) {
			var otr = tabLeft.rows[j];
			if (otr.style.display != "none") {
				Ltr = otr;
				break;
			};
		};
		if (Ltr != null)
			Ltr.style.display = "none";
	};
	this.HidRow = HidRow;
	function HidRow(id) {
		if (tabTi == null)
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			var otd = otr.cells[1];
			var odiv = otd.children[0];
			var oimg = odiv.children[0];
			if (oimg.nodeid == id) {
				if (otr.style.display != "none") {
					otr.style.display = "none";
					HidLeft();
				};
			};
		};
	};
	this.closeImg = closeImg;
	function closeImg(id) {
		if (tabTi == null)
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			var otd = otr.cells[1];
			var odiv = otd.children[0];
			var oimg = odiv.children[0];
			if (oimg.nodeid == id) {
				oimg.isLast = "1";
				oimg.src = CloseImg;
			};
		};
	};
	this.ShowRow = ShowRow;
	function ShowRow(id) {
		if (tabTi == null)
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			var otd = otr.cells[1];
			var odiv = otd.children[0];
			var oimg = odiv.children[0];
			if (oimg.nodeid == id) {
				otr.style.display = "block";
				if (odiv.offsetWidth > otd.offsetWidth + 3)
					addWidth(1, odiv.offsetWidth);
				ShowLeft();
				ChangeImg2(oimg);
			};
		};
	};
	this.PaddingRow = PaddingRow;
	function PaddingRow(id) {
		if (tabTi == null)
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			var otd = otr.cells[1];
			var odiv = otd.children[0];
			var oimg = odiv.children[0];
			if (oimg.nodeid == id) {
				var width1 = odiv.offsetWidth;
				var width2 = paddingLeft + oimg.offsetWidth;
				if (width1 < width2)
					addWidth(1, width2);
				odiv.style.paddingLeft = paddingLeft;
			};
		};
	};
	this.addWidth = addWidth;
	function addWidth(col, wid) {
		tabTou.rows[0].cells[col].width = wid + 5;
		tabSum.rows[0].cells[col].width = wid + 5;
		for (var i = 0; i < tabTi.rows.length; i++) {
			var otd = tabTi.rows[i].cells[col];
			if (otd != null) {
				otd.width = wid + 5;
			};
		};
	};
	this.doImgClick = doImgClick;
	function doImgClick() {
		var img = window.event.srcElement;
		if (img.tagName != "IMG")
			return;
		var nodeid = img.nodeid;
		if (img.open != "1") {
			OpenNode(null, nodeid);
			ChangeImg1(img);
		} else {
			CloseNode(null, nodeid);
			ChangeImg2(img);
		};
		divAll.fireEvent("onresize");
	};
	this.ChangeImg1 = ChangeImg1;
	function ChangeImg1(img) {
		if (img != null && img.tagName == "IMG") {
			if (img.isLast == "1")
				return;
			img.src = CloseImg;
			img.open = "1";
		};
	};
	this.ChangeImg2 = ChangeImg2;
	function ChangeImg2(img) {
		if (img != null && img.tagName == "IMG") {
			if (img.isLast == "1")
				return;
			img.src = OpenImg;
			img.open = "0";
		};
	};
	this.OpenNode = OpenNode;
	function OpenNode(node, nodeid) {
		if (treeObj == null)
			return;
		if (node == null)
			node = treeObj;
		else
			node = node.branch;
		for (var i = 0; i < node.length; i++) {
			var onode = node[i];
			if (onode.nodeId == nodeid) {
				ZhanKai(onode);
				arrangeRows();
				return;
			};
			if (onode.branch.length > 0) {
				OpenNode(onode, nodeid);
				arrangeRows();
			};
		};
	};
	this.CloseNode = CloseNode;
	function CloseNode(node, nodeid) {
		if (treeObj == null)
			return;
		if (node == null)
			node = treeObj;
		else
			node = node.branch;
		for (var i = 0; i < node.length; i++) {
			var onode = node[i];
			if (onode.nodeId == nodeid) {
				GuanBi(onode);
				arrangeRows();
				return;
			};
			if (onode.branch.length > 0) {
				CloseNode(onode, nodeid);
				arrangeRows();
			};
		};
	};
	this.ZhanKai = ZhanKai;
	function ZhanKai(onode) {
		for (var i = 0; i < onode.branch.length; i++) {
			var oonode = onode.branch[i];
			var ooid = oonode.nodeId;
			ShowRow(ooid);
		};
	};
	this.GuanBi = GuanBi;
	function GuanBi(onode) {
		for (var i = 0; i < onode.branch.length; i++) {
			var oonode = onode.branch[i];
			var ooid = oonode.nodeId;
			HidRow(ooid);
			if (oonode.branch.length > 0)
				GuanBi(oonode);
		};
	};
	this.OpenNodeById = OpenNodeById;
	function OpenNodeById(ids) {
		if (ids == null || ids == "")
			return;
		var arrid = ids.split(",");
		var imgs = divAll.getElementsByTagName("img");
		for (var i = 0; i < arrid.length; i++) {
			if (arrid[i] == null || arrid[i] == "")
				continue;
			for (var j = 0; j < imgs.length; j++) {
				var oimg = imgs[j];
				if (oimg.nodeid == arrid[i]) {
					oimg.click();
				};
			};
		};
	};
	this.resetPageIndex = resetPageIndex;
	function resetPageIndex() {
		document.all('net.mast.web.taglib.util.GRIDINFOPRIMARY').value = null;
		document.all("net.mast.web.taglib.util.RESETPAGEINDEX").value = "true";
	};
	this.pinCol = pinCol;
	function pinCol(col) {
	};
	this.cancelPinCol = cancelPinCol;
	function cancelPinCol(col) {
	};
	this.pinRow = pinRow;
	function pinRow(row) {
	};
	this.cancelPinRow = cancelPinRow;
	function cancelPinRow(row) {
	};
	this.showDetail = showDetail;
	function showDetail() {
	};
	this.hideDetail = hideDetail;
	function hideDetail() {
	};
};
function resetPageIndex() {
	var oField = document.all('net.mast.web.taglib.util.GRIDINFOPRIMARY');
	if (oField != null)
		oField.value = null;
	oField = document.all("net.mast.web.taglib.util.RESETPAGEINDEX");
	if (oField != null)
		oField.value = "true";
};
