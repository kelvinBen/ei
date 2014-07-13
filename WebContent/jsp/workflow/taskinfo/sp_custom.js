
/**
 * prapplyFlag 采办申请标识 
 * 采办申请:1,变更为:2 
 */
function forDealEx(activity_id,process_id,organ_id,formPlugin,readMark,prapplyFlag){
//可以在此对自己写的url进行特别处理，可进行扩展
 if(formPlugin.indexOf("Jsp_NoneField")>=0){
    	document.forms[0].action ="wftaskdeal.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;  
  	}else if(formPlugin.indexOf("Jsp_Field")>=0){
  		document.forms[0].action = "jspfield.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
  	}else if(formPlugin.indexOf("MdaForm")>=0){
  		document.forms[0].action = "moftaskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
  	}else if(formPlugin.indexOf("JspForm")>=0){
  		document.forms[0].action = "jspformtaskdeal.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
  	}else if(formPlugin.indexOf("wfd_self")>=0){
  		document.forms[0].action = "taskinfo.cmd?method=forwfd_selfdeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark+"&prapplyFlag="+prapplyFlag;
	}else{
	    document.forms[0].action ="taskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;  
	}
	document.forms[0].submit();
}