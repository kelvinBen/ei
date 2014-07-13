function init2(){
	
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		var subject=grid.getCellValue(i, 6);
		var formplugin =grid.getCellValue(i, 5);
		var curUserId =grid.getCellValue(i, 4);
	
		var FLD_APPLYNOcell = grid.getCellEx(i, "FLD_APPLYNO");
		var FLD_CHANGENOcell = grid.getCellEx(i, "FLD_CHANGENO");
		if(FLD_CHANGENOcell.innerText.length<=0){
			url0 = "&menu=zaiBan"
			FLD_APPLYNOcell.innerHTML ="<span nowrap='true'><a href=\"javascript:forold('"+activity_id+"','"+process_id+"','"+formplugin+"','"+curUserId+"','"+url0+"')\">"+FLD_APPLYNOcell.innerText+"</a></span>";
			continue;
		}
		
		if(FLD_CHANGENOcell.innerText.length>0){
			var url1 ="&prapplyFlag=1";
			var url2 ="&prapplyFlag=2";
			// FLD_APPLYNOcell.innerHTML ="<span nowrap='true'><a href=\"javascript:forold('"+activity_id+"','"+process_id+"','"+formplugin+"','"+curUserId+"','"+url1+"')\">"+FLD_APPLYNOcell.innerText+"</a></span>";
			FLD_CHANGENOcell.innerHTML ="<span nowrap='true'><a href=\"javascript:forold('"+activity_id+"','"+process_id+"','"+formplugin+"','"+curUserId+"','"+url2+"')\">"+FLD_CHANGENOcell.innerText+"</a></span>";
		 }
		

	}
	
}



function forold(activity_id,process_id,formplugin,curUserId,url){
//在此进行扩展，实现无表单的处理
  if(formplugin.indexOf("Jsp_NoneField")>=0){
  	document.forms[0].action ="wftaskdeal.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("Jsp_Field")>=0){
  document.forms[0].action ="jspfield.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("MdaForm")>=0){
    document.forms[0].action ="moftaskinfo.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  } else if(formplugin.indexOf("JspForm")>=0){
    document.forms[0].action ="jspformtaskdeal.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("wfd_self")>=0){
  		document.forms[0].action = "taskinfo.cmd?method=forwfd_selfold&activityId="+activity_id+"&processId="+process_id+"&user_id="+curUserId+url;
  }else{
  	document.forms[0].action ="taskinfo.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&curUserId="+curUserId;
  }
  document.forms[0].submit();	
}