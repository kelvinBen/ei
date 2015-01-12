 <%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script> 
<script language="javascript">
function checkStruRule(){
var ruleId = document.forms[0].ruleId;
 var srcRef = document.forms[0].srcRef;

  if (trim(srcRef.value)=="")
  {
    alert("请选择上级类型！");
    srcRef.focus();
    return false;
  }
  srcRef.value = trim(srcRef.value) ;
   

var targetRef=document.all("targetRef");
var lens=targetRef.options.length;
var flag = "N";
			for(var i=0;i<=lens-1;i++)
			{
				if((targetRef.options[i].value)!=""){
					flag ="Y";
				}
			} 
			
  if (trim(flag)=="N")
  {
    alert("请选择下级类型！");
    return false;
  }
   targetRef.value = trim(targetRef.value) ;
   
  
  var ruleNote=document.forms[0].ruleNote;
  
  if(!stringLengthCheck(ruleNote,250,"描述不能超过250个字符！")){
      ruleNote.value="";
  	  ruleNote.select();
  	  ruleNote.focus();
      return false;
  }
   return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<input type="hidden" name="targetRefList" value="">
<bsp:container title="组织结构规则增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="strurule.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="保存并继续" onclick="forSaveContinue()" action="strurule.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="strurulequery.cmd"></bsp:containbutton>
 
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text=" 一般信息  ">

  <table width="100%" cellpadding="0" class="tblContent">       
             <html:hidden name="ruleId" property="ruleId" write="false"/>
             <tr>
	             <td class="tdTitle"> <%=ResourcesFactory.getString("PUB_STRU_RULE.STRU_TYPE")%>：</td>
	             <td class="tdRight">
		             <html:select name="struType" property="struType" >
		                     <html:options collection="struTypeCollection" labelProperty="TYPE_NAME" property="STRU_TYPE"/>
			         </html:select><FONT COLOR=#ff0000>*</FONT>
		          </td>
              </tr>
              <tr>
	              <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.SRC_NAME")%>：</td>
	              <td class="tdRight">
		              <html:select name="srcRef" property="srcRef" >
		                      <html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
			     </html:select>
		          </td>
              </tr>
              
               <tr>
                   <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.RULE_NOTE")%>：</td>
	               <td class="tdRight"><html:text name="ruleNote" property="ruleNote" size="40" maxlength="250" /></td>
               </tr>                             
</table>
</tab:card>


<tab:card id="card1" text="下级类型">

  <table width="100%" cellpadding="0" class="tblContent" >  
	<tr>
		<td class="tdLeft">允许引用的类型名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;引用的类型名称：</td>
	</tr> 
	<tr>
	<td> 
	 	<list:pageToPage style="width:400"  type="multiImg" name="multi_0">
			<list:left size="10" name="targetRefId"  multiple="true" property="targetRef" styleTd="align:center;width:40%" style="width:100%">
				 <html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
			</list:left>
			<list:right size="10" name="targetRef" multiple="true" styleTd="align:center;width:40%" value="" style="width:100%">	
			</list:right>
		</list:pageToPage>
	</td>
	</tr>               
 </table>
 
</tab:card>
</tab:tab>
 
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkStruRule()) return;	
  
    			var rightListValue_targetRef="";
  			var select_targetRefs=document.all("targetRef");
			var lens=select_targetRefs.options.length;
			for(var i=0;i<=lens-1;i++)
			{
				if (i==lens-1){
					rightListValue_targetRef=rightListValue_targetRef+select_targetRefs.options[i].value;
				}
				else {
					rightListValue_targetRef=rightListValue_targetRef+select_targetRefs.options[i].value+",";
				}
				 
			} 
			
			document.all.targetRefList.value=rightListValue_targetRef;
		 
  
  document.forms[0].action ="strurule.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkStruRule()) return;	
	var rightListValue_targetRef="";
	var select_targetRefs=document.all("targetRef");
	var lens=select_targetRefs.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1){
			rightListValue_targetRef=rightListValue_targetRef+select_targetRefs.options[i].value;
		}
		else {
			rightListValue_targetRef=rightListValue_targetRef+select_targetRefs.options[i].value+",";
		}
		 
	} 
  document.all.targetRefList.value=rightListValue_targetRef;
  document.forms[0].action ="strurule.cmd?method=insertContinue&ruleNote=";
  document.forms[0].submit();	
}
function forReturn(){
  self.location.href ="strurulequery.cmd?clear=true";
}
function forReset(){  
  document.forms[0].reset();	
}
</script>