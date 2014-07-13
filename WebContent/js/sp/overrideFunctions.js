
EDITGRID.prototype.getIndexByName = function getIndexByName(name) {
//	this.columnNames = this.gridObj.ColumnNames;
	var columnNames = grid_jsonstr.ColumnNames;
		if (name == null || name == "") {
			alert(flexgrid_msg_13);
			return -1;
		}
		for (var i = 0; i < columnNames.length; i++) {
			if (name == columnNames[i]) {
				return i + 1;
			}
		}
		return -1;
}


EDITGRID.prototype.getCellObjectEx = function(row, col) {

	if (typeof(col) == "string") {
		col = this.getIndexByName(col);
		if (col == -1)
			return;
	}

	return this.getCellObject(row, col);
}

EDITGRID.prototype.getCellValueEx = function(row, col) {
	return this.getCellObjectEx(row, col).value;
}


EDITGRID.prototype.getHeadCellObjectEx = function(col) {

	if (typeof(col) == "string") {
		col = this.getIndexByName(col);
		if (col == -1)
			return;
	}

	return this.getHeadCellObject(col);
}

/**
 * ��ȡ����
 * @param {} col �ֶ���
 */
EDITGRID.prototype.getTouText = function(col) {
	var tabHead = grid_jsonstr.TabHead;
	if (typeof(col) == "string") {
		col = this.getIndexByName(col);
		if (col == -1)
			return;
	}
	
		return tabHead.rows[0].cols[col-1].text;
		
}


EDITGRID.prototype.setCellValueEx = function(row, col,val){
	var cell = this.getCellObjectEx(row,col);
	cell.value = val;
}


/************************add three methods for String object ************************************/

String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
String.prototype.lTrim = function() {
	return this.replace(/(^\s*)/g, "");
}
String.prototype.rTrim = function() {
	return this.replace(/(\s*$)/g, "");
}

String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
}





/**
 * workflow
 */

function selectAndSendToEmployee() {
	
	selectNextActivitiesAndEmployees();
	if (document.all("nextActDefUniqueId").value == null
			|| document.all("nextActDefUniqueId").value == "")
		return;
	var lt = new LoadTool();
	lt.showLoading();	
	if(!check()) return;
	
	document.forms[0].action = baseUrl+"?method=send";
	document.forms[0].submit();
}

function selectAndSend() {

	selectNextActivitiesAndParties();
	var nextActDefUniqueId = document.all("nextActDefUniqueId").value;
	if (nextActDefUniqueId == null || nextActDefUniqueId == "")
		return;
			var lt = new LoadTool();
	lt.showLoading();
	if(!check()) return;;

	document.forms[0].action = baseUrl+"?method=send";
	document.forms[0].submit();
}

function create() {
	var lt = new LoadTool();
	lt.showLoading();
	if(!check()) return;;
	
	wf_create(baseUrl+"?method=create");
}
function createAndSend() {
//	var lt = new LoadTool();
//	lt.showLoading();
//	if(!check()) return;;
	

	wf_createAndSend(baseUrl+"?method=createAndSend");

}
function send() {
//	var lt = new LoadTool();
//	lt.showLoading();
//	if(!check()) return;;
	wf_send(baseUrl+"?method=send");
}

function back() {
	document.forms[0].action = baseUrl+"?method=back";
	document.forms[0].submit();
}

function check(){
	return true;
}

