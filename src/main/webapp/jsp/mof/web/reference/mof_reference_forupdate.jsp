<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>参考类型修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript">
function checkMofReference(){
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("请输入名称！");    
	return false;
	}
	name.value = trim(name.value) ;
	var validationtype = document.forms[0].validationtype;
	if (trim(validationtype.value)=="")
	{
	alert("请输入参考数据类型！");    
	return false;
	}
	validationtype.value = trim(validationtype.value) ;
	var helpno = document.forms[0].helpno;
	
	validationtype.value = trim(validationtype.value) ;	  
	if( validationtype.value == "Table" ){
	    if( trim(helpno.value)==""){
	    	alert("关联表必须输入帮助编号!");
	    	return false;
	    }
	}
	helpno.value = trim(helpno.value) ;
	var discription = document.forms[0].discription;
	discription.value = trim(discription.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="参考类型修改" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">		
  					<tr>
  					<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.MOF_REFERENCE_ID")%>：</td>
  					<td class="tdRight"><html:text name="mofReferenceId" property="mofReferenceId" size="30" readonly="true" maxlength="60" /></td>
  					</tr>      
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="30" maxlength="60" /></td>
                    </tr>                      
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.DISCRIPTION")%>：</td>
                    <td class="tdRight"><html:textarea name="discription" property="discription" cols="80" rows="4" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.VALIDATIONTYPE")%>：</td>
                    <td class="tdRight">
                    <html:select name="validationtype" onchange="doChange();"  property="validationtype">
                    	<html:options collection="VALIDATION_TYPE" property="key" labelProperty="value"/>                    	
                    </html:select>
                    </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.HELPNO")%>：</td>
                    <td class="tdRight"><html:text name="helpno" property="helpno" size="30" maxlength="30" />
                    <img src="<mast:ui img='liulan.gif'/>"  border="0" style="cursor:hand"  onclick="forHelp()" /> 
                    </td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.IMPL_CLASS")%>：</td>
                    <td class="tdRight"><html:text name="implClass" property="implClass" size="70" maxlength="120" /></td>
                    </tr> 
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.IMPL_LOGIC")%>：</td>
                    <td class="tdRight"><html:text name="implLogic" property="implLogic" size="70" maxlength="120" /></td>
                    </tr>    
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.CATEGORY")%>：</td>
                    <td class="tdRight">
                    <html:select name="category" property="category">
                    	<html:options collection="MOFCATEGORY_COLLECTION" property="CATEGORY_ID" labelProperty="NAME"/>                    	
                    </html:select>
                    </td>
                    </tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
doChange();
function forHelp(){
			var win = help("commonhelp",null);
			if(win!=null && win.length>0){
				document.forms[0].helpno.value=win[0][0];
			}
  }
function forSave(){
  if(!checkMofReference()) return;	
  document.forms[0].action ="mofreference.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofreferencequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function doChange(){  
    var sel1=document.forms[0].validationtype;	
    var sel2=document.forms[0].category;	
    if (sel1.selectedIndex!=-1)
    {
    	var seled1=sel1.options[sel1.selectedIndex];
    	var oldkey=seled1.value;
    	if (oldkey=="DataValue"){
    	    sel2.value="";
    	    sel2.disabled=true;
    	}else{
    	    sel2.disabled=false; 
    	}
    }

  }
</script>