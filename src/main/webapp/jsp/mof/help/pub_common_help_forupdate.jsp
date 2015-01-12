
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>通用帮助修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubCommonHelp(){
var helpId = document.forms[0].helpId;
    if ( __isQuoteIn(helpId.value) )
    {
      alert("帮助编号不能含有引号或单引号");      
      return false;
    }
    if (trim(helpId.value)=="")
  {
    alert("请输入帮助编号！");    
    return false;
  }
  helpId.value = trim(helpId.value) ;
 var helpTable = document.forms[0].helpTable;
  if (trim(helpTable.value)=="")
  {
    alert("请输入帮助表名！");    
    return false;
  }
  helpTable.value = trim(helpTable.value) ;
 var helpTitle = document.forms[0].helpTitle;
  if (trim(helpTitle.value)=="")
  {
    alert("请输入帮助标题！");    
    return false;
  }
  helpTitle.value = trim(helpTitle.value) ;
   var codeField = document.forms[0].codeField;
  if (trim(codeField.value)=="")
  {
    alert("请输入编号字段！");    
    return false;
  }
  codeField.value = trim(codeField.value) ;
   var isEqualLen = document.forms[0].isEqualLen;
  if (trim(isEqualLen.value)=="")
  {
    alert("请输入编号字段是否等长！");    
    return false;
  }
  isEqualLen.value = trim(isEqualLen.value) ;  
      var nameField = document.forms[0].nameField;
  if (trim(nameField.value)=="")
  {
    alert("请输入名称字段！");    
    return false;
  }
  nameField.value = trim(nameField.value) ;
    var isDetailsel = document.forms[0].isDetailsel;
  if (trim(isDetailsel.value)=="")
  {
    alert("请输入是否只能选择明细！");    
    return false;
  }
  isDetailsel.value = trim(isDetailsel.value) ;
 var isMultsel = document.forms[0].isMultsel;
  if (trim(isMultsel.value)=="")
  {
    alert("请输入能否多选！");    
    return false;
  }
  isMultsel.value = trim(isMultsel.value) ;
 var isIndvl = document.forms[0].isIndvl;
  if (trim(isIndvl.value)=="")
  {
    alert("请输入是否个性化！");    
    return false;
  }
  isIndvl.value = trim(isIndvl.value) ;
                                      	return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="通用帮助修改" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                                                        <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_ID")%>：</td>
                    <td class="tdRight"><html:hidden name="helpId" property="helpId" write="true"/></td>
                    </tr>
                                                           <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_TABLE")%>：</td>
                    <td class="tdRight"><html:text name="helpTable" property="helpTable" size="50" maxlength="100"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_TITLE")%>：</td>
                    <td class="tdRight"><html:text name="helpTitle" property="helpTitle" size="60" maxlength="60"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.ROOT_NAME")%>：</td>
                    <td class="tdRight"><html:text name="rootName" property="rootName" size="20" maxlength="20"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.LEVEL_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="levelField" property="levelField" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.CODE_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="codeField" property="codeField" size="50" maxlength="50"/></td>
                    </tr>

                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_EQUAL_LEN")%>：</td>
                    <td class="tdRight"><html:text name="isEqualLen" property="isEqualLen" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.DETAIL_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="detailField" property="detailField" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.FILIATION_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="filiationField" property="filiationField" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.CODE_STRU")%>：</td>
                    <td class="tdRight"><html:text name="codeStru" property="codeStru" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.ID_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="idField" property="idField" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.SHORT_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="shortField" property="shortField" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.NAME_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="nameField" property="nameField" size="50" maxlength="50"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.SHOW_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="showField" property="showField" size="50" maxlength="500"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.RETURN_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="returnField" property="returnField" size="60" maxlength="500"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_WHERE")%>：</td>
                    <td class="tdRight"><html:text name="helpWhere" property="helpWhere" size="80" maxlength="1000"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_DETAILSEL")%>：</td>
                    <td class="tdRight"><html:select name="isDetailsel" property="isDetailsel" >
	                        <html:options collection="PUBCOMMONHELP_ISDETAILSEL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select></td>
                    </tr>
                                                           <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_MULTSEL")%>：</td>
                    <td class="tdRight"><html:select name="isMultsel" property="isMultsel" >
	                        <html:options collection="PUBCOMMONHELP_ISMULTSEL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select></td>
                    </tr>
                                                           <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_INDVL")%>：</td>
                    <td class="tdRight"><html:select name="isIndvl" property="isIndvl" >
	                        <html:options collection="PUBCOMMONHELP_ISINDVL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select></td>
                    </tr>
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.SHOW_NAME")%>：</td>
                    <td class="tdRight"><html:text name="showName" property="showName" size="80" maxlength="500" /></td>
                    </tr> 
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_STYLE")%>：</td>
                    <td class="tdRight"><html:text name="helpStyle" property="helpStyle" size="80" maxlength="300" /></td>
                    </tr>  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.DATASOURCE")%>：</td>
                    <td class="tdRight"><html:text name="dataSource" property="dataSource" size="40" maxlength="60" /></td>
                    </tr>  
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_NOTE")%>：</td>
                    <td class="tdRight"><html:text name="helpNote" property="helpNote" size="80" maxlength="200" /></td>
                    </tr>                                      
     </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubCommonHelp()) return;	
  document.forms[0].action ="pubcommonhelp.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubcommonhelpquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>