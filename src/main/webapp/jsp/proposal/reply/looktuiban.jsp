<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@page import="net.mast.bsp.util.DateUtil"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
String app=request.getContextPath();
List relylist=(List)request.getAttribute("list");

 %>
<%@page import="org.proposal.reply.view.ProposalReplyView"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<!--media=print ������Կ����ڴ�ӡʱ��Ч--> 
<style media=print> 
.noprint{display:none;} 
#Shadow1 {
	width:630px; margin:auto;
}
#boxCss {border:0px solid #cccccc;  font-size:14px;padding:20px 30px 15px 30px;}
#title1 { font-size:24px; }
#wy{
	font-size:22px;
}
.PageNext{page-break-after: always;} 
#line {
	display: none;
}
</style> 
<STYLE type=text/css>BODY {
	MARGIN: 0px; BACKGROUND-COLOR: #f1f1f1
}
.Shadow {
	FILTER: DropShadow(Color=#E7E7E7, OffX=4, OffY=4, Positive=45); MARGIN: 15px auto; WIDTH: 920px
}
.Shadow1 {
	MARGIN: auto; WIDTH: 920px
}
.boxCss {
	BORDER-RIGHT: #cccccc 1px solid; PADDING-RIGHT: 80px; BORDER-TOP: #cccccc 1px solid; PADDING-LEFT: 80px; FONT-SIZE: 16px; MARGIN-BOTTOM: 4px; PADDING-BOTTOM: 40px; BORDER-LEFT: #cccccc 1px solid; MARGIN-RIGHT: 4px; PADDING-TOP: 60px; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: #ffffff
}
.title {
	FONT-WEIGHT: bold; FONT-SIZE: 28px; PADDING-BOTTOM: 20px; COLOR: black; TEXT-ALIGN: center
}
.title1 {
	FONT-WEIGHT: bold; FONT-SIZE: 45px; PADDING-BOTTOM: 20px; COLOR: black; TEXT-ALIGN: center
}
.line {
	BORDER-TOP: black 3px solid; MARGIN-BOTTOM: 40px; OVERFLOW: hidden; BORDER-BOTTOM: black 1px solid; HEIGHT: 2px
}
P {
	LINE-HEIGHT: 200%
}
</STYLE>
<link href="<%=app %>/jsp/proposal/css/css1.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
 function save(){
var state= document.listForm.state.value;
 if(state=="7"){//�ѷ���
 	if(!window.confirm("���Ѿ����۹����Ƿ�Ҫ��������?")){
 		return ;
 	}
 }
  var ob=document.all.listForm;
  if(validateAll(ob)){
	document.listForm.action="proposalbuzi.cmd?method=dofankui";
	document.listForm.submit();
	}
}

function reset(){
	document.listForm.attitsatisfy.value='';
	document.listForm.resultsatisfy.value='';
	document.listForm.feedbackcomment.value='';
}

</script>
</head>

<body>

<FORM name=listForm method=post>
<html:hidden name="primaryKey" value="<%=request.getParameter("primaryKey") %>"></html:hidden>
<DIV 
style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 8px; MARGIN: auto; WIDTH: 100%; PADDING-TOP: 8px; BACKGROUND-COLOR: #ffffff">

<%
 for(int i=0;i<relylist.size();i++){
	 ProposalReplyView vi=(ProposalReplyView)relylist.get(i);
	// out.print(vi);
	int DEPTTYPE =vi.getDepttype();// ����Э��
	String dptype="����";
	if(DEPTTYPE==2)
		dptype="Э��";
%>
<DIV 
style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FONT-WEIGHT: bold; FONT-SIZE: 14px; BACKGROUND-IMAGE: url(/images/tian/bg1.gif); MARGIN-BOTTOM: 12px; PADDING-BOTTOM: 0px; COLOR: #8d4d12; LINE-HEIGHT: 30px; PADDING-TOP: 0px; HEIGHT: 30px">
<%=dptype%>��λ��<%=vi.getProcessdept() %>�����</DIV>

<TABLE 
style="PADDING-LEFT: 6px; FONT-SIZE: 14px; LINE-HEIGHT: 32px; BORDER-COLLAPSE: collapse" 
borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" border=1>
  <TBODY>
  <TR>
    <TD align=right width=160>�а�״̬��</TD>
    <TD>
    <html:label value="<%=vi.getState()+"" %>" name="state" collection="PROPOSALREPLY_STATE_COLLECTION" labelProperty="value" labelKey="key" />
      </TD></TR>
  <TR>
    <TD vAlign="middle" align=right width=160>�����</TD>
    <TD 
    style="PADDING-RIGHT: 0px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px">
  <%
  String jsjy=vi.getJsjy();//���콨��
  String thly= vi.getThly();//�˻�����
  String THJY= vi.getThjy();//�˻ظİ콨��
  boolean flag=true;
  if(!"".equals(jsjy)){
	  out.print("ȷ�Ͻ��հ����������� <font color='red'>");  
	  out.print(jsjy);
	  out.print("</font>�ȵ�λһ��а�<br>");
	  flag=false;
  }
  if(!"".equals(thly)){
	  out.print("�˻����ɣ� <font color='red'>");  
	  out.print(thly);
	  out.print("</font><br>");
	  flag=false;
  }
  if(!"".equals(THJY)){  
	  out.print("�˻��᰸�������ɣ� <font color='red'>");  
	  out.print(THJY);
	  out.print("</font>�ȵ�λ���а�<br>");
	  flag=false;
  }
  if(flag)
	  out.print("�����");
  %> 

    </TD></TR>
 </TBODY>
 </TABLE>
 <%} %>        
 
<TABLE style="PADDING-LEFT: 6px; FONT-SIZE: 14px; LINE-HEIGHT: 32px; BORDER-COLLAPSE: collapse" 
borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" border=1> 
  <TR>
    <TD align="center" height=36>
    <A onclick="window.close()" href="#">
       ��&nbsp;��</A> 
	  </TD></TR>
</TABLE></DIV></FORM>
      
</body>
</html>
