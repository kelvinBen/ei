<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.bsp.organization.view.StruView"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%
String refresh_id=(String)request.getAttribute("REFRESHID");
String primaryKey = (String)request.getAttribute("primaryKey");
String parentStruId=(String)request.getAttribute("parentStruId");
String organType=(String)request.getAttribute("organType");
//---------黄道泳 2005-11-14 读取参数use_prefix 是否允许自动将上级组织的编码作为本级编码的前缀
//String use_prefix=(String)request.getAttribute("use_prefix");
//out.print("use_prefix="+use_prefix+"<BR>");

String use_prefix =Global.getString("net.mast.bsp.use_prefix");
if(use_prefix!=null)
	use_prefix=use_prefix.toLowerCase().trim();
else
use_prefix="false";
//----------
String depName = "";
String depId ="";
if(organType==null || !organType.startsWith("1")){
	List list =  (ArrayList)request.getAttribute("departmentCollection");
	Map  depColl =  (HashMap)list.get(0);
	depName = (String) depColl.get("departmentName");
	depId = (String) depColl.get("departmentId");

}
//----------
boolean flag=true;
if(refresh_id==null || refresh_id.equals("")){
flag=false;
}
String style="";

if(organType!=null && organType.startsWith("1"))
  style="display:none";
else 
  style="display:block";


%>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkBase(){
 var organCode = document.forms[0].organCode;
    if ( __isQuoteIn(organCode.value) )
    {
      alert("编码不能含有特殊字符!");
      organCode.select();
      organCode.focus();
      return false;
    }
  if (trim(organCode.value)=="")
  {
    alert("请输入编码！");
    organCode.focus();
    return false;
  }
  organCode.value = trim(organCode.value) ;
  if(!__checkCode(organCode.value)){
    alert("编码必须是英文字符或数字！");
    organCode.focus();
    return false;
  }
 var organName = document.forms[0].organName;
     if ( __isQuoteIn(organName.value) )
    {
      alert("姓名/名称不能含有特殊字符!");
      organName.select();
      organName.focus();
      return false;
    }
  if (trim(organName.value)=="")
  {
    alert("请输入姓名/名称！");
    organName.focus();
    return false;
  }
  //add by 毛玲燕 20051108 如果“称呼/别名”或者“简称”为空，则把“姓名/名称”的值赋给它
   var organAlias = document.forms[0].organAlias;
   if (trim(organAlias.value)=="")
  {
    organAlias.value=organName.value;
  }
  organAlias.value = trim(organAlias.value) ;
  
   var shortName = document.forms[0].shortName;
   if (trim(shortName.value)=="")
	{
   shortName.value=organName.value;
   }
   shortName.value = trim(shortName.value) ;
  //!!!!
  organName.value = trim(organName.value) ;
   var organType = document.forms[0].organType;
  if (trim(organType.value)=="")
  {
    alert("请输入类型！");
    organType.focus();
    return false;
  }
  organType.value = trim(organType.value) ;
 var workplaceId = document.forms[0].workplaceId;
  if (trim(workplaceId.value)=="")
  {
    alert("请输入工作地点！");    
    return false;
  }
  workplaceId.value = trim(workplaceId.value) ;
 /**
  var beginDate=document.forms[0].beginDate;
  var endDate=document.forms[0].endDate;
   
   if (trim(beginDate.value)=="")
  {
    alert("生效日期不能为空！");  
      beginDate.select();
      beginDate.focus();
    return false;
  }
   if(!checkDateFormat("yyyyMMdd",beginDate.value)){
	alert("生效日期格式应该是'yyyyMMdd'的形式！");  
      beginDate.select();
      beginDate.focus();
    return false;
  }

  beginDate.value = trim(beginDate.value) ;
   if (trim(endDate.value)=="")
  {
    alert("失效日期不能为空！");  
      endDate.select();
      endDate.focus();
    return false;
  }
      if(!checkDateFormat("yyyyMMdd",endDate.value)){
	alert("失效日期格式应该是'yyyyMMdd'的形式！");  
      endDate.select();
      endDate.focus();
    return false;
  }

  
  endDate.value = trim(endDate.value) ;**/
  var shortName=document.forms[0].shortName;
  var organAlias=document.forms[0].organAlias;
  var hrEventMemo=document.forms[0].hrEventMemo;
  
  //---------huangdos 2005-11-14 标志flag表示是否组建前缀
var flag="<%=use_prefix%>";
var parentOrganCode = trim(document.forms[0].parentOrganCode.value);
var tempcode=organCode.value;
if(flag=="true") {
 organCode.value=parentOrganCode+organCode.value;
 if(!stringLengthCheck(organCode,30,"编码加上上级组织的编码长度不能超过30个字符!")){
	organCode.value=tempcode;
	organCode.focus();
  return false;
  }
 }
  else{
   if(!stringLengthCheck(organCode,30,"编码不能超过30个字符!")){
    organCode.select();
	organCode.focus();
  return false;
  }
}


 // if(!stringLengthCheck(organCode,30,"编码不能超过30个字符!")){
//	organCode.focus();
 // return false;
//  }
 //----------- 
  
  if(!stringLengthCheck(organName,80,"姓名/名称不能超过80个字符!")){
     organName.select();
     organName.focus();
     return false;
  }
  if(shortName == null || shortName == ""){
  	shortName = organName;
  }
  if(!stringLengthCheck(shortName,40,"简称不能超过40个字符!")){
    shortName.select();
    shortName.focus();
    return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"称呼/别名不能超过80个字符!")){
    organAlias.select();
    organAlias.focus();
    return false;
  }
  
  if(!stringLengthCheck(hrEventMemo,250,"人事事件类型备注不能超过250个字符!")){
    hrEventMemo.select();
    hrEventMemo.focus();
    return false;
  }
  var primaryKey = '<%=primaryKey%>';
  var organType = '<%=organType%>';
  //alert(document.all("projects").value);
  //异步处理
   xmlhttp("prworganext.cmd?method=AnysInsert&organType="+organType+"&primaryKey="+primaryKey+"&projects="+document.all("projects").value);
  //alert(result);
  return true
}

