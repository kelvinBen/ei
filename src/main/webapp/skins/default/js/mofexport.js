
function forExport()
{ 	
	if(grid.getCheckLine()!=null && grid.getCheckLine()!='')	{ 
	var sel=grid.getCheckLine(); 
	var url ="mofTransferCmd.cmd?method=windowExport&mofWindowId="+sel;self.help_frame.location.href=url;
	}else{
	var url ="mofTransferCmd.cmd?method=windowExport&exportAll=true";self.help_frame.location.href=url; 
	}
}

function forProcessExport()
{ 
	if( grid.getCheckLine()!= null && grid.getCheckLine()!='')	{ 
	
	var sel=grid.getCheckLine(); 
	var url ="mofProcessTransferCmd.cmd?method=processExport&primaryKey="+sel;self.help_frame.location.href=url;
	}else{
	
	var url ="mofProcessTransferCmd.cmd?method=processExport&exportAll=true";self.help_frame.location.href=url; 
	}
	
}

function forExportSQL(){ 
	
	if(grid.getCheckLine()!=null && grid.getCheckLine()!=''){ 
	var sel=grid.getCheckLine(); 
	var url ="mofTransferCmd.cmd?method=windowExport&isExportSql=true&mofWindowId="+sel;self.help_frame.location.href=url;
	}else{
	var url ="mofTransferCmd.cmd?method=windowExport&isExportSql=true&exportAll=true";self.help_frame.location.href=url; 
        } 
}


function forProcessExportSQL(){ 
	  
	if(grid.getCheckLine()!=null && grid.getCheckLine()!=''){ 
	var sel=grid.getCheckLine(); 
	var url ="mofProcessTransferCmd.cmd?method=processExport&isExportSql=true&primaryKey="+sel;self.help_frame.location.href=url; 
	}else{
	var url ="mofProcessTransferCmd.cmd?method=processExport&isExportSql=true&exportAll=true";self.help_frame.location.href=url; 
	}    
}