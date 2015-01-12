<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>持久模型修改</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript">
function checkPermanence(){
	  var categoryId = document.forms[0].categoryId;
  	  if ( __isQuoteIn(categoryId.value) )
	  {
	    alert("标识不能含有引号或单引号!");
	    categoryId.select();
	    categoryId.focus();
	    return false;
	  }
      if (trim(categoryId.value)=="")
	{
	  alert("请输入标识！");    
	  categoryId.focus();
	  return false;
	}
    categoryId.value = trim(categoryId.value) ;
	  var name = document.forms[0].name;
      if (trim(name.value)=="")
	{
	  alert("请输入表名！");    
	  name.focus();
	  return false;
	}
    name.value = trim(name.value) ;
	  var desc = document.forms[0].desc;
      if (trim(desc.value)=="")
	{
	  desc.value= name.value;
	}
    desc.value = trim(desc.value) ;
	  var javaname = document.forms[0].javaName;
	  if(trim(javaname.value)==""){
	  	javaname.value = name.value;
	  }
	  var iscache = document.forms[0].isCache;
      if (trim(iscache.value)=="")
	{
	  alert("请输入是否缓存！");    
	  iscache.focus();
	  return false;
	}
    iscache.value = trim(iscache.value) ;
	  var dataSouce = document.forms[0].dataSouce;
      if (trim(dataSouce.value)=="")
	{
	  dataSouce.value = "dataSource";
	}
    dataSouce.value = trim(dataSouce.value) ;
	  var template = document.forms[0].template;
	  var codepath = document.forms[0].webRoot;
	  var parent = document.forms[0].parent;
      if (trim(parent.value)=="")
	{
	  alert("请输入所属模块！");    
	  parent.focus();
	  return false;
	}
    parent.value = trim(parent.value) ;
	  var parent = document.forms[0].parent;
	  var creTime = document.forms[0].creTime;
      if (trim(creTime.value)=="")
	{
	  alert("请输入创建时间！");    
	  creTime.focus();
	  return false;
	}
    creTime.value = trim(creTime.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="持久模型修改" >
<bsp:containbutton action="permanence.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<html:hidden name="categoryId" property="categoryId" write="false" />                  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CATEGORY_NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="32" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CATEGORY_DESC")%>：</td>
                    <td class="tdRight"><html:text name="desc" property="desc" size="32" maxlength="50" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_JAVANAME")%>：</td>
                    <td class="tdRight"><html:text name="javaName" property="javaName" size="32" maxlength="32" /></td>
                    </tr>  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.JAVAPACKAGE")%>：</td>
                    <td class="tdRight"><html:text name="javaPackage" property="javaPackage" size="32" maxlength="100" /></td>
                    </tr>                                            
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.ASSOCIATE")%>：</td>
                    <td class="tdRight"><html:text name="associate" property="associate" size="32" maxlength="32" />
                    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectColumn()"></td>
                    </tr> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_ISCACHE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="isCache" property="isCache" >
	                        <html:options collection="PERMANENCE_ISCACHE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select><FONT COLOR=#ff0000>缓存与单独方法同时使用会出现不一致的情况</FONT>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_DS")%>：</td>
                    <td class="tdRight"><html:text name="dataSouce" property="dataSouce" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_TEMPLATE")%>：</td>
                    <td class="tdRight"><html:text name="template" property="template" size="32" maxlength="500" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.PM_WEBROOT")%>：</td>
                    <td class="tdRight"><html:text name="webRoot" property="webRoot" size="32" maxlength="500" /></td>
                    </tr>                    
					<html:hidden name="parent" property="parent" write="false"/></td>                  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PERMANENCE.CRE_TIME")%>：</td>
                    <td>
						<date:date name="creTime" property="creTime" divname="creTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
						</date:date>
					</td>
					</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPermanence()) return;	
  document.forms[0].action ="permanence.cmd?method=update";
  document.forms[0].submit();	
}
function selectColumn(){
  var url ="soacategory.cmd?method=getModel&parentid=-1&rtnpath=columnhelproot&modelType=1";
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	  return;
  } else {
	  document.forms[0].associate.value= win[0];
	  document.forms[0].associate.text= win[1];
  }
}
</script>