<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>�ķ�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function forReturn(){
	if(!getSelect()){
		return;
	}
	var result = new Array();
	
	var msgTypeArray=document.forms[0].msgType;
	var msgTypes="";
	for(var i=0;i<msgTypeArray.length;i++){
		if(msgTypeArray[i].checked==true)
		{
			if(i>0)msgTypes=msgTypes+",";
			msgTypes+=msgTypeArray[i].value;
		}
		
	}
	//��Ϣ���ѷ�ʽ���ַ�����ϸ�ʽ��typeid,typeid,......
	result[0]=msgTypes;
	//��Ϣ֪ͨ��
	result[1]=document.all("activityManager").value;
	//�´�����ID
	result[2]=document.forms[0].newOperateId.value;
	if(result[2]==""){
		alert("��ѡ���´����ˣ�");
		return;
	}
	//�´���������
	result[3]=document.forms[0].newOperateName.value;
	//����ԭ��
	result[4]=document.forms[0].reason.value;
	//��ԭ�����˹�ͨ���
	result[5]=document.forms[0].oldUserNote.value;
	//���´����˹�ͨ���
	result[6]=document.forms[0].newUserNote.value;
	//ԭ������id
	result[7]=grid.getCheckLine();
	if(result[7]==result[2]){
		alert("�´����˲�����ԭ��������ͬ��");
		return;
	}
	//ԭ������name
	var row=grid.getCurrentLine();
  	var oldUserName=grid.getCellValue(row,2);
  	result[8]=oldUserName;
	if(byteLength(document.forms[0].reason.value)>350){
		alert("����ԭ�����ݳ��Ȳ��ܳ���350���ַ���");
		document.forms[0].reason.focus();
		return;
	}
	if(byteLength(document.forms[0].oldUserNote.value)>350){
		alert("��ԭ�����˹�ͨ������Ȳ��ܳ���350���ַ���");
		document.forms[0].oldUserNote.focus();
		return;
	}
	if(byteLength(document.forms[0].newUserNote.value)>350){
		alert("���´����˹�ͨ������Ȳ��ܳ���350���ַ���");
		document.forms[0].newUserNote.focus();
		return;
	}		
	window.returnValue = result;
	window.close();
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ��ԭ������!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ��ԭ������!");
    return false;
  }  
  return true;
}
function selEmp(){
  var url ="struhelp.cmd?method=getCheckEmpRoot";      
  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 

  if(typeof(win)=="undefined"){//����ȡ����ť

  	return;
  }
    
  if(win.length==0){//���������ť
  document.all("activityManager").value="";
  document.all("activityManagerDisName").value="";
  document.getElementById("activityManagerDis").innerHTML="";
  return;  
  }
  var x = eval("/"+MatrixCol+"/g;");
  document.all("activityManager").value=win[0].replace(x,",");
  document.all("activityManagerDisName").value=win[1].replace(x,",");
  document.getElementById("activityManagerDis").innerHTML=win[1].replace(x,",");
}
function selActEmp(){
  	var url ="struhelp.cmd?method=getEmpRoot";      
  	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 

 	if(typeof(win)=="undefined"){//����ȡ����ť

  		return;
 	}

    if(win.length==0){//���������ť
  	document.all("newOperateId").value="";
  	document.all("newOperateName").value="";
  	document.getElementById("newOperateIdName").innerHTML="";
  	return;
  }
 
  document.all("newOperateId").value=win[0];
  document.all("newOperateName").value=win[1];
  document.getElementById("newOperateIdName").innerHTML=win[1];
}
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<input type="hidden" name="actDefId" value="">
<input type="hidden" name="actDisName" value="">
<div class="btnareaCss">
		<html:button name="ȷ��" value="ȷ��" onclick="forReturn()"></html:button>
		<html:button name="ȡ��" value="ȡ��" onclick="javascript:window.close();"></html:button>
</div>
<table width="100%" cellpadding="0" class="tblContent">
<tr>
<td class="tdLeft">
��ѡ��ԭ�����ˣ�
</td></tr>
</table>
<flex:flexgrid name="grid" height="150" action="" isSubmit="true">
						  <flex:radioCol caption="ѡ��" width="40" property="USER_ID"  name="oldUserId" sortName="a.b"></flex:radioCol>
                          <flex:flexCol caption='����' width="100" property="USER_NAME" name="oldUserName" sortName="a.c"></flex:flexCol>
                          

</flex:flexgrid>
<div align="center">


<br><fieldset class="FieldsetCss">

	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
		<td class="tdLeft">��Ϣ���ѷ�ʽ��</td>
		<td class="TdRight">
			<%
				List msgTypeList=(List)request.getAttribute("messageTypeList");
				for(int i=0;i<msgTypeList.size();i++){
					Map msgm=(Map)msgTypeList.get(i);
					String msgTypeId=(String)msgm.get("msgTypeId");
					String msgTypeName=(String)msgm.get("msgTypeName");
					%>
					<input type="checkbox" name="msgType" value="<%=msgTypeId%>"><%=msgTypeName%>&nbsp;&nbsp;
					<%
				}
			%>		
		</td>
		</tr>	
		<tr>
		<td class="tdLeft">��Ϣ֪ͨ�ˣ�</td>
		<td class="TdRight">
		<input type="hidden" name="activityManager" value=""><input type="hidden" name="activityManagerDisName" value=""><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selEmp()"><span id="activityManagerDis"></span>
		</td>
		</tr>
		<tr>
		<td class="tdLeft">�����´����ˣ�</td>
		<td class="TdRight">
		<input type="hidden" name="newOperateId" value=""><input type="hidden" name="newOperateName" value=""><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selActEmp()"><span id="newOperateIdName"></span>
		</td>
		</tr>
					
		<tr>
		<td class="tdLeft">����ԭ��</td>
		<td class="TdRight"><textarea cols="40" rows="3" name="reason" maxlength="350"></textarea>
		</td>
		</tr>
		<tr>
		<td class="tdLeft">��ԭ�����˹�ͨ�����</td>
		<td class="TdRight"><textarea cols="40" rows="3" name="oldUserNote" maxlength="350"></textarea>
		</td>
		</tr>
		<tr>
		<td class="tdLeft">���´����˹�ͨ�����</td>
		<td class="TdRight"><textarea cols="40" rows="3" name="newUserNote" maxlength="350"></textarea>
		</td>
		</tr>				
		</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
grid.show();
grid.setSumText("");
</script>

