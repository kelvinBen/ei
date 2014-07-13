<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>tabģ���޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript">
function checkSoaTab(){
	var categoryId = document.forms[0].categoryId;
      if ( __isQuoteIn(categoryId.value) )
    {
      alert("ģ���ʶ���ܺ������Ż�����!"); 
      categoryId.focus();     
      return false;
    }
  	if (trim(categoryId.value)=="")
	{
	  alert("������ģ���ʶ��");   
	  categoryId.focus(); 
	  return false;
	}
    categoryId.value = trim(categoryId.value) ;
	var name = document.forms[0].name;
  	if (trim(name.value)=="")
	{
	  alert("������ģ�����ƣ�");   
	  name.focus(); 
	  return false;
	}
    name.value = trim(name.value) ;
	var desc = document.forms[0].desc;
  	if (trim(desc.value)=="")
	{
	  alert("������ģ��������");   
	  desc.focus(); 
	  return false;
	}
    desc.value = trim(desc.value) ;
	//var pmId = document.forms[0].pmId;
  	//if (trim(pmId.value)=="")
	//{
	//  alert("������༭����");   
	//  pmId.focus(); 
	//  return false;
	//}
    //pmId.value = trim(pmId.value) ;
	var index = document.forms[0].index;
  	if (trim(index.value)=="")
	{
	  alert("��������ţ�");   
	  index.focus(); 
	  return false;
	}
    index.value = trim(index.value) ;
	var isMain = document.forms[0].isMain;
  	if (trim(isMain.value)=="")
	{
	  alert("�������Ƿ���tab��");   
	  isMain.focus(); 
	  return false;
	}
    isMain.value = trim(isMain.value) ;
    if(isMain.value=="0"&&document.forms[0].refId.value!=""&&document.forms[0].refId.value!=null){
    	alert("��tab����ѡ�������ϵ,�����������ϵ");
    	alert(isMain.value);
    	return false; 
    }
    if(isMain.value=="0"&&(document.forms[0].pmId.value==""||document.forms[0].pmId.value==null)){
    	alert("��tab����ָ���༭����");
    	return false; 
    }
    if(isMain.value=="1"&&document.forms[0].pmId.value!=""&&document.forms[0].pmId.value!=null&&(document.forms[0].refId.value==""||document.forms[0].refId.value==null)){
    	alert("������tab������tab,������tab����Ҫָ��������ϵ");
    	return false; 
    }
	var isDetail = document.forms[0].isDetail;
  	if (trim(isDetail.value)=="")
	{
	  alert("�������Ƿ���ϸtab��");   
	  isDetail.focus(); 
	  return false;
	}
    isDetail.value = trim(isDetail.value) ;
	var isSameTab = document.forms[0].isSameTab;
  	if (trim(isSameTab.value)=="")
	{
	  alert("�������Ƿ�ͬһtab��");   
	  isSameTab.focus(); 
	  return false;
	}
    isSameTab.value = trim(isSameTab.value) ;
	var creTime = document.forms[0].creTime;
  	if (trim(creTime.value)=="")
	{
	  alert("�����봴��ʱ�䣡");   
	  creTime.focus(); 
	  return false;
	}
    creTime.value = trim(creTime.value) ;
	var parent = document.forms[0].parent;
  	if (trim(parent.value)=="")
	{
	  alert("�������ϼ�ģ�飡");   
	  parent.focus(); 
	  return false;
	}
    parent.value = trim(parent.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="tabģ���޸�" >
<bsp:containbutton action="soatab.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<html:hidden name="categoryId" property="categoryId"/>                      
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CATEGORY_NAME")%>��</td>
                    <td class="tdRight"><html:text name="name" property="name" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CATEGORY_DESC")%>��</td>
                    <td class="tdRight"><html:text name="desc" property="desc" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.PERMANENCE_ID")%>��</td>
                    <td><html:text name="pmId" property="pmId" size="32" maxlength="32" /><img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPm()"></td>
					</tr>
				    <tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.REF_ID")%>��</td>
				      <td class="tdRight"><html:text name="refId" property="refId" size="32" maxlength="32" />
				      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectRef()"></td>
				    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.TAB_INDEX")%>��</td>
                    <td class="tdRight"><html:text name="index" property="index" size="32" maxlength="32" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_MAIN")%>��</td>
                    <td class="tdRight">
                    	<html:select name="isMain" property="isMain" >
	                        <html:options collection="SOATAB_ISMAIN_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_DETAIL")%>��</td>
                    <td class="tdRight">
                    	<html:select name="isDetail" property="isDetail" >
	                        <html:options collection="SOATAB_ISDETAIL_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_SAMETAB")%>��</td>
                    <td class="tdRight">
                    	<html:select name="isSameTab" property="isSameTab" >
	                        <html:options collection="SOATAB_ISSAMETAB_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.IS_READONLY")%>��</td>
                    <td class="tdRight">
                    	<html:radioGroup name="isReadOnly" property="isReadOnly" collection="SOATAB_ISREADONLY_COLLECTION" labelProperty="value" labelKey="key"/>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_TAB.CRE_TIME")%>��</td>
                    <td>
						<date:date name="creTime" property="creTime" divname="creTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
						</date:date>
					</td>
					</tr>
					<html:hidden name="parent" property="parent"/>                     
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkSoaTab()) return;	
  document.forms[0].action ="soatab.cmd?method=update";
  document.forms[0].submit();	
}
function selectRef(){
  var ismain = document.forms[0].isMain.value;
  if(ismain=="0"){
      alert("��tab����ѡ�������ϵ");
      return ;
  }
  var pmid = document.forms[0].pmId.value;
  if(pmid==null||pmid==""){
      alert("����ѡ��༭����");
      return ;
  }
  var pantid = document.forms[0].parent.value;
  var url ="jsp/help.jsp?url=soatab.cmd&method=getRefPm&pmid="+pmid+"&parentid="+pantid;
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	  return;
  } else {
	  document.forms[0].refId.value= win[0];
	  document.forms[0].refId.text= win[1];
  }
}
function selectPm(){
  var url ="soacategory.cmd?method=getModel&parentid=-1&rtnpath=pmroot&modelType=1";
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	  return;
  } else {
	  document.forms[0].pmId.value= win[0];
	  document.forms[0].pmId.text= win[1];
  }
}
</script>