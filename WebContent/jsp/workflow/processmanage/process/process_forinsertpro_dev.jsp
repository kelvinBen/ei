<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="net.mast.bsp.organization.domain.support.Organ"%>

<%@ page import="com.ntmast.commons.util.cache.CommUtilCache"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lc.dcwork.wf.config.dcworkFromData.FormDocument.Form"%>
<%@ page import="com.lc.dcwork.wf.config.dcworkFromData.FormsDocument.Forms"%>

<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function selectNewDeptIdTree(){
  var url ="jsp/help.jsp?url=struhelp.cmd&method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("organize").value="";
	  document.all("organizeName").value="";
  }else{
	  document.all("organize").value=win[0];
	  document.all("organizeName").value=win[1];
  }
  checkinputNullInDcWork('organize','organize_span');
}
function selectForm1(){
	if(document.all("flag").value==0){
	   alert("请选择表单类型");
       return;
	}
   if(document.all("flag").value==2) 
   { 
  	  alert("请选择业务表单");
  	  return;
   }
  var url ="jsp/help.jsp?url=workformmanagerhelpquery.cmd";
  url=url+"&processtype_search="+document.all("processtype").value;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("formid1").value=win[0];
  document.all("formname1").value=win[1];
  document.all("formid").value=win[0];
  document.all("formname").value=win[1];
  }
  checkinputNullInDcWork('formid','formname_span1');
}
function selectForm2(){
   if(document.all("flag").value==0){
	  alert("请选择表单类型");
      return;
   }
  if(document.all("flag").value==1) 
  {
  	  alert("请选择定制表单");
  	  return;
   }
  var processtype =document.all("processtype").value;
  if(processtype==""){
     alert("请先选择流程类型！");
     return;
  }
  //alert("需要二次开发，来根据流程类型来获取业务表单id")
 // 	return ;
 var reservetype =document.all("reservetype").value;
  var url ="jsp/help.jsp?url=wfYwHelpInitquery.cmd";
  url=url+"&processtypeid="+processtype+"&reservetype="+reservetype;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("formid2").value=win[1];
  document.all("formname2").value=win[2];
  document.all("formid").value=win[1];
  document.all("formname").value=win[2];
  }
  checkinputNullInDcWork('formid2','formname_span2');
}
function selectProcTemplate(){
  var url ="jsp/help.jsp?url=processtemplatequery.cmd";
  url=url+"&processtype_search="+document.all("processtype").value;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("proctemplate").value=win[0];
  document.all("proctemplatename").value=win[1];
  var oldformid=document.all("formid").value;
	  if(oldformid!=win[2] && ""!=win[2]){
	  		  if(confirm("是否使用流程模版对应的表单？")){
  				document.all("formid").value=win[2];
  				document.all("formname").value=win[3];	  
	 	 		}
	  }

  }
}
function selectProcType(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var win=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(win==null)return;
 document.all("processtype").value=win[0];
 document.all("processtypename").value=win[1];
 checkinputNullInDcWork ('processtype','processtype_span')
}
function checkProcess()
{
	var formid = document.forms[0].formid;
//	if (trim(formid.value)=="")
//	{
//		alert('"对应表单"不能为空！');
	    //formid.focus();
//		return false;
//	}
	formid.value = trim(formid.value) ;
	
	var organizeName = document.forms[0].organizeName;
	if (trim(organizeName.value)=="")
	{
		alert('"所属组织机构"不能为空！');
	    organizeName.focus();
		return false;
	}
	organizeName.value = trim(organizeName.value) ;
	var processtype = document.forms[0].processtype;
	if (trim(processtype.value)=="")
	{
		alert('"流程类型"不能为空！');
	    //processtype.focus();
		return false;
	}
	processtype.value = trim(processtype.value) ;

	return true;
}
</script>

</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="确定" value="确定" onclick="forSave()"></html:button>&nbsp;<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
	
<%

