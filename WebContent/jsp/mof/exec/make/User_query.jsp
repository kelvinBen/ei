<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<%@ page import="net.mast.mof.util.MultiRequestUtil"%>
<%
	String main_pk = (String)request.getAttribute("main_primaryKey");
	if( main_pk == null ){
		main_pk = MultiRequestUtil.getParameter(request,"main_primaryKey");
	}
	String parent = MultiRequestUtil.getParameter(request,"parent_window");
	String isCommonSearch=(String)request.getAttribute("isCommonSearch");
	if( isCommonSearch==null) isCommonSearch="false";
	
	String queueId = MultiRequestUtil.getParameter(request,"queueId");
%>
<HTML>
<HEAD>
<TITLE>用户维护查询</TITLE>
<script language="javascript"> 
if(self.location.toString().indexOf("mofexec.cmd?method=delete&window_name=User")>=0){
    self.location="mofexecquery.cmd?window_name=User";
}
</script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mof.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='test.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<widgets:container title="用户维护查询" >

<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<widgets:containbutton onclick=" if(!checkSelect('1')) return;document.forms[0].action ='mofprocess.cmd?method=forwardQueue&processField=User_foward&isQuery=true'; document.forms[0].submit();document.forms[0].target='_self';" text="提交注册流程"></widgets:containbutton>
	
	<widgets:containbutton onclick=" if(!checkSelect('1')) return;document.forms[0].action ='mofprocess.cmd?method=retractQueue&processField=User_retract&isQuery=true'; document.forms[0].submit();document.forms[0].target='_self';" text="收回"></widgets:containbutton>
	<widgets:containbutton onclick=" if(!checkSelect('1')) return;document.forms[0].action ='mofprocess.cmd?method=rejectQueue&processField=User_REJECT&isQuery=true'; document.forms[0].submit();document.forms[0].target='_self';" text="驳回"></widgets:containbutton>
	<widgets:containbutton onclick=" if(!checkSelect('1')) return;document.forms[0].action ='mofprocess.cmd?method=startProcess&processField=User_start&processName=userRegister&isQuery=true'; document.forms[0].submit();document.forms[0].target='_self';" text="启动注册流程"></widgets:containbutton>

<html:messages></html:messages>
<html:form name="frmList" action="">
<%if(main_pk!=null){%>
	<html:hidden name="main_primaryKey" value="<%=main_pk%>" />
<%}%>
<%if(parent!=null){%>
	<html:hidden name="parent_window" value="<%=parent%>" />
<%}%>
<input type="hidden" name="return_url" value="mofexecquery.cmd?window_name=User" />
<html:hidden name="mof_process_save" value="0" />
<html:hidden name="window_name" value="User"/>
<%if(queueId != null) {%>
<html:hidden name="queueId" value="<%=queueId%>" />
<%}%>
<html:hidden name="isSearch" value="1" />
<html:hidden name="isCommonSearch" value="<%=isCommonSearch%>" />

<div id="simple_search">
<table id="tblSearch" >
                  <tr>
          <td class="tdRight">用户名：<html:text name="User_name" property="User_name" size="10" maxlength="20" title="输入用户名称，注意不能超过4个汉字" /> </td>
                      <td class="tdRight">年龄：<html:text name="User_age" property="User_age" size="4" maxlength="3" style="text-align:right" /> </td>
                          <td class="tdRight">所属部门：<help:helpsearch ismulti="true" name="User_deptId" size="15" helpid="helpdept" iframe="User_deptIdhelp_frame" property="User_deptId" imgsrc="skins/default/images/liulan.gif"/></td>
                  </tr>
              <tr>
          <td class="tdRight">职称：<html:select name="User_post" property="User_post" >
    <html:options  collection="User_post.Collection" labelProperty="Name" property="ID"  /> </html:select></td>
                            <td class="tdRight">存款余额：<html:text name="User_money" property="User_money" size="15" maxlength="21" style="text-align:right" /> </td>
                            <td ><iframe name="help_frame" src=""  width=0 height=0> </iframe><flex:searchImg name="chaxun" action="mofexecquery.cmd?window_name=User" image="search.gif"/></td>
  </tr>
</table>
</div>

