<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE>员工信息</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<%
	String employeeId = request.getParameter("employeeId");
	String employeeName = request.getParameter("employeeName");

	String 	SEL_OPTS=request.getParameter("SEL_OPTS");
	if(SEL_OPTS==null)SEL_OPTS="";
%>
<% 
    String searchOptions = request.getParameter("SEARCH_OPTIONS");
	if (searchOptions==null){
	  searchOptions="";
	}
    String searchValue = request.getParameter("SEARCH_VALUE");
	if (searchValue==null){
	  searchValue="";
	}	
	String employee_status=request.getParameter("EMPLOYEE_STATUS");
	if (employee_status==null){
	  employee_status="";
	}
	String s_organId=(String)request.getParameter("organId");
	if(s_organId==null)s_organId="";
	String s_organName=(String)request.getParameter("organName");
	if(s_organName==null)s_organName="";	
	String s_struId=(String)request.getParameter("struId");
	if(s_struId==null)s_struId="";		
%>
<widgets:container title="员工信息" >
<html:form name="frmList" action="hrempforhelpcheckbox.cmd">
<input type="hidden" name="SEL_OPTS" value="<%=SEL_OPTS%>" size=50> 
<table id="tblSearch">
<flex:search>
	<tr>	
	<td>	
	<flex:searchSelect name="SEARCH_OPTIONS" labeltitle="查询项：" size="1" searchName="HR_EMPLOYEE.EMPLOYEE_STATUS" dataType="java.lang.String" operSymbol="=" value="<%=searchOptions%>">
	<html:option value="ORGAN_NAME">员工</html:option>
	<html:option value="POST_NAME">岗位</html:option>
	</flex:searchSelect>
	</td>
    <td><flex:searchText name="SEARCH_VALUE" labeltitle="查询项值："  size="12" searchName="PUB_ORGAN.ORGAN_NAME" dataType="java.lang.String" operSymbol="=" value="<%=searchValue%>">
	</flex:searchText>
	</td>
	
	<td><flex:searchSelect name="EMPLOYEE_STATUS" labeltitle="员工状态：" size="1" searchName="HR_EMPLOYEE.EMPLOYEE_STATUS" dataType="java.lang.String" operSymbol="=" value="<%=employee_status%>">
	<html:option value="">请选择</html:option>
	<html:options collection="HREMPLOYEE_STATUS_COLLECTION" labelProperty="value" property="key"/>
	</flex:searchSelect>

	</td>
	<td nowrap>部门：</td>
    <td><input type="hidden" name="organId" size="12" value="<%=s_organId%>"  readonly><input type="text" name="organName" size="10" value="<%=s_organName%>"  readonly><input type="hidden" name="struId" size="12" value="<%=s_struId%>"  readonly><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectDeptId()"></td>
	
	<td><flex:searchImg name="chaxun" action="hrempforhelpcheckbox.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=70%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                          <flex:flexCol caption="员工编号隐藏列" width="100" property="organId"  name="primaryKey" sortName="PUB_ORGAN.ORGAN_ID"  style="display:none"></flex:flexCol>
                          <flex:flexCol caption='返回隐藏列' width="100" property="returnStr" sortName="PUB_ORGAN.ORGAN_ID"  style="display:none"></flex:flexCol>
                              <flex:flexCol caption='姓名' width="100" property="organName" sortName="PUB_ORGAN.ORGAN_NAME"></flex:flexCol>
                              <flex:flexCol caption='岗位' width="100" property="parentOrganName" sortName="PUB_ORGAN.PARENT_ORGAN_NAME"></flex:flexCol>    
                         
        </support:flexgrid>
<flex:pagePolit action="hrempforhelpcheckbox.cmd" pageSize="10">
</flex:pagePolit>
</td>
<td width=10% align=center>

<button name="btnUp" onclick="moveUp()"   class="advbutton" >∧</button>
<br><br>
<button name="btnRight" onclick="moveRight()"   class="advbutton" >＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()"   class="advbutton" >＜</button>
<br><br>
<button name="btnDown" onclick="moveDown()"  class="advbutton" >∨</button>
</td>
<td width=20% align=center valign="top">
已选项<br>
<select name="SelOpts"  size="15"  style="width:100" multiple="multiple">
<%
		StringTokenizer sel= new StringTokenizer(SEL_OPTS,",");
		while(sel.hasMoreTokens())
		{
			String opt=sel.nextToken();
			StringTokenizer o = new StringTokenizer(opt,":");
			String val=o.nextToken();
			String show=o.nextToken();
%>
<option value="<%=val%>"><%=show%></option>		
<%			
		}
