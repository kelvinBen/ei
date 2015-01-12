<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>


<HTML>
<HEAD>
<TITLE>测试</TITLE>
<!--明细模板中JAVA代码-->

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

</HEAD>
<BODY topmargin="10px">
	<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

	<bsp:container title="测试">
		<!-- 插入按钮 -->
		<bsp:containbutton action="ztest.cmd?method=forinsert"
			onclick="forInsert()" text="增加"></bsp:containbutton>
		<bsp:containbutton action="ztest.cmd?method=forupdate"
			onclick="forUpdate()" text="修改"></bsp:containbutton>
		<bsp:containbutton action="ztest.cmd?method=detail"
			onclick="forDetail()" text="明细"></bsp:containbutton>
		<bsp:containbutton action="ztest.cmd?method=delete"
			onclick="forDelete()" text="删除"></bsp:containbutton>
		<html:messages></html:messages>
		<html:form name="frmList" action="ztestquery_page_init.cmd">
			<flex:search>
				<tr>
					<td>键： <flex:searchText name="ID" searchName="ZTEST.ID"
							dataType="java.lang.String" operSymbol="=" value="" size="12" />
					</td>

					<td><flex:searchImg name="chaxun" action="" image="search.gif" />
					</td>

				</tr>
			</flex:search>
			</table>
			<flex:flexgrid name="grid" height="420"
				action="ztestquery_page_init.cmd" isSubmit="true">
				<!-- 内编码 -->
				<flex:checkboxCol caption="全选" width="35" property="i$ZTEST$CODENUM"
					name="primaryKey" sortName="ZTEST.CODENUM"></flex:checkboxCol>
				<flex:flexCol caption="键" width="100" property="i$ZTEST$ID"
					sortName="ZTEST.ID" />
				<flex:flexCol caption="值" width="100" property="i$ZTEST$VALUE"
					sortName="ZTEST.VALUE" />
			</flex:flexgrid>
			<flex:pagePolit action="ztestquery_page_init.cmd" pageSize="100">
			</flex:pagePolit>
		</html:form>
	</bsp:container>
</BODY>
</HTML>



<script>
 grid.show(); 
function onload_func1(){
	grid.dblclickEvent=function(){ 
	    var ishelpsign = document.getElementById("is_helpersign").value;
	    var isshowbutton =document.getElementById("isshowbutton").value;//关联信息时 
	    if(isshowbutton=="1"){return;}//关联信息不显示时;不提供触发该方法事件。
	    if(ishelpsign=="y")return;//当该页面作为通用帮助页面时；不提供触发该方法事件。
	    
	    var primaryKey= grid.getCellValue(grid.getCurrentLine(),1);  
	    var sign_power="0";//可修改标志 
	    if(!forDetail_PowerSign()){sign_power="1";}; 
	    document.forms[0].action ="ztest.cmd?method=detail&sign_power="+sign_power+"&primaryKey="+primaryKey;    
	    document.forms[0].submit();
	}
	
}
function forInsert(){
 document.forms[0].action ="ztest.cmd?method=forinsert";       
  document.forms[0].submit();	
}
function forUpdate(){
 //  if(!getSelect()) return;
 document.forms[0].action ="ztest.cmd?method=forupdate";     
  document.forms[0].submit();	
}
function forDetail(){
  // if(!getSelect()) return;
  // if(!forDetail_PowerSign()){sign_power="1";};
  // document.forms[0].action ="ztest.cmd?method=detail&sign_power="+sign_power;
  document.forms[0].action ="ztest.cmd?method=detail";    
  document.forms[0].submit();	
}
/***
 * 逻辑删除，逻辑恢复及物理删除三个操作
 * value:undefined 物理删除,value:0 逻辑恢复,value:1 逻辑删除
 */
function forDelete(){
	var value=document.getElementById('recycleId').value;
	var flag=document.getElementById('isRecId').value;
	if(flag!="1"||value=="1"){ 
		if(!getPowerDatas('1'))return;
		if(!getDelete()) return;
document.forms[0].action ="ztest.cmd?method=delete"
	}else if(value==""){ 
		if(!getPowerDatas('1'))return;
		if(!getDelete()) return;
		document.forms[0].action ="ztest.cmd?method=update&updateType=1";
	}else{
		var sel=grid.getCheckLine();
		if(sel==""){
			alert("请选择要恢复的记录!");
			return false;
		}
		if (!confirm("真的要恢复选中的纪录吗？")) {
		   	return false;
		}
		if(!getPowerDatas('1'))return;
		document.forms[0].action ="ztest.cmd?method=update&updateType=0";
	}
  	document.forms[0].submit();	
}

/***
 * 包含进入用户回收站，管理员回收站及退出回收站三个操作
 * value:undefined 退出回收站,value:0 进入用户回收站,value:1进入管理员回收站
 */
function forRecycle(){
	var value=document.getElementById('recycleId').value;
	if(value==""){
		document.all("isInRecycle").value='0';
	}else{
		document.all("isInRecycle").value="";
	}
	document.forms[0].submit();
}
/***
 *查询方法
 *
 *
 */
function forQuery(){
    if(!is_NonullPro_Vilidate()){return;} 
    var url="ztestquery_page_init.cmd";//需添加查询的URL;例:test.cmd
    var isshowbutton =document.getElementById("isshowbutton").value;
    document.forms[0].action =url+"?iframesign=y"+"&isshowbutton="+isshowbutton;    
    document.forms[0].submit();
 }
 
 function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
</script>