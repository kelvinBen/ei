<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>表单打印模板修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function checkFormprinttemplet(){
 var templetname = document.forms[0].templetname;
 var noteValue=trim(document.forms[0].note.value);
  if (trim(templetname.value)=="")
  {
    alert("请输入模版名字！");
    templetname.focus();
    return false;
  }
  if (byteLength(trim(templetname.value))>100)
  {
    alert("模版名字过长，要少于100字节！");
    templetname.focus();
    return false;
  }
  if (noteValue!="" && byteLength(noteValue)>200)
  {
    alert("模版描述过长，要少于200字节！");
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
	<html:button onclick="forSave()" name="btn_insert" value="保存"></html:button>
	<html:button onclick="forReturn()" name="btn_delete" value="返回"></html:button>
</div>
<fieldset class="FieldsetCss">
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
<html:hidden name="id" property="id"/>
<html:hidden name="formid" property="formid"/>
<html:hidden name="processid" property="processid"/>             
<html:textarea name="content" property="content" style="display:none"/>
<html:hidden name="extendname" property="extendname" value="doc"/>

                                                             <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.TEMPLETNAME")%>：</td>
                    <td class="TdRight"><html:text name="templetname" property="templetname" size="80" maxlength="100" onchange="checkinputNullInDcWork ('templetname','templetname_span')"/><span id="templetname_span" class="xinghaoCss">*</span></td>
                    </tr>
                                                             <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.NOTE")%>：</td>
                    <td class="TdRight"><html:text name="note" property="note" size="80" maxlength="200" /></td>
                    </tr>
					                     <tr>
                    <td class="TdLeft">参考字段：</td>
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
        <SPAN STYLE="color:red">不能装载文档控件，请在检查浏览器的选项中检查浏览器的安全设置。</SPAN>
    </object>	
	<!--  
	<object  id="webOfficeNt" classid="clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404" codebase='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/OfficeControl.cab#Version=3,0,1,0"%>' width='100%' height='500'>
       	<param name="BorderStyle" value="1">
		<param name="TitlebarColor" value="42768">
	    <param name="TitlebarTextColor" value="0">	 
	    <param name="Caption" value="正文内容">
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
setTitleInTreeBar('表单打印模板修改');
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
//保存正文
function saveFile(){
	//编码控件
	dataObj = document.all("data");
	//正文控件
	officeObj = document.all("TANGER_OCX");
	activeDocument = officeObj.activeDocument;
	nowFileName = dataObj.tempFileName;
	nowFileName = nowFileName.substring(0,nowFileName.length-3) + "doc";
	//保存临时文件
	activeDocument.SaveAs(nowFileName,0);
	dataObj.filename = nowFileName;
	dataObj.encode();
	//返回正文编码赋值给隐藏域
	document.all("content").value = dataObj.encodeString;	
	officeObj.Close();
}
function openFile( ){
	//编码控件
	dataObj = document.all("data");
	//正文控件
	officeObj = document.all("TANGER_OCX");
	//编码隐藏域
	docCode = document.all("content");
	//如果编码为空，创建新文档；否则打开文档
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