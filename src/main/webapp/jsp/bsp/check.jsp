<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %>

<%@ page import="net.mast.bsp.permit.authentication.providers.*"%>
<%@ page import="net.mast.bsp.permit.context.*,net.mast.bsp.permit.pap.data.*"%>
<%@ page import="net.mast.bsp.permit.authentication.Authentication"%>
<%@ page import="net.mast.bsp.permit.authentication.AuthenticationManager"%>
<%@ page import="net.mast.waf.ComponentFactory" %>
<%@ page import="net.mast.bsp.organization.domain.support.*" %>

<%!
	public List getDataResourcePermitList(List userDataRefList,String dataType, String struType,Stru loginCorporation) {
		if (userDataRefList == null || userDataRefList.size() == 0) {
			return null;
		}
		// 获取登陆公司的organId
		String corporationOrganId = loginCorporation.getOrganId();
		List outList = new ArrayList();
		boolean isStru = false;
		for (int i = userDataRefList.size() - 1; i >= 0; i--) {
			UserDataReference ref = (UserDataReference) userDataRefList.get(i);
			if (ref.getDataResType().getDataResType().equals(dataType)
					&& ref.getStruType().equals(struType)) {
				if (ref.getDataResType().getIsStru().equals("1")) {
					isStru = true;
				}
				if (isStru) {
					Stru stru = StruObjectFactory.getStruByStruId(ref.getStruId());
					if ((stru != null)&& (stru.getCorporationId().equals(corporationOrganId))) {
						HashMap map = new HashMap();
						map.put("dataResourceId", ref.getDataResourceId());
						map.put("dataResourceName", ref.getDataResourceName());
						map.put("isDefault", ref.getIsDefault());
						map.put("struId", ref.getStruId());
						map.put("struType", ref.getStruType());
						map.put("dataResType", ref.getDataResType()
								.getDataResType());
						outList.add(map);
					}
				} else {
					HashMap map = new HashMap();
					map.put("dataResourceId", ref.getDataResourceId());
					map.put("dataResourceName", ref.getDataResourceName());
					map.put("isDefault", ref.getIsDefault());
					map.put("struId", ref.getStruId());
					map.put("struType", ref.getStruType());
					map.put("dataResType", ref.getDataResType()
							.getDataResType());
					outList.add(map);
				}
			}
		}
		List resultList = new ArrayList();
		for (int i = 0; i < outList.size(); i++) {
			HashMap keyMap = (HashMap) outList.get(i);
			boolean isExist = false;
			for (int j = 0; j < i; j++) {
				if (i != j) {
					HashMap tempMap = (HashMap) outList.get(j);
					if (isStru) {
						String keyStruId = (String) keyMap.get("struId");
						String tempStruId = (String) tempMap.get("struId");
						if (keyStruId.equals(tempStruId)) {
							isExist = true;
						}
					} else {
						String keyResourceId = (String) keyMap
								.get("dataResourceId");
						String tempResourceId = (String) tempMap
								.get("dataResourceId");
						if (keyResourceId.equals(tempResourceId)) {
							isExist = true;
						}
					}
				}
			}
			if (!isExist) {
				resultList.add(keyMap);
			}
		}
		return resultList;
	};

%>

<%
/*
String username="superadmin";
String password="superadmin2";
// 先使用用户名密码创建认证对象（UsernamePasswordAuthenticationToken）
			UsernamePasswordAuthenticationToken authRequest =
				new UsernamePasswordAuthenticationToken(username, password);
// 再取得认证的对象（AuthenticationManager）
AuthenticationManager manager=( AuthenticationManager) ComponentFactory.getBean("authenticationManager");
// 再用该对象进行认证，得到认证后的通过后的对象。如果认证不通过，则会抛出异常
			Authentication auth =
				manager.authenticate(authRequest);
// 使用认证后的对象（auth ）得到UserId
Object UserId = auth.getPrincipal();
out.println("userid="+(String)UserId);
*/
	//BspInfo bspinfo=GetBspInfo.getBspInfo();
	BspInfo bspinfo=(BspInfo)session.getAttribute(BspInfoKey.BSPINFOKEY);
	LoginUserInfo userinfo= bspinfo.getLoginUserInfo();
	List userdateref=userinfo.getUserDataRefList();//所有的数据权限List
	out.println("所有的数据权限List：getUserDataRefList.size="+userdateref.size());
	for(int i=0;i<userdateref.size();i++)
		out.println("<BR><FONT COLOR=\"#FF0099\">userdate:"+i+"</FONT> = <FONT COLOR=\"#3300FF\"> "+userdateref.get(i)+"</FONT>");
	//从BspInfo中取出来的数据权限
	List testlist=bspinfo.getDataResourcePermitList("11","00");
	out.println("<BR><FONT COLOR=\"#FF00CC\">从BspInfo中取出来的数据权限：bspinfo.getDataResourcePermitList(\"11\",\"00\");</FONT>");
	for(int i=0;i<testlist.size();i++){
		out.println("<BR><FONT COLOR=\"#FF0099\">testlist:"+i+"</FONT> = <FONT COLOR=\"#3300FF\"> "+testlist.get(i)+"</FONT>");
	}
	//直接运算得出的结果
	List testlist2=getDataResourcePermitList(userdateref,"11","00",bspinfo.getLoginCorporation());
	out.println("<BR><FONT COLOR=\"#FF00CC\">直接运算得出的结果：getDataResourcePermitList(\"11\",\"00\");</FONT>");
	for(int i=0;i<testlist.size();i++){
		out.println("<BR><FONT COLOR=\"#FF0099\">testlist2:"+i+"</FONT> = <FONT COLOR=\"#3300FF\"> "+testlist2.get(i)+"</FONT>");
	}
	session.setAttribute("user","setUser");
	    	Enumeration names=session.getAttributeNames();
    	while(names.hasMoreElements()){
    		String name=(String) names.nextElement();
    		Object value=session.getAttribute(name);
			out.println("<BR><FONT COLOR=\"#FF0099\">class=</FONT>"+value.getClass());
			if(value instanceof List){
				List list=(List)value;
				for(int i=0;i<list.size();i++)
					out.println("<br>list.get(i)"+list.get(i));
			}else				
    		out.println("<BR><FONT COLOR=\"#FF0099\">name=</FONT>"+name+",<FONT COLOR=\"#3300FF\">value=</FONT>"+value);
    	}
%>
