<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="net.mast.waf.ComponentFactory" %>
<%@ page import="net.mast.bsp.permit.context.BspInfo" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.organization.domain.support.*" %>
<%@ page import="net.mast.bsp.permit.pap.domain.support.*" %>
<%@ page import="net.mast.bsp.permit.pap.data.*" %>
<%@ page import="net.mast.bsp.permit.menu.*"%>


<html>
<head>
<title></title>
</head>
<body>

<div align="center">
<table width="100%">
<tr>
<td><label class="title">һ�����ܲ�����Ӧ����˵�����ʾҳ��</label></td>
		<TABLE align="CENTER" border="1" width="100%">
		<TR align="CENTER">

			<Th width="10%">��������ID</Th>
			<Th width="15%">������������</Th>
			<Th width="10%">����ID</Th>
			<Th width="15%">��������</Th>
			<!--
			<Th width="25%">URL</Th>
			-->
			<Th width="25%">���Է��ʵ���Ӧ�Ĳ˵�</Th>
		</TR>
<% 

/*�ļ�ʹ��˵����ֻ���һ�����ܲ�����Ӧ����˵������*/

MenuService menuService=(MenuService)ComponentFactory.getBean("menuService");
FunctionImpl functionDomain=(FunctionImpl)ComponentFactory.getBean("functionDomain");
ResourcesImpl resourcesImpl=(ResourcesImpl)ComponentFactory.getBean("resourceDomain");
//ȡ�����в˵�
List menulist= menuService.getAllMenuItem();
//ȡ�����й��ܵ��б�
List funlist= functionDomain.getAll();

//out.println("<BR>funlist:"+funlist);
//ĳ��"t1"���ܵ���Դ�б�
//List rlist = resourcesImpl.getResourcesOfFunction("t1");
//List rlist = resourcesImpl.getResourcesOfFunction("BSP0201");

//List outlist = new List();


for(int f=0;f<funlist.size();f++){
Function fun=(Function)funlist.get(f);
List rlist = resourcesImpl.getResourcesOfFunction(fun.getFunctionId());
//Resource res= resourcesImpl.get("BSP020101");
//���
//out.println("<BR>Resource:"+res);
//out.println("<BR>getResourcesOfFunction="+rlist);

for(int t=0;t<rlist.size();t++){
		//���URL
		Resource res=(Resource)rlist.get(t);
		//Map outmap=new HashMap();//���������������Map
		//String resUrl[] = res.getUrls();
		List resUrl = res.getUrls();


//��ÿһ���˵�����У���ж�
int key=0;
//������еĶ�Ӧ�˵�
StringBuffer muneText = new StringBuffer();
for(int i=0;i<menulist.size();i++){
	Map menu=(Map)menulist.get(i);

		String sType = (String) menu.get("TYPE");
		String sFunc = (String) menu.get("FUNCTION");
		//String sTitle = (String) menu.get("TITLE");
		String sText = (String) menu.get("TEXT");
		//String sOptions = (String) menu.get("OPTIONS");
		//String sTarget = (String) menu.get("TARGET");
		//����url
		int type = 0;
		if (sType != null) {
			try {
				type = Integer.parseInt(sType.trim());
			} catch (Exception e) {
				type = -1;
			}
		}
		//����URL
		String url = null;
		switch (type) {
		case 0:
			url = sFunc;
			break;
		case 1:
			url = resourcesImpl.get(sFunc).getUrlNames();
			break;
		case 2:
			url = "mofexecquery.cmd?window_name=" + sFunc;
			break;
		case 3:
			url = sFunc;
			// TODO �����urlû�д���
			break;
		default:			
			break;
		}

	//out.println("<BR>menulist:"+menu);
	if(!(url==null||url.equals(""))){
		boolean flag=true;//��ʾ��ǰ�Ĳ����Ƿ���������Ĳ˵�

				// ��ҪУ���url���룬���������ֽ��ַ����Ͳ˵���URL��ƥ��
				for (int h = 0; h < resUrl.size(); h++) {
					// �������ֽ���ַ�����������ʽȡ��
					String forCheckUrl[] = (String[]) resUrl.get(h);
					for (int j = 0; j < forCheckUrl.length; j++) {
						// ����һ��ƥ��
						int temp = url.indexOf(forCheckUrl[j]);
						//�����һ����ƥ��,��˵��û�ж�Ӧ�˵��ĳ���
						if (temp < 0)
							flag = false;					
					
					}
					if(flag) {
						key++;//���flagΪ�棬��˵������ʾ�˵���Ӧ��������ʾ�Ĳ˵�����key+1
						muneText.append(sText+"<BR>");
						}
				}
		}
	
	}//for end

		if(key>0){
		out.println("<TR align=\"LEFT\">");		
		out.println("<TD>"+fun.getFunctionId()+"</TD>");
		out.println("<TD>"+fun.getFunctionName()+"</TD>");
		out.println("<TD>"+res.getResourceId()+"</TD>");
		out.println("<TD>"+res.getResourceName()+"</TD>");
		//out.println("<TD>"+res.getUrlNames()+"</TD>");
		out.println("<TD>"+muneText.toString()+"</TD></tr>");
		
	}
}//for end

}

%>


</tr>
</table>
<hr>

</body>
</html>
