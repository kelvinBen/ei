<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>����ӡģ���޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function checkFormprinttemplet(){
 var templetname = document.forms[0].templetname;
 var noteValue=trim(document.forms[0].note.value);
  if (trim(templetname.value)=="")
  {
    alert("������ģ�����֣�");
    templetname.focus();
    return false;
  }
  if (byteLength(trim(templetname.value))>100)
  {
    alert("ģ�����ֹ�����Ҫ����100�ֽڣ�");
    templetname.focus();
    return false;
  }
  if (noteValue!="" && byteLength(noteValue)>200)
  {
    alert("ģ������������Ҫ����200�ֽڣ�");
    document.forms[0].note.focus();
    return false;
  }
  
  templetname.value = trim(templetname.value) ;
  return true
}
</script>
</HEAD>
<%
	String printField = (String)request.getAttribute("printField");
	if(printField == null){
		printField = "";
	}
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<div class="btnareaCss">
	<html:button onclick="forSave()" name="btn_insert" value="����"></html:button>
	<html:button onclick="forReturn()" name="btn_delete" value="����"></html:button>
</div>
<fieldset class="FieldsetCss">
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
<html:hidden name="id" property="id"/>
<html:hidden name="formid" property="formid"/>
<html:hidden name="processid" property="processid"/>             
<html:textarea name="content" property="content" style="display:none"/>
<html:hidden name="extendname" property="extendname" value="doc"/>

                                                             <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.TEMPLETNAME")%>��</td>
                    <td class="TdRight"><html:text name="templetname" property="templetname" size="80" maxlength="100" onchange="checkinputNullInDcWork ('templetname','templetname_span')"/><span id="templetname_span" class="xinghaoCss">*</span></td>
                    </tr>
                                                             <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.NOTE")%>��</td>
                    <td class="TdRight"><html:text name="note" property="note" size="80" maxlength="200" /></td>
                    </tr>
					                     <tr>
                    <td class="TdLeft">�ο��ֶΣ�</td>
                    <td class="TdRight"><%=printField%></td>
                    </tr>
       </table>
<div id="divWord" style="width:100%;height:100%" topmargin="0">

	<object id='TANGER_OCX' classid='clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404' codebase='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/OfficeControl.cab#Version=3,0,1,0"%>' width='100%' height='500'>
		<param name="BorderStyle" value="1">
		<param name="BorderColor" value="14402205">
		<param name="MakerCaption" value="">
		<param name="MakerKey" value="F763D91E30EC2FE0D97589012330DA259BC79EC6">
		<param name="ProductCaption" value="        ">
        <param name="ProductKey" value="1814A6D27F1C7504D5763201865365D85B9D5DE9">
        <SPAN STYLE="color:red">����װ���ĵ��ؼ������ڼ���������ѡ���м��������İ�ȫ���á�</SPAN>
    </object>	
	<!--  
	<object  id="webOfficeNt" classid="clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404" codebase='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/OfficeControl.cab#Version=3,0,1,0"%>' width='100%' height='500'>
       	<param name="BorderStyle" value="1">
		<param name="TitlebarColor" value="42768">
	    <param name="TitlebarTextColor" value="0">	 
	    <param name="Caption" value="��������">
		<param name="MakerCaption" value="">
     	<param name="MakerKey" value="F763D91E30EC2FE0D97589012330DA259BC79EC6">
		<param name="ProductCaption" value="        ">
        <param name="ProductKey" value="1814A6D27F1C7504D5763201865365D85B9D5DE9">
	</object>
	-->
</div>
<OBJECT id="data" CLASSID="CLSID:4AB7F4E4-D1AA-4646-8227-A5FA83F5BB8F" CODEBASE='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/data.ocx#version=1,1,12,18"%>' VIEWASTEXT></OBJECT>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar('����ӡģ���޸�');
function forSave(){
  if(!checkFormprinttemplet()) return;	
  saveFile();
  document.forms[0].action ="formprinttemplet.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  var formId = document.all("formid").value;
  var processId = document.all("processid").value;
  document.forms[0].action ="formprinttempletquery.cmd?formId="+formId+"&processType="+processId;
  document.forms[0].submit();	
}
//��������
function saveFile(){
	//����ؼ�
	dataObj = document.all("data");
	//���Ŀؼ�
	officeObj = document.all("TANGER_OCX");
	activeDocument = officeObj.activeDocument;
	nowFileName = dataObj.tempFileName;
	nowFileName = nowFileName.substring(0,nowFileName.length-3) + "doc";
	//������ʱ�ļ�
	activeDocument.SaveAs(nowFileName,0);
	dataObj.filename = nowFileName;
	dataObj.encode();
	//�������ı��븳ֵ��������
	document.all("content").value = dataObj.encodeString;	
	officeObj.Close();
}
function openFile( ){
	//����ؼ�
	dataObj = document.all("data");
	//���Ŀؼ�
	officeObj = document.all("TANGER_OCX");
	//����������
	docCode = document.all("content");
	//�������Ϊ�գ��������ĵ���������ĵ�
	if(docCode.value == ""){
		officeObj.Titlebar = false;
		officeObj.Menubar = false;
		officeObj.CreateNew("Word.Document");
	}else{
		dataObj.decodeValue(this.docCode.value);
		dataObj.changeFileName("doc");
		nowFileName = this.dataObj.decodefile;
		officeObj.Titlebar = false;
		officeObj.Menubar = true;
		officeObj.OpenLocalFile(nowFileName);
	}
}
openFile();
</script>