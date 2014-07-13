<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>

<% 
//�����ѯ����
    String caseno = RequestUtil.getPara2String(request,"CASENO");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String type = RequestUtil.getPara2String(request,"TYPE");
    String category = RequestUtil.getPara2String(request,"CATEGORY");

    String proposor = RequestUtil.getPara2String(request,"PROPOSOR");
    String PROCESSDEPT = RequestUtil.getPara2String(request,"PROCESSDEPT");
    String author = RequestUtil.getPara2String(request,"AUTHOR");
    String RELY_TYPE = RequestUtil.getPara2String(request,"RELY_TYPE");
    String starttime = RequestUtil.getPara2String(request,"starttime");
    String state = RequestUtil.getPara2String(request,"STATE");
    String SATISFY = RequestUtil.getPara2String(request,"SATISFY");
    String registeror = RequestUtil.getPara2String(request,"REGISTEROR");
    String endtime = RequestUtil.getPara2String(request,"endtime");
    String webstate = RequestUtil.getPara2String(request,"WEBSTATE");
    String isadddept = RequestUtil.getPara2String(request,"ISADDDEPT");
    String isregister = RequestUtil.getPara2String(request,"ISREGISTER");
    String period = RequestUtil.getPara2String(request,"PERIOD");
    String meeting = RequestUtil.getPara2String(request,"MEETING");
    String areacode = RequestUtil.getPara2String(request,"AREACODE");
    String simplename = RequestUtil.getPara2String(request,"simplename");//�򵥲�ѯ
    String flag = RequestUtil.getPara2String(request,"flag");//�򵥲�ѯ
    if("CASENO".equals(flag)){
    	simplename="��Ų�ѯ";
    }else if("STATE".equals(flag)){
    	simplename="������Ȳ�ѯ";
    }else if("SATISFY".equals(flag)){
    	simplename="����Ȳ�ѯ";
    }else if("ISREGISTER".equals(flag)){
    	simplename="���������ѯ";
    }else if("TYPE".equals(flag)){//��Ҫ�鸴�ı�
    	simplename="��������ѯ";
    }else if("PROCESSDEPT".equals(flag)){//��Ҫ�鸴�ı�
    	simplename="����λ��ѯ";
    }
    String url="smproppsalQueryAction.cmd?flag="+flag;
%>
<bsp:container title="<%=simplename %>" >

<form name="frmList" action="<%=url %>" method="post">
<html:hidden name="flag" value="<%=flag %>" />
<html:hidden name="simplename" value="<%=simplename %>" />
<table id="tblSearch" width="90%">
<flex:search>
	<tr >
	<%
	if("CASENO".equals(flag)){//���
	%>
    <td>
    ���ţ�</td>
    <td><flex:searchText name="CASENO" searchName="PROPOSAL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="16"/>
    </td>
<%}%>    
<%if("SATISFY".equals(flag)){%>
  <td>����ȣ�</td>
    <td>
           <flex:searchSelect name="SATISFY" searchName="PROPOSAL_BUZI.SATISFY" dataType="java.lang.String" operSymbol="=" value="<%=SATISFY%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_SATISFY_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
<%} %>
<%if("STATE".equals(flag)){%>
  <td>������ȣ�</td>
    <td>
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
<%} %>  
<%if("ISREGISTER".equals(flag)){%>
  <td>���������</td>
    <td>
           <flex:searchSelect name="ISREGISTER" searchName="PROPOSAL_BUZI.ISREGISTER" dataType="java.lang.String" operSymbol="=" value="<%=isregister%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_ISREGISTER_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
<%} %>  

<%if("TYPE".equals(flag)){%>
  <td>��������</td>
    <td>
           <flex:searchSelect name="RELY_TYPE" searchName="PROPOSALREPLY.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=RELY_TYPE%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALREPLY_TYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
<%} %>  
<%if("PROCESSDEPT".equals(flag)){%>
  <td>����λ��</td>
    <td>
<flex:searchText name="PROCESSDEPT" searchName="PROPOSAL_REPLY.PROCESSDEPT" dataType="java.lang.String" operSymbol="=" value="<%=PROCESSDEPT%>" size="16"/>
  </td>
<%} %>  
    <td>
    ���⣺</td>
    <td><flex:searchText name="TITLE"  searchName="PROPOSAL_BUZI.TITLE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="16"/>
    </td>
    <td>
    �᰸�ߣ�</td>
    <td><flex:searchText name="PROPOSOR" searchName="PROPOSAL_BUZI.PROPOSOR" dataType="java.lang.String" operSymbol="=" value="<%=proposor%>" size="16"/>
    </td>    
