/**
 * 
 * @param {} activity_id
 * @param {} process_id
 * @param {} organ_id
 * @param {} formPlugin
 * @param {} readMark
 * @param {0,1,2} reFlag 0:非变更单；1：变更单所对应的原单；2变更单
 * @param {} organ_name
 */
function forDeal(activity_id,process_id,old_organ_id,formPlugin,readMark,reFlag,old_organ_name){
//登录用户 organ_id
	var organ_id = document.getElementById("organId").value;
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
  		document.forms[0].action = "taskinfo.cmd?method=forwfd_selfdeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
	}else{
	    document.forms[0].action ="taskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;  
	}
	var addUrl = "&proxyFlag=1";
	document.forms[0].action += addUrl;
	
	addUrl = "&oldOrganId="+old_organ_id;
	document.forms[0].action += addUrl;
	
	 addUrl = "&oldOrganName="+old_organ_name;
	document.forms[0].action += addUrl;
	
	if(reFlag!=null){
		addUrl = "&prapplyFlag="+reFlag;
		document.forms[0].action += addUrl;
	}
	
	document.forms[0].submit();
}


function init(){
grid3.show();
grid3.setSumText("");

grid_jsonstr = grid3_jsonstr
for(var i=1;i<grid3.returnRowCount()+1;i++){
	var activity_id=grid3.getCellValue(i, 1);
	var process_id=grid3.getCellValue(i, 2);
	var organ_id=grid3.getCellEx(i,"USER_ID").innerText;
	var organ_name = grid3.getCellEx(i,"USER_NAME").innerText;
	var subject=grid3.getCellValue(i, 3);
	var formPlugin = grid3.getCellValue(i,4);
//	var readMark=grid3.getCellValue(i,13);
	var readMark = null;
	var prapplyno = grid3.getCellValue(i, 7);
	
	var changeapplyno = grid3.getCellEx(i, "FLD_CHANGENO");
	if(changeapplyno==null||changeapplyno.innerText.length<=0){
		grid3.getCellEx(i, "FLD_APPLYNO").innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+activity_id+"','"+process_id+"','"+organ_id+"','"+formPlugin+"','"+readMark+"','"+0+"','"+organ_name+"')\">"+prapplyno+"</a></span>";						
	}else{
		grid3.getCellEx(i, "FLD_CHANGENO").innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+activity_id+"','"+process_id+"','"+organ_id+"','"+formPlugin+"','"+readMark+"','"+2+"','"+organ_name+"')\">"+changeapplyno.innerText+"</a></span>";						
		
	}
	
}
}

function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else{
		var readMark=document.all("readMark").value;
		if(readMark=="" || readMark=="0")
		window.location.href="taskinfodaiban.cmd?method=getProcessTypeList"; 
		else
		window.location.href="taskinfozaiban.cmd?method=getProcessTypeList"; 
	}		
}
//取消了时间的查询
function forsearch(){
	var startTime=document.all("startTime").value;
	var endTime=document.all("endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("结束日期不能小于开始日期！");
			return;
		}
	}
	document.forms[0].action="taskinfoquery.cmd";
	document.forms[0].submit();	
}

function getSelect(){
  var sel=grid3.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}

function openDiv(){
	var _temp = window.parent.frames["banner"];
	if(null == _temp){
		var _otherTemp = window.parent.parent.frames["banner"];
		if(null == _otherTemp){
			window.parent.parent.parent.frames["banner"].closeDiv();
			window.parent.parent.parent.frames["contents"].closeDiv();
		}else{
			window.parent.parent.frames["banner"].closeDiv();
			window.parent.parent.frames["contents"].closeDiv();
		}
	}else{
		window.parent.frames["banner"].closeDiv();
		window.parent.frames["contents"].closeDiv();
	}
}