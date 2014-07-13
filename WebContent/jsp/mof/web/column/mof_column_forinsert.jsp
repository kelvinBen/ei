<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
	String mofTableId = request.getParameter("mofTableId");
	if (mofTableId==null){
	mofTableId="";
	}
	String mofTableName = request.getParameter("mofTableName");
	if (mofTableName==null){
	mofTableName="";
	}
	String refreshId=(String)request.getAttribute("refreshId");
	if (refreshId==null||refreshId.equals("")){
	    refreshId="";
	}else{
	    refreshId=refreshId+"@O";
	}
%>
<HTML>
<HEAD>
<TITLE>列增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMofColumn(){
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("请输入名称！");    
	return false;
	}
	name.value = trim(name.value) ;
	
	var description = document.forms[0].description;
	description.value = trim(description.value) ;
	
	var iscolumn = document.forms[0].iscolumn;
	if ((iscolumn[0].checked==false)&&(iscolumn[1].checked==false))
	{
	alert("请输入是否表列！");    
	return false;
	}
	iscolumn.value = trim(iscolumn.value) ;
	var columnname = document.forms[0].columnname;
	if (trim(columnname.value)=="")
	{
	alert("请输入列名！");    
	return false;
	}
	columnname.value = trim(columnname.value) ;
	var ismandatory = document.forms[0].ismandatory;
	if ((ismandatory[0].checked==false)&&(ismandatory[1].checked==false))
	{
	alert("请输入是否必须！");    
	return false;
	}
	ismandatory.value = trim(ismandatory.value) ;
	var defaultvalue = document.forms[0].defaultvalue;
	defaultvalue.value = trim(defaultvalue.value) ;
	var isupdateable = document.forms[0].isupdateable;
	if ((isupdateable[0].checked==false)&&(isupdateable[1].checked==false))
	{
	alert("请输入是否可更新！");    
	return false;
	}
	isupdateable.value = trim(isupdateable.value) ;
	var iskey = document.forms[0].iskey;
	if ((iskey[0].checked==false)&&(iskey[1].checked==false))
	{
	alert("请输入是否主键！");    
	return false;
	}
	iskey.value = trim(iskey.value) ;
	
	var readonlylogic = document.forms[0].readonlylogic;
	readonlylogic.value = trim(readonlylogic.value) ;
	
	var isactive = document.forms[0].isactive;
	if ((isactive[0].checked==false)&&(isactive[1].checked==false))
	{
	alert("请输入是否活动！");    
	return false;
	}
	isactive.value = trim(isactive.value) ;
	
	var length = document.forms[0].length;
	length.value = trim(length.value) ;
	
	var vformat = document.forms[0].vformat;
	vformat.value = trim(vformat.value) ;
	
	var valuemin = document.forms[0].valuemin;
	valuemin.value = trim(valuemin.value) ;
	
	var valuemax = document.forms[0].valuemax;
	valuemax.value = trim(valuemax.value) ;
	
	var validationMsg = document.forms[0].validationMsg;
	validationMsg.value = trim(validationMsg.value) ;
	
	var mofReferenceId = document.forms[0].mofReferenceId;
	mofReferenceId.value = trim(mofReferenceId.value) ;
	
	var mofReferenceValue = document.forms[0].mofReferenceValue;	
	mofReferenceValue.value = trim(mofReferenceValue.value) ;
	return true
}
function fillsel()
{
	var f = document.getElementById("dataFrame");
	f.src = "multiselect.cmd?method=getRefValueByRefId&mofReferenceName="+document.all("mofReferenceId").options[document.all("mofReferenceId").selectedIndex].innerText;
}
function fillData(str){
	document.all("seldiv").innerHTML = str;
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="列增加" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="保存并继续" onclick="forSaveContinue()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
	<html:hidden name="mofTableId" value="<%=mofTableId%>"/>	    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.MOF_TABLE_ID")%>：</td>
	<td class="tdRight" colspan="3"><html:hidden name="mofTableName" value="<%=mofTableName%>" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.NAME")%>：</td>
	<td class="tdRight" colspan="3"><html:text name="name" property="name" size="40" maxlength="40" /></td>
	</tr>	      
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.DESCRIPTION")%>：</td>
	<td class="tdRight" colspan="3"><html:textarea name="description" property="description" cols="80" rows="2" /></td>
	</tr>                         
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISACTIVE")%>：</td>
	<td class="tdRight"  colspan="3">
	<html:radio name="isactive" property="isactive" value="0" >否</html:radio>
	<html:radio name="isactive" property="isactive" value="1" >是</html:radio>
	</td>
	</tr>                   
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISCOLUMN")%>：</td>
	<td class="tdRight">
	<html:radio name="iscolumn" property="iscolumn" value="0">否</html:radio>
	<html:radio name="iscolumn" property="iscolumn" value="1">是</html:radio>
	</td>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.COLUMNNAME")%>：</td>
	<td class="tdRight"><html:text name="columnname" property="columnname" size="40" maxlength="40" /></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISKEY")%>：</td>
	<td class="tdRight">
	<html:radio name="iskey" property="iskey" value="0">否</html:radio>
	<html:radio name="iskey" property="iskey" value="1">是</html:radio>
	</td>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISPARENT")%>：</td>
	<td class="tdRight">
	<html:radio name="isparent" property="isparent" value="0">否</html:radio>
	<html:radio name="isparent" property="isparent" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISMANDATORY")%>：</td>
	<td class="tdRight">
	<html:radio name="ismandatory" property="ismandatory" value="0">否</html:radio>
	<html:radio name="ismandatory" property="ismandatory" value="1">是</html:radio>
	</td>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISUPDATEABLE")%>：</td>
	<td class="tdRight">
	<html:radio name="isupdateable" property="isupdateable" value="0">否</html:radio>
	<html:radio name="isupdateable" property="isupdateable" value="1">是</html:radio>
	</td>
	</tr>                           
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISTREE")%>：</td>
	<td class="tdRight"  colspan="3">
	  <html:select name="tree" property="tree"  >
	  <html:options  collection="MOFCOLUMN_ISTREE_COLLECTION" labelProperty="value" property="key"  /> 
     </html:select>
	</td>
	</tr>    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.DEFAULTVALUE")%>：</td>
	<td class="tdRight" colspan="3"><html:textarea name="defaultvalue" property="defaultvalue" rows="4" cols="80" /></td>
	</tr> 
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.READONLYLOGIC")%>：</td>
	<td class="tdRight" colspan="3"><html:textarea name="readonlylogic" property="readonlylogic" cols="80" rows="4" /></td>
	</tr> 
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.LENGTH")%>：</td>
	<td class="tdRight"><html:text name="length" property="length" size="8" maxlength="8" /></td>
	
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VFORMAT")%>：</td>
	<td class="tdRight"><html:text name="vformat" property="vformat" size="40" maxlength="40" /></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALUEMIN")%>：</td>
	<td class="tdRight"><html:text name="valuemin" property="valuemin" size="20" maxlength="20" /></td>
	
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALUEMAX")%>：</td>
	<td class="tdRight"><html:text name="valuemax" property="valuemax" size="20" maxlength="20" /></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISSUM")%>：</td>
	<td class="tdRight" colspan="3">	
	<html:radio name="issum" property="issum" value="0">否</html:radio>
	<html:radio name="issum" property="issum" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALIDATIONMSG")%>：</td>
	<td class="tdRight" colspan="3"><html:textarea name="validationMsg" property="validationMsg" rows="4" cols="80"/></td>
	</tr>            
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.MOF_REFERENCE_ID")%>：</td>
	<td class="tdRight"><html:select onchange="fillsel()" name="mofReferenceId" property="mofReferenceId">
	<html:options collection="MOFREFERENCE_IDNAME_COLLECTION1" property="MOF_REFERENCE_ID" labelProperty="NAME"/>
	</html:select>
	</td>
	
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.MOF_REFERENCE_VALUE")%>：</td>
	<html:hidden name="random" property="mofReferenceValue"/>
	<td class="tdRight">                    
	<div id="seldiv">
	</div>
	</td>
	
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.PROCESS")%>：</td>
	<td class="tdRight" colspan="3"><html:textarea name="process" property="process" rows="2" cols="80"/></td>
	</tr>              
	
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALIDATIONCODE")%>：</td>
	<td class="tdRight" colspan="3"><html:textarea name="validationCode" property="validationCode" rows="4" cols="80"/></td>
	</tr>
	<tr></tr>                  
  </table>
</div>
</widgets:container>
</html:form>
<iframe style="display:none" id="dataFrame"></iframe>
<script language="javascript">
document.all("mofReferenceId").onchange();
function forSave(){
  if(!checkMofColumn()) return;	
  document.forms[0].action ="mofcolumn.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMofColumn()) return;
  document.forms[0].action ="mofcolumn.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofcolumnquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null||refreshId!=""||refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>
</BODY>
</HTML>