</tr>
<tr>
<%/* %>
    <td>
    ����������</td>
    <td>
           <flex:searchSelect name="AREACODE" searchName="PROPOSAL_BUZI.AREACODE" dataType="java.lang.String" operSymbol="=" value="<%=areacode%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_CODE"/>
	       </flex:searchSelect>
    </td>
 <% */%> 
     <td>�ύ��ʼ���ڣ�</td>
    <td>
     <data:date name="starttime" divname="starttime1" value="<%=starttime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date>
     </td>
 	<td>�ύ�������ڣ�</td>
    <td><data:date name="endtime" divname="endtime1" value="<%=endtime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date>
 	</td>
 	
	<td><flex:searchImg name="chaxun" action="<%=url %>" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" hasLeft="false" isWrap="true" isSubmit="true">
<!-- ��� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_BUZI.ID" style="display:none"></flex:checkboxCol>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="50" property="caseno" sortName="PROPOSAL_BUZI.CASENO"/>
<!-- ���� --><flex:flexCol style="text-align:left;" caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TITLE")%>' width="100" property="title" sortName="PROPOSAL_BUZI.TITLE"/>

<!-- �᰸�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.PROPOSOR")%>' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" />
<!-- �᰸(����)��� --><flex:flexCol caption='�������' width="70" property="type" type="enum" enumCollection="PROPOSALBUZI_TYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.TYPE"/>
<!-- �᰸������� --><flex:flexCol caption='�������' width="70" property="category" type="enum" enumCollection="PROPOSALBUZI_CATEGORY_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.CATEGORY"/>

<!-- �ύʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="90" property="submitdatestr" sortName="PROPOSAL_BUZI.SUBMITDATE"/>
<%
if("TYPE".equals(flag)){//��Ҫ�鸴�ı�
%>
<!-- ������ --><flex:flexCol caption='������' width="60" property="relytype" sortName="PROPOSALREPLY.TYPE" />
<%}%>
<!-- �᰸״̬ --><flex:flexCol caption='�������' width="70" property="state" sortName="PROPOSAL_BUZI.STATE" type="enum" enumCollection="PROPOSALBUZI_STATE_COLLECTION" enumKey ="key" enumValue="value"/>

<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.REGISTERDATE")%>' width="90" property="registerdatestr" sortName="PROPOSAL_BUZI.REGISTERDATE" />
<!-- �츴��� --><flex:flexCol caption='�츴���' title="�����������" style="text-align:left;" width="320" property="banliqingkuang" index="13" sortName="PROPOSAL_BUZI.SATISFY" />

<!-- ���쵥λ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.REGISTERDEPT")%>' width="80" property="registerdept" sortName="PROPOSAL_BUZI.REGISTERDEPT" />

<!-- �Ƿ��ѽ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.ISREGISTER")%>' width="80" property="isregister" index="8" type="enum" enumCollection="PROPOSALBUZI_ISREGISTER_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.ISREGISTER"/>


</flex:flexgrid>
<flex:pagePolit action="<%=url %>" pageSize="15">
</flex:pagePolit>
</form>
</bsp:container>
<script language="javascript">
grid.show();
for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 3);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" class="blueLink">'+title+'</a> ';
		
		grid.getCell(i, 3).innerHTML =forlook;
}
//�鿴����
function lookfuwen(proposalid , PROCESSDEPTID){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+PROCESSDEPTID;
	  opens_fullcenter(url,"�鿴����Ϣ","no","yes");
}
//���������
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
  opens_center(url,"�鿴�����",700,480,"no","yes");
}
function forDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"�鿴�᰸��ϸ��Ϣ��","no","yes");
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