<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%
String app=request.getContextPath();
ProposalUserView proposalUser=(ProposalUserView)request.getAttribute("proposalUser");
BspInfo pfUser=GetBspInfo.getBspInfo();
String actionName="create";
ProposalBuziView proposalBuzi=(ProposalBuziView)request.getAttribute("proposalBuzi");
if(proposalBuzi==null)
	proposalBuzi=(ProposalBuziView)request.getAttribute("html.data");
%>
<%@page import="org.proposal.proposaluser.view.ProposalUserView"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="org.proposal.proposalbuzi.view.ProposalBuziView"%>
<HTML>
<HEAD>
<TITLE>�᰸�ύ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="JavaScript" src="<mast:ui js='validate.js'/>"  ></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='prototype-1.4.0.js'/>" ></script>
<script language="JavaScript" src="<mast:ui js='attach.js'/>"  ></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='json.js'/>"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>


<STYLE type=text/css>
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #f1f1f1
}

.Shadow {
	FILTER: DropShadow(Color = #E7E7E7, OffX = 4, OffY = 4, Positive = 45);
	MARGIN: 15px auto;
	WIDTH: 920px
}

.Shadow1 {
	MARGIN: auto;
	WIDTH: 850px
}

.boxCss {
	BORDER-RIGHT: #cccccc 1px solid;
	PADDING-RIGHT: 80px;
	BORDER-TOP: #cccccc 1px solid;
	PADDING-LEFT: 80px;
	FONT-SIZE: 16px;
	MARGIN-BOTTOM: 4px;
	PADDING-BOTTOM: 40px;
	BORDER-LEFT: #cccccc 1px solid;
	MARGIN-RIGHT: 4px;
	PADDING-TOP: 60px;
	BORDER-BOTTOM: #cccccc 1px solid;
	BACKGROUND-COLOR: #ffffff
}

.title {
	FONT-WEIGHT: bold;
	FONT-SIZE: 28px;
	PADDING-BOTTOM: 20px;
	COLOR: red;
	TEXT-ALIGN: center
}

.title1 {
	FONT-WEIGHT: bold;
	FONT-SIZE: 30px;
	PADDING-BOTTOM: 20px;
	COLOR: black;
	TEXT-ALIGN: center
}

.line {
	BORDER-TOP: black 3px solid;
	MARGIN-BOTTOM: 40px;
	OVERFLOW: hidden;
	BORDER-BOTTOM: black 1px solid;
	HEIGHT: 2px
}

P {
	LINE-HEIGHT: 200%
}
</STYLE>
<LINK href="<%=app %>/jsp/proposal/css/css1.css" type=text/css rel=stylesheet>

<META content="MSHTML 6.00.2900.5945" name=GENERATOR>
</HEAD>
<BODY onkeydown=keyDown()>
<FORM name=listForm method=post encType=multipart/form-data>
<html:hidden name="id" property="id"></html:hidden>
<input type="hidden" id="flag" name="flag" value="<%=request.getParameter("flag")%>" >
<INPUT id=trackFlag type=hidden	name=trackFlag>
<input type="hidden" id="areacode" name="areacode" value="<html:value property="areacode"/>" >
<input type="hidden" id="areaname" name="areaname" value="<html:value property="areaname"/>" >
<input type="hidden" id="author" name="author" value="<html:value property="author"/>" >
<input type="hidden" id="authoruserid" name="authoruserid" value="<html:value property="authoruserid"/>" >
<input type="hidden" id="insteador" name="insteador" value="<html:value property="insteador"/>" >
<input type="hidden" id="insteadoruserid" name="insteadoruserid" value="<html:value property="insteadoruserid"/>" >
<input type="hidden" id="state" name="state" value="<html:value property="state"/>" >
<html:hidden name="submitdate" property="submitdatestr"></html:hidden>

<DIV class=Shadow1 style="MARGIN-TOP: 10px">
<DIV class=boxCss style="MARGIN: 0px; CURSOR: pointer">
<DIV class=title1>��Э<html:value property="areaname"/>��
<INPUT class=input5	style="FONT-WEIGHT: bold; FONT-SIZE: 28px; WIDTH: 60px; COLOR: black; HEIGHT: 28px"
	name=period maxsize="20" datatype="text" nullable="no"
	cn_name="���">��ίԱ���
	<INPUT class=input5	style="FONT-WEIGHT: bold; FONT-SIZE: 28px; WIDTH: 35px; COLOR: black; HEIGHT: 28px"
	name=meeting maxsize="20" datatype="text" nullable="no"
	cn_name="����">�λ���</DIV>
<DIV style="FONT-WEIGHT: bold; FONT-SIZE: 26px; PADDING-BOTTOM: 10px; TEXT-ALIGN: center">
<TABLE cellSpacing=0 cellPadding=0 border=0>
	<TBODY>
		<TR>
			<TD>ίԱ�᰸</TD>
			<TD>(��&nbsp;
			<INPUT class=input5 id=caseno
				style="FONT-WEIGHT: bold; FONT-SIZE: 23px; WIDTH: 45px" readOnly>&nbsp;)��</TD>
		</TR>
	</TBODY>
</TABLE>
</DIV>
<DIV class=line></DIV>
<TABLE style="LINE-HEIGHT: 32px; BORDER-COLLAPSE: collapse"
	borderColor=#d7d7d7 cellSpacing=0 cellPadding=0 width="100%" border=1>
	<TBODY>
		<TR height=40>
			<TD align=middle bgColor=#f4f4f4>�᰸��Ŀ</TD>
			<TD
				style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px"><INPUT
				id=title style="WIDTH: 97%; HEIGHT: 40px" size=80
				name=title maxsize="200" datatype="text" nullable="no"
				cn_name="�᰸��Ŀ"></TD>
		</TR>
		<TR>
			<TD align=middle width=120 bgColor=#f4f4f4>�������</TD>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 4px; PADDING-BOTTOM: 8px; PADDING-TOP: 8px">
                    	<html:radioGroup name="type" property="type" value="0"  collection="PROPOSALBUZI_TYPE_COLLECTION" labelProperty="value" labelKey="key" />
		</TR>
		<TR>
			<TD
				style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px"
				colSpan=2>
			<TABLE id=userTable
				style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; LINE-HEIGHT: normal; PADDING-TOP: 4px; BORDER-COLLAPSE: collapse"
				borderColor=#97bddd cellSpacing=0 cellPadding=0 width="100%"
				bgColor=#f1f9ff border=1>
				<TBODY>
					<TR style="FONT-WEIGHT: bold; FONT-SIZE: 14px">
						<TD align=middle width="12%">ίԱ���</TD>
						<TD align=middle width="15%">ίԱ����</TD>
						<TD align=middle width="10%">���</TD>
						<TD align=middle width="15%">��ϵ�绰</TD>
						<TD align=middle width="24%">������λ</TD>
						<TD align=middle width="24%">ְ��</TD>
					</TR>
					<TR>
						<TD align=middle><INPUT class=input5 id=nameid0
							onkeydown=enterCommit(0)
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							value='<html:value property="#request.proposalUser.no"/>' name=proposalJointList[0].no maxsize="100"
							datatype="text" cn_name="ίԱ���"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=name0
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							value='<html:value property="#request.proposalUser.name"/>' name=proposalJointList[0].name
							maxsize="100" datatype="text" nullable="no" cn_name="ίԱ����"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=constituency0
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							value='<html:value property="#request.proposalUser.constituency"/>' name=proposalJointList[0].constituency
							maxsize="100" datatype="text" cn_name="���"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=phone0
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							value='<html:value property="#request.proposalUser.phone"/>' name=proposalJointList[0].phone
							maxsize="100" datatype="text" cn_name="��ϵ�绰"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=dept0
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							value='<html:value property="#request.proposalUser.dept"/>' name=proposalJointList[0].dept
							maxsize="400" datatype="text" cn_name="������λ"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=duty0
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							value='<html:value property="#request.proposalUser.duty"/>' name=proposalJointList[0].duty
							maxsize="400" datatype="text" cn_name="ְ��"><BR>
						</TD>
					</TR>
					<TR>
						<TD align=middle><INPUT class=input5 id=nameid1
							onkeydown=enterCommit(1)
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[1].no maxsize="100"
							datatype="text" cn_name="ίԱ���"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=name1
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[1].name maxsize="100"
							datatype="text" cn_name="ίԱ����"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=constituency1
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[1].constituency maxsize="100"
							datatype="text" cn_name="���"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=phone1
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[1].phone maxsize="100"
							datatype="text" cn_name="��ϵ�绰"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=dept1
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[1].dept maxsize="400"
							datatype="text" cn_name="������λ"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=duty1
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[1].duty maxsize="400"
							datatype="text" cn_name="ְ��"><BR>
						</TD>
					</TR>
					<TR>
						<TD align=middle><INPUT class=input5 id=nameid2
							onkeydown=enterCommit(2)
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[2].no maxsize="100"
							datatype="text" cn_name="ίԱ���"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=name2
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[2].name maxsize="100"
							datatype="text" cn_name="ίԱ����"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=constituency2
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[2].constituency maxsize="100"
							datatype="text" cn_name="���"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=phone2
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[2].phone maxsize="100"
							datatype="text" cn_name="��ϵ�绰"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=dept2
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[2].dept maxsize="400"
							datatype="text" cn_name="������λ"><BR>
						</TD>
						<TD align=middle><INPUT class=input5 id=duty2
							style="FONT-SIZE: 14px; WIDTH: 90%; HEIGHT: 20px; BACKGROUND-COLOR: #ffffff"
							name=proposalJointList[2].duty maxsize="400"
							datatype="text" cn_name="ְ��"><BR>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<DIV style="FONT-SIZE: 12px; TEXT-ALIGN: center"><SPAN><FONT
				color=red>ע�⣺����һ���밴 "F8", ɾ�����밴 "F7"�� ����ίԱ��ţ����س������Զ���䡣</FONT></SPAN></DIV>
			</TD>
		</TR>
		<TR>
			<TD align=middle bgColor=#f4f4f4>�᰸����</TD>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 4px; PADDING-BOTTOM: 8px; PADDING-TOP: 8px">
			<DIV style="HEIGHT: 32px">
			<html:radioGroup name="category" property="category" collection="PROPOSALBUZI_CATEGORY_COLLECTION" labelProperty="value" labelKey="key"></html:radioGroup>
				</DIV>
			</TD>
		</TR>
		<TR>
			<TD colSpan=2>
			<TABLE
				style="WIDTH: 100%; BORDER-TOP-STYLE: none; BORDER-BOTTOM-STYLE: none"
				borderColor=#d7d7d7 cellSpacing=0 cellPadding=0 border=1>
				<TBODY>
					<TR>
						<TD
							style="BORDER-RIGHT: #d7d7d7 1px solid; BORDER-TOP-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none"
							align=middle width="9%" bgColor=#f4f4f4>
						<DIV style="WIDTH: 16px; LINE-HEIGHT: 24px">������</DIV>
						</TD>
						<TD style="VERTICAL-ALIGN: top" align=left width="41%">
						<DIV style="OVERFLOW: auto; WORD-BREAK: break-all"></DIV>
						</TD>
						<TD align=middle width="9%" bgColor=#f4f4f4>
						<DIV style="WIDTH: 16px; LINE-HEIGHT: 24px">�������</DIV>
						</TD>
						<TD
							style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px"
							width="41%">
						<DIV>
						<TABLE style="LINE-HEIGHT: 24px" width="100%">
							<TBODY>
								<TR>
									<TD style="VERTICAL-ALIGN: top" noWrap align=right width="30%"><FONT
										>���쵥λ��</FONT></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD style="VERTICAL-ALIGN: top" align=right><FONT
										>Э�쵥λ��</FONT></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD style="VERTICAL-ALIGN: top" align=right><FONT
										>���쵥λ��</FONT></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD style="VERTICAL-ALIGN: top" align=right><FONT
										>�����</FONT></TD>
									<TD></TD>
								</TR>
							</TBODY>
						</TABLE>
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
		<TR>
			<TD style="FONT-WEIGHT: bold" align=middle bgColor=#f4f4f4 colSpan=2>��&nbsp;��&nbsp;��&nbsp;��</TD>
		</TR>
		<TR>
			<TD
				style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px"
				colSpan=2><TEXTAREA id=content
				style="FONT-SIZE: 15px; WIDTH: 98%; WORD-BREAK: break-all"
				name=content rows=18 cols=71 datatype="text"
				nullable="no" cn_name="����"></TEXTAREA>

			<DIV style="MARGIN-TOP: 10px; FONT-SIZE: 12px; COLOR: red; LINE-HEIGHT: 18px">ע�����1����ӡ���᰸����A4ֽ��2����֮�оݣ������Ե���Ϊ������3��һ��һ����һ����ǧ������Ϊ�ˡ�
			��Э��ϵ��ʽ��
			</DIV>
			</TD>
		</TR>
		<TR>
			<TD align=middle bgColor=#f4f4f4>��ظ�����</TD>
			<TD
				style="PADDING-RIGHT: 4px; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; PADDING-TOP: 4px"><A
				class=linkh id=attach
				title=�����Ҫ���Ͷ฽������ֻ���ε����������Ӹ��������ɡ�Ҫע�⸽���������ܳ����������ƵĴ�С��
				onclick="add();this.childNodes[0].nodeValue='������Ӹ���';"
				href="javascript:;"
				name=attach>��Ӹ���</A><SPAN id=idfilespan><BR>
			</SPAN><!--ѭ����ʾ������Ϣ--></TD>
		</TR>
		<TR>
			<TD
				style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px"
				align=middle colSpan=2><INPUT
				style="FONT-SIZE: 17px; WIDTH: 80px; HEIGHT: 30px"
				onclick="edit('create')" type=button value="�� ��" name=Submit>
			<!--  <input type="button"  value="�ر�" onClick="window.close()"/> --></TD>
		</TR>
	</TBODY>
</TABLE>
<%//net.mast.web.taglib.util.GRIDLENGTH ���������ӱ����ݵ�����  %>
<INPUT id="net.mast.web.taglib.util.GRIDLENGTH" type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" value="4" /> 

</DIV>
</DIV>
</FORM>
</BODY>
</HTML>
<SCRIPT language=JavaScript>
function edit(action){	
	var path="proposalbuzi.cmd?method=insert";

	var con = document.all.listForm.content.value;
	if(strlen(con)>=4000){
		alert("�᰸���ĳ��ȳ�����2000���֣�");
		document.all.listForm.content.focus();
		return;
	}
	if(validateAll(document.listForm)&&checkNo()){		
		document.listForm.action=path;
		var sel3 = getSelect("category"); 
		if(sel3==""){
			alert("��ѡ���᰸�������");
			$("category").focus();
			return;
		}
		//document.getElementById("smalltype").value=sel1.options[sel1.selectedIndex].text;
		document.listForm.submit();
	}
}

function checkNo(){
	var userTable = document.getElementById('userTable');
	var tabrow=userTable.rows.length;   //ȡ������
	var arr = new Array();
	for(var i=0;i<tabrow-1;i++){
		var no = document.getElementById('nameid'+i).value;
		if(no.replace(/\s/g,"")!=""){
			if(!isExist(arr,no)){
				arr[i]=no;
			}else{
				alert("ίԱ���"+no+"�ظ��ˣ���������д��");
				return false;
			}
		}
	}
	return true;
}
function isExist(arr,s){
	for(var i=0;i<arr.length;i++){
		if(s==arr[i]){
			return true;
		}
	}
	return false;
}

function doLimit(obj)
{    
	var limit = 4000;
	var maxChars = obj.value.length; 
     if(obj.value.length>limit)
     obj.value = obj.value.substring(0,limit);
	var curr = limit - maxChars; 
	document.getElementById("chLeft").innerHTML = curr.toString(); 
}

function setValue(id,value){
	document.getElementById(id).value=value;
}
/**
*ɾ������
*/
function deleteAttachment(id,len ,fileName){
	if(confirm("ɾ���ļ����޷��ָ����Ƿ������")){
		var url="proposalattachment.cmd?method=deleteById&id="+id+"&fileName="+fileName;
		var msg= xmlhttp(url);
		alert(msg);
		$('attach_'+len).style.display="none";
	}
}
//���ظ���
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}