String organId=(String)request.getAttribute("rootOrganId");
String organName=(String)request.getAttribute("rootOrganName");
%>

		<tr>
			<td class="tdTitle">流程类型：</td>
			<td class="TdRight">
			  <html:hidden name="processtype" value=""/><html:text name="processtypename" value="" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('processtype','processtype_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectProcType()"><span id="processtype_span" class="xinghaoCss">*</span>
			
			</td>
		</tr>
		<tr>
			<td class="tdTitle">流程模版：</td>
			<td class="TdRight">
			 <html:hidden name="proctemplate" value=""/><html:text name="proctemplatename" value="" size="30" maxlength="30" readonly="true" /><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectProcTemplate()"> 
	          </td>
		</tr>
		<tr>
			<td class="tdTitle">表单类型：</td>
			<td class="TdRight"><select name="formType" onchange="showValue()">
				<option value="wfd_self.bsh">外挂自定义表单</option>
				                 	<option value="wfd_32.bsh">定制表单</option>
			        <!--              <option value="wfd_dcwork.bsh">业务表单</option>
					                <option value="wfd_definedform.bsh">jsp表单</option>--> 
                                 </select>
            </td>
        </tr> 
		<tr>
			<td class="tdTitle">定制表单：</td>
			<td class="TdRight">
			 <html:hidden name="formid1" value=""/><html:text name="formname1" value="" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('formid1','formname_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectForm1()"><span id="formname_span1" class="xinghaoCss"></span> 
	          </td>
		</tr> 
		<tr>
			<td class="tdTitle">业务表单：</td>
			<td class="TdRight">	
	<html:hidden name="formid2" value=""/><html:text name="formname2" value="" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('formid2','formname_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectForm2()"><span id="formname_span2" class="xinghaoCss"></span> 
	          </td>
		</tr> 
						                  
		<tr>
			<td class="tdTitle">所属组织机构：</td>
			<td class="TdRight"><html:hidden name="organize" value="<%=organId%>"/><html:text name="organizeName" value="<%=organName%>" size="30" maxlength="30" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectNewDeptIdTree()"><span id="organize_span" class="xinghaoCss">*</span></td>
		</tr>
			<tr>
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ISALLSUB")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight">
                    	<html:select name="isallsub" property="isallsub" >
	                        <html:options collection="WFPROCESSTYPE_ISALLSUB_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
	        </tr>
		<input type="hidden" name="reservetype" value="">	
		<input type="hidden" name="formid" value="">
		<input type="hidden" name="formname" value="">
		<!-- 增加判断定制和业务表单的标志 -->
		<input type="hidden" name="flag" value="0">

			
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－流程管理－增加流程");
function forSave(){
	if( !checkProcess() ) return;
  document.forms[0].action ="process.cmd?method=forinsert";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processquery.cmd?clear=true";
  document.forms[0].submit();	
}
function showValue(){
    if(document.all("formType").value=="wfd_32.bsh" )
    {
        document.all("formname_span1").innerHTML="*";
        document.all("formname_span2").innerHTML="";
        document.all("flag").value="1";     
        document.all("reservetype").value="reservetypetest";
    }else if(document.all("formType").value=="wfd_self.bsh"){
		   document.all("formname_span2").innerHTML="";
		   document.all("formname_span1").innerHTML="";
		   document.all("reservetype").value="MdaForm";
	}else if(document.all("formType").value=="wfd_definedform.bsh"){
         document.all("reservetype").value="Jsp_Field";
         document.all("formname_span1").innerHTML="";
         document.all("formname_span2").innerHTML="*";
         document.all("formname2").readOnly=false;
         document.all("flag").value="2"; 
    }else{
           document.all("reservetype").value="Jsp_NoneField";
           document.all("formname_span1").innerHTML="";
           document.all("formname_span2").innerHTML="*";
           document.all("formname2").readOnly=false;
          document.all("flag").value="2";  
    }
}
 </script>