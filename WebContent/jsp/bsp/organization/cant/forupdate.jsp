<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<% 
    String superCode = request.getParameter("superCode");
    String country = request.getParameter("country");	
        if(country==null || country.equals("")){
		country="CN";
      }
      if(superCode==null || superCode.equals("")){
		superCode=country;
      }
%> 

<HTML>
<HEAD>
<TITLE>行政区划修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubCant(){
var cantCode = document.forms[0].cantCode;
    if ( __isQuoteIn(cantCode.value) )
    {
      alert("行政区划代码不能含有特殊字符！"); 
      cantCode.value="";
      cantCode.select();
      cantCode.focus();   
      return false;
    }
    if (trim(cantCode.value)=="")
  {
      alert("请输入行政区划代码！");   
      cantCode.select();
      cantCode.focus();
      return false;
  }
  cantCode.value = trim(cantCode.value) ;
 var cantName = document.forms[0].cantName;
 if ( __isQuoteIn(cantName.value) )
    {
       alert("行政区划名称不能含有特殊字符！"); 
       cantName.value="";
       cantName.select();
       cantName.focus();     
       return false;
    }
  if (trim(cantName.value)=="")
  {
     alert("请输入行政区划名称！");  
     cantName.select();
     cantName.focus(); 
     return false;
  }
  cantName.value = trim(cantName.value) ;
  var shortName=document.forms[0].shortName;
  if ( __isQuoteIn(shortName.value) )
    {
      alert("行政区划简称不能含有特殊字符!");    
      shortName.value="";
      shortName.select();
      shortName.focus();  
      return false;
    }
  shortName.value = trim(shortName.value) ;  
  var cantType = document.forms[0].cantType;
  if ( __isQuoteIn(cantType.value) )
    {
      alert("行政区划类型代码不能含有特殊字符!");          
      return false;
    }
  if (trim(cantType.value)=="")
  {
     alert("请输入类型！"); 
     return false;
  }
  cantType.value = trim(cantType.value) ;
 var superCode = document.forms[0].superCode;
  if (trim(superCode.value)=="")
  {
      alert("请输入上级行政区划内码！"); 
      superCode.select();
      superCode.focus(); 
      return false;
  }
  superCode.value = trim(superCode.value) ;
  var countryCode = document.forms[0].countryCode;
  if (trim(countryCode.value)=="")
  {
      alert("请输入国家代码！");   
      countryCode.select();
      countryCode.focus();
      return false;
  }
  countryCode.value = trim(countryCode.value) ;
  var cantNote=document.forms[0].cantNote;
  cantNote.value = trim(cantNote.value) ;
  if(!stringLengthCheck(cantName,250,"行政区划名称长度不能超过250个字符！")){
      cantName.value="";
      cantName.select();
      cantName.focus();
      return false;
  }
  if(!stringLengthCheck(shortName,120,"行政区划简称长度不能超过120个字符！")){
     shortName.value="";
     shortName.select();
     shortName.focus();
     return false;
  }
  if(!stringLengthCheck(cantNote,250,"描述长度不能超过250个字符！")){
     cantNote.value="";
     cantNote.select();
     cantNote.focus();
     return false;
  }
    return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="行政区划修改" >
<bsp:containbutton text="保存" onclick="forSave()" action="cant.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="cantquery.cmd?method=query"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_CODE")%>：</td>
                       <td class="tdRight"><html:hidden name="cantCode" property="cantCode" write="true"/></td>
                    </tr>
                    
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_NAME")%>：</td>
                       <td class="tdRight"><html:text name="cantName" property="cantName" size="40" maxlength="250"/><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>
                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.SHORT_NAME")%>：</td>
                    <td class="tdRight"><html:text name="shortName" property="shortName" size="30" maxlength="120"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_TYPE")%>：</td>
                    <td class="tdRight"><html:select name="cantType" property="cantType" >
	                        <html:options collection="cantTypeCollection" labelProperty="TYPE_NAME" property="CANT_TYPE"/>
	                    </html:select></td>
                    </tr>
                
                    <html:hidden name="superCode" property="superCode" write="false"/>  
                    <html:hidden name="countryCode" property="countryCode" write="false"/> 
                  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_NOTE")%>：</td>
                    <td class="tdRight"><html:text name="cantNote" property="cantNote" size="48" maxlength="250"/></td>
                    </tr>
       </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubCant()) return;	
  document.forms[0].action ="cant.cmd?method=update&country=<%=country%>&superCode=<%=superCode%>"; 
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+"<%=superCode%>";     
  document.forms[0].submit();
}
function forReset(){  
  document.forms[0].reset();	
}
</script>