//ɾ����
function deleteTableRow(tbIndex){
	var len=attachTbl.rows.length;
	var index=0;
	for(var i=0;i<len;i++){
		var obj=document.getElementById("attach_"+tbIndex);
		if(document.getElementById("attach_"+tbIndex)==attachTbl.rows[i]){
			index=i;
			break;
		}
	}
	if(index>=0)
		attachTbl.deleteRow(index);
}
var bXmlHttpSupport = (typeof XMLHttpRequest != "undefined" || window.ActiveXObject);
var isSelect = "";
if (typeof XMLHttpRequest == "undefined" && window.ActiveXObject) {
    function XMLHttpRequest() {
        var arrSignatures = ["MSXML2.XMLHTTP.5.0", "MSXML2.XMLHTTP.4.0",
                             "MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP",
                             "Microsoft.XMLHTTP"];                             
        for (var i=0; i < arrSignatures.length; i++) {
            try {        
                var oRequest = new ActiveXObject(arrSignatures[i]);            
                return oRequest;        
            } catch (oError) { /*ignore*/ }
        }
        throw new Error("MSXML is not installed on your system.");               
    }
}
var len = 3;
function keyDown(){
	if(event.keyCode==119){
		addrow();
	}else if(event.keyCode==118){
			delrow();
	}
}


