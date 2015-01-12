/************************GRID ************************************/


GRID.prototype.getIndexByName = function getIndexByName(name) {
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

GRID.prototype.getCellEx = function(row, col) {

	if (typeof(col) == "string") {
		col = this.getIndexByName(col);
		if (col == -1)
			return;
	}

	return this.getCell(row, col);
}


GRID.prototype.getCellValueEx = function(row, col) {

	if (typeof(col) == "string") {
		col = this.getIndexByName(col);
		if (col == -1)
			return;
	}

	return this.getCellValue(row, col);
}