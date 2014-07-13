function init2(){
	
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var LAST_STATE_TIME =  grid.getCellEx(i, "LAST_STATE_TIME");
		if(LAST_STATE_TIME.innerText == '1970-01-01 08:00')
		LAST_STATE_TIME.innerHTML ="<span nowrap='true'></span>";
		
		
		var process_id=grid.getCellValue(i, 1);
		//var subject=grid.getCellValue(i, 5);
		// var processName=grid.getCellValue(i, 3);
		var formplugin=grid.getCellValue(i ,4);
		
		var FLD_APPLYNOcell = grid.getCellEx(i, "FLD_APPLYNO");
		var FLD_CHANGENOcell = grid.getCellEx(i, "FLD_CHANGENO");
		
		if(FLD_CHANGENOcell.innerText.length<=0){
			url0 = "&menu=yiBan"
			FLD_APPLYNOcell.innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"','"+formplugin+"','"+url0+"')\">"+FLD_APPLYNOcell.innerText+"</a></span>";
			continue;
		}
		
		if(FLD_CHANGENOcell.innerText.length>0){
			var url1 ="&prapplyFlag=1";
			var url2 ="&prapplyFlag=2";
			//FLD_APPLYNOcell.innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"','"+formplugin+"','"+url1+"')\">"+FLD_APPLYNOcell.innerText+"</a></span>";
			FLD_CHANGENOcell.innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"','"+formplugin+"','"+url2+"')\">"+FLD_CHANGENOcell.innerText+"</a></span>";
		}
		

	}
	
}

/**
 * 
 */
function forChangeDealEx(fldcode,applyno){
	  document.forms[0].action ="reprwprapply.cmd?method=forChangeDetail&isstate=noButton&pk="+fldcode+"&FLD_APPLYNO="+applyno;
      document.forms[0].submit();
}



function forEnd(process_id,formplugin,url){
//可以对无表单的url进行处理，可扩展
  if(formplugin.indexOf("Jsp_NoneField")>=0){
      document.forms[0].action ="wftaskdeal.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("Jsp_Field")>=0){
   document.forms[0].action ="jspfield.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("MdaForm")>=0){
  	  document.forms[0].action ="moftaskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("JspForm")>=0){
  		document.forms[0].action = "jspformtaskdeal.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }if(formplugin.indexOf("wfd_self")>=0){
	  document.forms[0].action ="taskinfo.cmd?method=forwfd_selfend&processId="+process_id+"&user_id="+document.all("organId").value+url;

  }else{
	  document.forms[0].action ="taskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }
  document.forms[0].submit();	
}