<div id="common_search">
	<grid:grid name="condition" sumRow="false" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="condition" type="edit" headHeight="22"  sumHeight="22" width="100%" height="100">
		<grid:primaryKeyCol index="1" name="ID" property="ID" caption="选择"  xml="ID" width="30" style="width:100%;" styleClass="default"  />
		<grid:selectCol index="2" name="left_bracket" property="left_bracket" caption="左括号" width="40" size="1" ><grid:options collection="left_bracket.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
		<grid:selectCol index="3" name="field" property="field" caption="域"  xml="field" width="150" doChange="getGridCellHtml(this.options[this.selectedIndex].value,0)" ><grid:options collection="field.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
		<grid:selectCol index="4" name="compare" property="compare" caption="比较符" xml="compare" width="60" size="1" ><grid:options collection="compare.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
		<grid:textCol  index="5" name="value" property="value" caption="值" xml="value" width="150" style="width:100%;" styleClass="default"  />			
		<grid:selectCol index="2" name="right_bracket" property="right_bracket" caption="右括号" width="40" size="1" ><grid:options collection="right_bracket.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
		<grid:selectCol index="7" name="link" property="link" caption="连接符" width="70" size="1" ><grid:options collection="link.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
	</grid:grid>
  <table width="100%" cellpadding="0" class="tblContent" style="border:0px solid #000000">
	  <tr>
	    <td align="left" width="50%">
			  <IMG src="<mast:ui img='closeflag.gif'/>" name="add_Row" onclick="addRow()" style="cursor: hand;"/>
			  <IMG src="<mast:ui img='dele_h.gif'/>" name="delete_Row" onclick="deleteRow()" style="cursor: hand;"/>
		  </td>
		  <td align="left" width="50%">
			  <IMG src="<mast:ui img='search.gif'/>" name="common_chaxun" onclick="commonQuery()" style="cursor: hand;"/>
	    </td>
	  </tr>
  </table>
</div>

<flex:flexgrid name="grid" height="258" action="mofexecquery.cmd?window_name=User" isSubmit="true">
			<flex:checkboxCol caption="选择" width="50" property="User_id" name="primaryKey" sortName="User.id" ></flex:checkboxCol>
																				           																			<flex:flexCol caption='内码' width="140" property="User_id" sortName="User.id"  canSort="true" style='text-align:left;cursor:hand' onclick='forDetail(true)' >
							</flex:flexCol>
		           																<flex:flexCol caption='用户名' width="70" property="User_name" sortName="User.name"  canSort="true" style='text-align:left' >
							</flex:flexCol>
		                        													<flex:flexCol caption='年龄' width="28" property="User_age" sortName="User.age"  canSort="true" style='text-align:right' >
							</flex:flexCol>
		               																<flex:flexCol caption='电子邮件' width="140" property="User_email" sortName="User.email"  canSort="true" style='text-align:left' >
							</flex:flexCol>
		           																<flex:flexCol caption='所属部门' width="105" property="User_deptId" sortName="User.deptId"  canSort="true"  style='text-align:left' type="enum" enumCollection="User_deptId.Collection" enumKey="ID" enumValue="Name" hasDelimiter="true">
							</flex:flexCol>
		           																<flex:flexCol caption='职称' width="84" property="User_post" sortName="User.post"  canSort="true"  style='text-align:left' type="enum" enumCollection="User_post.Collection" enumKey="ID" enumValue="Name" hasDelimiter="false">
							</flex:flexCol>
		               																<flex:flexCol caption='用户编号' width="56" property="User_UserNo" sortName="User.UserNo"  canSort="true" style='text-align:left' >
							</flex:flexCol>
		           																<flex:flexCol caption='照片' width="105" property="User_PHOTO_DATA" sortName="User.PHOTO_DATA"  canSort="true" style='text-align:left' >
							</flex:flexCol>
		                        													<flex:flexCol caption='存款余额' width="105" property="User_money" sortName="User.money"  canSort="true" style='text-align:right' >
							</flex:flexCol>
		                       																<flex:flexCol caption='' width="0" property="User_abc" sortName="User.abc"  canSort="true" style='text-align:left' >
							</flex:flexCol>
		               																<flex:flexCol caption='备注' width="245" property="User_Note" sortName="User.Note"  canSort="true" style='text-align:left' >
							</flex:flexCol>
		            </flex:flexgrid>
<flex:pagePolit action="mofexecquery.cmd?window_name=User" pageSize="6">
</flex:pagePolit>
</html:form>
</widgets:container>
<iframe style="display:none" id="dataFrame"></iframe>

