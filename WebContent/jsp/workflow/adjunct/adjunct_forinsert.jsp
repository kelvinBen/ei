<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.web.upload.MultipartRequestHandler"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>��������</TITLE>
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
function checkAdjunct(){
	var dataId = document.forms[0].dataId;
	if (trim(dataId.value)==""){
	   alert("�Ƿ�������");
	   return false;
	}	
 
  /**���editGrid�������*/
  	rowCount = attachmentGrid.returnRowCount()+1;
	for(var i=1;i<rowCount;i++){
		cellValue=attachmentGrid.getCellValue(i,1);
		if (trim(cellValue)==""){
		  	alert("��ѡ��һ���ļ�!");
			cellObject=attachmentGrid.getCellObject(i,1);
			cellObject.focus();
		    return false;
		  }
		if(byteLength(cellValue)>200){
			alert("�ļ������ܳ���200�ֽڣ�");
			cellObject=attachmentGrid.getCellObject(i,1);
			cellObject.focus();
			return false;
		}
	}
	return true
}

</script>
</head>
<%
	String isEdit = request.getParameter("isEdit");
	if(isEdit == null){
		isEdit = "";
	}
	String dataId = request.getParameter("dataId");
	if(dataId == null){
		dataId = "";
	}
%>
<BODY topmargin="10px" onload="init();">

<html:form  name="frmList"  enctype="multipart/form-data" action="" method="post">
<div class="btnareaCss">
	<html:button name='����' value='����'	onclick="forSave()"></html:button>
	<html:button name='����' value='����' onclick="forReturn()"></html:button>
</div>
<br>
<input type="hidden" name="dataId" value="<%=dataId%>" />
<input type="hidden" name="isEdit" value="<%=isEdit%>" />
<html:hidden name ="<%=MultipartRequestHandler.MAX_LENGTH_EXCEEDED_KEY%>" value ="DCWORK.EDOC"/>
<fieldset class="FieldsetCss">
	<table name="a" cellspacing='0' class="tblContent" width="100%" >
		<tr width="100%">
			<td align="left" width="100%">
				<html:button name="addRow" value='������' onclick="attachmentGridAddRow();"></html:button>
				<html:button name="delRow" value='ɾ����' onclick="attachmentGridDelRow();"></html:button>
			</td>
		</tr>
	</table>
	<grid:grid name="attachmentGrid" property="adjunctList" type="edit" width="100%" height="200" sumRow="true" headHeight="22" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false">
		<grid:textCol property="docContent" name="docContent" caption='�ļ�' index="1" width="450"  style="width:100%" styleClass="default">
		</grid:textCol>
	</grid:grid>
</fieldset>
</html:form>

<script language="javascript">
function init(){
	attachmentGrid.show();
	attachmentGrid.setSumText('');
}

function forSave(){
  if(!checkAdjunct()) return;
  document.forms[0].<%=ResourcesFactory.getString("button.save")%>.disabled=true;
  document.forms[0].<%=ResourcesFactory.getString("button.return")%>.disabled=true;
  document.forms[0].action ="adjunct.cmd?method=insert";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="adjunctquery.cmd?dataId=<%=dataId%>&isEdit=<%=isEdit%>";
  document.forms[0].submit();	
}

function attachmentGridAddRow()
{
	var row=attachmentGrid.addRow();
	var cnt=attachmentGrid.returnRowCount();
	attachmentGrid.setCellHtml(cnt,1,' <input type="file"  name="adjunctList.docContent"  id="adjunctList.docContent" value="" onkeydown="return false;" style="ime-mode:disabled"  oncontextmenu="return false;">');
	attachmentGrid.show();
}
function attachmentGridDelRow()
{
	if(attachmentGrid.returnRowCount()==0)
	{
		alert('û�п���ɾ���ĸ�����');
		return;
	}
	if(attachmentGrid.getCurrentLine()==null)
	{
		alert('û��ѡ�и�������ѡ�к���ɾ����');
		return;
	}
	if(confirm('ȷ��Ҫɾ����ǰѡ���еĸ�����'))
	{
		attachmentGrid.delRow();
	}
}
</script>
</BODY>
</HTML>