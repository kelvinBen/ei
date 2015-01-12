<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>国家(地区)代码增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubCountry(){
var countryCode = document.forms[0].countryCode;
    if ( __isQuoteIn(countryCode.value) )
    {
      alert("国家(地区)代码不能含有特殊字符！");
      countryCode.value="";
      countryCode.select();
      countryCode.focus();
      return false;
    }
  if (trim(countryCode.value)=="")
  {
    alert("请输入国家(地区)代码！");
    countryCode.focus();
    return false;
  }
  countryCode.value = trim(countryCode.value) ;
  var rs = /^([0-9]|[a-z]|[A-Z])+$/;
  if(!rs.test(countryCode.value)){
     alert("国家(地区)代码必须是英文字符或数字！");
     countryCode.value="";
     countryCode.select();
     countryCode.focus();
     return false;
  }
 var countryName = document.forms[0].countryName;
 if ( __isQuoteIn(countryName.value) )
    {
      alert("国家(地区)名称不能含有特殊字符！");
      countryName.value="";
      countryName.select();
      countryName.focus();
      return false;
    }
  if (trim(countryName.value)=="")
  {
    alert("请输入国家(地区)名称！");
    countryName.focus();
    return false;
  }
  countryName.value = trim(countryName.value) ;
 var shortName = document.forms[0].shortName;
 if ( __isQuoteIn(shortName.value) )
    {
      alert("国家(地区)简称不能含有特殊字符！");
      shortName.value="";
      shortName.select();
      shortName.focus();
      return false;
    }
  if (trim(shortName.value)=="")
  {
    alert("请输入国家(地区)简称！");
    shortName.focus();
    return false;
  }
  shortName.value = trim(shortName.value) ;
  var inUse=document.forms[0].inUse;
  inUse.value = trim(inUse.value) ;
   
  if(!stringLengthCheck(countryCode,10,"国家(地区)代码长度不能超过10个字符！")){
     countryCode.value="";
     countryCode.select();
     countryCode.focus();
     return false;
  }
  if(!stringLengthCheck(countryName,100,"国家(地区)名称长度不能超过100个字符！")){
     countryName.value="";
     countryName.select();
     countryName.focus();
     return false;
  }
  if(!stringLengthCheck(shortName,20,"国家(地区)简称长度不能超过20个字符！")){
     shortName.value="";
     shortName.select();
     shortName.focus();
     return false;
  }
  return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="国家(地区)代码增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="country.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="保存并继续" onclick="forSaveContinue()" action="country.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="countryquery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COUNTRY.COUNTRY_CODE")%>：</td>
                    <td class="tdRight"><html:text name="countryCode" property="countryCode" size="10" maxlength="10" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COUNTRY.COUNTRY_NAME")%>：</td>
                    <td class="tdRight"><html:text name="countryName" property="countryName" size="40" maxlength="100" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COUNTRY.SHORT_NAME")%>：</td>
                    <td class="tdRight"><html:text name="shortName" property="shortName" size="20" maxlength="20" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                      
                    <html:hidden name="inUse" property="inUse" write="false"/>                  
   </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubCountry()) return;	
  document.forms[0].action ="country.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubCountry()) return;
  document.forms[0].action ="country.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="countryquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>