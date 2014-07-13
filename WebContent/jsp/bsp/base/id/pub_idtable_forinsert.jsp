<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>最大号表增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubIdtable(){
var id = document.forms[0].id;
    if ( __isQuoteIn(id.value) )
    {
      alert("主键标识只能是数字或字母!");
      id.select();
      id.focus();
      return false;
    }
  if (trim(id.value)=="")
  {
    alert("请输入主键标识！");
    id.focus();
    return false;
  }
   if(byteLength(trim(id.value))>"30")
  {
  	alert("主键标识输入过长");
    id.focus();
    return false;
  }
  id.value = trim(id.value) ;
 var value = document.forms[0].value;
  if (trim(value.value)=="")
  {
    alert("请输入当前编号！");
    value.focus();
    return false;
  }
  value.value = trim(value.value) ;
 var name = document.forms[0].name;
  if (trim(name.value)=="")
  {
    alert("请输入业务名称！");
    name.focus();
    return false;
  }
  if(byteLength(trim(name.value))>"50")
  {
  	alert("业务名称输入过长");
    name.focus();
    return false;
  }
  name.value = trim(name.value) ;
 var cacheSize = document.forms[0].cacheSize;
  if (trim(cacheSize.value)=="")
  {
    alert("请输入缓存大小！");
    cacheSize.focus();
    return false;
  }
  if(!__isNum(trim(cacheSize.value)))
	{
	  alert("缓存大小必须是0或者正整数！");
	  cacheSize.focus();
	  return false;
	}
  cacheSize.value = trim(cacheSize.value) ;
  var isPrefix = document.forms[0].isPrefix;
  if (trim(isPrefix.value)=="")
  {
    alert("请输入是否使用前缀！");
    isPrefix.focus();
    return false;
  }
  isPrefix.value = trim(isPrefix.value) ;
 var idLength = document.forms[0].idLength;
  if (trim(idLength.value)=="")
  {
    alert("请输入编号长度！");
    idLength.focus();
    return false;
  }
  if(!__isNum(trim(idLength.value)))
	{
	  alert("编号长度必须是0或者正整数！");
	  idLength.focus();
	  return false;
	}
  idLength.value = trim(idLength.value) ;
  return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="最大号表增加" >
<bsp:containbutton text="保存" onclick="forSave()" action ="pubidtable.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="保存并继续" onclick="forSaveContinue()" action ="pubidtable.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" action=""></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action ="pubidtablequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_ID")%>：</td>
                    <td class="tdRight"><html:text name="id" property="id" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_VALUE")%>：</td>
                    <td class="tdRight"><html:text name="value" property="value" size="8" maxlength="8" /></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="50" maxlength="50" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.CACHE_SIZE")%>：</td>
                    <td class="tdRight"><html:text name="cacheSize" property="cacheSize" size="8" maxlength="8" /></td>
                    </tr>   
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.IS_PREFIX")%>：</td>
                    <td class="tdRight"><html:select name="isPrefix" property="isPrefix" >
	                        <html:options collection="PUBIDTABLE_ISPREFIX_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select></td>
                    </tr>                 
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_PREFIX")%>：</td>
                    <td class="tdRight"><html:text name="prefix" property="prefix" size="10" maxlength="10" /></td>
                    </tr>                    
                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_LENGTH")%>：</td>
                    <td class="tdRight"><html:text name="idLength" property="idLength" size="8" maxlength="8" /></td>
                    </tr>     
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.IS_SUFFIX")%>：</td>
                    <td class="tdRight"><html:select name="isSuffix" property="isSuffix" >
	                        <html:options collection="PUBIDTABLE_ISSUFFIX_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_SUFFIX")%>：</td>
                    <td class="tdRight"><html:text name="suffix" property="suffix" size="8" maxlength="8"/></td>
                    </tr>    
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.IS_GLOBAL")%>：</td>
                    <td class="tdRight"><html:select name="isGlobal" property="isGlobal" >
	                        <html:options collection="PUBIDTABLE_ISGLOBAL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select></td>
                    </tr>    
                    <tr>
                     <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ORGANID")%>：</td>
                     <td class="tdRight"><html:text name="organId"  property="organId" size="20" maxlength="30" value="" readonly="true" ondblclick = "clean()"/>
                     <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectOrganName()" >(选择组织)</td>
                    </tr> 
   </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].organId.value="";
}
function selectOrganName(){
  var cmdUrl="stru.cmd&method=getSelectRoot&organType=1&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=1";
  
  var url ="jsp/help.jsp?url="+cmdUrl;     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("organId").value=win[0];
  }
}
function forSave(){
  if(!checkPubIdtable()) return;	
  document.forms[0].action ="pubidtable.cmd?method=insert";
  document.forms[0].submit();	
}
function forSave(){
  if(!checkPubIdtable()) return;	
  document.forms[0].action ="pubidtable.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubIdtable()) return;
  document.forms[0].action ="pubidtable.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubidtablequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>