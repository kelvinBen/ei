<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

</head>

<body>
<bsp:container title="�������" >

<bsp:containbutton onclick="forDetail()" text="��ϸ" ></bsp:containbutton>
<bsp:containbutton onclick="forClear()" text="���" ></bsp:containbutton>
<html:form name="frmList" action="bspCache.cmd" >
<table id="tblSearch">
<flex:search>
</flex:search>
</table>

<support:flexgrid name="grid" action="" height="400" isSubmit="true">
    <flex:checkboxCol caption="ѡ��" width="30" property="$groupName+'@'+cacheName"  name="primaryKey" sortName="x.cacheName"></flex:checkboxCol> 
	<flex:flexCol caption='��������' width="180" property="groupName" sortName="x.groupName"  canSort="false"></flex:flexCol>
	<flex:flexCol caption='��������' width="160" property="cacheName" sortName="x.cacheName" canSort="false"></flex:flexCol>
	<flex:flexCol caption='�Ǽ�ʱ��' width="120" property="createTime" sortName="x.y" canSort="false"  style="display:none" ></flex:flexCol>
	<flex:flexCol caption='���д���' width="60" property="hits" sortName="x.y" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='ʧ�����' width="60" property="misses" sortName="x.y" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='��մ���' width="40" property="clears" sortName="x.y" canSort="false" style="display:none"></flex:flexCol>
	<flex:flexCol caption='�����������' width="80" property="maxSize" sortName="x.y" canSort="false"></flex:flexCol>
	<flex:flexCol caption='������������' width="80" property="usedSize" sortName="x.y" canSort="false"></flex:flexCol>

</support:flexgrid>

</html:form>
</bsp:container>

</body>
<script language="javascript">
grid.show();
grid.setSumText("");
document.all("grid").style.height=screen.height*0.5;
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);

location.href="bspCache.cmd?method=detail&primaryKey="+id;
}


function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="bspCache.cmd?method=detail";    
  document.forms[0].submit();	
}
function forClear(){
  if(!getClear()) return;
  
  document.forms[0].action ="bspCache.cmd?method=clear";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}
function getClear(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫ����Ļ���!");
    return false;
  }
  if (!confirm("���Ҫ���ѡ�еĻ����𣿴˲������ָܻ���")) {
   	     return false;
   	     }  
	//alert(sel);
  return true;
}
</script>
</html>