function selectPrincipalId(){
  var url ="stru.cmd?method=getEmpRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("principalId").value=win[0];
  document.all("principalName").value=win[1];
  }
}
function selectDepartmentId(){
  var url = "stru.cmd?method=getDepartmentRoot";
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("departmentId").value=win[0];
  document.all("departmentName").value=win[1];
  }
}
function init(){
<%

if(flag){
%>
        var parent_id = "<%=refresh_id%>";
        getTreeFrame().seltree.refreshNodeById(parent_id);        
	<%
	}
	%>
}
init();
</script>
<div align="left">
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text="一般信息">
  <table width="100%" cellpadding="0" class="tblContent"> 	  
         <input type="hidden" name="primaryKey" value="<%=primaryKey%>" >              
         <html:hidden name="struType" property="struType" write="false"/> 
         <html:hidden name="parentId" property="parentId" write="false"/>
         <html:hidden name="parentStruId" property="parentStruId" value="<%=parentStruId%>" write="false"/>
         <html:hidden name="corporationId" property="parentId" write="false"/>
         <html:hidden name="struLevel" property="struLevel" write="false"/> 
         <html:hidden name="struPath" property="struPath" write="false"/>
         <html:hidden name="struOrder" property="struOrder" write="false"/>          
         <html:hidden name="globalOrder" property="globalOrder" write="false"/>            
  		
  		                <tr style="display:none">
                <td class="tdTitle">结构内码:</td>
                <td class="tdRight"><html:text name="struId" property="struId" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
                </tr>
                
                <tr style="display:none">
                <td class="tdTitle">组织内码:</td>
                <td class="tdRight"><html:text name="organId" property="organId" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
                </tr>
  		
  				<tr >
                <td class="tdTitle">上级组织编码:</td>
                <td class="tdRight"><html:hidden name="parentOrganCode" property="parentOrganCode" write="true"/>
                </tr>
  		<%
		if("true".equalsIgnoreCase(use_prefix)) {
		//只显示本级组织推荐编码，用户只可以修改本级的编码
		StruView stru=(StruView)request.getAttribute(Global.getString("html.data"));
		//编码的最大长度限制
		String codeLength =stru.getOrganCode().length()+"";
		
			%>
		<tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>:</td>
        <td class="tdRight"><html:text name="organCode" property="organCode" size="<%=codeLength%>" maxlength="<%=codeLength%>"/><FONT COLOR=#ff0000>*</FONT></td>
        </tr>
        <%}
			else{
		//将上级组织的编码作为前缀和下级组织一同显示出来，并允许用户修改整个编码
		%>
		<tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>:</td>
        <td class="tdRight"><html:text name="organCode" property="$parentOrganCode+organCode" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
        </tr>
		<%
			}				
		%>
        
        <tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>:</td>
        <td class="tdRight"><html:text name="organName" property="organName" size="40" maxlength="80"/><FONT COLOR=#ff0000>*</FONT></td>
        </tr>
        
        <tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.SHORT_NAME")%>:</td>
        <td class="tdRight"><html:text name="shortName" property="shortName" size="40" maxlength="40"/></td>
        </tr>
        
         <tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_ALIAS")%>:</td>
        <td class="tdRight"><html:text name="organAlias" property="organAlias" size="40" maxlength="80"/></td>
        </tr>
        
          
        <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.PRINCIPAL_ID")%>:</td>
		<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/><html:text name="principalName" property="principalName" value="请选择负责人" size="20" maxlength="60"  readonly="true" ondblclick="clean()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
		</tr> 
		
		 <html:hidden name="organType" property="organType" value="<%=organType%>" write="false"/>
       
        <tr style="<%=style%>">
        <td class="tdTitle">所属部门：</td>
        <td class="tdRight">
		<html:hidden name="departmentId" property="departmentId" value="<%=depId%>" write="false"/>
		<html:hidden name="departmentName" property="departmentName" value="<%=depName%>" write="true"/>
        </td>
        </tr>
        
		     <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.WORKPLACE_ID")%>:</td>
                <td class="tdRight"><html:select name="workplaceId" property="workplaceId" >
	            	<html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_ID"/>
	        		</html:select></td>
                </tr>   
