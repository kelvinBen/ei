function EDITGRID() {
	var gridObj = null;
	var divAll = null;
	var divTou = null;
	var divTi = null;
	var divSum = null;
	var divTiLeftCol = null;
	var divTouLeftCol = null;
	var divSumLeftCol = null;
	var inputRowCount = null;
	var tabTou = null;
	var tabTi = null;
	var tabSum = null;
	var oldFTr = null;
	var curDivHeight = "";
	var curTrHeight = "";
	var currentLine = null;
	var isMouDown = false;
	var OldPlace = null;
	var nowPlace = null;
	var curTd = null;
	var curHr = null;
	var fix = 0;
	var primaryKeyCol = -1;
	var deleteCol = -1;
	var indexCol = -1;
	var targetFormat = "yyyy-MM-dd HH:mm";
	var tabTouTrIndex = 1;
	var divSecTou = null;
	var divDateAll = null;
	var divDate = null;
	var divTime = null;
	var curDateTd = null;
	var dDate = new Date();
	var month = dDate.getMonth() + 1;
	var year = dDate.getFullYear();
	var day = dDate.getDate();
	var hour = dDate.getHours();
	var minute = dDate.getMinutes();
	var second = dDate.getSeconds();
	var oldday = null;
	var inputtextid = null;
	var inputtext = null;
	var innerhtml = "";
	var middle = "-";
	var date_interv = null;
	var date_interv_ob = null;
	var date_currob = null;
	var isShow = false;
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
				.open("GET", cxtPath + "/templates/editgrid.jsp", false);
		xmlHttp_Template.send();
	};
	this.init = function(odivid, Index, primaryKey, Delete, tabtouindex,
			clickEvent, dblclickEvent) {
		var screenWidth = document.body.clientWidth;
		var divW = parseInt(screenWidth) * 0.9;
		divAll = document.all(odivid);
		tabTouTrIndex = tabtouindex;
		if (divAll != null && divAll.tagName == "DIV") {
			divTou = divAll.children[0].children[0];
			divTi = divAll.children[1];
			divSum = divAll.children[2].children[0];
			divTouLeftCol = divAll.children[0].children[1];
			divTiLeftCol = divAll.children[4];
			divSumLeftCol = divAll.children[2].children[1];
			inputRowCount = divAll.children[3];
			divDateAll = divAll.children[5];
			curDivHeight = divTi.style.height;
			if (divTou != null)
				tabTou = divTou.children[0];
			if (divTi != null)
				tabTi = divTi.children[0];
			if (divSum != null)
				tabSum = divSum.children[0];
			curTrHeight = tabTi.rows[0].clientHeight;
			oldFTr = tabTi.rows[0];
			if (primaryKey != "" && primaryKey != null)
				primaryKeyCol = primaryKey;
			if (Delete != "" && Delete != null)
				deleteCol = Delete;
			if (Index != "" && Index != null)
				indexCol = Index;
			tabTi.attachEvent("onmousedown", this.doclick);
			tabTi.attachEvent("onkeydown", this.dokeydownTab);
			divTi.attachEvent("onscroll", this.doscroll);
			tabTou.attachEvent("onclick", this.doTabTouClick);
			tabTou.attachEvent("onmousedown", this.domousedown);
			tabTou.attachEvent("onmouseup", this.domouseup);
			tabTou.attachEvent("onmousemove", this.domousemove);
			tabTou.attachEvent("onmouseout", this.domouseout);
			divTou.attachEvent("onselectstart", this.domouseselect);
			divAll.attachEvent("onresize", this.doresize);
			if (clickEvent != "" && clickEvent != null)
				tabTi.attachEvent("onclick", clickEvent);
			if (dblclickEvent != "" && dblclickEvent != null)
				tabTi.attachEvent("ondblclick", dblclickEvent);
			addHr();
			CountSum();
			divAll.style.overflow = "visible";
			divAll.style.overflow = "hidden";
			divAll.fireEvent("onresize");
		};
	};
	this.showSum = showSum;
	function showSum(isShow) {
		var dis = null;
		if (isShow == "true")
			dis = "";
		else if (isShow == "false")
			dis = "none";
		else
			return;
		divSum.style.display = dis;
		divSumLeftCol.style.display = dis;
		tabTi.nextSibling.style.display = dis;
		divSum.parentNode.style.display = dis;
	};
	this.showLeft = showLeft;
	function showLeft(isShow) {
		var dis = null;
		if (isShow == "true" && divTouLeftCol.style.display == "none") {
			dis = "";
			var col = document.createElement("COL");
			tabTou.children[0].insertAdjacentElement("afterBegin", col);
			col.width = "30px";
			if (divSum.style.display != "none") {
				divSumLeftCol.style.display = "";
				tabSum.rows[0].cells[0].style.display = "";
			};
		} else if (isShow == "false" && divTouLeftCol.style.display != "none") {
			dis = "none";
			tabTou.children[0].children[0].removeNode();
			divSumLeftCol.style.display = "none";
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
	this.getTabTi = getTabTi;
	function getTabTi() {
		return tabTi;
	};
	this.addHr = addHr;
	function addHr() {
		var ohr = document.createElement("DIV");
		ohr.className = "divHr";
		ohr.style.display = "none";
		divAll.appendChild(ohr);
		curHr = ohr;
	};
	this.hidDelCol = hidDelCol;
	function hidDelCol(col) {
		if (col == "" || col == -1)
			return;
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		for (var i = 0; i < tabTi.rows.length; i++) {
			var otd = tabTi.rows[i].cells[col];
			if (otd != null)
				otd.style.display = "none";
		};
	};
	this.changeDelValue = changeDelValue;
	function changeDelValue(otr) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		if (otr == "" || otr == null || otr.tagName != "TR")
			return;
		if (deleteCol == -1)
			return;
		try {
			otr.cells[deleteCol].children[0].value = 1;
		} catch (ex) {
			alert(grid_msg_1);
		};
	};
	this.insertRow = insertRow;
	function insertRow(rowIndex) {
		if (rowIndex == null) {
			this.addRow();
			return;
		};
		if (rowIndex <= 0 || rowIndex > tabTi.rows.length)
			return;
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var tr = tabTi.rows[0];
		if (tr != null) {
			try {
				tabTi.rows[0].style.display = "block";
				var ntr = tabTi.insertRow(rowIndex);
				ntr.className = tabTi.rows[0].className;
				var otd = ntr.insertCell();
				var cell0 = tabTi.rows[0].cells[0];
				otd.innerHTML = cell0.innerHTML;
				otd.width = cell0.width;
				otd.className = cell0.className;
				for (var i = 1; i < tabTi.rows[0].cells.length; i++) {
					var otd = ntr.insertCell();
					var celli = tabTi.rows[0].cells[i];
					otd.innerHTML = celli.innerHTML;
					otd.width = celli.width;
					otd.index = celli.index;
					if (celli.style.display != "undefined")
						otd.style.display = celli.style.display;
				};
				ntr.lastChild.style.borderRight = "0";
				if (currentLine != null)
					delightLine(currentLine);
				currentLine = ntr;
				latd2 = ntr;
				lightLine(latd2);
				var fixView = currentLine.offsetTop + currentLine.offsetHeight
						- divTi.scrollTop - divTi.clientHeight
						+ divSum.offsetHeight;
				if (!isNaN(parseInt(divTi.style.paddingTop)))
					fixView += parseInt(divTi.style.paddingTop);
				if (fixView > 0)
					divTi.scrollTop += fixView;
				if (inputRowCount != null) {
					inputRowCount.value = parseInt(inputRowCount.value) + 1;
					if (tabTi.rows.length - 1 != inputRowCount.value)
						inputRowCount.value = tabTi.rows.length - 1;
				};
				rename();
				if (divTiLeftCol != null && divTiLeftCol.children[0] != null) {
					var tableft = divTiLeftCol.children[0];
					var row = tableft.insertRow();
					var otd = row.insertCell();
					var rowindex = row.rowIndex;
					otd.innerHTML = "<span>" + (rowindex) + "</span>";
				};
				divAll.scrollTop = divAll.scrollHeight;
				if (divSum.style.display == "none") {
					divTiLeftCol.style.height = divTi.clientHeight;
				} else {
					divTiLeftCol.style.height = divTi.clientHeight - 21;
				};
			} catch (ex) {
				alert(grid_msg_2 + ex.description);
				return;
			};
		};
		divTou.style.width = divTi.clientWidth;
		divSum.style.width = divTi.clientWidth;
		this.arrangeRows();
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
				var otd = ntr.insertCell();
				var cell0 = tabTi.rows[0].cells[0];
				otd.innerHTML = cell0.innerHTML;
				otd.width = cell0.width;
				otd.className = cell0.className;
				for (var i = 1; i < tabTi.rows[0].cells.length; i++) {
					var otd = ntr.insertCell();
					var celli = tabTi.rows[0].cells[i];
					otd.innerHTML = celli.innerHTML;
					otd.width = celli.width;
					otd.index = celli.index;
					if (celli.style.display != "undefined")
						otd.style.display = celli.style.display;
				};
				ntr.lastChild.style.borderRight = "0";
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
				if (inputRowCount != null) {
					inputRowCount.value = parseInt(inputRowCount.value) + 1;
					if (tabTi.rows.length - 1 != inputRowCount.value)
						inputRowCount.value = tabTi.rows.length - 1;
				};
				rename(ntr);
				if (divTiLeftCol != null && divTiLeftCol.children[0] != null) {
					var tableft = divTiLeftCol.children[0];
					var row = tableft.insertRow();
					var otd = row.insertCell();
					var rowindex = row.rowIndex;
					otd.innerHTML = "<span>" + (rowindex) + "</span>";
				};
				divAll.scrollTop = divAll.scrollHeight;
				if (divSum.style.display == "none") {
					divTiLeftCol.style.height = divTi.clientHeight;
				} else {
					divTiLeftCol.style.height = divTi.clientHeight - 21;
				};
			} catch (ex) {
				alert(grid_msg_2 + ex.description);
				return;
			};
		};
	};
	this.addHeight = addHeight;
	function addHeight() {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		try {
			curDivHeight = parseInt(curDivHeight) + parseInt(curTrHeight);
		} catch (ex) {
			alert(gird_msg_3);
			return;
		};
	};
	this.lowHeight = lowHeight;
	function lowHeight() {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
	};
	this.delLine = function() {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		try {
			if (currentLine != null) {
				var oldTr = currentLine.rowIndex;
				var isdel = currentLine.removeNode(true);
				var otr = this.findCurrentLine(oldTr);
				currentLine = otr;
				if (inputRowCount != null) {
					inputRowCount.value = parseInt(inputRowCount.value) - 1;
					if (tabTi.rows.length - 1 != inputRowCount.value)
						inputRowCount.value = tabTi.rows.length - 1;
				};
				rename();
				if (divTiLeftCol != null && divTiLeftCol.children[0] != null) {
					var tableft = divTiLeftCol.children[0];
					if (tableft.rows.length > 0)
						tableft.rows[tableft.rows.length - 1].removeNode(true);
				};
				divTou.style.width = divTi.clientWidth;
				divSum.style.width = divTi.clientWidth;
			};
		} catch (ex) {
			alert("删除一行失败2！");
			return;
		};
	};
	this.arrangeRows = arrangeRows;
	function arrangeRows() {
		var leftTi = divTiLeftCol.children[0];
		for (var i = 1; i < leftTi.rows.length; i++) {
			var trow = leftTi.rows(i);
			trow.cells[0].children[0].innerText = trow.rowIndex;
		};
	};
	this.hideLine = function(ctr) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		try {
			if (ctr == null)
				ctr = currentLine;
			ctr.style.display = "none";
			changeDelValue(ctr);
			this.delightLine(ctr);
			var otr = this.findCurrentLine(ctr.rowIndex);
			currentLine = otr;
			if (inputRowCount != null) {
				inputRowCount.value = parseInt(inputRowCount.value) - 1;
				if (tabTi.rows.length - 1 != inputRowCount.value)
					inputRowCount.value = tabTi.rows.length - 1;
			};
			rename();
			if (divTiLeftCol != null && divTiLeftCol.children[0] != null) {
				var tableft = divTiLeftCol.children[0];
				if (tableft.rows.length > 0)
					tableft.rows[tableft.rows.length - 1].removeNode(true);
			};
			divTou.style.width = divTi.clientWidth;
			divSum.style.width = divTi.clientWidth;
		} catch (ex) {
			alert(grid_msg_5 + ex.description);
			return;
		};
	};
	this.findCurrentLine = function(rowindex) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		if (rowindex != null) {
			try {
				var ntr = null;
				for (var i = rowindex - 1; i > 0; i--) {
					var otr = tabTi.rows[i];
					if (otr != null && otr.style.display != "none") {
						ntr = otr;
						break;
					};
				};
				if (ntr == null) {
					for (var i = 1; i < tabTi.rows.length; i++) {
						var otr = tabTi.rows[i];
						if (otr != null && otr.style.display != "none") {
							ntr = otr;
							break;
						};
					};
				};
				if (ntr != null)
					this.lightLine(ntr);
				return ntr;
			} catch (ex) {
				alert("查找当前行失败！" + ex.description);
				return;
			};
		};
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
		var otd = null;
		switch (obj.tagName) {
			case "TR" :
				otd = obj.children[0];
				oTr = obj;
				break;
			case "TD" :
				oTr = obj.parentElement;
				otd = obj;
				break;
			case "INPUT" :
				oTr = obj.parentElement.parentElement;
				otd = obj.parentElement;
				break;
			case "IMG" :
				oTr = obj.parentElement.parentElement;
				otd = obj.parentElement;
				break;
			case "SELECT" :
				oTr = obj.parentElement.parentElement.parentElement;
				otd = obj.parentElement.parentElement;
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
			alert(ex.description);
		};
	};
	this.dokeydownTab = function() {
		var obj = window.event.srcElement;
		if (obj == null)
			return;
		var otd = null;
		if (obj.tagName == "SELECT")
			otd = obj.parentElement.parentElement;
		else
			otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var tab = otr.parentElement.parentElement;
		if (tab == null || tab.tagName != "TABLE")
			return;
		try {
			if (window.event.keyCode == "13") {
				movetToRight(obj);
				return;
			};
			if (window.event.keyCode == 38 && tab == tabTi)
				moveFocus(obj, -1);
			if (window.event.keyCode == 40 && tab == tabTi)
				moveFocus(obj, 1);
			if (window.event.keyCode == 37 && tab == tabTi)
				movetToLeft(obj);
			if (window.event.keyCode == 39 && tab == tabTi)
				movetToRight(obj)
		} catch (ex) {
		};
	};
	this.IsLast = IsLast;
	function IsLast(obj) {
		if (obj == null)
			return;
		var otd = null;
		if (obj.tagName == "SELECT")
			otd = obj.parentElement.parentElement;
		else
			otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = tabTi.rows[tabTi.rows.length - 1];
		if (otr == null || otr.tagName != "TR")
			return false;
		for (var i = otr.cells.length - 1; i > 0; i--) {
			var ntd = otr.cells[i];
			var nch = null;
			if (ntd.children[1] != null && ntd.children[1].tagName == "DIV") {
				nch = ntd.children[1].children[0];
			} else
				nch = ntd.children[0];
			if (nch == null
					|| (nch.tagName != "INPUT" && nch.tagName != "SELECT"))
				continue;
			if (ntd.style.display == "none" || nch.readOnly)
				continue;
			if (ntd == otd) {
				return true;
			} else
				return false;
		};
		return false;
	};
	this.IsLastInRow = IsLastInRow;
	function IsLastInRow(obj) {
		if (obj == null)
			return;
		var otd = null;
		if (obj.tagName == "SELECT")
			otd = obj.parentElement.parentElement;
		else
			otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		for (var i = otr.cells.length - 1; i > 0; i--) {
			var ntd = otr.cells[i];
			var nch = ntd.children[0];
			if (nch == null)
				continue;
			if (ntd.style.display == "none" || nch.readOnly
					|| nch.tagName == "SPAN")
				continue;
			if (ntd == otd) {
				return true;
			} else
				return false;
		};
		return false;
	};
	this.movetToRight = movetToRight;
	function movetToRight(obj) {
		if (obj == null)
			return;
		var otd = null;
		if (obj.tagName == "SELECT")
			otd = obj.parentElement.parentElement;
		else
			otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var index = parseInt(otd.getAttribute("index")) + 1;
		if (IsLast(obj)) {
			addRow();
			var nobj = findFTd(otr.nextSibling).children[0];
			if (nobj != null)
				nobj.focus();
			return;
		} else {
			if (IsLastInRow(obj)) {
				var nnobj = findFTd(otr.nextSibling).children[0];
				if (nnobj != null) {
					delightLine(currentLine);
					lightLine(otr.nextSibling);
					currentLine = otr.nextSibling;
					nnobj.focus();
					nnobj.select();
				};
				if (currentLine.offsetTop + currentLine.clientHeight >= divTi.clientHeight)
					divTi.scrollTop += currentLine.clientHeight;
				if (currentLine.offsetTop < divTi.scrollTop)
					divTi.scrollTop -= currentLine.clientHeight;
				return;
			};
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
			if (objNext == null && trindex < tabTi.rows.length - 1)
				objNext = findNextFirst(tabTi.rows[trindex + 1], index - 1,
						tdindex);
			if (objNext.children[0].tagName == "DIV"
					&& objNext.children[0].children[0] != null)
				objNext.children[0].children[0].focus();
			else {
				objNext.children[0].focus();
				objNext.children[0].select();
			};
		};
		if (currentLine.offsetTop + currentLine.clientHeight >= divTi.clientHeight)
			divTi.scrollTop += currentLine.clientHeight;
		if (currentLine.offsetTop < divTi.scrollTop)
			divTi.scrollTop -= currentLine.clientHeight;
	};
	this.findNextFirst = findNextFirst;
	function findNextFirst(otr, index, cellIndex) {
		var otd = otr.cells[cellIndex];
		for (i = cellIndex; i > 1; i--) {
			var objTemp = otr.cells[i];
			if (objTemp.getAttribute("index") == index
					&& objTemp.style.display != "none") {
				index = index - 1;
				otd = otr.cells[i];
			};
		};
		return otd;
	};
	this.movetToLeft = movetToLeft;
	function movetToLeft(obj) {
		if (obj == null)
			return;
		var otd = null;
		if (obj.tagName == "SELECT")
			otd = obj.parentElement.parentElement;
		else
			otd = obj.parentElement;
		if (otd == null || otd.tagName != "TD")
			return false;
		var otr = otd.parentElement;
		if (otr == null || otr.tagName != "TR")
			return false;
		var index = parseInt(otd.getAttribute("index")) - parseInt(1);
		var objNext = otr.cells[index];
		var tdindex = countOT(otd);
		var trindex = otr.rowIndex;
		var i;
		for (i = tdindex; i >= 0; i--) {
			var objTemp = otr.cells[i];
			if (objTemp.getAttribute("index") == null
					|| objTemp.getAttribute("index") == "0")
				continue;
			if (parseInt(objTemp.getAttribute("index")) <= index) {
				objNext = objTemp;
				break;
			};
		};
		objNext.children[0].focus();
		if (objNext.children[0].tagName == "INPUT")
			objNext.children[0].select();
		if (currentLine.offsetTop + currentLine.clientHeight >= divTi.clientHeight)
			divTi.scrollTop += currentLine.clientHeight;
		if (currentLine.offsetTop < divTi.scrollTop)
			divTi.scrollTop -= currentLine.clientHeight;
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
		var tdindex = countOT(otd);
		if (otr.rowIndex == 1 && par == -1)
			return;
		try {
			if (trindex + par >= tabTi.rows.length || trindex + par < 1)
				return;
			var ntr = tabTi.rows[trindex + par];
			var ntd = ntr.cells[tdindex];
			delightLine(currentLine);
			lightLine(ntr);
			currentLine = ntr;
			if (ntd.children[0] != null) {
				ntd.children[0].focus();
				if (ntd.children[0].tagName == "INPUT")
					ntd.children[0].select();
			};
			if (currentLine.offsetTop + currentLine.clientHeight >= divTi.clientHeight)
				divTi.scrollTop += currentLine.clientHeight;
			if (currentLine.offsetTop < divTi.scrollTop)
				divTi.scrollTop -= currentLine.clientHeight;
		} catch (ex) {
			alert(grid_msg_6 + ex.description);
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
			return null;
		for (var i = 0; i < otr.cells.length; i++) {
			var td = otr.cells[i];
			if (td == null)
				continue;
			if (td.style.display == "none" || td.children[0] == null
					|| td.children[0].readOnly
					|| td.children[0].tagName == "SPAN")
				continue;
			else
				return td;
		};
	};
	this.doTabTouClick = doTabTouClick;
	function doTabTouClick() {
		var obj = window.event.srcElement;
		if (obj.tagName != "SPAN")
			return;
		if (obj.innerText == "")
			return;
		var objcheckAll = obj.getAttribute("enableCheckAll");
		if (objcheckAll == "true") {
			if (obj.ischecked) {
				doCheckAllLine(false);
				obj.ischecked = false;
			} else {
				doCheckAllLine(true);
				obj.ischecked = true;
			};
		};
	};
	this.doCheckAllLine = doCheckAllLine;
	function doCheckAllLine(isCheck) {
		if (tabTi == null && tabTi.tagName != "TABLE")
			return "";
		try {
			var col = null;
			for (var i = 0; i < tabTi.rows[1].cells.length; i++) {
				var otd = tabTi.rows[1].cells[i].children[0];
				if (otd != null && (otd.type == "checkbox")) {
					col = i;
					break;
				};
			};
			if (col == null || isNaN(col))
				return false;
			var str = "";
			if (isCheck) {
				for (var j = 1; j < tabTi.rows.length; j++) {
					tabTi.rows[j].cells[col].children[0].checked = true;
				};
				return true;
			} else {
				for (var j = 1; j < tabTi.rows.length; j++) {
					tabTi.rows[j].cells[col].children[0].checked = false;
				};
				return true;
			};
		} catch (ex) {
			return false;
		};
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
		divSum.scrollLeft = disWid;
		divTiLeftCol.scrollTop = divTi.scrollTop;
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
			OldPlace = window.event.clientX;
		};
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
		try {
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
			} else
				divTou.style.cursor = "default";
		} catch (ex) {
			alert(ex.description);
		};
	};
	this.domouseup = domouseup;
	function domouseup() {
		if (isMouDown) {
			try {
				nowPlace = window.event.clientX;
				if (isNaN(OldPlace - nowPlace)) {
					isMouDown = false;
					return;
				};
				var cellindex = findTdCellIndex(curTd);
				var tWidth = tabTou.children[0].all(cellindex).offsetWidth
						- (OldPlace - nowPlace);
				if (tWidth < 1)
					tWidth = "1px";
				tabTou.children[0].all(cellindex).width = tWidth;
				isMouDown = false;
				var firstRow = tabTi.rows[0];
				var k = -1;
				for (var j = 0; j < firstRow.cells.length; j++) {
					if (firstRow.cells[j].style.display != "none")
						k++;
					if (k == cellindex) {
						break;
					};
				};
				for (var i = 0; i < tabTi.rows.length; i++) {
					var otd1 = tabTi.rows[i].cells[j];
					if (otd1 != null)
						otd1.width = tWidth;
				};
				var otd = tabSum.rows[0].cells[0];
				while (otd.cellIndex != cellindex)
					otd = otd.nextSibling;
				if (otd != null)
					otd.width = tWidth;
				divAll.fireEvent("onresize");
				curHr.style.display = "none";
				isMouDown = false;
				tabTou.releaseCapture();
			} catch (ex) {
				isMouDown = false;
				tabTou.releaseCapture();
				alert(ex.description);
			};
		};
	};
	this.findTdCellIndex = findTdCellIndex;
	function findTdCellIndex(otd) {
		if (otd == null || otd.tagName != "TD")
			return;
		var otr = otd.parentElement;
		var cellindex = 0;
		for (var i = 0; i < otr.cells.length; i++) {
			var tt = otr.cells[i];
			if (tt.style.display != "none") {
				cellindex += tt.colSpan;
				if (tt == otd)
					break;
			};
		};
		return --cellindex;
	};
	this.domouseout = domouseout;
	function domouseout() {
		document.body.style.cursor = "default";
	};
	this.doresize = doresize;
	function doresize() {
		divTou.style.width = divTi.clientWidth;
		divSum.style.width = divTi.clientWidth;
		if (divSum.style.display == "none") {
			divTiLeftCol.style.height = divTi.clientHeight;
		} else {
			divTiLeftCol.style.height = 20;
		};
		divSum.parentElement.style.top = parseInt(divTi.offsetHeight, 10)
				- parseInt(divSum.parentElement.offsetHeight, 10)
				- (divTi.offsetWidth >= divTi.scrollWidth ? 0 : 18);
	};
	this.domouseselect = domouseselect;
	function domouseselect() {
		if (isMouDown)
			window.event.returnValue = false;
	};
	this.focus = focus;
	function focus(row, col) {
		delightLine(currentLine);
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = 0;
		var oRow = null;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display == "none")
				continue;
			rowsnow++;
			if (rowsnow == row) {
				oRow = otr;
				break;
			};
		};
		if (oRow == null)
			return;
		var otr = oRow;
		if (otr == null)
			return;
		if (otr.style.display != "none" && otr.rowIndex != 0
				&& otr.rowIndex != tabTi.rows.length) {
			lightLine(otr);
			currentLine = otr;
			try {
				var otd = otr.cells[col];
				if (otd != null && otd.children[0] != null) {
					otd.children[0].focus();
					otd.children[0].select();
				};
				if (currentLine.offsetTop + currentLine.clientHeight >= divTi.clientHeight)
					divTi.scrollTop += currentLine.clientHeight;
				if (currentLine.offsetTop < divTi.scrollTop)
					divTi.scrollTop -= currentLine.clientHeight;
			} catch (ex) {
				alert(grid_msg_8);
			};
		};
	};
	this.getCellValue = getCellValue;
	function getCellValue(row, col) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = 0;
		var oRow = null;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display == "none")
				continue;
			rowsnow++;
			if (rowsnow == row) {
				oRow = otr;
				break;
			};
		};
		if (oRow == null)
			return;
		try {
			var otd = oRow.cells[col];
			if (otd != null && otd.children[1] != null
					&& otd.children[1] != null
					&& otd.children[1].tagName == "DIV") {
				return otd.children[1].children[0].value;
			};
			if (otd != null && otd.children[0] != null) {
				switch (otd.children[0].tagName) {
					case "INPUT" :
						return (otd.children[0].value);
						break;
					case "SELECT" :
						return (otd.children[0].options[otd.children[0].selectedIndex].value);
				};
			};
		} catch (ex) {
			return null;
		};
	};
	this.getCellObject = getCellObject;
	function getCellObject(row, col) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = 0;
		var oRow = null;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display == "none")
				continue;
			rowsnow++;
			if (rowsnow == row)
				oRow = otr;
		};
		if (oRow == null)
			return;
		try {
			var otd = oRow.cells[col];
			if (otd != null && otd.children[1] != null
					&& otd.children[1] != null
					&& otd.children[1].tagName == "DIV") {
				return otd.children[1].children[0];
			};
			if (otd != null && otd.children[0] != null) {
				return otd.children[0];
			};
		} catch (ex) {
			return null;
		};
	};
	this.getHeadCellObject = getHeadCellObject;
	function getHeadCellObject(col) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = 0;
		var oRow = tabTi.rows[0];
		if (oRow == null)
			return;
		try {
			var otd = oRow.cells[col];
			if (otd != null && otd.children[1] != null
					&& otd.children[1] != null
					&& otd.children[1].tagName == "DIV") {
				return otd.children[1].children[0];
			};
			if (otd != null && otd.children[0] != null) {
				return otd.children[0];
			};
		} catch (ex) {
			return null;
		};
	};
	this.setHeadCellObject = setHeadCellObject;
	function setHeadCellObject(col, val) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = 0;
		var oRow = tabTi.rows[0];
		if (oRow == null)
			return;
		try {
			var otd = oRow.cells[col];
			if (otd != null && otd.children[1] != null
					&& otd.children[1].tagName == "DIV") {
				for (var i = 0; i < otd.children[1].children[0].options.length; i++) {
					if (otd.children[1].children[0].options[i].value == val) {
						otd.children[1].children[0].options[i].selected = true;
						otd.children[0].value = otd.children[1].children[0].options[i].text;
					};
				};
				return;
			};
			if (otd != null && otd.children[0] != null) {
				otd.children[0].value = val;
				return;
			};
		} catch (ex) {
			return null;
		};
	};
	this.moveRow = moveRow;
	function moveRow(val) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		if (currentLine != null) {
			var rindex = currentLine.rowIndex;
			if (val == null || val == "")
				val = 1;
			if (val == -1 && rindex > 1) {
				tabTi.moveRow(rindex - 1, rindex);
				rename();
			};
			if (val > 0 && rindex < tabTi.rows.length - 1) {
				tabTi.moveRow(rindex, rindex + val);
				rename();
			};
		};
	};
	this.setCellValue = setCellValue;
	function setCellValue(row, col, value) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = 0;
		var oRow = null;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display == "none")
				continue;
			rowsnow++;
			if (rowsnow == row)
				oRow = otr;
		};
		if (oRow == null)
			return;
		try {
			var otd = oRow.cells[col];
			if (otd != null && otd.children[1] != null
					&& otd.children[1].tagName == "DIV") {
				var sel = otd.children[1].children[0];
				for (var i = 0; i < sel.options.length; i++) {
					var opi = sel.options[i];
					if (opi.value == value) {
						opi.selected = true;
						otd.children[0].value = opi.text;
					};
				};
				return;
			};
			if (otd != null && otd.children[0] != null) {
				otd.children[0].value = value;
				return;
			};
		} catch (ex) {
			alert(grid_msg_9);
		};
	};
	this.setCellHtml = setCellHtml;
	function setCellHtml(row, col, value) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var rowsnow = -1;
		var oRow = null;
		for (var i = 0; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display == "none")
				continue;
			rowsnow++;
			if (rowsnow == row)
				oRow = otr;
		};
		if (oRow == null)
			return;
		try {
			var otd = oRow.cells[col];
			if (otd != null) {
				otd.innerHTML = value;
			};
		} catch (ex) {
			alert(grid_msg_10);
		};
	};
	this.checkHaveRepeat = checkHaveRepeat;
	function checkHaveRepeat(col) {
		if (col == "")
			return;
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var arrStr = new Array();
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display == "none")
				continue;
			var otd = otr.cells[col];
			if (otd != null && otd.children[0] != null) {
				arrStr[i - 1] = otd.children[0].value;
			};
		};
		for (var j = 0; j < arrStr.length; j++) {
			var aa = arrStr[j];
			for (k = j + 1; k < arrStr.length; k++) {
				var bb = arrStr[k];
				if (bb == aa)
					return true;
			};
		};
		return false;
	};
	this.checkHaveEmpty = checkHaveEmpty;
	function checkHaveEmpty(col) {
		if (col == "")
			return;
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otd = tabTi.rows[i].cells[col];
			if (otd != null && otd.children[0] != null) {
				if (otd.children[0].value == "")
					return true;
			};
		};
		return false;
	};
	this.index = index;
	function index(col) {
		if (col == "")
			return;
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var index = 0;
		for (var i = 1; i < tabTi.rows.length; i++) {
			if (tabTi.rows[i].style.display == "none")
				continue;
			var otd = tabTi.rows[i].cells[col];
			if (otd != null && otd.children[0] != null) {
				otd.children[0].value = index + 1;
			};
			index++;
		};
	};
	this.sum = sum;
	function sum(col) {
		if (col == "")
			return;
		if (tabTi == null || tabTi.tagName != "TABLE")
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
	this.setSumFieldValue = setSumFieldValue;
	function setSumFieldValue(row, col, value) {
		if (tabSum == null && tabSum.tagName != "TABLE")
			return;
		var otr = tabSum.rows[row];
		if (otr == null)
			return;
		if (otr.style.display != "none") {
			try {
				var otd = otr.cells[col];
				if (otd != null) {
					if (otd.children[0] != null) {
						otd.children[0].innerText = value;
					} else
						otd.innerHTML = value;
				};
			} catch (ex) {
				alert(grid_msg_9);
			};
		};
	};
	this.setSumAlign = setSumAlign;
	function setSumAlign(col, val) {
		if (tabSum == null)
			return;
		var otd = tabSum.rows[0].cells[col];
		if (otd == null)
			return;
		var ospan = otd.children[0];
		if (ospan != null)
			ospan.style.textAlign = val;
		else
			otd.style.textAlign = val;
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
	this.getSumFieldValue = getSumFieldValue;
	function getSumFieldValue(row, col) {
		if (tabSum == null && tabSum.tagName != "TABLE")
			return;
		var otr = tabTi.rows[row];
		if (otr == null)
			return;
		if (otr.style.display != "none" && otr.rowIndex != 0) {
			try {
				var otd = otr.cells[col];
				if (otd != null) {
					if (otd.children[0] != null) {
						return (otd.children[0].value);
					} else
						return (otd.innerText);
				};
			} catch (ex) {
				return null;
			};
		};
	};
	this.getGridValue = getGridValue;
	function getGridValue(col, tag1, tag2) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		if (tag1 == "")
			tag1 = ",";
		if (tag2 == "")
			tag2 = ";";
		var cellStr = "";
		if (col != "") {
			var arrCol = col.split(",");
			for (var j = 0; j < tabTi.rows.length; j++) {
				for (var i = 0; i < arrCol.length; i++) {
					cellStr += this.getCellValue(j, arrCol[i]) + tag1;
				};
				if (cellStr.substring(cellStr.length - 1, cellStr.length) == tag1)
					cellStr = cellStr.substring(0, cellStr.length - 1);
				cellStr += tag2;
			};
		} else {
			for (var j = 0; j < tabTi.rows.length; j++) {
				for (var i = 0; i < tabTi.rows[0].cells.length; i++) {
					cellStr += this.getCellValue(j, i) + tag1;
				};
				if (cellStr.substring(cellStr.length - 1, cellStr.length) == tag1)
					cellStr = cellStr.substring(0, cellStr.length - 1);
				cellStr += tag2;
			};
		};
		return cellStr;
	};
	this.getGridXmlValue = getGridXmlValue;
	function getGridXmlValue(col) {
		if (col != "") {
			var arrCol = col.split(",");
			cellXmlStr = "";
			for (var j = 0; j < tabTi.rows.length; j++) {
				for (var i = 0; i < arrCol.length; i++) {
					var otd = tabTi.rows[j].cells[arrCol[i]];
					var code = otd.getAttribute("xml");
					if (code == null)
						code = "";
					var name = otd.name;
					if (name == null)
						name = "";
					cellXmlStr += "<detail><code>" + code + "</code><name>"
							+ name + "</name></detail>";
				};
			};
			return ("<orderDetail>" + cellXmlStr + "</orderDetail>");
		} else {
			for (var j = 0; j < tabTi.rows.length; j++) {
				for (var i = 0; i < tabTi.rows[0].cells.length; i++) {
					var otd = tabTi.rows[j].cells[i];
					var code = otd.getAttribute("xml");
					if (code == null)
						code = "";
					var name = otd.name;
					if (name == null)
						name = "";
					cellXmlStr += "<detail><code>" + code + "</code><name>"
							+ name + "</name></detail>";
				};
			};
			return ("<orderDetail>" + cellXmlStr + "</orderDetail>");
		};
	};
	this.addRow = addRow;
	function addRow() {
		addLine();
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
			if (primaryKeyCol != -1) {
				if (currentLine.cells[primaryKeyCol].children[0].value != "")
					this.hideLine();
				else
					this.delLine();
			} else {
				this.delLine();
			}
		} catch (ex) {
			alert(ex.description);
		};
		CountSum();
		divTou.style.width = divTi.clientWidth;
		divSum.style.width = divTi.clientWidth;
	};
	this.delCheckRow = delCheckRow;
	function delCheckRow(checkcol) {
		try {
			if (tabTi == null && tabTi.tagName != "TABLE")
				return;
			if (tabTi.rows.length == 1)
				return;
			if (checkcol == null)
				return;
			for (var i = tabTi.rows.length - 1; i > 0; i--) {
				var otr = tabTi.rows[i];
				if (otr.style.display == "none")
					continue;
				var otd = otr.cells[checkcol];
				if (otd == null)
					return;
				var ochk = otd.children[0];
				if (ochk == null || ochk.tagName != "INPUT")
					return;
				var ctr = null;
				if (ochk.checked)
					ctr = otr;
				else
					continue;
				if (ctr == null)
					continue;
				if (primaryKeyCol != -1) {
					if (ctr.cells[primaryKeyCol].children[0].value != "") {
						ctr.style.display = "none";
						ochk.checked = false;
					} else
						otr.removeNode(true);
					if (inputRowCount != null) {
						inputRowCount.value = parseInt(inputRowCount.value) - 1;
						if (tabTi.rows.length - 1 != inputRowCount.value)
							inputRowCount.value = tabTi.rows.length - 1;
					};
					rename();
				} else {
					otr.removeNode(true);
					if (inputRowCount != null) {
						inputRowCount.value = parseInt(inputRowCount.value) - 1;
						if (tabTi.rows.length - 1 != inputRowCount.value)
							inputRowCount.value = tabTi.rows.length - 1;
					};
					rename();
				};
			};
			if (primaryKeyCol != -1)
				index(indexCol);
		} catch (ex) {
			alert(ex.description);
		};
		CountSum();
		divTou.style.width = divTi.clientWidth;
		divSum.style.width = divTi.clientWidth;
	};
	this.CountSum = CountSum;
	function CountSum() {
		if (tabSum == null && tabSum.tagName != "TABLE")
			return;
		for (var i = 0; i < tabSum.rows[0].cells.length; i++) {
			var otd = tabSum.rows[0].cells[i];
			if (otd == null)
				continue;
			var script = otd.getAttribute("script");
			if (script != null)
				eval(script);
		};
	};
	this.returnRowCount = returnRowCount;
	function returnRowCount() {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		var count = 0;
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			if (otr.style.display != "none")
				count++;
		};
		return count;
	};
	this.rename = rename;
	function rename(otr) {
		if (otr != null && otr.tagName == "TR") {
			for (var i = 0; i < otr.cells.length; i++) {
				var otd = null;
				if (otr.cells[i].children[1] != null
						&& otr.cells[i].children[1].tagName == "DIV") {
					otd = otr.cells[i].children[1].children[0];
				} else
					otd = otr.cells[i].children[0];
				if (otd == null)
					continue;
				var code = otd.getAttribute("id");
				var n = code.indexOf(".");
				var newName = code.substring(0, n) + "["
						+ eval(otr.rowIndex - 1) + "]"
						+ code.substring(n, code.length);
				otd.name = newName;
			};
			return;
		};
		for (var j = 1; j < tabTi.rows.length; j++) {
			for (var i = 0; i < tabTi.rows[0].cells.length; i++) {
				var otd = null;
				if (tabTi.rows[j].cells[i].children[1] != null
						&& tabTi.rows[j].cells[i].children[1].tagName == "DIV") {
					otd = tabTi.rows[j].cells[i].children[1].children[0];
				} else
					otd = tabTi.rows[j].cells[i].children[0];
				if (otd == null)
					continue;
				var code = otd.getAttribute("id");
				var n = code.indexOf(".");
				var newName = code.substring(0, n) + "[" + eval(j - 1) + "]"
						+ code.substring(n, code.length);
				otd.name = newName;
			};
		};
	};
	this.getCurrentLine = getCurrentLine;
	function getCurrentLine() {
		if (currentLine == null)
			return null;
		var hidRows = 0;
		for (var j = 1; j < tabTi.rows.length; j++) {
			if (tabTi.rows[j] == currentLine)
				break;
			if (tabTi.rows[j].style.display == "none")
				hidRows++;
		};
		return parseInt(currentLine.rowIndex) - hidRows;
	};
	this.getLineByObj = getLineByObj;
	function getLineByObj(obj) {
		if (obj == null)
			return null;
		var otr = obj;
		if (obj.tagName == "INPUT") {
			otr = obj.parentElement.parentElement;
		};
		if (obj.tagName == "SELECT") {
			otr = obj.parentElement.parentElement.parentElement;
		};
		if (otr != null && otr.tagName == "TR") {
			var hidRows = 0;
			for (var j = 1; j < tabTi.rows.length; j++) {
				if (tabTi.rows[j] == otr)
					break;
				if (tabTi.rows[j].style.display == "none")
					hidRows++;
			};
			return parseInt(otr.rowIndex) - hidRows;
		};
	};
	this.getCheckLineNo = getCheckLineNo;
	function getCheckLineNo() {
		if (tabTi == null || tabTi.tagName != "TABLE")
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
						str += j + ",";
					};
				};
			};
			return str.substring(0, str.length - 1);
		} catch (ex) {
			return "";
		};
	};
	this.getCheckAll = getCheckAll;
	function getCheckAll(selectType) {
		if (tabTi == null || tabTi.tagName != "TABLE")
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
								if (ootd.children[1] != null
										&& ootd.children[1].tagName == "DIV"
										&& selectType != "1") {
									val = ootd.children[1].children[0].value;
								} else
									val = ootd.children[0].value;
								if (val == null)
									val = "";
								str += val + ",";
							};
						};
						str += "|";
					};
				};
			};
			return str.substring(0, str.length - 1);
		} catch (ex) {
			return "";
		};
	};
	this.checkProdId = checkProdId;
	function checkProdId(prodId, row, col) {
		var countRows = this.returnRowCount();
		for (var i = 1; i < countRows; i++) {
			if (i == row)
				continue;
			var oInput = this.getCellValue(i, col);
			if (oInput == prodId) {
				alert(grid_msg_11);
				this.setCellValue(row, col, "");
				focus(row, col);
				return false;
			};
		};
		return true;
	};
	this.delRowByIndex = delRowByIndex;
	function delRowByIndex(index) {
		if (tabTi == null || tabTi.tagName != "TABLE")
			return;
		try {
			var otr = tabTi.rows[index];
			otr.removeNode(true);
			if (inputRowCount != null) {
				inputRowCount.value = parseInt(inputRowCount.value) - 1;
				if (tabTi.rows.length - 1 != inputRowCount.value)
					inputRowCount.value = tabTi.rows.length - 1;
			};
			rename();
		} catch (ex) {
			alert(grid_msg_4);
			return;
		};
	};
	this.setTouText = setTouText;
	function setTouText(col, val) {
		if (tabTou == null)
			return;
		var otd = tabTou.rows[0].cells[col];
		var ospan = otd.children[0];
		ospan.innerHTML = val;
	};
	this.doTextFocusInGrid = doTextFocusInGrid;
	function doTextFocusInGrid(obj) {
		if (obj == null || obj.tagName != "INPUT")
			return;
		var pobj = obj.parentElement.children[1];
		if (pobj == null && pobj.tagName != "DIV")
			return;
		obj.style.display = "none";
		pobj.style.display = "block";
		pobj.children[0].focus();
	};
	this.doSelBlurInGrid = doSelBlurInGrid;
	function doSelBlurInGrid(obj) {
		if (obj == null || obj.tagName != "SELECT" || obj.options.length == 0)
			return;
		var nobj = obj.parentElement.parentElement.children[0];
		if (nobj == null || nobj.tagName != "INPUT")
			return;
		var opt = obj.options[obj.selectedIndex];
		nobj.value = opt.innerText;
		obj.parentElement.style.display = "none";
		nobj.style.display = "block";
	};
	this.changeDivTiScroll = changeDivTiScroll;
	function changeDivTiScroll(val) {
		if (!isNaN(val))
			divTi.scrollTop += val;
	};
	this.changeCheckboxValue = changeCheckboxValue;
	function changeCheckboxValue() {
		var obj = event.srcElement;
		if (obj.type != "checkbox")
			return;
		if (obj.value === "0")
			obj.value = "1";
		else
			obj.value = "0";
	};
	this._inchingswitch = _inchingswitch;
	function _inchingswitch(obj, flag) {
		var o, ob, ar;
		if (date_currob != null
				&& obj.parentElement.parentElement.contains(date_currob)) {
			o = date_currob;
			ob = date_currob.value;
			ar = date_currob.conf.split(",");
		} else {
			o = obj.parentElement.nextSibling;
			ob = obj.parentElement.nextSibling.value;
			ar = obj.parentElement.nextSibling.conf.split(",");
		};
		var step = parseInt(ar[0]);
		var min = parseInt(ar[1]);
		var max = parseInt(ar[2]);
		var alph = ar[3];
		if (ob == "")
			ob = ar[1];
		if (typeof(alph) != "undefined" && alph != "") {
			if (alph == ob.substr(ob.length - 2, ob.length - 1))
				ob = ob.substr(0, ob.length - 1);
		};
		var obvalue = parseInt(ob);
		if (isNaN(obvalue)) {
			obvalue = min;
		};
		if (isNaN(step))
			step = 1;
		if (flag == "+") {
			obvalue = obvalue + step;
			if (obvalue > max)
				return;
		};
		if (flag == "-") {
			obvalue = obvalue - step;
			if (obvalue < min)
				return;
		};
		o.value = obvalue + alph;
		o.select();
	};
	this._uper = _uper;
	function _uper(ob) {
		if (date_interv_ob != null)
			_inchingswitch(date_interv_ob, "+");
		else
			_inchingswitch(ob, "+");
	};
	this._conti_uper = _conti_uper;
	function _conti_uper(obb) {
		if (date_interv == null) {
			date_interv_ob = obb;
			date_interv = window.setInterval(this._uper, 200);
		};
	};
	this._stop_inch = _stop_inch;
	function _stop_inch() {
		if (date_interv != null) {
			clearInterval(date_interv);
			date_interv = null;
			date_interv_ob = null;
		};
	};
	this._downer = _downer;
	function _downer(ob) {
		if (date_interv_ob != null)
			_inchingswitch(date_interv_ob, "-");
		else
			_inchingswitch(ob, "-");
	};
	this._conti_downer = _conti_downer;
	function _conti_downer(obb) {
		if (date_interv == null) {
			date_interv_ob = obb;
			date_interv = window.setInterval(this._downer, 200);
		};
	};
	this._selthis = _selthis;
	function _selthis(ob) {
		ob.select();
		date_currob = ob;
	};
	this.fGetDaysInMonth = fGetDaysInMonth;
	function fGetDaysInMonth(iMonth, iYear) {
		var dPrevDate = new Date(iYear, iMonth, 0);
		return dPrevDate.getDate();
	};
	this.fBuildCal = fBuildCal;
	function fBuildCal(iYear, iMonth, iDayStyle) {
		var aMonth = new Array();
		aMonth[0] = new Array(7);
		aMonth[1] = new Array(7);
		aMonth[2] = new Array(7);
		aMonth[3] = new Array(7);
		aMonth[4] = new Array(7);
		aMonth[5] = new Array(7);
		aMonth[6] = new Array(7);
		var dCalDate = new Date(iYear, iMonth - 1, 1);
		var iDayOfFirst = dCalDate.getDay();
		var iDaysInMonth = fGetDaysInMonth(iMonth, iYear);
		var iVarDate = 1;
		var i, d, w;
		if (iDayStyle == 2) {
			aMonth[0][0] = "Sunday";
			aMonth[0][1] = "Monday";
			aMonth[0][2] = "Tuesday";
			aMonth[0][3] = "Wednesday";
			aMonth[0][4] = "Thursday";
			aMonth[0][5] = "Friday";
			aMonth[0][6] = "Saturday";
		} else if (iDayStyle == 1) {
			aMonth[0][0] = "日";
			aMonth[0][1] = "一";
			aMonth[0][2] = "二";
			aMonth[0][3] = "三";
			aMonth[0][4] = "四";
			aMonth[0][5] = "五";
			aMonth[0][6] = "六";
		} else {
			aMonth[0][0] = "Su";
			aMonth[0][1] = "Mo";
			aMonth[0][2] = "Tu";
			aMonth[0][3] = "We";
			aMonth[0][4] = "Th";
			aMonth[0][5] = "Fr";
			aMonth[0][6] = "Sa";
		};
		for (d = iDayOfFirst; d < 7; d++) {
			aMonth[1][d] = iVarDate;
			iVarDate++;
		};
		for (w = 2; w < 7; w++) {
			for (d = 0; d < 7; d++) {
				if (iVarDate <= iDaysInMonth) {
					aMonth[w][d] = iVarDate;
					iVarDate++;
				};
			};
		};
		return aMonth;
	};
	this.fDrawCal = fDrawCal;
	function fDrawCal(iYear, iMonth, iDayStyle) {
		var myMonth;
		myMonth = fBuildCal(iYear, iMonth, iDayStyle);
		innerhtml += "<table border='0' width='100%'  class='date_body' cellspacing='0' cellpadding='0' ><tr class='date_title'>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][0]
				+ "</td>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][1]
				+ "</td>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][2]
				+ "</td>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][3]
				+ "</td>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][4]
				+ "</td>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][5]
				+ "</td>";
		innerhtml += "<td width='10%' unselectable='on'>" + myMonth[0][6]
				+ "</td>";
		innerhtml += "</tr>";
		for (w = 1; w < 6; w++) {
			innerhtml += "<tr class='date_row_odd'>";
			for (d = 0; d < 7; d++) {
				if (myMonth[w][d] == day && year == dDate.getFullYear()
						&& month == dDate.getMonth() + 1)
					innerhtml += "<td   width='10%'  class='date_today' unselectable='on'>"
							+ myMonth[w][d];
				else if (day != null && day != dDate.getDate()
						&& day == myMonth[w][d]) {
					innerhtml += "<td   width='10%'  class='date_select' unselectable='on'>"
							+ myMonth[w][d];
					newtdstr = "divDate.children[0].rows[" + w + "].cells[" + d
							+ "];";
				} else {
					if (!isNaN(myMonth[w][d])) {
						innerhtml += "<td   width='10%' class='date_td' unselectable='on'>"
								+ myMonth[w][d];
					} else {
						innerhtml += "<td   width='10%' class='date_blank_td' unselectable='on'>";
					};
				};
				innerhtml += "</td>"
			};
			innerhtml += "</tr>";
		};
		innerhtml += "<tr  class='date_row_odd'>";
		for (d = 0; d < 7; d++) {
			if (!isNaN(myMonth[6][d])) {
				innerhtml += "<td   width='10%' class='date_td' unselectable='on'>"
						+ myMonth[6][d];
			} else {
				innerhtml += "<td   width='10%' class='date_blank_td' unselectable='on'>";
			};
			innerhtml += "</td>"
		};
		innerhtml += "</tr>";
		innerhtml += "</table>";
	};
	this.showSelectTable = showSelectTable;
	function showSelectTable(flag) {
		var obj = document.all("objcalendar");
		if (obj.style.display == "block")
			obj.style.display = "none";
		else
			obj.style.position = "absolute";
	};
	this.parseInputTextValue = parseInputTextValue;
	function parseInputTextValue(val) {
		var value = checkinputtextvalue(val);
		var b = new Array();
		for (var i = 0; i < 2; i++) {
			var a = value.indexOf(middle);
			if (value.substring(0, a) == "08") {
				b[i] = 8;
			} else {
				if (value.substring(0, a) == "09") {
					b[i] = 9;
				} else {
					b[i] = parseInt(value.substring(0, a));
				};
			};
			value = value.substring(a + 1);
		};
		if (value.charAt(0) == '0') {
			value = value.substring(1);
		};
		b[2] = parseInt(value);
		year = b[0];
		month = b[1];
		day = b[2];
	};
	this.checkinputtextvalue = checkinputtextvalue;
	function checkinputtextvalue(val) {
		var flag = false;
		var i, j;
		var value, val1, val2;
		if (val.length != 10) {
			flag = true;
		};
		if (flag) {
			value = year + middle;
			if (month < 10)
				value += "0" + month + middle;
			else
				value += month + middle;
			if (day < 10)
				value += "0" + day;
			else
				value += day;
			if (hasform) {
				var obj1 = eval(tableformname);
				input = eval(obj1.name + "." + inputtextid);
			} else
				input = document.all(inputtextid);
		} else
			value = val;
		return value;
	};
	this.OnMouseOver = OnMouseOver;
	function OnMouseOver() {
		var obj = event.srcElement;
		if (obj != curDateTd)
			obj.className = "date_mouseover";
	};
	this.OnMouseOut = OnMouseOut;
	function OnMouseOut() {
		var obj = event.srcElement;
		if (obj != curDateTd)
			obj.className = "date_td";
	};
	this.OnMouseDown = OnMouseDown;
	function OnMouseDown() {
		var obj = event.srcElement;
		if (curDateTd != null)
			curDateTd.className = "date_td";
		curDateTd = obj;
		day = obj.innerText;
		obj.className = "date_select";
	};
	this.OnDbClick = OnDbClick;
	function OnDbClick() {
		var obj = event.srcElement;
		if (curDateTd != null)
			curDateTd.className = "date_td";
		curDateTd = obj;
		day = obj.innerText;
		obj.className = "date_select";
		saveValue();
	};
	this.changeYearAndMonth = changeYearAndMonth;
	function changeYearAndMonth(oyear, omonth) {
		if (oyear != null)
			year = oyear;
		if (omonth != null)
			month = omonth;
		innerhtml = "";
		setJavaScript();
	};
	this.changeHourAndMinute = changeHourAndMinute;
	function changeHourAndMinute(ohour, ominute) {
		if (ohour != null)
			hour = ohour;
		if (ominute != null)
			minute = ominute;
	};
	this.setJavaScript = setJavaScript;
	function setJavaScript() {
		fDrawCal(year, month, 1);
		var obj = divDate;
		obj.innerHTML = innerhtml;
		var tabDate = divDate.children[0];
		if (tabDate != null) {
			for (var i = 1; i < tabDate.rows.length; i++) {
				for (var j = 0; j < tabDate.rows[i].cells.length; j++) {
					var otd = tabDate.rows[i].cells[j];
					if (otd.innerText == "")
						continue;
					otd.onmouseover = OnMouseOver;
					otd.onmouseout = OnMouseOut;
					otd.onmousedown = OnMouseDown;
					otd.onclick = OnDbClick;
				};
			};
		};
	};
	this.set = set;
	function set(objid, splitStr) {
		if (objid != null && objid != "")
			inputtextid = objid;
		if (splitStr != null && splitStr != "")
			middle = splitStr;
		innerhtml = "";
		setJavaScript();
	};
	this.doYearBlur = doYearBlur;
	function doYearBlur(obj) {
		if (obj == null)
			return;
		var arr = obj.conf.split(",");
		var objvalue = obj.value;
		var minyear = arr[1];
		var maxyear = arr[2];
		if (isNaN(objvalue) || objvalue == "")
			objvalue = year;
		if (parseInt(objvalue) < parseInt(minyear))
			objvalue = minyear;
		if (parseInt(objvalue) > parseInt(maxyear))
			objvalue = maxyear;
		obj.value = objvalue;
		changeYearAndMonth(objvalue);
	};
	this.doHourBlur = doHourBlur;
	function doHourBlur(obj) {
		if (obj == null)
			return;
		var arr = obj.conf.split(",");
		var objvalue = obj.value;
		var minyear = arr[1];
		var maxyear = arr[2];
		if (isNaN(objvalue) || objvalue == "")
			objvalue = 0;
		if (parseInt(objvalue, 10) < 0)
			objvalue = "0";
		if (parseInt(objvalue) > 23)
			objvalue = 23;
		obj.value = objvalue;
		hour = obj.value;
	};
	this.doMiniteBlur = doMiniteBlur;
	function doMiniteBlur(obj) {
		if (obj == null)
			return;
		var arr = obj.conf.split(",");
		var objvalue = obj.value;
		var minyear = arr[1];
		var maxyear = arr[2];
		if (isNaN(objvalue) || objvalue == "")
			objvalue = 0;
		if (parseInt(objvalue, 10) < 0)
			objvalue = "0";
		if (parseInt(objvalue) > 59)
			objvalue = 59;
		obj.value = objvalue;
		minute = obj.value;
	};
	this.doSecondBlur = doSecondBlur;
	function doSecondBlur(obj) {
		if (obj == null)
			return;
		var arr = obj.conf.split(",");
		var objvalue = obj.value;
		var minsecond = arr[1];
		var maxsecond = arr[2];
		if (isNaN(objvalue) || objvalue == "")
			objvalue = 0;
		if (parseInt(objvalue, 10) < 0)
			objvalue = "0";
		if (parseInt(objvalue) > 59)
			objvalue = 59;
		obj.value = objvalue;
		second = obj.value;
	};
	this.initDate = initDate;
	function initDate(iniyear, inimonth, iniday, inihour, iniminute, inisecond) {
		if (divDateAll != null && divDateAll.tagName == "DIV") {
			divDate = divDateAll.children[1];
			divTime = divDateAll.children[2].children[0];
		};
		if (iniyear != null)
			year = iniyear;
		if (inimonth != null)
			month = inimonth;
		if (iniday != null)
			day = iniday;
		if (inihour != null)
			hour = inihour;
		if (iniminute != null)
			minute = iniminute;
		if (inisecond != null)
			second = inisecond;
		set("", '-');
		setYearText();
		setMonthSel();
	};
	this.saveValue = saveValue;
	function saveValue() {
		var datestr = year + middle + month + middle + day;
		var timestr = "";
		var timeinputs = divTime.getElementsByTagName("INPUT");
		var hourinput = timeinputs[0];
		var mininput = timeinputs[2];
		hour = hourinput.value;
		minute = mininput.value;
		if (timeinputs.length == 5) {
			var secinput = timeinputs[4];
			second = secinput.value;
		};
		if (divTime != null && divTime.style.display == "none") {
			hour = "";
			minute = "";
			second = "";
		};
		var ndate = new Date(year, month - 1, day, hour, minute, second);
		var targetStr = targetFormat;
		if (inputtext.targetFormat != null && inputtext.targetFormat != "")
			targetStr = inputtext.targetFormat;
		inputtext.value = ndate.format(targetStr);
		if (inputtext.onchange != null)
			inputtext.onchange();
		divDateAll.style.display = "none";
		if (curDateTd) {
			curDateTd.className = "";
			curDateTd = null;
		};
		divAll.style.overflow = "hidden";
		divAll.fireEvent("onresize");
	};
	this.setFormat = setFormat;
	function setFormat(target) {
		if (target != null || target != "") {
			targetFormat = target;
		};
	};
	this.showDate = showDate;
	function showDate() {
		if (divDateAll == null)
			return;
		var odiv = divDateAll;
		if (odiv == null)
			return;
		var obj = window.event.srcElement;
		if (obj != null && obj.tagName == "BUTTON")
			inputtext = obj.previousSibling;
		if (inputtext.targetFormat != null && inputtext.targetFormat != "")
			targetFormat = inputtext.targetFormat;
		var iniyear, inimonth, iniday, inihour, iniminute, inisecond;
		var odate = null;
		defstr = inputtext.value;
		if (defstr != null && defstr != "") {
			try {
				defstr = parseIntputDate(defstr);
				odate = new Date(defstr);
				if (isNaN(odate)) {
					alert(grid_msg_12);
					return;
				};
				oldday = odate.getDate();
			} catch (ex) {
				alert(grid_msg_12);
			};
		} else {
			odate = new Date();
			oldday = null;
		};
		iniyear = odate.getFullYear();
		inimonth = odate.getMonth() + 1;
		iniday = odate.getDate();
		inihour = odate.getHours();
		iniminute = odate.getMinutes();
		inisecond = odate.getSeconds();
		initDate(iniyear, inimonth, iniday, inihour, iniminute, inisecond);
		if (odiv.style.display == "none") {
			odiv.style.display = "block";
			divAll.style.overflow = "visible";
			divSum.parentElement.style.top = parseInt(divTi.offsetTop)
					+ parseInt(divTi.clientHeight)
					- (parseInt(divSum.clientHeight))
					+ (divTi.offsetWidth < divTi.scrollWidth ? 0 : 2);
			var obj2 = inputtext;
			var otop = 20;
			var oleft = 0;
			var alph = 0;
			while (obj2 != null && obj2 != odiv.offsetParent) {
				otop += obj2.offsetTop;
				oleft += obj2.offsetLeft;
				obj2 = obj2.offsetParent;
				if (obj2 != null && obj2.tagName == "TD")
					alph = 1;
			};
			odiv.style.top = otop + alph - divTi.scrollTop;
			odiv.style.left = oleft + alph - divTi.scrollLeft;
		} else {
			odiv.style.display = "none";
			divAll.style.overflow = "hidden";
			divAll.fireEvent("onresize");
		};
	};
	this.setDay = setDay;
	function setDay(oday) {
		if (oday != null && oday != "")
			day = oday;
	};
	this.parseIntputDate = parseIntputDate;
	function parseIntputDate(str) {
		var sparr = str.split(" ");
		var pararr = targetFormat.split(" ");
		var len = sparr.length;
		var datestr, timestr;
		var pardate, partime;
		if (len > 1) {
			datestr = sparr[0];
			timestr = sparr[1];
			pardate = pararr[0];
			partime = pararr[1];
		} else {
			datestr = str;
			timestr = "";
			var sourceStr = targetFormat;
			if (inputtext.sourceFormat != null && inputtext.sourceFormat != "")
				sourceStr = inputtext.sourceFormat;
			pardate = sourceStr;
			partime = "";
		};
		var regstr = /[^yyyyMMdd]/g;
		var arr = pardate.match(regstr);
		if (arr == null) {
			datestr = datestr.slice(0, 4) + "/" + datestr.slice(4, 6) + "/"
					+ datestr.slice(6);
		} else {
			for (var i = 0; i < arr.length; i++) {
				datestr = datestr.replace(arr[i], "/");
			};
			var ldate = datestr.substr(datestr.length - 1, 1);
			if (isNaN(ldate)) {
				datestr = datestr.substr(0, datestr.length - 1);
			};
		};
		if (timestr != "") {
			var regtime = /[^hhmmss]/g;
			var arrt = partime.match(regtime);
			if (arrt == null) {
				timestr = timestr.slice(0, 2) + ":" + timestr.slice(2, 4) + ":"
						+ timestr.slice(4);
			} else {
				for (var i = 0; i < arrt.length; i++) {
					timestr = timestr.replace(arrt[i], ":");
				};
				var ltime = timestr.substr(timestr.length - 1, 1);
				if (isNaN(ltime)) {
					timestr = timestr.substr(0, timestr.length - 1);
				};
			};
		};
		return (datestr + " " + timestr);
	};
	this.setYearText = setYearText;
	function setYearText() {
		var yeartext = divDateAll.children[0].children[0].rows[0].cells[0].children[0].children[1];
		if (yeartext != null && yeartext.tagName == "INPUT") {
			yeartext.value = year;
		};
	};
	this.setMonthSel = setMonthSel;
	function setMonthSel() {
		var monthSel = divDateAll.children[0].children[0].rows[0].cells[1].children[0].children[0];
		if (monthSel != null && monthSel.tagName == "SELECT") {
			for (var i = 0; i < monthSel.options.length; i++) {
				if (monthSel.options[i].value == month)
					monthSel.options[i].selected = true;
			};
		};
	};
	this.doclickingrid = doclickingrid;
	function doclickingrid(obj) {
		if (obj != null && obj.tagName == "INPUT") {
			if (obj.checked) {
				obj.value = 1;
			} else
				obj.value = 0;
		};
	};
	this.setRowCount = setRowCount;
	function setRowCount() {
		if (tabTi.rows.length - 1 != inputRowCount.value)
			inputRowCount.value = tabTi.rows.length - 1;
	};
	if (deleteCol == -1)
		return;
	try {
		for (var i = 1; i < tabTi.rows.length; i++) {
			var otr = tabTi.rows[i];
			otr.cells[deleteCol].children[0].value = 0;
		};
	} catch (ex) {
		alert("setRowCount错误！");
	};
};
Date.prototype.format = function(fomatstr) {
	if (fomatstr == null || fomatstr == "")
		return;
	var nowYear = this.getFullYear();
	var nowMonth = this.getMonth() + 1;
	var nowDay = this.getDate();
	var nowHour = this.getHours();
	var nowMinute = this.getMinutes();
	var nowSecond = this.getSeconds();
	if (nowYear != null && nowYear !== "") {
		fomatstr = fomatstr.replace("yyyy", nowYear);
	};
	if (nowMonth != null && nowMonth !== "") {
		nowMonth = this.numUtil(nowMonth);
		fomatstr = fomatstr.replace("MM", nowMonth);
	};
	if (nowDay != null && nowDay !== "") {
		nowDay = this.numUtil(nowDay);
		fomatstr = fomatstr.replace("dd", nowDay);
	};
	if (nowHour != null && nowHour !== "") {
		nowHour = this.numUtil(nowHour);
		var restr = /HH/i;
		fomatstr = fomatstr.replace(restr, nowHour);
	} else {
		var restr = /hh[\S ]*mm/i;
		fomatstr = fomatstr.replace(restr, "");
	};
	if (nowMinute != null && nowMinute !== "") {
		nowMinute = this.numUtil(nowMinute);
		fomatstr = fomatstr.replace("mm", nowMinute);
	};
	if (nowSecond != null && nowSecond !== "") {
		nowSecond = this.numUtil(nowSecond);
		var restr = /SS/i;
		fomatstr = fomatstr.replace(restr, nowSecond);
	};
	return fomatstr.replace(/\s*$/g, "");
};
Date.prototype.numUtil = function(num) {
	if (parseInt(num) < 10)
		return "0" + num;
	else
		return num;
};
function setGridHeight(str, oldhei) {
	if (oldhei == null || oldhei == "")
		oldhei = 0.5;
	var obj = eval(str);
	if (typeof(obj) == "undefined")
		return;
	var hei = screen.height;
	var newhei = oldhei * hei;
	if (isNaN(newhei))
		return;
	document.all(str).style.height = parseInt(newhei);
};
function clickShowImage(obj) {
	newWin = window.open("", "news",
			"width=500,height=400,scrollbars=1,toolbar=0,resizable=1");
	newWin.document.write("<TITLE>图片</TITLE>");
	newWin.document.write("<BODY BGCOLOR=#ffffff>");
	newWin.document.write("<div style='width:100%;height:100%'>");
	newWin.document.write("<img src='" + obj.src + "'>");
	newWin.document.write("</div>");
	newWin.document.write("</BODY>");
	newWin.document.write("</HTML>");
	newWin.document.close();
	newWin.focus();
};
function mouserOverShowImage(obj) {
	if (!event.ctrlKey) {
		return;
	};
	var imgPosition = document.getElementById("divimage");
	var img;
	if (imgPosition == null) {
		imgPosition = document.createElement("DIV");
		imgPosition.style.position = "absolute";
		imgPosition.style.top = 10;
		imgPosition.style.left = 0;
		imgPosition.style.zIndex = 1;
		imgPosition.style.display = "none";
		imgPosition.id = "divimage";
		document.body.appendChild(imgPosition);
		img = document.createElement("IMG");
		img.attachEvent("onmouseout", mouseOutImage);
		imgPosition.appendChild(img);
	} else {
		img = imgPosition.firstChild;
	};
	img.src = obj.src;
	var last = obj.src.lastIndexOf("/");
	var imageName = obj.src.substring(last + 1, obj.src.length);
	if (imageName == "default.jpg") {
		return;
	};
	var image = new Image();
	image.src = obj.src;
	var obj2 = obj;
	var otop = 0;
	var oleft = 0;
	var alph = 0;
	while (obj2 != null && obj2 != document.body) {
		otop += obj2.offsetTop - obj2.parentElement.scrollTop;
		oleft += obj2.offsetLeft - obj2.parentElement.scrollLeft;
		obj2 = obj2.offsetParent;
		if (obj2 != null && obj2.tagName == "TD")
			alph = 1;
	};
	if (image.width > 0 && image.height > 0) {
		if (image.width >= 300) {
			img.width = 300;
			var height = (image.height * 300) / image.width;
			img.height = height;
			if (((image.height * 300) / image.width + window.event.clientY - document.body.clientHeight) > 0) {
				if (height + window.event.clientY - document.body.clientHeight
						+ 5 > otop) {
					imgPosition.style.top = 10;
				} else {
					imgPosition.style.top = otop
							- (height + window.event.clientY - document.body.clientHeight)
							- 5;
				};
			} else {
				imgPosition.style.top = otop;
			};
			if ((300 + window.event.clientX - document.body.clientWidth) > 0) {
				imgPosition.style.left = oleft
						- (300 + window.event.clientX - document.body.clientWidth)
						- 5;
			} else {
				imgPosition.style.left = oleft;
			};
		} else {
			img.width = image.width;
			img.height = image.height;
			imgPosition.style.top = otop;
			imgPosition.style.left = oleft;
		};
	};
	imgPosition.style.display = "block";
};
function mouseOutImage() {
	event.srcElement.parentElement.style.display = "none";
	event.srcElement.parentElement.removeNode(true);
};
