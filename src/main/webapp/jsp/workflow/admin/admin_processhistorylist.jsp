<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>

<BODY topmargin="10px" >
<div class="btnareaCss">
<html:button onclick="forReturn()" name="btn_return" value="����"></html:button>
</div>
<br>
<html:messages/>
<html:form name="frmList" action="">

<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  
                          <flex:flexCol caption='��������' width="150" property="curActivity" sortName="a.b" ></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="curHandler" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='����ʱ��' width="100" property="arrivetime" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='�뿪ʱ��' width="100" property="leavetime" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='�Ƿ���' width="100" property="isDeal" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='��ת״̬' width="100" property="state" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='�Ƿ�����' width="100" property="isdelay" sortName="a.b"></flex:flexCol>
                         
</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("��������-���̼��-��ת��ʷ");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
function forReturn(){
	window.history.back();
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
</script>