<div id="deptId" style="display:none" class='selectColCss'></div>

</BODY>
<script language="javascript">
grid.show();
grid.setSumText("");




	grid.setTouAlign(1,"center");
		grid.setTouAlign(2,"center");
		grid.setTouAlign(3,"center");
			grid.setTouAlign(4,"center");
		grid.setTouAlign(5,"center");
		grid.setTouAlign(6,"center");
			grid.setTouAlign(7,"center");
		grid.setTouAlign(8,"center");
		grid.setTouAlign(9,"center");
					grid.setTouAlign(10,"center");
			grid.setTouAlign(11,"center");
				
init();

<%if(isCommonSearch!=null&&isCommonSearch.equals("true")){%>
showCommonSearch(true);
<%}else{%>
showCommonSearch(false);
<%}%>

function showCommonSearch(isdisplay){
	//alert(document.all("ttt") );
	var ss = "";
	var cc = "";
	if( isdisplay){
	    document.forms[0].return_url.value="mofcommonquery.cmd?window_name=User";
	   	ss="none";
	   	cc="";
	}else{
	    document.forms[0].return_url.value="mofexecquery.cmd?window_name=User";
		ss="";
		cc="none";
	}
	document.all("common_search").style.display=cc;
		
	document.all("simple_search").style.display=ss;
	}

function commonQuery(){
  if (checkConditions()) {
    document.forms[0].action="mofcommonquery.cmd?window_name=User";
    document.forms[0].submit();
  }
  return;
}
function addRow(){
	condition.addRow();
}
function deleteRow(){
	condition.delRow();
}

function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
	alert("请选择要删除的记录!");
	return false;
  }
  if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
		 return false;
		 }  
  return true;
}