function addrow()
{
try{	
    var userTable = document.getElementById('userTable');
	var tabrow=userTable.rows.length;   //ȡ������
	var row=userTable.insertRow(userTable.rows.length);
	
	var col = row.insertCell(0);
	col.innerHTML='<center><input name="proposalJointList['+(tabrow-1)+'].no" id="nameid'+(tabrow-1)+'"  onKeyDown="enterCommit('+(tabrow-1)+')"  type="text" cn_name="ίԱ���"  datatype="text" maxsize="100" style=" width:90%; height:20px; font-size:14px; background-color:#FFFFFF" class="input5"/></center>';
	var col = row.insertCell(1);
	col.innerHTML='<center><input name="proposalJointList['+(tabrow-1)+'].name" id="name'+(tabrow-1)+'" type="text" cn_name="ίԱ����" nullable="yes"  datatype="text" maxsize="100" style=" width:90%; height:20px;font-size:14px; background-color:#FFFFFF" class="input5"/></center>';
	var col = row.insertCell(2);
	col.innerHTML='<center><input name="proposalJointList['+(tabrow-1)+'].constituency" id="constituency'+(tabrow-1)+'"  type="text" cn_name="���"  datatype="text" maxsize="100" style=" width:90%;height:20px; font-size:14px; background-color:#FFFFFF" class="input5"/></center>';
	var col = row.insertCell(3);
	col.innerHTML='<center><input name="proposalJointList['+(tabrow-1)+'].phone" id="phone'+(tabrow-1)+'"  type="text" cn_name="��ϵ�绰"  datatype="text" maxsize="100" style=" width:90%;height:20px; font-size:14px; background-color:#FFFFFF" class="input5"/></center>';
	var col = row.insertCell(4);
	col.innerHTML='<center><input name="proposalJointList['+(tabrow-1)+'].dept"  id="dept'+(tabrow-1)+'"  type="text" cn_name="������λ"  datatype="text" maxsize="400"  style=" width:90%; height:20px;font-size:14px; background-color:#FFFFFF" class="input5"/></center>';
	var col = row.insertCell(5);
	col.innerHTML='<center><input name="proposalJointList['+(tabrow-1)+'].duty" id="duty'+(tabrow-1)+'"  type="text" cn_name="ְ��"  datatype="text" maxsize="400" style=" width:90%;height:20px; font-size:14px; background-color:#FFFFFF" class="input5"/></center>';
	
	row.setAttribute("id","row"+(tabrow+1));
	var len= $('net.mast.web.taglib.util.GRIDLENGTH').value;
	len++;
	$('net.mast.web.taglib.util.GRIDLENGTH').value=len;
}catch(e){
 	alert(e.description);
 }	
}
function delrow()
{
try{	
	var userTable = document.getElementById('userTable');
	var tabrow=userTable.rows.length;   //ȡ������
	if(userTable.rows("row"+tabrow)==null){
		alert("����ɾ�����У�");
		return false;
	}
	if(!confirm("ȷ��Ҫɾ��ίԱ�б�����һ����?")){
		return false;
	}
	var i = userTable.rows("row"+tabrow).rowIndex; //ȡ���б��(��0��ʼ��
	userTable.deleteRow(i);
	var len= $('net.mast.web.taglib.util.GRIDLENGTH').value;//��������
	len--;
	$('net.mast.web.taglib.util.GRIDLENGTH').value=len;
}catch(e){
 	alert(e.description);
 }
}

	//�س��ύ