%>
</select>
</td>
</tr>
</table>
<div align=center><table width=150><tr><td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td><td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td><td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td></tr></table></div>
</html:form>
</widgets:container>
<script language="javascript">
init();
function init(){
	var selOpts=document.all("SelOpts");
	var employeeId = "<%=employeeId%>";
	var employeeName = "<%=employeeName%>";
	var idArray = employeeId.split(",");
	var nameArray = employeeName.split(",");
	if (employeeId==""){
		return;
	}	
	if (idArray.length!=nameArray.length){
		alert("error!");
		return;
	}
	if (idArray.length==0){
		return;
	}
	for(var i=0;i<idArray.length;i++){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);	 		
	 		opn.innerText=nameArray[i];
	 		opn.value=idArray[i]+"#"+nameArray[i];
	}
}
grid.show();
grid.setTabTiClick(moveRight);
function doConfirm(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	if(lens==0){
		alert("请选择记录!");
		return;
	}
	var result = new Array();
	var value = new Array();
	var value1 = new Array();
	for(var i=0;i<lens;i++){
		var val=selOpts.options[i].value;
//		result[i]=val.split("#"); 
//		result[i][2]='<%=MatrixHref.getUrl("Employee")%>';
	 value = val.split("#");
	 value1["primary-value"]=value[0];
	 value1["display-str"]=value[1];
	 value1["display-url"]='<%=MatrixHref.getUrl("Document")%>';	
	 result[i]=value1;
	}
	parent.returnValue = result;
	parent.close();	
}

function doClose(){
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
function moveRight(){
if(!getSelect()) return false;
var row=grid.getCurrentLine();

	  var selOpts=document.all("SelOpts");
	
	 	//如果已选项中已经存在，则忽略
	 	var selName=grid.getCellValue(row,3);
	 	var selRet=grid.getCellValue(row,2);
	 	var exist=0;
	 	for(var j=selOpts.options.length-1;j>=0;j--)
	 	{
	 		var val=selOpts.options[j].value;
	 		if(val==selRet)exist=1;
	 			
	 	}
	 	if(exist==0){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);
	 		
	 		opn.innerText=selName;
	 		opn.value=selRet;
	 		
	 				
	 	}
	 	

	 
	 setSel();	  	
}
function moveLeft(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
	
	 if(selOpts.options[i].selected)
	 {
	 	
	 	selOpts.options.remove(i);
	 	
	 }
	 
	}
	lens=selOpts.options.length;
	if(lens>0) selOpts.options[lens-1].selected=true;
	setSel();	
}
function moveUp(){
  var selOpts=document.all("SelOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  for(var i=1;i<len;i++){
  	if(selOpts.options[i].selected){
		  //生成
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  
		  selOpts.options(i).innerText = selOpts.options(i-1).innerText;
		  selOpts.options(i).value = selOpts.options(i-1).value;
		 
		  
		  selOpts.options(i-1).innerText = tmpOption.innerText;
		  selOpts.options(i-1).value =  tmpOption.value;
		 
		  selOpts.options(i-1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	

  

  setSel();
}
function moveDown(){
  var selOpts=document.all("SelOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  	
  if(selIndex==len-1)return;
  var len = selOpts.length;
  for(var i=len-2;i>=0;i--){
  	
  	if(selOpts.options[i].selected){
		  //生成
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  
		  selOpts.options(i).innerText = selOpts.options(i+1).innerText;
		  selOpts.options(i).value = selOpts.options(i+1).value;
		 
		  
		  selOpts.options(i+1).innerText = tmpOption.innerText;
		  selOpts.options(i+1).value =  tmpOption.value;
		 
		  selOpts.options(i+1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	

  

  setSel();
}
function setSel(){
	
	var selOpts=document.all("SelOpts");
	
	var lens=selOpts.options.length;
	var SEL_OPTS=document.all("SEL_OPTS");
	var tempSel="";
	for(var i=0;i<lens;i++)
	{
	 
	 
	 	var val=selOpts.options[i].value;
	 	var showName=selOpts.options[i].innerText;
	 	if(tempSel=="") 
	 		tempSel=val+":"+showName;
	 	else
	 		tempSel=tempSel + "," + val+":"+showName;
	 
	}
	SEL_OPTS.value=tempSel;	
}
function selectDeptId(){
  var url ="stru.cmd?method=getDeptRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) { 
  document.all("organId").value="";
  document.all("organName").value="";  
  document.all("struId").value=""; 
  	return;
  }else{
  document.all("organId").value=win[0];
  document.all("organName").value=win[1];
  document.all("struId").value=win[2];
  }
}
</script>