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
		// ��ȡ��½��˾��organId
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
// ��ʹ���û������봴����֤����UsernamePasswordAuthenticationToken��
			UsernamePasswordAuthenticationToken authRequest =
				new UsernamePasswordAuthenticationToken(username, password);
// ��ȡ����֤�Ķ���AuthenticationManager��
AuthenticationManager manager=( AuthenticationManager) ComponentFactory.getBean("authenticationManager");
// ���øö��������֤���õ���֤���ͨ����Ķ��������֤��ͨ��������׳��쳣
			Authentication auth =
				manager.authenticate(authRequest);
// ʹ����֤��Ķ���auth ���õ�UserId
Object UserId = auth.getPrincipal();
out.println("userid="+(String)UserId);
*/
	//BspInfo bspinfo=GetBspInfo.getBspInfo();
	BspInfo bspinfo=(BspInfo)session.getAttribute(BspInfoKey.BSPINFOKEY);
	LoginUserInfo userinfo= bspinfo.getLoginUserInfo();
	List userdateref=userinfo.getUserDataRefList();//���е�����Ȩ��List
	out.println("���е�����Ȩ��List��getUserDataRefList.size="+userdateref.size());
	for(int i=0;i<userdateref.size();i++)
		out.println("<BR><FONT COLOR=\"#FF0099\">userdate:"+i+"</FONT> = <FONT COLOR=\"#3300FF\"> "+userdateref.get(i)+"</FONT>");
	//��BspInfo��ȡ����������Ȩ��
	List testlist=bspinfo.getDataResourcePermitList("11","00");
	out.println("<BR><FONT COLOR=\"#FF00CC\">��BspInfo��ȡ����������Ȩ�ޣ�bspinfo.getDataResourcePermitList(\"11\",\"00\");</FONT>");
	for(int i=0;i<testlist.size();i++){
		out.println("<BR><FONT COLOR=\"#FF0099\">testlist:"+i+"</FONT> = <FONT COLOR=\"#3300FF\"> "+testlist.get(i)+"</FONT>");
	}
	//ֱ������ó��Ľ��
	List testlist2=getDataResourcePermitList(userdateref,"11","00",bspinfo.getLoginCorporation());
	out.println("<BR><FONT COLOR=\"#FF00CC\">ֱ������ó��Ľ����getDataResourcePermitList(\"11\",\"00\");</FONT>");
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
