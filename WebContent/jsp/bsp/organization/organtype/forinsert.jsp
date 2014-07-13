<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkOrganType(){
var organType = document.forms[0].organType;

  if (trim(organType.value)=="")
  {
    alert("请输入组织类型代码！");
    organType.focus();
    return false;
  }
  if(!__isNum(organType.value)){
     alert("组织类型代码必须是数字！");
     organType.focus();
     return false;
  }
  organType.value = trim(organType.value) ;
  if(((organType.value).indexOf(document.forms[0].parentType.value))!=0){
     alert("输入的组织类型代码必须以上级组织类型代码开头！");
     organType.value="";
     organType.select();
     organType.focus();
     return false;
  }
 var typeName = document.forms[0].typeName;
   if ( __isQuoteIn(typeName.value) )
    {
      alert("组织类型名称不能含有特殊字符！");
      typeName.value="";
      typeName.select();
      typeName.focus();
      return false;
    }
  if (trim(typeName.value)=="")
  {
    alert("请输入组织类型名称！");
    typeName.focus();
    return false;
  }
  typeName.value = trim(typeName.value) ;
  
  if(!stringLengthCheck(organType,4,"组织类型代码长度不能超过4个字符！")){
  return false;
  }
  if(!stringLengthCheck(typeName,60,"组织类型名称长度不能超过60个字符！")){
     typeName.value="";
  	 typeName.select();
  	 typeName.focus();
     return false;
  }
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="组织类型增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="organtype.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="保存并继续" onclick="forSaveContinue()" action="organtype.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="organtypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.ORGAN_TYPE")%>：</td>
                    <td class="tdRight"><html:text name="organType" property="organType" size="4" maxlength="4" /><FONT COLOR=#ff0000>*(请直接输入数字)</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.TYPE_NAME")%>：</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="36" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle">上级组织类型：</td>
                    <td class="tdRight"><html:select name="parentType" property="parentType" onchange="select()">
	                <html:options collection="selectCollection" labelProperty="typeName" property="typeId"/>
	               </html:select></td>
                    </tr> 
                    <html:hidden name="inUse" property="inUse" write="false"/>                       
                                     
   </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function select(){
  var parentType = document.all("parentType");
  var prompt = "*"+"(请输入以"+parentType.value+"开头的数字)";
  var organType = parentType.value+"*";
  if(parentType.value==""){
    prompt = "*(请直接输入数字)"
    organType = "";
  }
  parentType.parentNode.parentNode.parentNode.childNodes[0].childNodes[1].childNodes[1].innerText=prompt;
  //document.all("organType").value=organType;
}
function forSave(){
  if(!checkOrganType()) return;	
  document.forms[0].action ="organtype.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkOrganType()) return;
  document.forms[0].action ="organtype.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="organtypequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>