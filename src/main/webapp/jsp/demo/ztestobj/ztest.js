function getPo_itemForAddfun() {
	return "t$ZTESTITEM$PO_ITEM";
}

/**
 * “≥√Ê≥ı ºªØ
 */
function init() {
	
	if (grid0.returnRowCount() <= 0) {
		addfun('grid0');
	}

	grid0.dblclickEvent = function() {

		var primaryKey = grid.getCellValue(grid.getCurrentLine(), 1);

		var data = getSalesArea(grid.getCurrentLine());
		var url = "jsp/help.jsp?url=cusinfo.cmd&method=forsalesarea&opeflag=detail&primaryKey="
				+ primaryKey + "&read=" + read;
		var win = showModalDialog(url, window,
				"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
		if (win == null)
			return;
		data = "i$CUS_INFO$VKORG=" + win[0] + "&i$CUS_INFO$VTWEG=" + win[1]
				+ "&i$CUS_INFO$SPART=" + win[2];

		document.forms[0].action = "cusinfo.cmd?method=detail&sign_power="
				+ sign_power + "&primaryKey=" + primaryKey + "&" + data;
		document.forms[0].submit();

	}

}
