<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>通用选择增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubComhelp(){
	  var helpId = document.forms[0].helpId;
  	  if ( __isQuoteIn(helpId.value) )
	  {
	    alert("帮助编号不能含有引号或单引号!");
	    helpId.select();
	    helpId.focus();
	    return false;
	  }
      if (trim(helpId.value)=="")
	{
	  alert("请输入帮助编号！");    
	  helpId.focus();
	  return false;
	}
    helpId.value = trim(helpId.value) ;
  	  var helpTitle = document.forms[0].helpTitle;
      if (trim(helpTitle.value)=="")
	{
	  alert("请输入帮助标题！");    
	  helpTitle.focus();
	  return false;
	}
    helpTitle.value = trim(helpTitle.value) ;
  	  var helpSql = document.forms[0].helpSql;
      if (trim(helpSql.value)=="")
	{
	  alert("请输入显示选择的SQL！");    
	  helpSql.focus();
	  return false;
	}
    helpSql.value = trim(helpSql.value) ;
  	  var idField = document.forms[0].idField;
      if (trim(idField.value)=="")
	{
	  alert("请输入唯一标示字段！");    
	  idField.focus();
	  return false;
	}
    idField.value = trim(idField.value) ;
  	  var showField = document.forms[0].showField;
	  var returnField = document.forms[0].returnField;
	  var shearchField = document.forms[0].shearchField;
	  var showName = document.forms[0].showName;
	  var helpNote = document.forms[0].helpNote;
	  var datasource = document.forms[0].datasource;
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="通用选择增加" >
<bsp:containbutton action="pubcomhelp.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="pubcomhelp.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="pubcomhelpquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- 帮助编号 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_ID")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="helpId" property="helpId" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- 帮助标题 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TITLE")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="helpTitle" property="helpTitle" size="35"  maxlength="80" /> </td>
		</tr>
		<tr>	                   
<!-- 显示选择的SQL -->
					<td class="tdTitle" ><%=ResourcesFactory.getString("PUB_COMHELP.HELP_SQL")%>：  <span style="color: red">* </span> 	</td>
					<td class="tdRight" colspan="3">
						<html:textarea name="helpSql" cols="35" style="width:75%;height:100px" property="helpSql"/>
					<span style="color: red"> <br/>
					(注：SQL语句里面需要有where,否则有执行查询条件可能出错.
					<br/>例如输入：select * from pub_cant where 1=1 ,如果SQL中没有where 则运行时会出错,如果需要传入动态的查询参数
					<br/> 那么只需要SQL 中把该参数以 @ @ 符号括起来 ， 例如 select * from pub_cant where CANT_CODE like '@CODE@%' 
					<br/> 上面的SQL 的意思就表示，在调用当前选择组件的时候，会替换掉 @CODE@ 为当前请求中的 request.getParameter('CODE') 的值,再执行数据的显示。
					
					</span> 
					</td>
					</tr>
					<tr>
<!-- 唯一标示字段 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.ID_FIELD")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="idField" property="idField" size="35"  maxlength="50" /> </td>
<!-- 名称字段 --><td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NAME_FIELD")%>：  <span style="color: red">*</span>   	</td>
                    <td class="tdRight"><html:text name="nameField" property="nameField" size="35"  maxlength="50" /> </td>
		
		<tr>	                   
<!-- 显示字段 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_FIELD")%>： 	</td>
                    <td class="tdRight"><html:text name="showField" property="showField" size="35"  maxlength="300" /> </td>
<!-- 返回字段 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.RETURN_FIELD")%>： 	</td>
                    <td class="tdRight"><html:text name="returnField" property="returnField" size="35"  maxlength="300" /> </td>
		</tr>
		<tr>	                   
<!-- 查询条件字段 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.SHEARCH_FIELD")%>： 	</td>
                    <td class="tdRight"><html:text name="shearchField" property="shearchField" size="35"  maxlength="300" /> </td>

		</tr>
<tr>		
		<!-- 帮助字段显示名称 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_NAME")%>： 
					</td>
					<td class="tdRight" colspan="3">
						<html:textarea name="showName" cols="35" style="width:85%;height:40px" property="showName"/>
			<span style="text-align: center;color: red">
					<br>(说明：格式： <br>字段1#中文名称#列的宽度,字段2#中文名称#列的宽度,...字段N#中文名称#列的宽度
					<br>其中 列的宽度 可为空,默认为100
					<br/>例如：CANT_CODE#编码#,CANT_NAME#名称#,SUPER_CODE#上级# )
					</span>	
					</td>
</tr>		
		<tr>	                   
<!-- 排序用的表名 --><td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TABLE")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="helpTable" property="helpTable" size="35"  maxlength="40" /> </td>


<!-- 数据源 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.DATASOURCE")%>： 	</td>
                    <td class="tdRight"><html:text name="datasource" property="datasource" size="35"  maxlength="60" /> </td>
		</tr>
		<tr>	    
<!-- 说明 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_NOTE")%>： 	</td>
                    <td class="tdRight" colspan="3"><html:text name="helpNote" property="helpNote" size="55" style="width:85%;"  maxlength="100" /> </td>
</tr>
 <!--              
 备注 
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE")%>： 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
--><!-- NOTE2 
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE2")%>： 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
--><!-- NOTE3 
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE3")%>： 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
-->  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubComhelp()) return;	
  document.forms[0].action ="pubcomhelp.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubComhelp()) return;
  document.forms[0].action ="pubcomhelp.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubcomhelpquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function ctlent(event) {
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			forSave();
			return;
	}
}
//检查主键是否已经被使用, 该功能目前只支持单主键，多主键需要修改
function checkId(obj){
	var primaryKey= obj.value;
	if(primaryKey=="")
		return ;
	var result= xmlhttp("pubcomhelp.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//返回字符串为空时，表示该主键没被使用
	if(result!=""){
		alert("该编号已经被使用，请使用其他编号！");
		obj.focus();
		obj.value="";
	}
}

</script>