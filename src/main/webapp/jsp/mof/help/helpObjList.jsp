<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.util.Page,java.util.*"%>

<%
List list=new ArrayList();

Page ourPage = new Page(list,0);    
QueryTool tool = new QueryTool(request);
tool.process(ourPage,null);

%>
<HEAD>
<TITLE>帮助对象查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<body onload="showGrid()">
<widgets:container title="通用帮助查询" >
<widgets:containbutton onclick="closeHelp(true)" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="closeHelp(false)" text="关 闭"></widgets:containbutton>
<html:form name="frmList" action="">
<flex:flexgrid name="grid" height="220" action="" isSubmit="false">
		<flex:radioCol caption="选择" width="60" property="ID" name="primaryKey" sortName="a.ID" />
																							
		<flex:flexCol caption='编号' width="120" property="ID" sortName="a.ID"  canSort="false" style='text-align:left;cursor:hand' >
		</flex:flexCol>
																
		<flex:flexCol caption='名称' width="180" property="NAME" sortName="a.NAME"  canSort="false" style='text-align:left' >
		</flex:flexCol>
			<flex:flexCol caption='预留列1' width="10" property="1"  sortName="a.1"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列2' width="10" property="2"  sortName="a.2"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列3' width="10" property="3"  sortName="a.3"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列4' width="10" property="4"  sortName="a.4"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列5' width="10" property="5"  sortName="a.5"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列6' width="10" property="6"  sortName="a.6"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列7' width="10" property="7"  sortName="a.7"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列8' width="10" property="8"  sortName="a.8"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列9' width="10" property="9"  sortName="a.9"   canSort="false" style="display:none"></flex:flexCol>
			<flex:flexCol caption='预留列10' width="10" property="10"  sortName="a.10"   canSort="false" style="display:none"></flex:flexCol>
		
</flex:flexgrid>
</html:form>
</widgets:container>
</body>
<script language="javascript">
function showGrid(){
	grid.show();
	grid.setSumText("");
	grid.setTouAlign(1,"center");
	grid.setTouAlign(2,"center");
	grid.setTouAlign(3,"center");
	add_row();
	
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var otd=grid.getCell(i,1);
		if(otd!=null){
			var or=otd.children[0];
			if(or!=null && or.tagName=="INPUT"){
				or.attachEvent("onkeydown",doRadioKeyDown);
			}
			if(i==1){
			  or.checked=true;
			  or.focus();
			}
		}
	}
	//grid.getCellObject(1,1).checked=true;
}
function add_row(){
   for(var i=0;i<dialogArguments.length;i++){
       var obj=dialogArguments[i];
       grid.addRow();
       for(var j=0;j<dialogArguments[i].length;j++){
          grid.setTiValue(i+1,j+2,obj[j]);
       }
      
   }
}
function closeHelp(is_ret){
  if( !is_ret ){
    window.close();
    return;
  }
  var sel=grid.getCurrentLine();
  if(sel==""){
	alert("请选择一条记录!");
	return ;
  }
  var line=grid.getCheckLineNo();
  //alert("rr:"+list);
  window.returnValue = line-1;
  window.close();
}

function doRadioKeyDown(){
var keycode=event.keyCode;
if(keycode=="13")
	closeHelp(true);
if(keycode=="27")
	closeHelp(false);

}
</script>