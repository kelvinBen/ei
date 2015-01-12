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
function selectForm(){
	if(document.all("formType").value=="wfd_32.bsh"){
	    var url ="jsp/help.jsp?url=workformmanagerhelpquery.cmd";
        url=url+"&processtype_search="+document.all("processtype").value;      
        var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
        if (win == null) {  
         	return;
        }else{
        document.all("formid").value=win[0];
        document.all("formname").value=win[1];
        checkinputNullInDcWork('formId','formname_span');
        return;
	   }
	}else if(document.all("formType").value=="wfd_jsp.bsh"){
	    var url ="jsp/help.jsp?url=jspFormsHelpQuery.cmd";
        var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
        if (win == null) {  
         	return;
        }else{
        document.all("formid").value=win[0];
        document.all("formname").value=win[1];
        checkinputNullInDcWork('formId','formname_span');
        return;
	   } 
	}else if(document.all("formType").value=="wfd_self.bsh"){
	   alert("������Ϊ�ޱ�������ѡ�����");
	   document.all("formid").value="";
       document.all("formname").value="";
	   return;
	}
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
	  		  if(confirm("�Ƿ�ʹ������ģ���Ӧ�ı���")){
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
//		alert('"��Ӧ��"����Ϊ�գ�');
	    //formid.focus();
//		return false;
//	}
	formid.value = trim(formid.value) ;
	
	var organizeName = document.forms[0].organizeName;
	if (trim(organizeName.value)=="")
	{
		alert('"������֯����"����Ϊ�գ�');
	    organizeName.focus();
		return false;
	}
	organizeName.value = trim(organizeName.value) ;
	var processtype = document.forms[0].processtype;
	if (trim(processtype.value)=="")
	{
		alert('"��������"����Ϊ�գ�');
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
<html:button name="ȷ��" value="ȷ��" onclick="forSave()"></html:button>&nbsp;<html:button name="����" value="����" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
	
<%

String organId=(String)request.getAttribute("rootOrganId");
String organName=(String)request.getAttribute("rootOrganName");
%>

		<tr>
			<td class="TdLeft">�������ͣ�</td>
			<td class="TdRight">
			  <html:hidden name="processtype" value=""/><html:text name="processtypename" value="" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('processtype','processtype_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectProcType()"><span id="processtype_span" class="xinghaoCss">*</span>
			
			</td>
		</tr>
		<tr>
			<td class="TdLeft">����ģ�棺</td>
			<td class="TdRight">
			 <html:hidden name="proctemplate" value=""/><html:text name="proctemplatename" value="" size="30" maxlength="30" readonly="true" /><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectProcTemplate()"> 
	          </td>
		</tr>
		<tr>
			<td class="TdLeft">�����ͣ�</td>
			<td class="TdRight">
			 <select name="formType" onchange="showValue()">
		     	<option value="wfd_32.bsh">���Ʊ�</option>
		     	<option value="wfd_jsp.bsh">jsp��</option>
				<option value="wfd_self.bsh">�ޱ�</option>
             </select>
            </td>
        </tr> 
		<tr>
			<td class="TdLeft">����</td>
			<td class="TdRight">
			 <html:hidden name="formid" value=""/><html:text name="formname" value="" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('formId','formname_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectForm()"><span id="formname_span" class="xinghaoCss">*</span> 
	          </td>
		</tr> 
						                  
		<tr>
			<td class="TdLeft">������֯������</td>
			<td class="TdRight"><html:hidden name="organize" value="<%=organId%>"/><html:text name="organizeName" value="<%=organName%>" size="30" maxlength="30" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectNewDeptIdTree()"><span id="organize_span" class="xinghaoCss">*</span></td>
		</tr>
		
		<input type="hidden" name="reservetype" value="">	
		
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("�������̣����̹�����������");
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
        document.all("reservetype").value="reservetypetest";   
        document.all("formname_span").innerHTML="*";
        document.all("formname").readOnly=true;
    }else if(document.all("formType").value=="wfd_jsp.bsh"){
         document.all("reservetype").value="JspForm";
         document.all("formname_span").innerHTML="*";
         document.all("formname").readOnly=true;
    }
    else if(document.all("formType").value=="wfd_self.bsh"){
		   document.all("formname_span").innerHTML="";
		   document.all("reservetype").value="MdaForm";
		   document.all("formid").value="";
           document.all("formname").value="";
           document.all("formname").readOnly=true;
	}
}
 </script>