function process(){
	if(!getSelect()) return;
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

function checkSelect(count){
  if( count == "0" ) 	
  	return true;
  var sel=grid.getCheckLine();
  if(sel==""){
	alert("请选择一条记录!");
	return false;
  }
  if( count=="n")
  	return true;
  	
  var obj=sel.split(",");  
  if(obj.length*1>parseInt(count) ){
	alert("请选择"+count+"记录!");
	return false;
  }  
  return true;
}

function checkConditions() {
  var count=condition.returnRowCount();
  var i,left,right;
  var checkSum=0;
  
  if(count == 0) return true;
  //关系运算符校验
  for(i=1; i<count; i++) {
    if (condition.getCellValue([i],7)=="") {
      alert("查询条件第"+i+"行的关系运算符不可为空！");
      return false;
    }
  }
  if (condition.getCellValue([i],7)!="") {
    alert("查询条件最后一行的关系运算符必须为空！");
    return false;
  }
    
  //括号匹配校验
  for(i=1; i<count+1; i++) {
    left=condition.getCellValue([i],2).length;
    right=condition.getCellValue([i],6).length;
    checkSum+=left-right;
    if (checkSum<0) {
      alert("检测到括号不匹配！");
      return false;
    }
  }
  if (checkSum!=0) {
    alert("检测到括号不匹配！");
    return false;
  }
  return true;
}

//获取嵌入editgrid单元格的html代码
function getGridCellHtml(fieldName,row) {
  if(row==0) row=condition.getCurrentLine();
  var iframe = document.getElementById("dataFrame");

  iframe.src = "multiselect.cmd?method=getHtmlByFieldName&fieldName="+fieldName+"&gridName=condition&window_name=User&row="+row;
}
//把html代码嵌入单元格中
function fillCell(cellHtml,row,fieldName) {

  var cell=condition.getCellObject(row,5);
  var value=cell.value;
  var td;
  var selectedIndex;
  var seldiv=document.all(fieldName);

  if(cell.tagName=="SELECT")td=cell.parentElement.parentElement;
  else td=cell.parentElement;
  var htmls = cellHtml.split("@");
  td.innerHTML=htmls[0];

  //给用于多选下拉框展示的div赋值
  if(htmls.length>1)seldiv.innerHTML=htmls[1];
    
  condition.rename();
  condition.show();
}
//显示日历对话框
function show_date_dialog(obj, hasTime){
	var url="jsp/mof/exec/datepage.jsp";
	if(hasTime)url="jsp/mof/exec/datetimepage.jsp";
	var format=obj.getAttribute("targetFormat");
	if(format!=null&&format!="")url+="?targetformat="+format;
    var datetime = showModalDialog(url,window,"scroll:no;status:no;dialogWidth:192px;dialogHeight:183px");
	if(datetime){
	    obj.previousSibling.value=datetime;
	}
}
//初始化查询条件grid
function init() {
  condition.show();
  condition.setSumText("");
  
  var count=condition.returnRowCount();
  var iframe = document.getElementById("dataFrame");
  var src="multiselect.cmd?method=getHtmlByFieldName";

  if(count>0){
    for(i=1; i<=count; i++) {
      src+="&fieldName="+condition.getCellValue(i,3);
      src+="&fieldValue="+condition.getCellValue(i,5);
    }
    src+="&gridName=condition&isinit=true&window_name=User";

    iframe.src=src;
  }
}

function condition_value_clear(cell){
   var td=cell.parentElement;
   cell.value="";
   td.children[0].value="";
 }
 function condition_value_dialog(cell,helpId){
   try{
     condition_forHelp(cell,helpId);
   }catch(e){}
 }
 function condition_forHelp(cell,helpId){
   var win = null;
   win = help(helpId,null);
   setcondition_dataHelp(win,cell);
 }
 function setcondition_dataHelp(win,cell){
   var td=cell.parentElement;
   if(win!=null && win.length>=1){
     var no_str="";
     var name_str="";
     for(i=0;i<win.length;i++){
       if( i>0){ no_str=no_str+",";name_str=name_str+",";}
       no_str+=win[i][0];
       name_str+=win[i][1];
     }
     td.children[0].value=no_str;
     td.children[1].value=name_str;
   }else{
     td.children[0].value="";
     td.children[1].value="";
   }
 }

var lastInput=null;
 function doTextFocusInGrid(inputname){
 inputname.style.display="none";

 var inputvalue=inputname.parentElement.children[0];
 var fieldName=condition.getCellValue(condition.getCurrentLine(),3);
 var seldiv=document.all(fieldName);
 var sel=seldiv.children[0];
 seldiv.style.position="absolute";

 var opts=sel.options;
 var selopts=inputvalue.value.split(",");

 for(var i=0;i<opts.length;i++){
   for(var j=0;j<selopts.length;j++){
     if(selopts[j]==opts[i].value){
		 opts[i].selected="true";
	     break;
     }
   }
 }

 var divTi=inputname.offsetParent.offsetParent.offsetParent;
 //循环取得div的定位坐标
 var top=0;
 var left=0;
 var oParent=inputname.offsetParent;
 while(oParent.tagName!="BODY"){
	 top+=oParent.offsetTop;
	 left+=oParent.offsetLeft;
     oParent=oParent.offsetParent;
 }

 seldiv.style.top=top - divTi.scrollTop;
 seldiv.style.left=left -divTi.scrollLeft;
 seldiv.style.display="block";
 seldiv.style.width="150px";
 sel.focus();

 lastInput=inputname;
}

function doSelBlurInGrid(sel){
	if(lastInput==null)return;

    var inputname=lastInput;
	var inputvalue=inputname.parentElement.children[0];
	var names="";
	var values="";
    var opts=sel.options;

	for(var i=0;i<opts.length;i++){
	    if(opts[i].selected){
		    if(names!=""){names+=",",values+=","}
			names+=opts[i].innerText;
			values+=opts[i].value;
		}
	}
    inputname.value=names;
	inputvalue.value=values;

	sel.parentElement.style.display="none";
    inputname.style.display="block";

	for(var i=0;i<sel.options.length;i++){
		sel.options[i].selected=false;
    }
}

function forInsert(){
  document.forms[0].action ="mofexec.cmd?method=forinsert&window_name=User";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofexec.cmd?method=forupdate&window_name=User";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofexec.cmd?method=delete&window_name=User";    
  document.forms[0].submit();	
}
function forDetail(hand){
  if(!hand && !getSelect()) return;
  var sel;
  if( hand )
	sel = grid.getCurrentLine();
  else
	sel=grid.getCheckLineNo();
  //alert("sel:" +sel);
  var pk = grid.getCellValue(sel,1);
  document.forms[0].action ="mofexec.cmd?method=detail&window_name=User&primaryKey=" + pk;    
  document.forms[0].submit();	
}
</script>