<%@ taglib uri="/tags/web-seltree" prefix="tree" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.demo.html.data.*" %> 
<%   
        ArrayList list = new ArrayList();
        list=(ArrayList)request.getAttribute("citys");
        String value =(String)request.getAttribute("default");
        //request.setAttribute("provinces",list);   
        StringBuffer sb = new StringBuffer(); 
         for(int i=0;i<list.size();i++){
        	 City City=null;
        	 City=(City)list.get(i);
        	 String CityId=City.getId();
        	 String CityName=City.getName();
        	 String ProvinceId=City.getProvinceId();
        	 if(CityName.equals(value)){
        		 //sb.append("<option value="+CityId+">"+CityName+"</option>");	
        		 sb.append("<option value="+CityId+"selected>"+CityName+"</option>");	
        	 } 
        	// sb.append("<option value="+CityId+"selected>"+CityName+"</option>");	
        	else sb.append("<option value="+CityId+">"+CityName+"</option>");
         }
         out.print(sb.toString());
%>
