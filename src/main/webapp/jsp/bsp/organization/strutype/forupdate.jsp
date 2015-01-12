<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkStruType(){
var struType = document.forms[0].struType;
    if ( __isQuoteIn(struType.value) )
    {
      alert("类型代码不能含有特殊字符!");  
      struType.select();
      struType.focus();    
      return false;
    }
    if (trim(struType.value)=="")
  {
    alert("请输入类型代码！");    
    return false;
  }
  struType.value = trim(struType.value) ;
 var typeName = document.forms[0].typeName;
   if ( __isQuoteIn(typeName.value) )
    {
      alert("类型名称不能含有特殊字符!");    
      typeName.select();
      typeName.focus();  
      return false;
    }
  if (trim(typeName.value)=="")
  {
    alert("请输入类型名称！");    
    return false;
  }
  typeName.value = trim(typeName.value) ; 

  var note=document.forms[0].note;
  
  if(!stringLengthCheck(typeName,60,"类型名称长度不能超过60个字符!")){
      typeName.value="";
  	  typeName.select();
  	  typeName.focus();
      return false;
  }
  if(!stringLengthCheck(note,250,"说明长度不能超过250个字符!")){
      note.value="";
      note.select();
      note.focus();
      return false;
  }
  return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="组织结构类型修改" >
<bsp:containbutton text="保存" onclick="forSave()" action="strutype.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="strutypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.STRU_TYPE")%>：</td>
                    <td class="tdRight"><html:hidden name="struType" property="struType" write="true"/></td>
                    </tr>
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.TYPE_NAME")%>：</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="40" maxlength="60"/><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                                                     
             
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.NOTE")%>：</td>
                    <td class="tdRight"><html:text name="note" property="note" size="40" maxlength="250"/></td>
                    </tr>
                    
                    <tr>
                    <td class="tdTitle">实施组织结构规则约束：</td>
                    <td class="tdRight"><html:checkbox name="isApplyRule" property="isApplyRule" value="1" /></td>
                    </tr> 
                    
                    <tr>
                    <td class="tdTitle">支持矩阵制：</td>
                    <td class="tdRight"><html:checkbox name="isMatrix" property="isMatrix" value="1" /></td>
                    </tr>
                    
                    <tr>
                    <td class="tdTitle">保留历史记录：</td>
                    <td class="tdRight"><html:checkbox name="isKeepRecord" property="isKeepRecord" value="1" /></td>
                    </tr>   
       </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkStruType()) return;	
  document.forms[0].action ="strutype.cmd?method=update";
  document.forms[0].submit();
}
function forReturn(){
  document.forms[0].action ="strutypequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>