function enterCommit(na){
   try{
     if(event.keyCode==13)
        findName(na)
     else
        return true;
   }catch(e){}
}
/**
*js�л�ѡ�
*(��ǰѡ�,��ǰ��ʾ����,����ѡ���,����������,����,������ʽ,�ǽ�����ʽ)
*/
/**����ίԱ���ȡ���û�����Ϣ*/
function findName(na){
	            //var id = document.listForm.nameid+'na'.value;
	            var id = document.getElementById('nameid'+na).value;
	            if(id!=null&&id!=""){
				//����ĵ�ַ
				var url = '<%=app%>/proposaluser.cmd?method=findById';
				var params = "id="+id+"&na="+na;
				//var params = "na="+na;
				//����Ajax.Request���󣬶�Ӧ�ڷ�������
				var myAjax = new Ajax.Request(
				url,
				{ 
					//����ʽ��POST
					method:'get',
					//�������
					parameters:params,
					//ָ���ص�����
					onComplete: processResponse,
					//�Ƿ��첽��������
					asynchronous:true
				});
				}else{
                 return false;
				}
			
			}
	function processResponse(request){    
			var action = request.responseText.parseJSON();
			     var num = action.num;
			     var msg = action.msg;
			     if(msg!=1){
  	            $("name"+num).value = action.name;
   	        	$("phone"+num).value = action.phone;
   	        	$("constituency"+num).value = action.constituency;
   	        	$("dept"+num).value = action.dept;
   	        	$("duty"+num).value = action.duty;
   	        	}else{
   	        	 alert("��ίԱ������");
   	        	}
  	        }
  	        
  	        var flag=true;
  	        flag=false
  	        function contentFocus(ta){
  	        	if(flag){
  	        		ta.value="";
  	        		flag=false;
  	        	}
  	        }
  	         function contentBlur(ta){
  	        	if(ta.value==""){
  	        		ta.value="     ����ʾ�������������һ��������⣻�����������⣻��������������Ҫ���飩";
  	        		flag=true;
  	        	}
  	        }
	
	
	function submitBeforeCheckCaseNo(action){
		var id = document.listForm.id.value;
		var caseno = document.listForm.caseno.value;
		if(caseno==null||caseno==""){
			return edit(action);
		}
		var url = "<%=app%>/proposaluser.cmd?method=isCasenoExist";
		var params = "proposalBuzi.id="+id+"&proposalBuzi.caseno="+caseno;
				//����Ajax.Request���󣬶�Ӧ�ڷ�������
				var myAjax = new Ajax.Request(
				url,
				{ 
					//����ʽ��POST
					method:'get',
					//�������
					parameters:params,
					//ָ���ص�����
					onComplete: processCaseNo,
					//�Ƿ��첽��������
					asynchronous:true
				});
		
	}
	
	function processCaseNo(request){
		var msg = request.responseText;
		if(msg.search("true")!=-1){
			alert("�����Ѵ��ڣ�����д�������ţ�");
			document.listForm.caseno.focus();
			return ;
		}else{
			edit("update");
		}	
	}

</SCRIPT>
