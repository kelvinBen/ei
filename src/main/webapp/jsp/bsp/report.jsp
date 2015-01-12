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
<td><label class="title">一个功能操作对应多个菜单的显示页面</label></td>
		<TABLE align="CENTER" border="1" width="100%">
		<TR align="CENTER">

			<Th width="10%">所属功能ID</Th>
			<Th width="15%">所属功能名称</Th>
			<Th width="10%">操作ID</Th>
			<Th width="15%">操作名称</Th>
			<!--
			<Th width="25%">URL</Th>
			-->
			<Th width="25%">可以访问的相应的菜单</Th>
		</TR>
<% 

/*文件使用说明：只输出一个功能操作对应多个菜单的情况*/

MenuService menuService=(MenuService)ComponentFactory.getBean("menuService");
FunctionImpl functionDomain=(FunctionImpl)ComponentFactory.getBean("functionDomain");
ResourcesImpl resourcesImpl=(ResourcesImpl)ComponentFactory.getBean("resourceDomain");
//取出所有菜单
List menulist= menuService.getAllMenuItem();
//取出所有功能的列表
List funlist= functionDomain.getAll();

//out.println("<BR>funlist:"+funlist);
//某个"t1"功能的资源列表
//List rlist = resourcesImpl.getResourcesOfFunction("t1");
//List rlist = resourcesImpl.getResourcesOfFunction("BSP0201");

//List outlist = new List();


for(int f=0;f<funlist.size();f++){
Function fun=(Function)funlist.get(f);
List rlist = resourcesImpl.getResourcesOfFunction(fun.getFunctionId());
//Resource res= resourcesImpl.get("BSP020101");
//输出
//out.println("<BR>Resource:"+res);
//out.println("<BR>getResourcesOfFunction="+rlist);

for(int t=0;t<rlist.size();t++){
		//输出URL
		Resource res=(Resource)rlist.get(t);
		//Map outmap=new HashMap();//用来存放输出对象的Map
		//String resUrl[] = res.getUrls();
		List resUrl = res.getUrls();


//对每一个菜单进行校验判断
int key=0;
//存放所有的对应菜单
StringBuffer muneText = new StringBuffer();
for(int i=0;i<menulist.size();i++){
	Map menu=(Map)menulist.get(i);

		String sType = (String) menu.get("TYPE");
		String sFunc = (String) menu.get("FUNCTION");
		//String sTitle = (String) menu.get("TITLE");
		String sText = (String) menu.get("TEXT");
		//String sOptions = (String) menu.get("OPTIONS");
		//String sTarget = (String) menu.get("TARGET");
		//设置url
		int type = 0;
		if (sType != null) {
			try {
				type = Integer.parseInt(sType.trim());
			} catch (Exception e) {
				type = -1;
			}
		}
		//处理URL
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
			// TODO 报表的url没有处理
			break;
		default:			
			break;
		}

	//out.println("<BR>menulist:"+menu);
	if(!(url==null||url.equals(""))){
		boolean flag=true;//表示当前的操作是否有相关联的菜单

				// 将要校验的url传入，并将各个分解字符串和菜单的URL作匹配
				for (int h = 0; h < resUrl.size(); h++) {
					// 将各个分解的字符串以数组形式取出
					String forCheckUrl[] = (String[]) resUrl.get(h);
					for (int j = 0; j < forCheckUrl.length; j++) {
						// 做逐一的匹配
						int temp = url.indexOf(forCheckUrl[j]);
						//如果有一个不匹配,则说明没有对应菜单的出现
						if (temp < 0)
							flag = false;					
					
					}
					if(flag) {
						key++;//如果flag为真，则说明有显示菜单对应，并对显示的菜单计数key+1
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