<!--                 
        <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.BEGIN_DATE")%>:</td>
		<td class="tdRight" valign="top"><date:date name="beginDate" divname="ddd" zindex="12" property="beginDate" readonly="false" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><FONT COLOR=#ff0000>*</FONT></td>
		</tr> 
		
		       <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>:</td>
		<td class="tdRight" valign="top"><date:date name="endDate" divname="ddv" zindex="11" property="endDate" readonly="false" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><FONT COLOR=#ff0000>*</FONT></td>
		</tr> 
--> 		
		       <tr>
        <td class="tdTitle">人事事件类型:</td>
        <td class="tdRight"><html:select name="hrEventType" property="hrEventType" >
        	<html:options collection="eventTypeOptions" labelProperty="typeName" property="eventType"/>
    		</html:select></td>
      </tr> 
      
              <tr>
        <td class="tdTitle">人事事件备注:</td>
        <td class="tdRight"><html:text name="hrEventMemo" property="hrEventMemo" size="40" maxlength="250"/></td>
        </tr>                                    
   </table>
   </tab:card>  
   <tab:card id="card1" text=" 扩展信息  ">
  <table width="100%" cellpadding="0" class="tblContent">
      <tr>
        <td class="tdTitle">项目性质:</td>
        <td class="tdRight">  <select name="projects">
    <option value="">--请选择--</option>
    <option value="0">非营业性</option>
    <option value="1">营业性</option>
  </select></td>
      </tr>
  </table>
  </tab:card>
   </tab:tab>   
</div>   
    <script language="javascript">
 function clean(){
 	document.forms[0].principalId.value="";
 	document.forms[0].principalName.value="";
 }
 </script>