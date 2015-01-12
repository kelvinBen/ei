<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="org.ld.dao.QuickDao" %>

<%--<%
List ls = (List)request.getAttribute("flexgrid.data");

for(int i=0;i<ls.size();i++){
	
	Map m = (Map)ls.get(i);
	String FLD_PROCESS_ID =  (String)m.get("FLD_PROCESS_ID");
	String sql = "SELECT  p.fld_code FROM PRW_PRAPPLY p, WF_TASK_LIST w, wf_assignment a where fld_apply_state in ('1', '0') and p.FLD_CODE=w.SOURCE_REFERENCE_ID and p.fld_process_id=a.process_id and p.fld_process_id = ";
	sql+="'"+FLD_PROCESS_ID+"'";
	List ls2  = QuickDao.excuteQuerySql(sql);
	if(ls2.size()>0){
		Map m2  = (Map)ls2.get(0);
		m.putAll(m2);
	}
}
%>
--%><HTML>
<HEAD>
<TITLE></TITLE>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<html:form name="frmList" action="taskinfoquery.cmd">
<div class="btnareaCss">
<html:button onclick="forInsert()" name="btn_deal" value="授权"></html:button>
</div>
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
<tr>
<td class="tdLeft">采办申请号：</td>
<td class="tdRight" ><html:text name="fld_applyno" value="" size="20"></html:text></td>
<td class="tdLeft">当前审批人：</td>
<td class="tdRight" ><html:text name="user_name" value="" size="20"></html:text></td>
<td width="100" align="center"><flex:searchImg name="chaxun" action="#" image="search.gif"/></td>
	</tr>
	<tr>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
        <flex:checkboxCol caption='选择' width="50" property="FLD_PROCESS_ID" name="primaryKey" sortName="p.fld_process_id"  canSort="false"></flex:checkboxCol>
       <flex:flexCol caption=''  property="FLD_CODE" sortName="p.fld_code" canSort="false" style="display:none"></flex:flexCol>
        <flex:flexCol caption='采办申请号' width="200" property="FLD_APPLYNO" sortName="p.fld_applyno" canSort="false"></flex:flexCol>
		<flex:flexCol caption='变更采办申请号' width="200" property="FLD_CHANGENO" sortName="p.fld_changeno" canSort="false"></flex:flexCol>
        <flex:flexCol caption='当前审批人' width="300" property="USER_NAME" sortName="a.user_name"  canSort="false">  </flex:flexCol>
        <flex:flexCol caption='当前审批人ID' width="300" property="USER_ID" style="display:none" sortName="a.user_id"  canSort="false">  </flex:flexCol>          
        <flex:flexCol caption='当前环节ID' width="300" property="ACTIVITY_ID" style="display:none" sortName="w.activity_id"  canSort="false">  </flex:flexCol>
 </support:flexgrid>
<flex:pagePolit action="taskQueryCmd.cmd">
</flex:pagePolit>
</html:form>
</body>
</html>
<script type="text/javascript" src="js/sp/FlexGridOverride.js"></script>

<script language="javascript">
function init(){
	grid.show();
	grid.setSumText("");
	for(var i=1;i<grid.returnRowCount()+1;i++){
			var fldcode = grid.getCellValueEx(i, "FLD_CODE");
			var applyno = grid.getCellValueEx(i, "FLD_APPLYNO");
			
		var fldChangeno = grid.getCellValueEx(i, "FLD_CHANGENO");
		if(fldChangeno.length>0){
			grid.getCellEx(i, "FLD_CHANGENO").innerHTML = "<span nowrap='true'><a href=\"javascript:forChangeDealEx('"+fldcode+"')\">"+fldChangeno+"</a></span>";		
		}else{
			grid.getCellEx(i, "FLD_APPLYNO").innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+fldcode+"')\">"+applyno+"</a></span>";
			
		}
	}
}
function forInsert(){
	if(getSelect()){
		var _line = grid.getCurrentLine();
		var _processId = grid.getCellValueEx(_line, 1);
		var _applyNo = grid.getCellValueEx(_line, "FLD_APPLYNO");
		var _username = grid.getCellValueEx(_line, "USER_NAME");
		var _userId = grid.getCellValueEx(_line, "USER_ID");
		var _activityId = grid.getCellValueEx(_line, "ACTIVITY_ID");
		if('' != _line && '' != _username && '' != _userId){
			document.forms[0].action ="taskManageCmd.cmd?method=updateAssignment&_oldUsername=" + _username + "&_oldUserId=" + _userId + "&_processId=" + _processId + "&_activityId=" + _activityId + "&_applyNo=" + _applyNo;    
			document.forms[0].submit();	
		}
	}
}
function getSelect(){
  var sel=grid.getCheckLine();
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


 function forDeal(fldcode){
 	  document.forms[0].action ="prwprapply.cmd?method=todetail&menu=process_accredit&fldcode="+fldcode;
      document.forms[0].submit();
 }
 
 
 function forChangeDealEx(fldcode) {
	document.forms[0].action = "reprwprapply.cmd?method=forChangeDetail&menu=process_accredit&isstate=noButton&pk="
			+ fldcode;
	document.forms[0].submit();
}
</script>
