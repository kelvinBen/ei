<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="net.mast.bsp.permit.context.BspInfoKey"%>
<%@page import="net.mast.bsp.permit.pap.domain.support.PermitBeanFactory" %>
<%
	BspInfo bspInfo = (BspInfo) request.getSession().getAttribute(BspInfoKey.BSPINFOKEY);
%>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=GB2312">
<title>����̨</title>
	<script type="text/javascript" src="../js/jquery/jquery.js"></script>
	<style type="text/css">
		#tbIframe .subheader {
			height: 23px;
			background-color: #deeeff;
		}
		#tbIframe .subheader .subtitle
		{
			font-size:13px;
			font-weight:bold;
			margin-left: 20px;
		}
		.divPanel{
			float:left;
			display:inline;
			margin:0px;
			width:50%;
			height:200px;
			padding: 1px;
		}
		.divPanel iframe{
			padding-right: 2px;
		}
		body{
			margin: 0px;
			padding: 0px;
		}
	</style>
</head>
<BODY>
	<table id="tbIframe" width="100%">
		<tr>
			<td valign="top" align="left">
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/prcreqitemlistquery_page_init.cmd")){
			%>	
				<div class="divPanel" id="div1">
					<div class="subheader">
						<a class="subtitle" href="../prcreqitemlistquery_page_init.cmd">��������-�ᱨ�ɰ�����</a>
					</div>
					<iframe scrolling="auto" src="../index/prapply_submit.do" width="100%" height="100%" frameborder="0" id="ifPRApplySubmit">
					</iframe>
				</div>
			<%
				}
			%>
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/pr/central/list.do")){
			%>	
				<div class="divPanel">
					<div class="subheader">
						<a class="subtitle" href="../pr/central/list.do">��������-�ᱨһ�����вɹ�</a>
					</div>
					<iframe scrolling="auto" src="../index/cp1_submit.do" width="100%" height="100%" frameborder="0" id="ifCP1Submit">
					</iframe>
				</div>
			<%
				}
			%>
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/rfx/unhandled_list.do")){
			%>	
				<div class="divPanel">
					<div class="subheader">
						<a class="subtitle" href="../rfx/unhandled_list.do">��������-δ����ѰԴ����</a>
					</div>
					<iframe scrolling="no" src="../index/unhandled_rfx.do" width="100%" height="100%" frameborder="0" id="ifRFxUnhandled">
					</iframe>
				</div>
			<%
				}
			%>
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/pr/merge/list.do")){
			%>	
				<div class="divPanel">
					<div class="subheader">
						<a class="subtitle" href="../pr/merge/list.do">��������-�ɰ�����ϲ�����</a>
					</div>
					<iframe scrolling="auto" src="../index/pri_merge.do" width="100%" height="100%" frameborder="0" id="ifPriMerge">
					</iframe>
				</div>
			<%
				}
			%>
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/pr/central/check/list.do")){
			%>	
				<div class="divPanel">
					<div class="subheader">
						<a class="subtitle" href="../pr/central/check/list.do">��������-���һ�����вɹ�</a>
					</div>
					<iframe scrolling="auto" src="../index/cp_auditing.do" width="100%" height="100%" frameborder="0" id="ifCPAuditing">
					</iframe>
				</div>
			<%
				}
			%>
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/prwprapply.cmd")){
			%>	
				<div class="divPanel">
					<div class="subheader">
						<a class="subtitle" href="../prwprapply.cmd">��������-�����ɰ�����/���</a>
					</div>
					<iframe scrolling="auto" src="../prwprapply.cmd" width="100%" height="100%" frameborder="0" id="ifPRApplyAuditing">
					</iframe>
				</div>
			<%
				}
			%>
			<%
				if (PermitBeanFactory.hasPermission(bspInfo,"/pr/central/merge/list.do")){
			%>	
				<div class="divPanel">
					<div class="subheader">
						<a class="subtitle" href="../pr/central/merge/list.do">��������-һ�����вɹ��ϲ�����</a>
					</div>
					<iframe scrolling="auto" src="../index/cp_merge.do" width="100%" height="100%" frameborder="0" id="ifCPMerge">
					</iframe>
				</div>
			<%
				}
			%>
			</td>
		</tr>
	</table>
</BODY>
</html>